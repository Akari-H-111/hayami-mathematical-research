from pathlib import Path
BASE = Path(__file__).resolve().parent
import contextlib, io, runpy, sympy as sp
buf=io.StringIO()
with contextlib.redirect_stdout(buf):
    V49=runpy.run_path(str(BASE / "verify_extension_independent_forced_core_v0_49.py"))
    V47=runpy.run_path(str(BASE / "verify_cubic_support_multigrading_v0_47.py"))
MU=V47["MU"]; HB=V47["HB"]
Hvals=[hv for _,hv in [HB[p] for p in sorted(HB)]]
MH=V47["matcols"](Hvals)
assert MH.rank()==MU.rank()==35
assert MH.row_join(MU).rank()==35
C=V49["C"]; Rem=V49["Rem"]; AC=V49["AC"]
assert C.rank()==19
assert Rem*C==sp.zeros(Rem.rows,C.cols)
assert V49["Aambient"]*C==C*AC
assert Rem*V49["Aambient"]*C==sp.zeros(Rem.rows,C.cols)
assert AC.rank()==7 and (AC**2).rank()==7
assert V49["R"].rank()==7
S=sp.symbols("S")
q=S**5-4*S**4+12*S**3-32*S**2+80*S-192
assert sp.expand(V49["AR"].charpoly(S).as_expr()-(S+2)**2*q)==0
print("v0.50 intrinsic forced-core verifier: PASS")
print("im(h0)=U16 intrinsically, dim 35")
print("intrinsic forced module dim 19")
print("stable recurrent image dim 7")

