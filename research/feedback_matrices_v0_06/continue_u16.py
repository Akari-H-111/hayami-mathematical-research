"""Probe compatible U16 feedback from the archived arity-17 trajectory."""
from fractions import Fraction as Q
import json
from pathlib import Path
import sys
import sympy as sp

ROOT = Path(__file__).resolve().parents[2]
BASE = ROOT / "releases/archive/paper-01/independent-reconstruction-v0.05"
sys.path.insert(0, str(BASE))
import reconstruct as R
import complete_and_verify as C


def dec(rows):
    return {k: Q(a, b) for k, a, b in rows}


data = json.loads((BASE / "transfer_through_22.json").read_text())
full = json.loads((BASE / "complete_splitting.json").read_text())
pcols = [dec(row["p"]) for row in full["h2_p2_columns"]]


def old_project(q):
    out = {}
    for k, z in q.items():
        out = R.add(out, pcols[k], z)
    return out


alpha = R.flatten(R.V["alpha"])
xi = R.flatten(R.V["dec_c1"](R.V["DATA"]["xi"]))
U = [R.flatten(f) for f in R.V["U16"]]
quads = [R.bracket(f, g) for i, f in enumerate([alpha, xi]+U) for g in ([alpha, xi]+U)[i:]]
diff, closed = R.Basis(), R.Basis()
for q in quads:
    dq, pq = C.d2(q), old_project(q)
    rem, pc = diff.reduce(dq, pq)
    if rem:
        diff.insert(dq, pq)
    else:
        closed.insert(pc)
assert len(closed) == 2
zeta, eta = [v for _, (v, _) in sorted(closed.rows.items())]
extra = next(old_project(q) for q in quads if closed.reduce(old_project(q))[0])
ambient = sp.Matrix(42, 3, lambda i, j: [zeta, eta, extra][j].get(i, 0))
_, pivot3 = ambient.T.to_DM().rref()
inverse3 = ambient[list(pivot3), :].inv()
old_feedback = [old_project(R.bracket(a, f)) for a in (alpha, xi) for f in U]
old_feedback_matrix = sp.Matrix(42, 70, lambda i, j: old_feedback[j].get(i, 0))
for parameter in (0, 1):
    target = sp.Matrix(42, 3, lambda i, j: [zeta, eta, R.scale(eta, Q(parameter))][j].get(i, 0))
    if (target*inverse3*old_feedback_matrix[list(pivot3), :]).to_DM().rank() == 2:
        break
else:
    raise AssertionError("No tested retraction preserves the feedback sector")
print("RETRACTION parameter", parameter, flush=True)
correction = R.Basis()
for q in quads:
    pq_sparse = old_project(q)
    pq = sp.Matrix([pq_sparse.get(i, 0) for i in range(42)])
    coefficients = inverse3*pq[list(pivot3), :]
    assert ambient*coefficients == pq
    delta = target*coefficients-pq
    desired = {i: Q(z) for i, z in enumerate(delta) if z}
    dq = C.d2(q)
    if correction.reduce(dq)[0]:
        correction.insert(dq, desired)
    else:
        assert R.scale(correction.reduce(dq)[1], -1) == desired

new_pcols = [R.add(p, correction.reduce(dq)[1], -1) for p, dq in zip(pcols, C.UNITS)]


def project(q):
    out = {}
    for k, z in q.items():
        out = R.add(out, new_pcols[k], z)
    return out


for q, h in R.V["HB"].values():
    assert not project(q)
for i, z in enumerate(full["H2_representatives"]):
    assert project(dec(z)) == {i: Q(1)}
print("PROJECTION PASS: all 42 cohomology classes retained; old partial sources still killed", flush=True)
blocks = [[project(R.bracket(a, f)) for f in U] for a in (alpha, xi)]
A, B = [sp.Matrix(42, 35, lambda i, j: cols[j].get(i, 0)) for cols in blocks]
images = A.row_join(B)
_, cols = images.to_DM().rref()
J = images[:, list(cols)]
_, rows = J.T.to_DM().rref()
left = J[list(rows), :].inv()
assert len(rows) == 2


