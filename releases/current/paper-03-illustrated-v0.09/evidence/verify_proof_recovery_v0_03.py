"""Exact v0.03 recovery checks. Historical helpers are not reconstructed by name."""
from pathlib import Path
from fractions import Fraction
from itertools import product
import runpy
import sympy as sp
from sympy.polys.matrices import DomainMatrix

ROOT = Path(__file__).resolve().parent
prior = runpy.run_path(str(ROOT / "verify_revision_claims.py"))
V, minpoly = prior["cubic"], prior["minimal_polynomial"]
S = prior["S"]
SBAR, SID = V["SBAR"], V["SID"]
br, add1, scale1, add2 = V["bracket"], V["c1_add"], V["c1_scale"], V["c2_add"]
alpha, xi = V["alpha"], V["dec_c1"](V["DATA"]["xi"])
E, K, P, Q, R = V["U16"][:5]
MU = {s: V["matsparse"](V["L"][s[0]] * V["R"][s[1]]) for s in SBAR}


def c2pairs(q):
    out = {}
    for key, value in q.items():
        s, t, rc = V["unidx2"](key)
        out.setdefault((s, t), {})[rc] = value
    return out


def differential1(f):
    out = {}
    for s, t in product(SBAR, repeat=2):
        st = (s[0] + t[0], s[1] + t[1])
        value = V["madd"](V["mmul"](MU[s], f.get(t, {})), f.get(st, {}), -1)
        value = V["madd"](value, V["mmul"](f.get(s, {}), MU[t]))
        for rc, z in value.items():
            out[V["idx2"](s, t, rc)] = z
    return out


def differential2(q):
    pairs = c2pairs(q)
    out = {}
    for s, t, u in product(SBAR, repeat=3):
        st, tu = (s[0] + t[0], s[1] + t[1]), (t[0] + u[0], t[1] + u[1])
        val = V["madd"](V["mmul"](MU[s], pairs.get((t, u), {})), pairs.get((st, u), {}), -1)
        val = V["madd"](val, pairs.get((s, tu), {}))
        val = V["madd"](val, V["mmul"](pairs.get((s, t), {}), MU[u]), -1)
        for (i, j), z in val.items():
            out[((SID[s] * 15 + SID[t]) * 15 + SID[u]) * 9 + i * 3 + j] = z
    return out


def exact_rank(columns):
    keys = sorted(set().union(*(set(col) for col in columns)))
    if not keys or not columns:
        return 0
    rows = {key: i for i, key in enumerate(keys)}
    entries = {(rows[k], j): sp.Rational(v) for j, col in enumerate(columns) for k, v in col.items()}
    matrix = sp.MutableSparseMatrix(len(keys), len(columns), entries)
    return DomainMatrix.from_Matrix(matrix).convert_to(sp.QQ).rank()


# Paper I: rebuild all strict equations from the actual nine-dimensional weak fiber.
u, v, a, b, c, d, e, f, g = sp.symbols("u v a b c d e f g")
w = sp.Matrix([u, v + a, b, 2*v, c, d, e, f, g])
X, Y = V["decode"](V["WI"] * w)
L = {j: V["L"][j] + X[j] for j in range(4)}
RR = {j: V["R"][j] + Y[j] for j in range(4)}
blocks = {}
for i, j in product(range(1, 4), repeat=2):
    blocks["L", i, j] = L[i]*L[j] - (L[i+j] if i+j < 4 else sp.zeros(3))
    blocks["R", i, j] = RR[j]*RR[i] - (RR[i+j] if i+j < 4 else sp.zeros(3))
    blocks["M", i, j] = L[i]*RR[j] - RR[j]*L[i]
relations = [sp.expand(z) for matrix in blocks.values() for z in matrix]
variables = [a, b, c, d, f, g, e, u, v]
strict = sp.groebner([z for z in relations if z], *variables, order="lex")
target = sp.groebner([a+e/6, b-e/3, c-2*e/3, d, f, g, e**2, e*v, (1+2*u)*e+3*v**2, v**3], *variables, order="lex")
assert strict == target
origin = {z: 0 for z in variables}
assert sp.Matrix(relations).jacobian(variables).subs(origin).rank() == 7
transverse = -3*v**2/(1+2*u)
section = {e: transverse, a: -transverse/6, b: transverse/3, c: 2*transverse/3, d: 0, f: 0, g: 0}
for z in relations:
    num, den = sp.fraction(sp.cancel(z.subs(section)))
    assert sp.rem(num, v**3, v) == 0
    assert den.subs({u: 0, v: 0}) != 0
