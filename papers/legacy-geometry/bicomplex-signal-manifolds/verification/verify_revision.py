"""Independent exact replay of the v13 working corrections, not an analytic certificate."""
from pathlib import Path
import hashlib
import sympy as s

ROOT = Path(__file__).resolve().parents[1]
PDF = ROOT.parent / "source-registry/final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf"


def zero(expr, label):
    expected = s.zeros(*expr.shape) if isinstance(expr, s.MatrixBase) else 0
    assert s.simplify(expr) == expected, f"{label}: {s.factor(expr)}"


def main():
    assert hashlib.sha256(PDF.read_bytes()).hexdigest() == "4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a"
    t, u, r, e = s.symbols("t u r e", real=True)
    c, sn = s.cos(t), s.sin(t)
    q = s.sqrt(c * (2-c))
    surf = s.Matrix([c+2*u*(1-c), (1-u)*sn, u*q])
    st, su = surf.diff(t), surf.diff(u)
    delta = s.det(s.Matrix.hstack(su, su.diff(t), st.diff(t)))
    zero(delta.subs({t: 0, u: 1})-1, "polar cross-cap determinant")
    c0 = (3-s.sqrt(5))/2
    # Substitute algebraic cos/sin values before simplifying nested radicals.
    lateral = {s.cos(t): c0, s.sin(t): s.sqrt(1-c0**2), u: (1-c0)/2}
    zero(delta.subs(lateral)+5*s.sqrt(s.sqrt(5)-2), "lateral cross-cap determinant")

    bc = 1-s.sqrt(1-r*r)
    bs = e*s.sqrt(1-bc*bc)
    bsurf = s.Matrix([bc+2*u*(1-bc), (1-u)*bs, u*r])
    br, bu = bsurf.diff(r), bsurf.diff(u)
    zero(br.subs(r, 0)-s.Matrix([0,0,u]), "actual endpoint differential")
    zero(bu.subs(r, 0)-s.Matrix([2,-e,0]), "actual endpoint ruling")
    zero(br.cross(bu).subs(r, 0)-s.Matrix([e*u,2*u,0]), "endpoint rank loss iff u=0")
    zero(s.det(s.Matrix.hstack(bu,bu.diff(r),br.diff(r))).subs({r:0,u:0})+e,
         "corner cross-cap determinant in signed smooth extension")
    print("PASS actual S derivatives; interior and both endpoint cross-cap determinants")

    n = (1-c)*(1-c-2*u)
    d = 1-c+c*c
    m = (c*c*(2-c)-u*d)/q
    zero(n.subs(t,-t)-n, "N parity")
    zero(m.subs(t,-t)-m, "M parity")
    # The old polar remainder omits this fourth-order term.
    zero(s.diff(m,t,4).subs({t:0,u:1})+12, "polar M(t,1)=-t^4/2+O(t^6)")
    eta_sq = 4*s.sin(t/2)**2*(u-(1-c)/2)
    zero(s.expand_trig(-n-eta_sq), "actual polar fold chart identity")
    print("PASS even observation field; corrected polar Taylor term; actual fold identity")

    # Rebuild the actual Euclidean normal-plane data of old Proposition 5.12.
    su0, stt0, sut0 = (v.subs(lateral) for v in (su,st.diff(t),su.diff(t)))
    lam = -c0*s.sqrt(1-c0*c0)/(2*(1-c0))
    proj = s.eye(3)-su0*su0.T/(su0.dot(su0))
    av, bv = proj*(stt0-2*lam*sut0), proj*(-sut0/s.sqrt(3))
    nn = s.simplify(av.dot(av))
    mm = s.simplify(av.dot(bv)**2)
    rr = s.simplify(bv.dot(bv)-mm/nn)
    zero(nn-(-335+162*s.sqrt(5))/12, "actual N")
    zero(mm-(-520+249*s.sqrt(5))/27, "actual M squared")
    zero(rr-20*(140+11*s.sqrt(5))/11397, "actual R")
    assert all(v.is_positive for v in (nn,mm,rr))
    a,b,cc = -mm/(2*nn**s.Rational(3,2)), s.sqrt(mm*rr)/nn, s.sqrt(2*rr)/nn**s.Rational(1,4)
    zero(b*b+a*cc*cc, "actual cusp discriminant")
    aa,bb,kk,h = s.symbols("a b k h", real=True, nonzero=True)
    tau = h-bb/kk
    pedal = 2*kk*h*h/(kk*kk+4*tau*tau)*s.Matrix([-kk,2*tau])
    det23 = s.det(s.Matrix.hstack(pedal.diff(h,2),pedal.diff(h,3))).subs(h,0)
    zero(det23+96*kk**3/(kk**2+4*bb**2/kk**2)**2, "ordinary cusp derivative determinant")
    print("PASS independently rebuilt actual two-jet invariants and ordinary cusp criterion")

    alpha,beta,x = s.symbols("alpha beta x", real=True, positive=True)
    w = x**(2*beta-1)
    zero(s.diff(x*w,x)/w-2*beta, "weighted adjoint coefficient")
    # This boundary witness belongs to the Dirichlet domain, not the compact-core graph closure.
    witness = x*(1-x)
    zero(s.integrate(-s.diff(witness,x,2),(x,0,1))-2, "outer-boundary Green witness")
    print("PASS weighted formal-adjoint correction; nonzero outer-boundary obstruction")

    xx,yy,z,xi = s.symbols("x y z xi", real=True)
    f = s.Matrix([xx,xx*yy,yy**2])
    jac = f.jacobian([xx,yy])
    g = jac.T*jac
    rho2 = f.dot(f)
    w2 = g.det()
    dl = s.Matrix([s.diff(rho2,v) for v in (xx,yy)])/(2*rho2)
    # Work with density times Laplacian, avoiding unnecessary square-root derivatives.
    ww = s.sqrt(w2)
    flux = s.simplify(ww*g.inv()*dl)
    lap = s.simplify(sum(s.diff(flux[i],v) for i,v in enumerate((xx,yy)))/ww)
    expected = 2*xx**2*yy**2*(3*xx**2*yy**4+5*xx**2*yy**2+xx**2+7*yy**6+5*yy**4)/(w2**2*rho2**2)
    zero(lap-expected, "actual standard-metric Laplacian of log radius")
    # Normal commutators do not gain a positive dilation weight automatically.
    scale = s.symbols("scale", positive=True)
    chi = s.Function("chi")
    zero(scale*s.diff(chi(x/scale),x).subs(x,scale*r)-s.diff(chi(r),r), "rescaled commutator has weight zero")
    print("PASS standard Green residual; weight-zero commutator (old smallness argument rejected)")

    # Non-equivariant shear: preservation of capacity cannot certify Green coefficients.
    shear = s.Matrix([[1,0,0],[0,1,0],[0,1,1]])
    gs = (shear*jac).T*(shear*jac)
    assert gs.subs(yy,-yy) != s.diag(1,-1)*gs*s.diag(1,-1)
    print("PASS right-left cross-cap equivalence need not preserve the Euclidean sheet isometry")
    print("PASS v13 working exact replay; operator-domain and parametrix conclusions are not inferred")


if __name__ == "__main__":
    main()
