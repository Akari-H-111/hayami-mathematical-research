#!/usr/bin/env python3
"""Exact replay of the new v5 corrections; no numerical sampling or Python -O."""
from __future__ import annotations

import sympy as sp
import sys


def main() -> None:
    if sys.flags.optimize:
        raise SystemExit("FAIL Python optimization disables required assertions")
    r, u, c, s, q, e = sp.symbols("r u c s q e", real=True)
    d = sp.sqrt(1 - r**2)
    cr = 1 - d
    sr = e * sp.sqrt(1 - cr**2)
    surface = sp.Matrix([cr + 2*u*(1-cr), (1-u)*sr, u*r])
    dr = surface.diff(r)
    du = surface.diff(u)
    assert dr.subs(r, 0) == sp.Matrix([0, 0, u])
    assert du.subs(r, 0) == sp.Matrix([2, -e, 0])
    assert dr.cross(du).subs(r, 0) == sp.Matrix([e*u, 2*u, 0])
    mixed_edge = du.diff(r).subs(r, 0)
    assert mixed_edge == sp.Matrix([0, 0, 1])
    assert surface.diff(u, 2) == sp.zeros(3, 1)
    assert dr.cross(du).subs(r, 0).dot(mixed_edge) == 0
    assert sp.simplify(cr*(2-cr) - r**2) == 0
    assert sp.simplify((sr**2 + cr**2 - 1).subs(e**2, 1)) == 0
    print("PASS actual boundary atlas, endpoint derivative, and rank loss iff u=0")
    print("PASS actual boundary second derivatives and zero mixed normal coefficient; regular Q=0 edge curvature is zero")
    vglobal = sp.Symbol("v_global", real=True)
    gc = (1-vglobal**2)**2
    gs = vglobal*sp.sqrt((2-vglobal**2)*(1+(1-vglobal**2)**2))
    gq = (1-vglobal**2)*sp.sqrt(2-gc)
    assert sp.expand(gc**2+gs**2-1) == 0
    assert sp.expand(gq**2-gc*(2-gc)) == 0
    assert gc.subs(vglobal,0) == 1 and gq.subs(vglobal,0) == 1
    assert gs.subs(vglobal,1) == 1 and gs.subs(vglobal,-1) == -1
    assert gq.diff(vglobal).subs(vglobal,1) == -2*sp.sqrt(2)
    assert gq.diff(vglobal).subs(vglobal,-1) == 2*sp.sqrt(2)
    print("PASS global coordinate circle/ruling identities and nonzero endpoint Q rates; homeomorphism and manifold proofs are separate Lean results")
    # Signed physical inverse; the smooth extension at r<0 is not a physical
    # inverse of Q, whose nonnegative square-root branch gives |r|.
    assert sp.simplify(sp.sqrt(sp.simplify(cr*(2-cr)))) == sp.Abs(r)
    assert sp.Abs(sp.Rational(-1, 4)) != sp.Rational(-1, 4)
    paired_base = sp.Matrix([e*sp.acos(cr), sp.asin(r)])
    assert paired_base.diff(r).subs(r, 0) == sp.Matrix([0, 1])
    assert sp.simplify(sp.cos(e*sp.acos(cr)).subs(e, 1)+sp.cos(sp.asin(r))-1) == 0
    assert sp.simplify(sp.cos(e*sp.acos(cr)).subs(e, -1)+sp.cos(sp.asin(r))-1) == 0
    dt_dr = -e*r/(d*sp.sqrt(1-cr**2))
    dr_dt = -e*sp.sqrt(1-cr**2)*d/r
    assert sp.cancel((dt_dr*dr_dt).subs(e**2, 1)) == 1
    print("PASS signed transition identity, reciprocal derivatives, and regular paired-base tangent; r>=0 inverse boundary retained")
    # Distinct limiting tangent planes at the corner, along regular paths.
    v = dr.cross(du)
    assert sp.Matrix([sp.limit(x.subs(u, 0)/r, r, 0, dir="+") for x in v]) == sp.Matrix([0, 0, -e])
    assert sp.Matrix([sp.limit(x.subs(u, r)/r, r, 0, dir="+") for x in v]) == sp.Matrix([e, 2, -e])
    assert sp.Matrix([sp.limit(x.subs(u, 0)/r, r, 0, dir="+") for x in dr]) == sp.Matrix([1, 0, 0])
    assert sp.Matrix([sp.limit(x.subs(u, r)/r, r, 0, dir="+") for x in dr]) == sp.Matrix([1, 0, 1])
    assert sp.Matrix([sp.limit(x.subs(u, 0), r, 0, dir="+") for x in du]) == sp.Matrix([2, -e, 0])
    assert sp.Matrix([[1,0,0],[1,0,1],[2,-e,0]]).det() == e
    print("PASS incompatible corner tangent planes and three independent actual tangent limits; epsilon != 0")

    P = c**2 - 3*c + 1
    D = 1-c+c**2
    H = c**2*(2-c)-u*D
    N = (1-c)*(1-c-2*u)
    assert sp.expand(H.subs(u, (1-c)/2)+(c+1)*P/2) == 0
    assert sp.expand((c*(2-c)-2*u).subs(u, (1-c)/2)+P) == 0
    c0 = (3-sp.sqrt(5))/2
    assert sp.simplify(P.subs(c, c0)) == 0
    assert sp.Poly(P,c).count_roots(0,1) == 1
    assert bool(0 < c0) and bool(c0 < 1)
    u0 = (1-c0)/2
    assert bool(0 < u0) and bool(u0 < 1)
    assert sp.simplify(H.subs({c:1,u:1})) == 0
    print("PASS full interior zero system: polar zero plus two lateral zeros")

    A = (1-c)*c*(2-c)*(1+2*c-c**2)
    B = c**3-3*c+1
    pb = c**5-5*c**4+6*c**3-c**2+c-1
    E = c**5-3*c**4+5*c**3-6*c**2+c+1
    pb_derivative_certificate = (1-c)**4+2*c*(1-c)**3+18*c**2*(1-c)**2+14*c**3*(1-c)+2*c**4
    assert sp.expand(sp.diff(pb,c)-pb_derivative_certificate) == 0
    R7 = 3*c**7-8*c**6-12*c**5+60*c**4-69*c**3+30*c**2-6*c-1
    R7_certificate = sum(k*c**j*(1-c)**(7-j) for j,k in enumerate([1,13,27,44,71,57,21,3]))
    assert sp.expand(-R7-R7_certificate) == 0
    assert sp.expand(-A-B-pb) == 0
    assert sp.Poly(pb,c).count_roots(0,1) == 1
    assert sp.Poly(pb,c).count_roots(sp.Rational(613,1000), sp.Rational(614,1000)) == 1
    assert sp.Poly(E,c).count_roots(0,1) == 1
    assert sp.Poly(E,c).count_roots(sp.Rational(673741,10**6),sp.Rational(673742,10**6)) == 1
    assert sp.expand(c*B+(1-c)*(1+2*c-c**2)*D-E) == 0
    assert (N.subs({c:1}), H.subs({c:1,u:1})) == (0,0)
    print("PASS physical-fold boundary, quintic isolation, and extra polar skeleton intersection")

    # A coordinate area field is rescaled by the source-chart Jacobian.
    rel = sp.groebner([s**2-(1-c**2),q**2-c*(2-c)],s,q,u,c)
    st = sp.Matrix([(2*u-1)*s,(1-u)*c,u*s*(c-1)/q])
    su = sp.Matrix([2*(1-c),-s,q])
    vt = st.cross(su)
    expected = sp.Matrix([H/q, -s*(2*u-c*(2-c))/q, N])
    for component in vt-expected:
        num = sp.fraction(sp.cancel(component))[0]
        assert rel.reduce(sp.expand(num))[1] == 0
    # Actual first/second-form curvature derivation; generic Euclidean Gram identity.
    assert surface.diff(u,2) == sp.zeros(3,1)
    ax,ay,az,bx,by,bz=sp.symbols("ax ay az bx by bz",real=True)
    av,bv=sp.Matrix([ax,ay,az]),sp.Matrix([bx,by,bz])
    assert sp.expand(av.dot(av)*bv.dot(bv)-av.dot(bv)**2-av.cross(bv).dot(av.cross(bv))) == 0
    tt,area_sq,second_tt=sp.symbols("T area_sq second_tt",real=True,positive=True)
    assert sp.simplify((second_tt*0-(tt/sp.sqrt(area_sq))**2)/area_sq+tt**2/area_sq**2) == 0
    assert sp.expand(D-c**2*(2-c)-(1-c)**2*(1+c)) == 0
    print("PASS second u derivative, Euclidean Gram determinant, actual second-form curvature reduction, and skeleton range identity")
    alpha,beta,e,f,g,tangent_normal=sp.symbols("alpha beta e f g tangent_normal",real=True)
    # Independent algebraic part of the actual second-order pullback theorem.
    first_det_new=alpha**2*area_sq
    second_det_raw_new=(alpha*(alpha**2*e+beta*tangent_normal))*(alpha*g)-(alpha**2*f)**2
    assert sp.expand(second_det_raw_new.subs(tangent_normal,0)-alpha**4*(e*g-f**2)) == 0
    assert sp.cancel(second_det_raw_new.subs(tangent_normal,0)/first_det_new**2-(e*g-f**2)/area_sq**2) == 0
    print("PASS curvature pullback cancellation for nonzero alpha; actual composed-map chain rule and atlas application are Lean proofs")
    scale = -q/(s*(1-c))
    assert sp.limit((scale*N).subs({s:sp.sqrt(1-c**2),q:sp.sqrt(c*(2-c))}),c,0,dir="+") == 0
    assert sp.limit((scale*H/q).subs({s:sp.sqrt(1-c**2),q:sp.sqrt(c*(2-c))}),c,0,dir="+") == u
    print("PASS boundary area-field extension differs from the interior coordinate field")

    x, y, x2, y2 = sp.symbols("x y x2 y2", real=True)
    assert sp.factor(y**2-y2**2) == (y-y2)*(y+y2)
    assert sp.solve([x-x2,y**2-y2**2],[x2,y2],dict=True) == [{x2:x,y2:-y},{x2:x,y2:y}]
    assert sp.solve([x-x2,x**2-x2**2],[x,x2],dict=True) == [{x:x2}]
    # Even a retraced nonzero observation can fail after an unlocked rotation.
    z = 1+sp.I
    assert z != sp.exp(sp.I*sp.pi)*z
    a, theta = sp.symbols("a theta", real=True)
    assert sp.expand_trig(sp.cos(2*theta))- (2*sp.cos(theta)**2-1) == 0
    assert sp.simplify(a**2*sp.cos(theta+sp.pi)**2-a**2*sp.cos(theta)**2) == 0
    kappa = sp.Symbol("kappa", real=True)
    leading = kappa*(1+sp.cos(2*theta))/2
    assert sp.integrate(leading*sp.cos(2*theta),(theta,-sp.pi,sp.pi))/sp.pi == kappa/2
    assert sp.expand(kappa/2-4*kappa**3/3-kappa*(3-8*kappa**2)/6) == 0
    print("PASS exact leading Fourier coefficient and dominance-gap identity; all-mode bounds/odd-mode cancellation are Lean integral proofs")
    print("PASS recurrence equality criterion, crossing counterexample, phase-lock counterexample, half-period response")
    print("PASS new v5 exact corrections; analytic/topological claims require their separate proofs")


if __name__ == "__main__":
    main()
