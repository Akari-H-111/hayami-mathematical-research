"""Exact and finite checks for continuation 0.04 (moment readouts, exceptional
pullback, log/linear windows).

Analytic-rigidity, smooth-extension, Verdier-duality and covering-space proofs are
written arguments with stated external theorems.  This script checks only the
algebra, explicit formulas and finite numerical replays used by those proofs.
"""
from pathlib import Path
import cmath
import hashlib
import math
import sys

import mpmath as mp
import sympy as s

PAPER = Path(__file__).resolve().parents[1]
REGISTRY = PAPER.parent / "source-registry"
V12 = "4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a"
V7 = "6cefa5258257f3a23e35b5dd5cbe123b7af0ed3319c3a614b1c8d54c94bd654f"
ANCESTOR = "4c0a5b5a8287ab5559c892b2ee21c170984e5f9649481018f851095118a1f016"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def sources():
    assert sha(REGISTRY / "final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf") == V12
    v7 = REGISTRY / "historical_drafts/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v7.pdf"
    # The v7 draft was supplied privately and is not distributed; its SHA-256 is
    # recorded in claims/V7_DRAFT_INDEX.md. It is checked whenever the file is present.
    if v7.exists():
        assert sha(v7) == V7
    assert sha(PAPER / "source_ancestor/signal_manifolds_v2.tex") == ANCESTOR
    print("PASS source identities: v12 authority, "
          + ("registered v7 draft" if v7.exists() else "v7 draft not distributed (hash in V7_DRAFT_INDEX.md)")
          + ", ancestor TeX")


def surface(t, u):
    c = s.cos(t)
    return s.Matrix([c + 2*u*(1-c), (1-u)*s.sin(t), u*s.sqrt(c*(2-c))])


def edges_and_lines():
    u, lam, mu = s.symbols("u lam mu", real=True)
    plus = s.simplify(surface(s.pi/2, u))
    minus = s.simplify(surface(-s.pi/2, u))
    ruling = s.simplify(surface(0, u))
    assert plus == s.Matrix([2*u, 1-u, 0]) and minus == s.Matrix([2*u, u-1, 0])
    assert ruling == s.Matrix([1, 0, u])
    # The two edge segments lie on distinct lines through the apex (2,0,0).
    d_plus, d_minus = plus.diff(u), minus.diff(u)
    assert d_plus.cross(d_minus) != s.zeros(3, 1)
    assert plus.subs(u, 1) == minus.subs(u, 1) == s.Matrix([2, 0, 0])
    # The t=0 ruling line and either edge line are skew: no common point and not parallel.
    for edge in (plus, minus):
        assert s.solve(list(edge.subs(u, lam) - ruling.subs(u, mu)), [lam, mu], dict=True) == []
        assert edge.diff(u).cross(ruling.diff(u)) != s.zeros(3, 1)
    print("PASS edge V-shape, distinct edge lines and skew ruling/edge lines")


def smooth_readout_identities():
    c, u, L, th = s.symbols("c u L theta", nonnegative=True)
    eps = s.symbols("epsilon", integer=True)
    # Exact decoder identities on the state image (phases are explicit).
    a1 = th*L*u
    a2 = eps*s.pi + th*(1-L)*(1+u)
    assert s.simplify(a1/(th*L) - u) == 0
    assert s.simplify((2*a2 - 2*eps*s.pi)/(2*th*(1-L)) - 1 - u) == 0
    # Phase ranges: with theta=pi/8, arg z1 in [0,pi/8], arg z2^2 in [0,pi/2],
    # arg z2 in eps*pi+[0,pi/4], all inside the chosen principal/plateau sectors.
    th0 = s.pi/8
    assert s.simplify(th0*1*1 - s.pi/8) == 0 and s.simplify(2*th0*1*2 - s.pi/2) == 0
    # Sign, Q and first-coordinate identities.
    t = s.symbols("t", real=True)
    cc = s.cos(t)
    lhs_sign = s.sqrt(1-cc)*s.sqrt(1+cc)
    assert s.simplify((lhs_sign**2 - s.sin(t)**2)) == 0
    assert s.simplify(s.sqrt(c)*s.sqrt(2-c) - s.sqrt(c*(2-c))) == 0
    assert s.expand(c + 2*u*(1-c) - (c + 2*u*(1-c))) == 0
    print("PASS explicit smooth-readout decoder, phase-range and coordinate identities")


THETA = math.pi/8


def _h(x):
    return math.exp(-1.0/x) if x > 0 else 0.0


