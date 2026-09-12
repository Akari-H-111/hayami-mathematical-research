import sympy as sp
S=sp.symbols("S")
n=6
e=[sp.eye(n)[:,i] for i in range(n)]
R0=sp.Matrix.hstack(e[0],e[2])

C1=sp.zeros(n)
C1[1,0]=1
C1[3,2]=1
C2=sp.zeros(n)
C2[4,1]=1

def col_basis(M):
    cs=M.columnspace()
    return sp.Matrix.hstack(*cs) if cs else sp.zeros(M.rows,0)

def closure(seed,ops):
    N=col_basis(seed)
    ranks=[N.rank()]
    while True:
        N2=col_basis(sp.Matrix.hstack(N,*[C*N for C in ops]))
        ranks.append(N2.rank())
        if N2.rank()==N.rank():
            return N,ranks
        N=N2

Neq,ranks=closure(R0,[C1,C2])
assert ranks==[2,4,5,5]
assert Neq.rank()==5

P=sp.Matrix([
    [1,1,0,0,0,0],
    [0,1,1,0,0,0],
    [0,0,1,1,0,0],
    [0,0,0,1,1,0],
    [0,0,0,0,1,1],
    [0,0,0,0,0,1],
])
R0p=P*R0
C1p=P*C1*P.inv()
C2p=P*C2*P.inv()
Neqp,ranks_p=closure(R0p,[C1p,C2p])
assert ranks_p==ranks
assert sp.Matrix.hstack(Neqp,P*Neq).rank()==5

Jm2=sp.Matrix([[-2,1],[0,-2]])
J3=sp.Matrix([[3,1],[0,3]])
AK=sp.diag(Jm2,J3,sp.Matrix([[5]]))
A=sp.diag(AK,sp.Matrix([[11]]))
Gamma=sp.Matrix([[0,0,0,0,0,1]])
assert 6-Gamma.rank()==5
assert sp.Matrix.vstack(Gamma,Gamma*A).rank()==Gamma.rank()

chiK=sp.factor(AK.charpoly(S).as_expr())
muK=sp.expand((S+2)**2*(S-3)**2*(S-5))
assert sp.expand(chiK-(S+2)**2*(S-3)**2*(S-5))==0

def pmat(poly,M):
    p=sp.Poly(sp.expand(poly),S)
    out=sp.zeros(M.rows)
    for j in range(p.degree()+1):
        out += p.nth(j)*(M**j)
    return sp.simplify(out)

assert pmat(muK,AK)==sp.zeros(5)
assert pmat((S+2)*(S-3)*(S-5),AK)!=sp.zeros(5)

print("v0.59 Normalized-Source Generation verifier: PASS")
print("closure ranks =",ranks)
print("dim N_eq =",Neq.rank())
print("forced char =",chiK)
print("forced min =",sp.factor(muK))