def sector(q):
    p = project(q)
    v = sp.Matrix([p.get(k, 0) for k in range(42)])
    c = left * v[list(rows), :]
    assert J*c == v, "harmonic output outside the complete two-dimensional sector"
    return c


for i, f in enumerate(U):
    for g in U[i:]:
        sector(R.bracket(f, g))
print("SECTOR PASS: all U16 quadratic brackets have full p-image in the same 2D sector", flush=True)
A2, B2 = left*A[list(rows), :], left*B[list(rows), :]
print("BLOCKS", "pivot harmonic rows", rows, "A", A2, "B", B2, flush=True)
F = {}
for row in data["F"]:
    if row["arity"] <= 17:
        F.setdefault(row["arity"], {})[tuple(row["monomial"])] = dec(row["cochain"])
fixed = [(dec(row["dF"]), dec(row["F"])) for row in data["boundary_basis"]]
fixed += [(q, R.flatten(h)) for q, h in R.V["HB"].values()]


def seed():
    basis = R.Basis()
    for q, h in fixed:
        rem, neg = basis.reduce(q)
        if rem:
            assert basis.insert(q, h)[0]
        else:
            assert R.scale(neg, -1) == h
    return basis


for n in range(18, 23):
    rn = R.source(F, n)
    assert all(not project(q) for q in rn.values())
    domain = seed()
    affine, free = {}, []
    for key, q in sorted(rn.items(), reverse=True):
        if domain.reduce(q)[0]:
            domain.insert(q, {135+len(free): Q(-1)})
            free.append(key)
        affine[key] = R.scale(domain.reduce(q)[1], -1)
    # h(q) has a real C1 component plus -formal F-channel symbols.
    F[n] = {key: R.scale({k: z for k, z in h.items() if k < 135}, -1)
            for key, h in affine.items()}
    base = R.source(F, n+1)
    rhs = sp.Matrix.vstack(*(sector(base.get((n+1-b, b), {})) for b in range(6, n+2)))
    M = sp.zeros(rhs.rows, 35*len(free))
    for (a, b), h in affine.items():
        for symbol, coefficient in h.items():
            if symbol < 135:
                continue
            j = symbol-135
            assert b >= 6
            M[2*(b-6):2*(b-5), 35*j:35*(j+1)] -= coefficient*A2
            M[2*(b-5):2*(b-4), 35*j:35*(j+1)] -= coefficient*B2
    rank, augmented = M.to_DM().rank(), M.row_join(rhs).to_DM().rank()
    print("FEEDBACK", n+1, "free", free, "shape", M.shape, "rank/aug", rank, augmented, flush=True)
    assert rank == augmented
    reduced, pivots = M.row_join(-rhs).to_DM().rref()
    reduced = reduced.to_Matrix()
    solution = sp.zeros(M.cols, 1)
    for i, p in enumerate(pivots):
        assert p < M.cols
        solution[p] = reduced[i, -1]
    assert M*solution == -rhs
    lifts = []
    for j in range(len(free)):
        f = {}
        for k, u in enumerate(U):
            f = R.add(f, u, Q(solution[35*j+k]))
        lifts.append(f)
    for key, h in affine.items():
        f = F[n][key]
        for symbol, coefficient in h.items():
            if symbol >= 135:
                f = R.add(f, lifts[symbol-135], -coefficient)
        F[n][key] = f
        fixed.append((rn[key], R.scale(f, -1)))
    assert all(not project(q) for q in R.source(F, n+1).values())
    seed()
    print("COMPATIBLE PASS", n, "source-domain dimension", len(domain), "nonzero controls", sum(bool(z) for z in solution), flush=True)