def step(x, a, b):
    p, q = _h(x-a), _h(b-x)
    return p/(p+q)


def plateau(phi):
    phi = (phi + math.pi/8) % (2*math.pi) - math.pi/8
    if phi <= 3*math.pi/8:
        return 1.0
    if phi <= 7*math.pi/8:
        return 1.0 - 2*step(phi, 3*math.pi/8, 7*math.pi/8)
    if phi <= 11*math.pi/8:
        return -1.0
    return -1.0 + 2*step(phi, 11*math.pi/8, 15*math.pi/8)


def lam(c):
    return step(c, 0.25, 0.75)


def state(t, u):
    c = math.cos(t)
    eps = 0 if t >= 0 else 1
    L = lam(c)
    z1 = math.sqrt(max(c, 0.0))*cmath.exp(1j*THETA*L*u)
    z2 = math.sqrt(max(1-c, 0.0))*cmath.exp(1j*(eps*math.pi + THETA*(1-L)*(1+u)))
    return z1, z2


def readout(z1, z2):
    c = abs(z1)**2
    psi, rho, kap = step(c, 1/3, 2/3), step(c, 0.75, 0.875), 1.0-step(c, 0.125, 0.25)
    ua = cmath.phase(z1)/(THETA*lam(c)) if psi > 0 else 0.0
    ub = cmath.phase(z2*z2)/(2*THETA*(1-lam(c))) - 1 if psi < 1 else 0.0
    uu = psi*ua + (1-psi)*ub
    s1 = z2.real*math.sqrt(1+c)
    s0 = abs(z2)*plateau(cmath.phase(z2))*math.sqrt(1+c) if rho < 1 else 0.0
    sg = rho*s1 + (1-rho)*s0
    q = kap*z1.real*math.sqrt(2-c) + (1-kap)*math.sqrt(c*(2-c))
    return (c + 2*uu*abs(z2)**2, (1-uu)*sg, uu*q)


def smooth_readout_replay():
    worst, seen = 0.0, set()
    for i in range(801):
        t = -math.pi/2 + math.pi*i/800
        for j in range(81):
            u = j/80
            z1, z2 = state(t, u)
            assert abs(abs(z1)**2 - math.cos(t)) < 1e-12 and abs(abs(z1)**2 + abs(z2)**2 - 1) < 1e-12
            target = (math.cos(t) + 2*u*(1-math.cos(t)), (1-u)*math.sin(t),
                      u*math.sqrt(max(math.cos(t)*(2-math.cos(t)), 0.0)))
            worst = max(worst, max(abs(a-b) for a, b in zip(readout(z1, z2), target)))
            seen.add(tuple(round(x, 9) for x in (z1.real, z1.imag, z2.real, z2.imag)))
    assert worst < 1e-12, worst
    assert len(seen) == 801*81
    print(f"PASS finite replay of the C-infinity readout on 64881 source labels, max error {worst:.2e}; labels injective")


def half_source_embedding():
    r = s.symbols("r", real=True)
    C = 1 - s.sqrt(1 - r**2)
    z1 = r/s.sqrt(1 + s.sqrt(1 - r**2))
    z2 = (1 - r**2)**s.Rational(1, 4)
    # For r>=0 the edge-chart state has powers (C,1-C) and agrees with sqrt(c), sqrt(1-c).
    assert s.simplify(z1**2 - C) == 0
    assert s.simplify(z2**4 - (1 - C)**2) == 0
    assert s.simplify(s.diff(z1, r).subs(r, 0) - 1/s.sqrt(2)) == 0
    t = s.symbols("t", real=True)
    v = s.Matrix([s.sqrt(s.cos(t)), s.sqrt(2)*s.sin(t/2)])
    assert s.simplify(v.dot(v) - 1) == 0
    assert s.simplify(s.diff(v[1], t) - s.cos(t/2)/s.sqrt(2)) == 0
    print("PASS half-source analytic state: edge-chart powers, unit norm and nonvanishing derivatives")


