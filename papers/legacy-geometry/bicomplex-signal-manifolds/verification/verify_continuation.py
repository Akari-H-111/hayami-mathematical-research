"""Exact identities behind the continuation; PDE/domain proofs are written/external."""
from pathlib import Path
import hashlib
import sys
import sympy as s

PAPER = Path(__file__).resolve().parents[1]


def main():
    assert not sys.flags.optimize
    pdf = PAPER.parent / "source-registry/final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf"
    assert hashlib.sha256(pdf.read_bytes()).hexdigest() == "4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a"
    c, sn, u = s.symbols("c sn u", real=True)
    # Real quadratures of the two actual unit-power component states.
    cp, cm = s.sqrt(1-u), s.sqrt(u)
    ap, bp = s.sqrt((1+c)/2), sn/s.sqrt(2*(1+c))
    am, bm = s.sqrt((2-c)/2), s.sqrt(c/2)
    power = s.simplify((cp*ap)**2+(cp*bp)**2+(cm*am)**2+(cm*bm)**2)
    assert s.simplify(power.subs(sn**2,1-c**2)-1) == 0
    readout = s.Matrix([(cp*ap)**2-(cp*bp)**2+2*(cm*am)**2,
                       2*cp**2*ap*bp, 2*cm**2*am*bm])
    assert s.simplify((readout[0]-c-2*u*(1-c)).subs(sn**2,1-c**2)) == 0
    # Square-root branch identities are replayed on c>=0, 0<=u<=1.
    cc, uu = s.symbols("cc uu", positive=True)
    assert s.simplify((readout[1]-(1-u)*sn).subs(c,cc)) == 0
    assert s.simplify((readout[2]-u*s.sqrt(c*(2-c))).subs(c,cc)) == 0
    a,b,d,e = s.symbols("a b d e", real=True)
    bloch = s.Matrix([2*(a*d+b*e),2*(a*e-b*d),a*a+b*b-d*d-e*e])
    assert s.expand(bloch.dot(bloch)-(a*a+b*b+d*d+e*e)**2) == 0
    points = [s.Matrix(v) for v in [(1,0,0),(0,1,0),(0,-1,0),(1,0,1)]]
    assert s.det(s.Matrix.hstack(*(v-points[0] for v in points[1:]))) == 2
    print("PASS explicit unit-power quadrature realization; pure-state Bloch identity and nonplanarity")

    x,y,xi,eta = s.symbols("x y xi eta", real=True)
    radius = s.sqrt(x*x+y*y)
    immersion = s.Matrix([x,x*y,y*y])
    jac = immersion.jacobian([x,y])
    metric = jac.T*jac
    energy = (s.Matrix([xi,eta]).T*metric*s.Matrix([xi,eta]))[0]
    diagonal = xi*xi+(x*x+y*y)*eta*eta
    low_sos = (2*y*xi+x*eta)**2/2+(s.Rational(1,2)-y*y)*xi*xi+s.Rational(7,2)*(y*eta)**2
    high_sos = (y*xi-x*eta)**2+(3-2*y*y)*xi*xi+2*(x*eta)**2
    assert s.expand(energy-diagonal/2-low_sos) == 0
    assert s.expand(4*diagonal-energy-high_sos) == 0
    resolved = s.Matrix([x,y*radius])
    dresolved = resolved.jacobian([x,y])
    assert s.simplify(dresolved.det()-(x*x+2*y*y)/radius) == 0
    assert s.expand(resolved.dot(resolved)-immersion.dot(immersion)) == 0
    v2,Y = s.symbols("v2 Y", nonnegative=True)
    inverse_y2 = (s.sqrt(x**4+4*v2)-x*x)/2
    assert s.simplify(inverse_y2**2+x*x*inverse_y2-v2) == 0
    print("PASS actual cross-cap metric; positive SOS bounds; resolved Jacobian, radius and inverse")

    normal = jac[:,0].cross(jac[:,1])
    determinant = s.simplify(metric.det())
    second = s.Matrix(2,2,lambda i,j: normal.dot(immersion.diff((x,y)[i],(x,y)[j]))/s.sqrt(determinant))
    gaussian = s.simplify(second.det()/determinant)
    assert s.simplify(gaussian+4*y*y/determinant**2) == 0
    print("PASS actual standard Gaussian curvature; written Lp range is 1<=p<3/2")
    q1,q2,n1,n2 = s.symbols("q1 q2 n1 n2", real=True)
    dot = q1*n1+q2*n2
    adapted = s.Matrix([[1+q1*q1+q2*q2,dot],[dot,1]])
    det = 1+q1*q1+q2*q2-dot*dot
    assert s.expand(adapted.det()-det) == 0
    assert s.simplify(adapted.inv()*adapted-s.eye(2)) == s.zeros(2)
    # Under |n|=1, the determinant excess is the squared planar cross product.
    excess = s.expand(det-1-(q1*n2-q2*n1)**2)
    assert s.expand(excess+(q1*q1+q2*q2)*(n1*n1+n2*n2-1)) == 0
    rho,epsilon = s.symbols("rho epsilon", positive=True)
    assert s.integrate(rho**s.Rational(-1,2),(rho,0,epsilon)) == 2*s.sqrt(epsilon)
    actual_s = s.Matrix([c+2*u*(1-c),(1-u)*sn,u*s.sqrt(c*(2-c))])
    assert actual_s.subs(sn,-sn) == s.diag(1,-1,1)*actual_s
    # These are finite boundary-coordinate identities, not an operator-domain proof.
    zero,ident = s.zeros(2),s.eye(2)
    J = s.BlockMatrix([[zero,-ident],[ident,zero]]).as_explicit()
    T = s.diag(-2*s.pi,-2*s.pi,1,1)
    raw = s.BlockMatrix([[zero,ident],[-ident,zero]]).as_explicit()
    assert T.T*J*T == 2*s.pi*raw
    time = s.symbols("time", real=True)
    shear = s.BlockMatrix([[ident,zero],[time*ident,ident]]).as_explicit()
    assert shear.T*raw*shear == raw
    print("PASS arclength metric matrix/determinant, L3 radial integrability, actual reflection and finite Green-coordinate/shear identities")
    print("PASS continuation exact replay; Holder regularity, point traces and extension domains are not CAS-certified")


if __name__ == "__main__":
    main()