certificate = (4*blocks["L",1,1][0,1] - 2*blocks["L",1,1][1,2]
               -2*blocks["L",1,2][0,2] - 2*blocks["R",1,1][1,2])/8
q = 1+2*u
assert sp.cancel(certificate.subs(section) - v**3*(v+4*q)/(4*q**2)) == 0
assert sp.cancel((4*q**2/(v+4*q))*certificate.subs(section) - v**3) == 0
# The same affine equations define a finite free rank-three family over Q[u].
Mv = sp.Matrix([[0,0,0],[1,0,0],[0,-q/3,0]])
Me = sp.Matrix([[0,0,0],[0,0,0],[1,0,0]])
assert Me**2 == Me*Mv == Mv*Me == sp.zeros(3)
assert 3*Mv**2+q*Me == sp.zeros(3)
assert sp.Matrix.hstack(sp.eye(3)[:,0],Mv[:,0],Me[:,0]) == sp.eye(3)
assert Mv.subs(u,0).rank() == 2 and (Mv.subs(u,0)**2).rank() == 1
assert Mv.subs(u,sp.Rational(-1,2))**2 == sp.zeros(3)
assert sp.Matrix.hstack(Mv[:,0],Me[:,0]).rank() == 2
flat_basis = sp.groebner([e**2,e*v,3*v**2+q*e],v,e,domain=sp.QQ.poly_ring(u))
assert len(flat_basis.polys) == 3
# The section calculation above includes the all-orders certificate; no finite truncation is used for that claim.
print("PASS I: reconstructed weak rank 45, strict tangent rank 7; exact cubic ideal and rational all-orders section", flush=True)
print("PASS I: finite free rank-three family; cubic fibers for q!=0, square-zero two-generator fiber for q=0",flush=True)

# Paper II: derive differentials from the finite algebra action, without v0.13.
du = [differential1(x) for x in V["U16"]]
assert exact_rank(du) == 35
assert all(not differential2(z) for z in du)
assert differential1(alpha) == differential1(xi) == {}
full_c1 = V["weak"] + [V["basis_c1"]((i,j),(r,c))
    for i,j,r,c in product(range(1,4),range(1,4),range(3),range(3))]
assert len(full_c1) == 90
boundaries = [differential1(x) for x in full_c1]
assert exact_rank(boundaries) == 88
assert br(alpha,alpha) == br(alpha,xi) == {}
assert br(xi,xi) == {k:-2*z for k,z in differential1(E).items()}
assert br(alpha,E) == {k:2*z for k,z in differential1(E).items()}
# Independence and spanning of Z1 follow from rank 88 and the two independent cocycles.
assert xi and alpha and exact_rank([
    {SID[s]*9+rc[0]*3+rc[1]:z for s,m in x.items() for rc,z in m.items()}
    for x in [alpha,xi]]) == 2
print("PASS II: constrained C1 dimension 90, differential rank 88, Z1=span(alpha,xi), maximal response domain", flush=True)

# Recompute every numerical invariant formerly read from the absent v0.48 JSON.
old = [source for source, hvalue in V["HB"].values()]
sources = [br(alpha,x) for x in V["U16"]]
combined = old + sources
r_old, r_F, r_L = exact_rank(old), exact_rank(sources), exact_rank(combined)
assert (r_old,r_F,r_L) == (100,23,116)
assert r_old+r_F-r_L == 7
dold = [differential2(z) for z in old]
dF = [differential2(z) for z in sources]
assert exact_rank(dold) == 99
assert exact_rank(dF) == 22
assert exact_rank(dold+dF) == 114
print("PASS II: combined source cycle intersection has dimension 2 (not its boundary dimension 1)",flush=True)
assert r_old+88-exact_rank(old+boundaries) == 1
assert r_L+88-exact_rank(combined+boundaries) == 1
assert r_F+35-exact_rank(sources+du) == 1
# The separate one-dimensional cycle intersections contain dE. The combined boundary intersection was checked directly.
assert exact_rank(old+[differential1(E)]) == 100
assert exact_rank(sources+[differential1(E)]) == 23
_, h_dE = V["reduce_h"](differential1(E))
assert h_dE == E
assert (r_L-r_old)*35 == 560
print("PASS II: reconstructed v0.48 claims: ranks 35/23/100/116; intersections 7/1; 16*35=560 extensions", flush=True)

