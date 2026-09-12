import sympy as sp
lam=sp.symbols("lam")
n=4

S=sp.zeros(n)
for i in range(n-1):
    S[i+1,i]=1
W=sp.diag(0,1,2,3)
assert S**4==sp.zeros(n)
assert W*S-S*W==S

def vec(A):
    return sp.Matrix(A).reshape(A.rows*A.cols,1)

def lb(mats):
    basis=[]
    M=sp.zeros(mats[0].rows*mats[0].cols,0)
    for A in mats:
        v=vec(A)
        C=M.row_join(v)
        if C.rank()>M.rank():
            basis.append(A); M=C
    return basis

def alg(gens):
    basis=lb([sp.eye(gens[0].rows)]+gens)
    while True:
        old=len(basis)
        cand=list(basis)
        for G in gens:
            for A in basis:
                cand += [G*A,A*G]
        basis=lb(cand)
        if len(basis)==old: return basis

Aeff=alg([S,W])
Ash=alg([S])
assert len(Aeff)==10
assert len(Ash)==4

lower=[]
for i in range(n):
    for j in range(i+1):
        E=sp.zeros(n); E[i,j]=1
        lower.append(E)
assert len(lb(Aeff+lower))==10

P=sp.Matrix([
    [1,1,0,0],
    [0,1,1,0],
    [0,0,1,1],
    [0,0,0,1],
])
Sp=P.inv()*S*P
Wp=P.inv()*W*P
Aeffp=alg([Sp,Wp])
assert len(Aeffp)==10
transport=[P.inv()*A*P for A in Aeff]
assert len(lb(transport+Aeffp))==10

# Two different actions on a contractible summand.
c=2
d=sp.Matrix.vstack(sp.zeros(n,c),sp.eye(c))
ScA=sp.Matrix([[0,0],[1,0]])
WcA=sp.diag(5,6)
S0A=sp.diag(S,ScA); S1A=ScA
W0A=sp.diag(W,WcA); W1A=WcA
assert S0A*d==d*S1A and W0A*d==d*W1A

ScB=sp.diag(7,8)
WcB=sp.Matrix([[1,1],[0,1]])
S0B=sp.diag(S,ScB); S1B=ScB
W0B=sp.diag(W,WcB); W1B=WcB
assert S0B*d==d*S1B and W0B*d==d*W1B
assert S0A!=S0B and W0A!=W0B
assert S0A[:n,:n]==S0B[:n,:n]==S
assert W0A[:n,:n]==W0B[:n,:n]==W

print("v0.61 Equation-Operator Reconstruction verifier: PASS")
print("effective algebra dim =",len(Aeff))
print("shift-only algebra dim =",len(Ash))
print("relations: S^4=0, [W,S]=S")
print("basis-change and contractible-resolution checks: PASS")
