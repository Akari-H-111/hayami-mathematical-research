"""Independent full Hochschild cycle-space calculation, without chosen history."""
from pathlib import Path
import json
import time
import sympy as sp
from sympy.polys.matrices import DomainMatrix
from complete_and_verify import UNITS

start = time.monotonic()
D = sp.MutableSparseMatrix(30375,2025,{(k,j):sp.Rational(z)
    for j,c in enumerate(UNITS) for k,z in c.items()})
dm = DomainMatrix.from_Matrix(D).convert_to(sp.QQ)
print(f"D2 assembled: {D.shape}, nonzeros={D.nnz()}",flush=True)
Z = dm.nullspace()
assert (dm*Z.transpose()).is_zero_matrix
out = Z.to_Matrix()
record = {"shape":list(D.shape),"rank_d2":2025-out.rows,"cycle_dimension":out.rows,
          "cycles":[[[j,int(z.p),int(z.q)] for j,z in enumerate(out.row(i)) if z]
                    for i in range(out.rows)]}
path = Path(__file__).with_name("full_cycles.json")
if path.exists():
    raise FileExistsError(path)
path.write_text(json.dumps(record,separators=(",",":"))+"\n")
print(f"FULL CYCLES PASS: dim Z2={out.rows}, rank d2={2025-out.rows}, {time.monotonic()-start:.1f}s",flush=True)
