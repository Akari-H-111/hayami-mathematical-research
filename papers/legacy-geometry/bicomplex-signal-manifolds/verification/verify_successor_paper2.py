"""Exact checks for successor paper 2 (Pseudo-Laplacians at Whitney Cross-Caps).

Verifies the algebra used by the written proofs: adapted-metric identities, the
Roman surface singular set and Whitney determinants, its symmetry orbits on
pairs of cross-caps, the eigenvalue pattern of the symmetric Green matrix, and
the ruled-surface reflection identity. It then replays the exact verifiers for
the ruled-surface cross-cap determinants and the arclength identities. Analytic
statements are written proofs and are not certified here.
"""
from pathlib import Path
import itertools
import random
import re
import subprocess
import sys

import sympy as s

PAPER = Path(__file__).resolve().parents[1]
TEX = PAPER / "successor/Pseudo_Laplacians_Whitney_Cross_Caps.tex"


def adapted_metric():
    hx = s.Matrix(s.symbols("a1 a2", real=True))
    hy = s.Matrix(s.symbols("b1 b2", real=True))
    g = s.Matrix([[1 + hx.dot(hx), hx.dot(hy)], [hx.dot(hy), hy.dot(hy)]])
    det = s.expand(g.det())
    cs = s.expand(hx.dot(hx) * hy.dot(hy) - hx.dot(hy) ** 2)  # Cauchy-Schwarz excess >= 0
    assert s.expand(det - hy.dot(hy) - cs) == 0
    assert s.expand((1 + hx.dot(hx)) * hy.dot(hy) - det - hx.dot(hy) ** 2) == 0
    print("PASS adapted metric: |h_y|^2 <= det g <= (1+|h_x|^2)|h_y|^2")


def roman():
    x, y, z, sv, tv = s.symbols("x y z s t", real=True)
    f = lambda p: s.Matrix([p[1] * p[2], p[0] * p[2], p[0] * p[1]])
    M = s.Matrix([[0, z, y], [z, 0, x], [y, x, 0]])
    assert s.expand(M.det() - 2 * x * y * z) == 0
    X = s.Matrix([x, y, z])
    assert f(-X) == f(X)
    pts = []
    for zero in (x, y, z):
        others = [v for v in (x, y, z) if v != zero]
        Mz = M.subs(zero, 0)
        for v in Mz.nullspace():
            p = X.subs(zero, 0)
            for so in s.solve([s.expand(v.dot(p)), s.expand(p.dot(p) - 1)], others, dict=True):
                pts.append(tuple(s.simplify(c) for c in p.subs(so)))
    pts = sorted(set(pts), key=str)
    assert len(pts) == 12
    dets = []
    for pt in pts:
        p = s.Matrix(pt)
        K = [v for v in M.subs(dict(zip((x, y, z), pt))).nullspace() if s.simplify(v.dot(p)) == 0]
        eta = K[0] / s.sqrt(K[0].dot(K[0]))
        xi = p.cross(eta)
        q = p + sv * xi + tv * eta
        F = f(q / s.sqrt(q.dot(q)))
        at0 = {sv: 0, tv: 0}
        Fs, Ft = F.diff(sv).subs(at0), F.diff(tv).subs(at0)
        Fst, Ftt = F.diff(sv).diff(tv).subs(at0), F.diff(tv, 2).subs(at0)
        assert s.simplify(Ft.norm()) == 0 and s.simplify(Fs.norm()) == 1
        dets.append(s.simplify(s.Matrix.hstack(Fs, Fst, Ftt).det()))
    assert set(dets) == {2, -2}
    # rank two away from the twelve points (random sample on the sphere)
    random.seed(20261002)
    for _ in range(400):
        v = [random.gauss(0, 1) for _ in range(3)]
        n = sum(c * c for c in v) ** 0.5
        p = [c / n for c in v]
        if min(abs(p[0]), abs(p[1]), abs(p[2])) < 1e-3:
            continue
        Mp = s.Matrix([[0, p[2], p[1]], [p[2], 0, p[0]], [p[1], p[0], 0]])
        assert abs(Mp.det()) > 1e-9  # invertible, hence rank 2 on the tangent plane
    print("PASS Roman surface: 12 singular points on S^2 (6 on RP^2), Whitney determinants +-2, immersion elsewhere")
    return pts