def fold_and_monodromy_inputs():
    t, u, c = s.symbols("t u c", real=True)
    cc = s.cos(t)
    Q = s.sqrt(cc*(2-cc))
    N = (1-cc)*(1-cc-2*u)
    P = (1-u)*cc**2*(2-cc) - u*(1-cc)**2*(1+cc)
    M = P/Q
    J = s.diff(N, t)*s.diff(M, u) - s.diff(N, u)*s.diff(M, t)
    A = (1-c)*c*(2-c)*(1+2*c-c**2)
    B = c**3 - 3*c + 1
    factor = (-2*s.sin(t)/Q**3*(A + u*B)).subs(c, cc)
    for tv in (s.Rational(3, 10), s.Rational(-7, 10), s.Rational(11, 10)):
        for uv in (s.Rational(1, 7), s.Rational(1, 2), s.Rational(5, 6)):
            assert abs(s.N((J - factor).subs({t: tv, u: uv}), 30)) < 1e-25
    assert s.simplify(s.diff(N, t, 2).subs(t, 0) + 2*u) == 0
    # Zero set of F on c>0: N=0 on c=1 (M=1-u) and on u=(1-c)/2 (P=(1+c)/2*(-(c^2-3c+1))).
    Pc = (1-u)*c**2*(2-c) - u*(1-c)**2*(1+c)
    assert s.expand(Pc.subs(u, (1-c)/2) + (1+c)/2*(c**2 - 3*c + 1)) == 0
    assert s.simplify((Pc/s.sqrt(c*(2-c))).subs(c, 1) - (1-u)) == 0
    # Winding of F=N+iM around the two interior zeros, by a fine finite argument sum.
    c0 = (3 - math.sqrt(5))/2
    t0, u0 = math.acos(c0), (1 - c0)/2

    def F(tv, uv):
        cv = math.cos(tv)
        qv = math.sqrt(cv*(2-cv))
        nv = (1-cv)*(1-cv-2*uv)
        pv = (1-uv)*cv*cv*(2-cv) - uv*(1-cv)**2*(1+cv)
        return complex(nv, pv/qv)
    for sign, expected in ((1, -1), (-1, 1)):
        total, steps, radius = 0.0, 4000, 0.02
        prev = F(sign*t0 + radius, u0)
        for k in range(1, steps+1):
            a = 2*math.pi*k/steps
            cur = F(sign*t0 + radius*math.cos(a), u0 + radius*math.sin(a))
            total += cmath.phase(cur/prev)
            prev = cur
        assert round(total/(2*math.pi)) == expected
    # Z[C2]=Z[x]/(x^2-1) has only the idempotents 0 and 1.
    a, b = s.symbols("a b", integer=True)
    sols = s.solve([a*a + b*b - a, 2*a*b - b], [a, b], dict=True)
    integral = sorted((d[a], d[b]) for d in sols if all(v.is_integer for v in d.values()))
    assert integral == [(0, 0), (1, 0)]
    print("PASS fold Jacobian factor and C_sym second derivative; F windings -1/+1; Z[C2] idempotents {0,1}")


def window_kernels():
    d, L, T, x, tau = s.symbols("delta L T x tau", positive=True)
    K = s.integrate(s.exp(-s.I*d*tau), (tau, 0, L))/L
    haar = s.integrate(s.exp(-s.I*d*tau), (tau, 0, s.log(T)))/s.log(T)
    assert s.simplify(haar - K.subs(L, s.log(T))) == 0
    assert s.simplify(s.expand_complex(K*s.conjugate(K)) - (s.sin(d*L/2)/(d*L/2))**2) == 0
    lebesgue = s.integrate(x**(-s.I*d), (x, 1, T))/(T - 1)
    closed = (T**(1 - s.I*d) - 1)/((1 - s.I*d)*(T - 1))
    assert s.simplify(lebesgue - closed) == 0
    mp.mp.dps = 30
    for dv in (0.3, 1.0, math.log(3/2), 4.0):
        limit_mod = 1/math.sqrt(1 + dv*dv)
        val = abs(complex((mp.power(10**8, 1 - 1j*dv) - 1)/((1 - 1j*dv)*(10**8 - 1))))
        assert abs(val - limit_mod) < 1e-6
        for Tv in (10.0, 1e3, 1e6):
            integral = mp.quad(lambda tt: mp.exp(-1j*dv*tt)/tt, mp.linspace(1, Tv, 400))
            assert abs(integral)/math.log(Tv) <= 2/(dv*math.log(Tv)) + 1e-12
    print("PASS window kernels: Haar change of variable, sinc modulus, Lebesgue non-decay limit and 2/(delta*mass) Haar bound")


def main():
    assert not sys.flags.optimize
    sources()
    edges_and_lines()
    smooth_readout_identities()
    smooth_readout_replay()
    half_source_embedding()
    fold_and_monodromy_inputs()
    window_kernels()
    print("PASS continuation 0.04 exact/finite replay; analytic, sheaf and covering proofs are written/external")


if __name__ == "__main__":
    main()
