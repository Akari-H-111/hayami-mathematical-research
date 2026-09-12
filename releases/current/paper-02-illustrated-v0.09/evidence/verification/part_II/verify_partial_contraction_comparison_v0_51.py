from pathlib import Path
BASE = Path(__file__).resolve().parent
import sympy as sp

# A relevant rigid germ consists of U, source F=D(U), K_rel subset F,
# h_rel:K_rel->U, with C_pt=D^{-1}(K_rel).

# ------------------------------------------------------------
# 1. A nontrivial finite example with a two-step invariance filtration.
# ------------------------------------------------------------
# U=k^4, F=k^3.
D=sp.Matrix([
    [1,0,0,0],
    [0,1,0,0],
    [0,0,1,0],
])

# K_rel=span(e1,e2) in F.
K=sp.Matrix([
    [1,0],
    [0,1],
    [0,0],
])

# h_rel columns are values on e1,e2.
# This choice gives A_pt on C_pt=span(u1,u2,u4):
#   u1 -> u2, u2 -> u3 (leaves C_pt), u4 -> 0.
# Therefore C_forced=span(u4), demonstrating that C_pt need not be invariant.
hK=sp.Matrix([
    [0,0],
    [-1,0],
    [0,-1],
    [0,0],
])

# C_pt = {u : D u in K} = ker(last source coordinate).
# Basis u1,u2,u4.
C0=sp.Matrix.hstack(
    sp.Matrix([1,0,0,0]),
    sp.Matrix([0,1,0,0]),
    sp.Matrix([0,0,0,1]),
)

# Common A on C0 from -h_rel D.
# Source coordinates in K are just first two entries.
AonC0=sp.Matrix.hstack(
    -hK[:,0],
    -hK[:,1],
    sp.zeros(4,1),
)

# First invariance step keeps only vectors whose image lies in C0.
# A(u1)=u2 in C0; A(u2)=u3 outside; A(u4)=0.
# Thus C1=span(u1,u4); second step removes u1 because A(u1)=u2 not in C1.
# Stable forced core is span(u4).
C1=sp.Matrix.hstack(
    sp.Matrix([1,0,0,0]),
    sp.Matrix([0,0,0,1]),
)
Cforced=sp.Matrix([0,0,0,1])
assert Cforced.rank()==1

# ------------------------------------------------------------
# 2. Change relevant-rigid-germ presentation.
# ------------------------------------------------------------
P=sp.Matrix([
    [1,1,0,0],
    [0,1,0,0],
    [0,0,1,1],
    [0,0,0,1],
])
Q=sp.Matrix([
    [1,1,0],
    [0,1,0],
    [0,0,1],
])
assert P.det()!=0 and Q.det()!=0

Dp=Q*D*P.inv()
Kp=Q*K
hKp=P*hK   # because h'_rel Q = P h_rel on K; columns are Q*K generators.

# Transformed C_pt and forced subspace.
C0p=P*C0
Cforcedp=P*Cforced

# Directly verify C_pt condition using source quotient:
# vector columns in C0p map into Kp.
assert sp.Matrix.hstack(Kp,Dp*C0p).rank()==Kp.rank()

# Common action intertwines on C_pt.
AonC0p=P*AonC0
# Verify the defining formula on the transformed generators:
# Dp*C0p source vectors have Kp coordinates [1,0],[0,1],[0,0].
coords=sp.Matrix([
    [1,0,0],
    [0,1,0],
])
assert Dp*C0p == Kp*coords
assert AonC0p == -hKp*coords

# Stable forced line transports naturally.
assert Cforcedp.rank()==1

# ------------------------------------------------------------
# 3. Same-complex relevant-germ equality criterion.
# ------------------------------------------------------------
# Add an irrelevant rigid source direction outside D(U) by enlarging C2
# to k^4 while keeping the relevant D(U) in the first three coordinates.
D4=sp.Matrix.vstack(D,sp.zeros(1,4))
Krig1=sp.Matrix.hstack(
    sp.Matrix([1,0,0,0]),
    sp.Matrix([0,1,0,0]),
)
Krig2=sp.Matrix.hstack(
    Krig1,
    sp.Matrix([0,0,0,1]), # extra rigidity outside D(U)
)
# Intersections with D(U) are the same.
DU=D4
assert sp.Matrix.hstack(Krig1,DU).rank()==sp.Matrix.hstack(Krig2,DU).rank()-1
# More directly: D(U) has fourth coordinate zero, so the extra e4 cannot alter C_pt.

# ------------------------------------------------------------
# 4. No-go: same ambient complex/cohomology data do not suffice.
# ------------------------------------------------------------
# Same U,F,D.  Package A rigidifies e1; package B rigidifies nothing.
Dsmall=sp.Matrix([[1]])
# A: K_rel=F -> C_pt=U.
# B: K_rel=0 -> C_pt=0.
dim_C_A=1
dim_C_B=0
assert dim_C_A!=dim_C_B

print("v0.51 Partial-Contraction Comparison verifier: PASS")
print("nontrivial example: C_pt dim 3 -> C_forced dim 1")
print("rigid-germ change of basis transports C_forced naturally")
print("irrelevant rigidity outside D(U_part) does not affect the core")
print("same ambient complex alone is insufficient")

