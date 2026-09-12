"""Read-only probe of the specified v0.05 full projection's feedback blocks."""
from fractions import Fraction as Q
import json
from pathlib import Path
import sys
import sympy as sp

ROOT = Path(__file__).resolve().parents[2]
BASE = ROOT / "releases/archive/paper-01/independent-reconstruction-v0.05"
sys.path.insert(0, str(BASE))
import reconstruct as R


def dec(rows):
    return {k: Q(a, b) for k, a, b in rows}


data = json.loads((BASE / "transfer_through_22.json").read_text())
full = json.loads((BASE / "complete_splitting.json").read_text())
pcols = [dec(row["p"]) for row in full["h2_p2_columns"]]


def project(q):
    out = {}
    for k, z in q.items():
        out = R.add(out, pcols[k], z)
    return out


alpha = R.flatten(R.V["alpha"])
xi = R.flatten(R.V["dec_c1"](R.V["DATA"]["xi"]))
U = [R.flatten(f) for f in R.V["U16"]]
fullU = [dec(row["F"]) for row in data["boundary_basis"]]

for label, basis in [("U16", U), ("C1_acyclic", fullU)]:
    blocks = [[project(R.bracket(a, f)) for f in basis] for a in (alpha, xi)]
    A, B = [sp.Matrix(42, len(basis), lambda i, j: cols[j].get(i, 0)) for cols in blocks]
    print(label, "block ranks", A.to_DM().rank(), B.to_DM().rank(),
          "joint harmonic image rank", A.row_join(B).to_DM().rank(), flush=True)
    F = {}
    for row in data["F"]:
        F.setdefault(row["arity"], {})[tuple(row["monomial"])] = dec(row["cochain"])
    n = 22
    F[n-1] = {key: value for key, value in F[n-1].items() if key[1] <= 5}
    source = R.source(F, n)
    rhs = sp.Matrix([project(source.get((n-b, b), {})).get(j, 0)
                     for b in range(6, n+1) for j in range(42)])
    M = sp.zeros(42*(n-5), len(basis)*(n-6))
    for b in range(n-6):
        M[42*b:42*(b+1), len(basis)*b:len(basis)*(b+1)] = A
        M[42*(b+1):42*(b+2), len(basis)*b:len(basis)*(b+1)] = B
    print(label, "M22", M.shape, "ranks", M.to_DM().rank(),
          M.row_join(rhs).to_DM().rank(), "nonzero forcing", sum(z != 0 for z in rhs), flush=True)
