"""Find the actual cohomology image of closed quadratic source combinations."""
from fractions import Fraction as Q
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[2]
BASE = ROOT / "releases/archive/paper-01/independent-reconstruction-v0.05"
sys.path.insert(0, str(BASE))
import reconstruct as R
import complete_and_verify as C


def dec(rows):
    return {k: Q(a, b) for k, a, b in rows}


full = json.loads((BASE / "complete_splitting.json").read_text())
pcols = [dec(row["p"]) for row in full["h2_p2_columns"]]


def project(q):
    out = {}
    for k, z in q.items():
        out = R.add(out, pcols[k], z)
    return out


U = [R.flatten(R.V["alpha"]), R.flatten(R.V["dec_c1"](R.V["DATA"]["xi"]))]
U += [R.flatten(f) for f in R.V["U16"]]
raw, differential, closed, pimage = R.Basis(), R.Basis(), R.Basis(), R.Basis()
for i, f in enumerate(U):
    for j, g in enumerate(U[i:], i):
        q = R.bracket(f, g)
        raw.insert(q)
        pq = project(q)
        pimage.insert(pq)
        dq = C.d2(q)
        rem, pc = differential.reduce(dq, pq)
        if rem:
            differential.insert(dq, pq)
        elif closed.insert(pc)[0]:
            print("NEW CLOSED H CLASS", i, j, R.encode(pc), flush=True)
print("QUADRATIC: raw rank", len(raw), "differential rank", len(differential),
      "closed-H rank", len(closed), "old full projection image rank", len(pimage), flush=True)