# Re-run the substantive v0.53 source checks with the reconstructed d1 and d2.
rails = V["rails"]
g0 = add1(scale1(K,Fraction(2)),P,Fraction(-1))
assert g0 == add1(rails[3][1],rails[3][0],Fraction(2))
s = br(xi,E)
Y13 = add2(br(alpha,K),s,Fraction(-2))
Z23 = add2({k:4*z for k,z in s.items()},br(alpha,P),Fraction(-1))
U33 = add2({k:-8*z for k,z in s.items()},br(alpha,R),Fraction(-1))
Aco = V["U16"][7]
V43 = add2({k:16*z for k,z in s.items()},br(alpha,Aco),Fraction(-1))
g1, g2 = add1(scale1(P,Fraction(-2)),R,Fraction(-1)), add1(scale1(R,Fraction(-2)),Aco,Fraction(-1))
assert g1 == add1(rails[3][2],rails[3][1],Fraction(2))
for gv, first, second in [(g0,Y13,Z23),(g1,Z23,U33),(g2,U33,V43)]:
    assert br(alpha,gv) == add2({k:2*z for k,z in first.items()},second)
assert br(alpha,add1(g0,E,Fraction(-1))) == add2(br(alpha,g0),br(alpha,E),Fraction(-1))
assert differential2(br(alpha,K))
assert not differential2(differential1(K))
assert br(alpha,add1(g0,K,Fraction(-1))) == add2(br(alpha,g0),br(alpha,K),Fraction(-1))
print("PASS II: v0.53 E-rail and first three g3 source identities, boundary/nonclosed tilts, d^2K=0", flush=True)

# Paper III: exact witnesses for the same full orbit with noninvariant normalization.
def core(A,H):
    O = sp.Matrix.vstack(*(H*A**j for j in range(A.rows)))
    basis = O.nullspace()
    return sp.Matrix.hstack(*basis) if basis else sp.zeros(A.rows,0)


def restriction(A,U):
    return U.gauss_jordan_solve(A*U)[0] if U.cols else sp.zeros(0)


def check_two(A,H,L1,L2):
    U = core(A,H)
    AK = restriction(A,U)
    B1,B2 = A+L1*H,A+L2*H
    assert core(B1,H).columnspace() == U.columnspace()
    assert core(B2,H).columnspace() == U.columnspace()
    assert B1*U == B2*U == A*U
    assert sp.expand(sp.gcd(B1.charpoly(S).as_poly(),B2.charpoly(S).as_poly()).as_expr()-AK.charpoly(S).as_expr()) == 0
    assert sp.expand(sp.gcd(minpoly(B1),minpoly(B2)).as_expr()-minpoly(AK).as_expr()) == 0


