"""Exact certificates and separate numerical checks for EXCEPTIONAL_GERM.md.

Run with python3 -B; never -O. CAS checks do not certify smooth inverse charts
or the cited singularity-theory results. No files are regenerated.
"""
import platform

import mpmath as mp
import sympy as sp

if not __debug__:
    raise SystemExit("FAIL assertions must be enabled; run without -O")
c, a, u, x, d, y = sp.symbols("c a u x d y", real=True)
qc, qa = sp.symbols("qc qa", real=True)
w = lambda z: 1 - z + z**2
A = lambda z: (1-z)*z*(2-z)*(1+2*z-z**2)
B = lambda z: z**3-3*z+1
U = lambda z: -A(z)/B(z)
P = lambda z: -z**4+3*z**3-3*z+1
P2 = lambda z, b: -3*b**2-2*b*z+6*b-z**2+3*z
q = lambda z: sp.sqrt(z*(2-z))
N = lambda z, v: (1-z)*(1-z-2*v)
M = lambda z, v: ((1-v)*z**2*(2-z)-v*(1-z)**2*(1+z))/q(z)
n = lambda z: N(z, U(z))
m = lambda z: M(z, U(z))
ql = (1-a)/qa
qr = -(1+ql**2)/(qc+qa+ql*(c-a))
ma = m(a).subs(q(a), qa)
K = (P2(c, a)+2*ma*((1-c)*qr-ql)-n(a))/w(c)
K1 = K.subs({c: 1, qc: 1}, simultaneous=True)
L = (2-2*a-c-2*ma*qr-c*K1)/w(c)


def zero(expr):
    assert sp.cancel(expr) == 0, expr


def quadratic_zero(expr):
    """Clear nonzero local denominators, then reduce the two sqrt relations."""
    num = sp.fraction(sp.cancel(expr))[0]
    poly = sp.Poly(num, qc, qa, c, a)
    for relation in (qc**2-c*(2-c), qa**2-a*(2-a)):
        num = sp.rem(poly.as_expr(), relation, qc if relation.has(qc) else qa)
        poly = sp.Poly(sp.expand(num), qc, qa, c, a)
    assert poly.is_zero, sp.factor(poly.as_expr())


def exact_checks():
    G = sp.Matrix([N(c, u), M(c, u)])
    DG = G.jacobian([c, u])
    assert DG.subs({c: 1, u: 0}) == sp.Matrix([[0, 0], [1, -1]])
    J = sp.simplify(DG.det())
    zero(J-2*(A(c)+u*B(c))/q(c)**3)
    assert (sp.diff(J, c)+sp.diff(J, u)).subs({c: 1, u: 0}) == -6
    second = sp.Matrix([(sp.diff(f, c, 2)+2*sp.diff(f, c, u)+sp.diff(f, u, 2))
                        .subs({c: 1, u: 0}) for f in G])
    assert second == sp.Matrix([6, -3])
    assert sp.diff(U(c), c).subs(c, 1) == -2
    # Critical tangent (1,-2) and kernel (1,1) each cross c=1.
    assert sp.det(sp.Matrix([[1, 0], [-2, 1]])) != 0
    assert sp.det(sp.Matrix([[1, 0], [1, 1]])) != 0
    t = sp.symbols("t", real=True)
    Ft = G.subs(c, sp.cos(t))
    assert Ft.subs(t, -t) == Ft
    assert sp.trigsimp(1-sp.cos(t)-2*sp.sin(t/2)**2) == 0

    ad = (1-d)**2*(1+d)
    wd = 1-d+d**2
    qd = sp.sqrt(1-d**2)
    ud = (ad-qd*(1-x))/wd
    Ad = d**2-2*d*(ad-qd)/wd
    Bd = 2*d*qd/wd
    zero(M(1-d, u).subs(q(1-d), qd)-(ad-u*wd)/qd)
    zero(N(1-d, ud)-(Ad-x*Bd))
    assert sp.series(Ad, d, 0, 4) == 3*d**2+3*d**3+sp.Order(d**4)
    assert sp.series(Bd, d, 0, 4) == 2*d+2*d**2-d**3+sp.Order(d**4)
    assert sp.diff(Ad, d, 2).subs(d, 0)/sp.diff(Bd, d).subs(d, 0) == 3

    reduced = (P(c)+2*(1-c)*ma*qc)/w(c)
    quadratic_zero(qc-qa-ql*(c-a)-(c-a)**2*qr)
    quadratic_zero(reduced-n(a)-(c-a)**2*K)
    zero(K1-K-(1-c)*L)
    assert K.subs({c: 1, a: 1, qc: 1, qa: 1}) == 3
    assert sp.diff(m(a), a).subs(a, 1) == 3
    axis = -2*(1-a)*sp.sqrt(K1.subs(qa, q(a)))
    assert sp.simplify(sp.diff(axis, a).subs(a, 1)) == 2*sp.sqrt(3)
    source_derivative = sp.Matrix([[0, -2*sp.sqrt(3)/3], [sp.sqrt(2*sp.sqrt(3))/2, 0]])
    target_derivative = sp.Matrix([[0, 2*sp.sqrt(3)/3], [1, 0]])
    assert source_derivative.det().is_positive
    assert target_derivative.det().is_negative
    # Rationalization of sqrt K: k1-k = (1-c)L/(k1+k).
    k, k1 = sp.symbols("k k1", positive=True)
    rho = k+(1-a)*L/(k1+k)
    R = (1-c)*rho
    S = (c-a)*k
    S1 = (1-a)*k1
    # Use K1-K=(1-c)L and k1²-k²=K1-K, without choosing a branch by CAS.
    num = sp.fraction(sp.cancel(R-(S1-S)))[0]
    assert sp.rem(num, k1**2-k**2-(1-c)*L, k1).expand() == 0
    zero((S1-S)**2-2*S1*(S1-S)-(S**2-S1**2))
    # At c=1, reduced N is exactly zero; hence n(a)=-S1².
    quadratic_zero(-n(a)-(1-a)**2*K1)
    # R=y² using 1-cos t=2 sin²(t/2) and positive rho.
    rho_symbol, s = sp.symbols("rho s", positive=True)
    zero((sp.sqrt(2*rho_symbol)*s)**2-2*s**2*rho_symbol)

    f = sp.Matrix([x, x*y**2+y**4])
    jac = f.jacobian([x, y]).det()
    assert sp.factor(jac) == 2*y*(x+2*y**2)
    b = sp.symbols("b", nonzero=True, real=True)
    assert f.subs({x: -2*b**2, y: b}) == f.subs({x: -2*b**2, y: -b})
    assert f.subs({x: -2*b**2, y: b}) == sp.Matrix([-2*b**2, -b**4])
    assert sp.diff(f[1], y, 2).subs({x: -2*b**2, y: b}) == 8*b**2
    # Both critical-value derivatives are the same line, spanned by (1,b²).
    for sign in (-1, 1):
        tangent = f.jacobian([x, y]).subs({x: -2*b**2, y: sign*b})[:, 0]
        assert tangent == sp.Matrix([1, b**2])
    # Fixed-origin even stability is false: epsilon*y² changes the rank/fold type.
    eps = sp.symbols("eps", nonzero=True, real=True)
    assert sp.diff(x*y**2+y**4+eps*y**2, y, 2).subs({x: 0, y: 0}) == 2*eps
    print("PASS exact factorization/reduction/fold/remainder/boundary/bi-germ certificates")