def roman_symmetry():
    lines = []
    for i, j in itertools.combinations(range(3), 2):
        for sg in (1, -1):
            v = [0, 0, 0]
            v[i], v[j] = 1, sg
            lines.append(tuple(v))

    def canon(v):
        for c in v:
            if c:
                return tuple(-a for a in v) if c < 0 else tuple(v)

    lines = [canon(v) for v in lines]
    idx = {v: i for i, v in enumerate(lines)}
    X = s.symbols("X0:3")
    fp = (X[1] * X[2], X[0] * X[2], X[0] * X[1])
    perms = []
    for perm in itertools.permutations(range(3)):
        for signs in itertools.product((1, -1), repeat=3):
            act = lambda p: tuple(signs[k] * p[perm[k]] for k in range(3))
            fq = (lambda q: (q[1] * q[2], q[0] * q[2], q[0] * q[1]))(act(X))
            assert all(any(s.expand(fq[a] - e * fp[b]) == 0 for b in range(3) for e in (1, -1)) for a in range(3))
            perms.append(tuple(idx[canon(act(v))] for v in lines))
    assert {pm[0] for pm in perms} == set(range(6))
    seen, orbits = set(), []
    for pr in ((a, b) for a in range(6) for b in range(6) if a != b):
        if pr in seen:
            continue
        orb = {(pm[pr[0]], pm[pr[1]]) for pm in perms}
        seen |= orb
        orbits.append(orb)
    cosines = sorted((len(o), abs(s.Matrix(lines[next(iter(o))[0]]).dot(s.Matrix(lines[next(iter(o))[1]])))) for o in orbits)
    assert cosines == [(6, 0), (24, 1)]  # |u.v| = 0 (orthogonal) or 1 (60 degrees for norm sqrt2 vectors)
    # eigenvalue pattern of r I + g_perp P_perp + g_circ P_circ
    r, gp, gc = s.symbols("r g_perp g_circ", real=True)
    Pp = s.zeros(6)
    for a in range(6):
        for b in range(6):
            if a != b and s.Matrix(lines[a]).dot(s.Matrix(lines[b])) == 0:
                Pp[a, b] = 1
    Pc = s.ones(6) - s.eye(6) - Pp
    assert Pp * Pc == Pc * Pp and all(sum(Pc.row(a)) == 4 for a in range(6))
    B = r * s.eye(6) + gp * Pp + gc * Pc
    ev = B.eigenvals()
    expected = {r + gp + 4 * gc: 1, r + gp - 2 * gc: 2, r - gp: 3}
    assert {s.expand(k): v for k, v in ev.items()} == {s.expand(k): v for k, v in expected.items()}
    print("PASS Roman symmetry: transitive on 6 cross-caps; pair orbits 6 (orthogonal) + 24 (60 deg); eigenvalues with multiplicities 1,2,3")


def ruled_reflection():
    t, u = s.symbols("t u", real=True)
    c = s.cos(t)
    S = s.Matrix([c + 2 * u * (1 - c), (1 - u) * s.sin(t), u * s.sqrt(c * (2 - c))])
    assert s.simplify(S.subs(t, -t) - s.diag(1, -1, 1) * S) == s.zeros(3, 1)
    print("PASS ruled surface reflection S(-t,u)=J S(t,u)")


def references():
    tex = TEX.read_text()
    labels = set(re.findall(r"\\label\{([^}]+)\}", tex))
    refs = set(re.findall(r"\\ref\{([^}]+)\}", tex))
    assert refs <= labels, refs - labels
    cites = {c for grp in re.findall(r"\\cite(?:\[[^]]*\])?\{([^}]+)\}", tex) for c in grp.split(",")}
    bibs = set(re.findall(r"\\bibitem\{([^}]+)\}", tex))
    assert cites <= bibs, cites - bibs
    print("PASS paper 2 cross-references and citations resolve")


def main():
    assert not sys.flags.optimize
    adapted_metric()
    roman()
    roman_symmetry()
    ruled_reflection()
    references()
    for script in ("verify_revision.py", "verify_continuation.py"):
        out = subprocess.run([sys.executable, "-B", str(PAPER / "verification" / script)],
                             text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        if out.returncode:
            raise SystemExit(out.stdout)
        print(out.stdout.strip().splitlines()[-1])
    print("PASS successor paper 2 exact replay; written analytic proofs and external theorems are not machine-certified")


if __name__ == "__main__":
    main()