A = sp.Matrix([[0,0,0],[0,2,0],[1,0,3]])
H = sp.Matrix([[0,0,1]])
assert core(A,H) == sp.Matrix([0,1,0])
check_two(A,H,sp.Matrix([0,0,-3]),sp.Matrix([-1,0,-3]))
# Two-point witnesses have characteristic polynomials (S-2)*S^2 and (S-2)*(S^2+1).
assert sp.factor((A+sp.Matrix([0,0,-3])*H).charpoly(S).as_expr()) == S**2*(S-2)
assert sp.factor((A+sp.Matrix([-1,0,-3])*H).charpoly(S).as_expr()) == (S-2)*(S**2+1)
# One marked model realizes the entire assembly, with supplied state data explicit.
d1,G0,G1 = sp.Matrix([0,0,1]),sp.diag(1,2,3),sp.Matrix([[3]])
eps,Gbar = sp.Matrix([[1,0,0],[0,1,0]]),sp.diag(1,2)
assert G0*d1 == d1*G1 and eps*d1 == sp.zeros(2,1)
assert eps*G0 == Gbar*eps and eps.rank() == 2
assert sp.Matrix.hstack(sp.eye(2).reshape(4,1),Gbar.reshape(4,1)).rank() == 2
iota,R0 = sp.eye(2),sp.Matrix([1,0])
sourceN = iota*R0
assert Gbar*R0 == R0
quotient = sp.Matrix([[0,1]])
D = sp.Matrix([[0,0,0],[0,0,1]])
Lambda = sp.eye(3)
assert sourceN.rank() == 1 and quotient*sourceN == sp.zeros(1,1)
assert quotient*D*Lambda == H
assert core(A,quotient*D*Lambda) == sp.Matrix([0,1,0])
assert Lambda.nullspace() == []
print("PASS III: single end-to-end marked model, including noninvariant normalization",flush=True)
# Noncyclic Jordan core with different characteristic and minimal floors.
J = sp.Matrix([[-2,1],[0,-2]])
AK = sp.diag(J,-2,3)
AQ = sp.Matrix([[0,0],[1,3]])
cross = sp.Matrix([[1,0],[0,1],[2,3],[4,5]])
A = sp.BlockMatrix([[AK,cross],[sp.zeros(2,4),AQ]]).as_explicit()
H = sp.Matrix([[0,0,0,0,0,1]])
L1, L2 = sp.zeros(6,1),sp.zeros(6,1)
L1[5],L2[4],L2[5] = -3,-1,-3
check_two(A,H,L1,L2)
assert minpoly(AK).degree() == 3 and AK.charpoly(S).as_poly().degree() == 4
# Exact rational conjugacy and a multi-output example.
P = sp.eye(6)
P[0,5],P[4,1] = 2,3
check_two(P*A*P.inv(),H*P.inv(),P*L1,P*L2)
A = sp.diag(2,0,1,0,3)
A[2,1],A[4,3] = 1,1
H = sp.Matrix([[0,0,1,0,0],[0,0,0,0,1]])
L1,L2 = sp.zeros(5,2),sp.zeros(5,2)
L1[2,0],L1[4,1] = -1,-3
L2[:,:] = L1
L2[1,0],L2[3,1] = -1,-2
check_two(A,H,L1,L2)
print("PASS III: same-orbit stable floors, two rational witnesses, noncyclic Jordan depths, conjugacy and multiple outputs", flush=True)

# Landing descent can fail globally but hold on the normalized stable core.
T = sp.diag(2,0,3)
T[2,1] = 1
Lambda = sp.Matrix([[1,0,0],[0,0,1]])
Gamma = sp.Matrix([[0,0,1]])
W = core(T,Gamma)
assert W == sp.Matrix([1,0,0])
assert sp.Matrix.vstack(Lambda,Lambda*T).rank() > Lambda.rank()
assert (Lambda*W).rank() == 1 and T*W == 2*W
# In the absence of even local descent, quotient by future-invisible states is always defined.
T = sp.Matrix([[0,1],[0,0]])
Lambda = sp.Matrix([[1,0]])
Gamma = sp.zeros(1,2)
W,Jfuture = core(T,Gamma),core(T,Lambda)
assert W.rank() == 2 and Jfuture.cols == 0
assert sp.Matrix.vstack(Lambda,Lambda*T).rank() == 2
# Static quotient has dimension one and no induced operator; future-output quotient has dimension two.
assert Lambda.rank() == 1 and T*sp.Matrix([0,1]) == sp.Matrix([1,0])
print("PASS III: local versus global descent and future-output quotient boundary example", flush=True)
# Seed surjectivity itself is not necessary: generation of all target seeds suffices.
C = sp.Matrix([[0,0],[1,0]])
seed = sp.Matrix([1,0])
assert sp.Matrix.hstack(seed,C*seed).rank() == 2
assert seed.rank() == 1 and sp.eye(2).rank() == 2
print("PASS III: generated-seed coverage can hold without surjectivity onto the target seed image",flush=True)
Az = sp.Matrix([[0,0],[1,3]])
Hz = sp.Matrix([[0,1]])
check_two(Az,Hz,sp.Matrix([0,-3]),sp.Matrix([-1,-3]))
assert core(Az,Hz).cols == 0
print("PASS III: empty stable core gives characteristic and minimal floors equal to one",flush=True)
print("PASS: v0.03 proof-recovery suite; prior v0.02 regression checks included.", flush=True)