def taylor_checks():
    # Three independent rational paths; order 12 is a finite Taylor diagnostic.
    # Exact two-variable identities above, rather than these paths, certify algebra.
    z = sp.symbols("z")
    trunc = lambda f: sp.series(f, z, 0, 12).removeO().expand()
    for cc, aa in ((1-z, 1+z), (1+2*z, 1-z), (trunc(sp.cos(z)), 1+z**2)):
        kk = trunc(K.subs({c: cc, a: aa, qc: trunc(q(cc)), qa: trunc(q(aa))}, simultaneous=True))
        kk1 = trunc(K1.subs({a: aa, qa: trunc(q(aa))}, simultaneous=True))
        ss = trunc((cc-aa)*trunc(sp.sqrt(kk)))
        ss1 = trunc((1-aa)*trunc(sp.sqrt(kk1)))
        rr = trunc(ss1-ss)
        xx = -2*ss1
        nn = trunc(n(aa)+(cc-aa)**2*kk)
        assert trunc(nn-xx*rr-rr**2) == 0
    print("PASS Taylor normal-form identity through degree 11 on 3 specified paths")


def numerical_checks():
    mp.mp.dps = 60
    kn = sp.lambdify((c, a), K.subs({qc: q(c), qa: q(a)}), "mpmath")
    ln = sp.lambdify((c, a), L.subs({qc: q(c), qa: q(a)}), "mpmath")
    mn = sp.lambdify(a, m(a), "mpmath")
    maxerr = mp.mpf(0)
    for tt, uu in (("0.02", "0.003"), ("-0.03", "-0.002"), ("0", "0.004"), ("0.05", "0")):
        t0, u0 = mp.mpf(tt), mp.mpf(uu)
        c0 = mp.cos(t0)
        q0 = mp.sqrt(c0*(2-c0))
        m0 = ((1-u0)*c0**2*(2-c0)-u0*(1-c0)**2*(1+c0))/q0
        a0 = mp.findroot(lambda b: mn(b)-m0, (mp.mpf("0.99"), mp.mpf("1.01")))
        k0, k1 = mp.sqrt(kn(c0, a0)), mp.sqrt(kn(1, a0))
        rho = k0+(1-a0)*ln(c0, a0)/(k1+k0)
        assert rho > 0
        X = -2*(1-a0)*k1
        Y = mp.sqrt(2*rho)*mp.sin(t0/2)
        n0 = (1-c0)*(1-c0-2*u0)
        err = abs(n0-X*Y**2-Y**4)
        assert err < mp.mpf("1e-50"), err
        assert abs((1-c0)*rho-Y**2) < mp.mpf("1e-50")
        assert mp.sqrt(2*rho)*mp.sin(-t0/2) == -Y
        maxerr = max(maxerr, err)
    print("PASS numerical actual-chart spot checks (4 points, 60 digits; error < 1e-50)")


if __name__ == "__main__":
    print("Python", platform.python_version(), "SymPy", sp.__version__, "mpmath", mp.__version__)
    exact_checks()
    taylor_checks()
    numerical_checks()
    print("PASS exceptional germ: exact certificates, Taylor diagnostics, numerical charts")
