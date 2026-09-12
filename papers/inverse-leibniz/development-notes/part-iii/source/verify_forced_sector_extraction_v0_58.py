import sympy as sp
S=sp.symbols("S")

Jm2=sp.Matrix([[-2,1],[0,-2]])
AK=sp.diag(Jm2,sp.Matrix([[3]]))
B=sp.Matrix([[1,0,2],[0,1,0],[3,0,1]])
DX=sp.diag(7,8,9)
A=sp.Matrix.vstack(
    sp.Matrix.hstack(AK,B),
    sp.Matrix.hstack(sp.zeros(3,3),DX)
)
EJ=sp.Matrix([[11,1],[0,11]])
C=sp.Matrix([[1,0,0,0,0,0],[0,1,0,0,0,0]])
T=sp.Matrix.vstack(
    sp.Matrix.hstack(A,sp.zeros(6,2)),
    sp.Matrix.hstack(C,EJ)
)
Lambda=sp.Matrix.hstack(sp.eye(6),sp.zeros(6,2))
nu=sp.Matrix.hstack(sp.zeros(3,3),sp.eye(3))
Gamma=nu*Lambda

assert Lambda.rank()==6 and Gamma.rank()==3
assert sp.Matrix.vstack(Lambda,Lambda*T).rank()==Lambda.rank()
assert sp.Matrix.vstack(Gamma,Gamma*T).rank()==Gamma.rank()

KG=sp.Matrix.hstack(*Gamma.nullspace())
KL=sp.Matrix.hstack(*Lambda.nullspace())
basis=[]
M=KL
for v in Gamma.nullspace():
    cand=sp.Matrix.hstack(M,v)
    if cand.rank()>M.rank():
        basis.append(v); M=cand
    if len(basis)==3: break
Q=sp.Matrix.hstack(*basis)
W=sp.Matrix.hstack(Q,KL)
coeff=W.gauss_jordan_solve(T*Q)[0]
TK=coeff[:3,:]
assert sp.expand(TK.charpoly(S).as_expr()-AK.charpoly(S).as_expr())==0

# Non-invariant normalized sector.
T2=sp.Matrix([[0,0,0],[0,2,0],[1,0,3]])
Gamma2=sp.Matrix([[0,0,1]])
assert sp.Matrix.vstack(Gamma2,Gamma2*T2).rank()>Gamma2.rank()
O2=sp.Matrix.vstack(*[Gamma2*(T2**r) for r in range(3)])
Minf=sp.Matrix.hstack(*O2.nullspace())
assert Minf==sp.Matrix([0,1,0])
assert T2*Minf==2*Minf

# Cyclic symbol formula.
dL=sp.expand((S+2)**2*(S-3))
dG=S-3
pforced=sp.factor(sp.div(dL,dG,S)[0])
assert sp.expand(pforced-(S+2)**2)==0

print("v0.58 Forced-Sector Extraction verifier: PASS")
print("dim forced sector =",Lambda.rank()-Gamma.rank())
print("forced char polynomial =",sp.factor(TK.charpoly(S).as_expr()))
print("cyclic forced polynomial =",pforced)
