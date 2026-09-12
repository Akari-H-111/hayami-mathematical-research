import sympy as sp
lam=sp.symbols("lam")

J4=sp.zeros(4)
for i in range(3):
    J4[i+1,i]=1
Mt=sp.diag(J4,J4)

s=sp.zeros(8,1)
s[1,0]=1
s[4,0]=-1
Syz=sp.Matrix.hstack(*[(Mt**r)*s for r in range(4)])

assert Syz.rank()==4
assert sp.Matrix.hstack(Syz,Mt*Syz).rank()==4

Q=sp.Matrix.hstack(*[sp.eye(8)[:,i] for i in range(4)])
W=sp.Matrix.hstack(Q,Syz)
assert W.det()!=0

coef=W.inv()*(Mt*Q)
Ct=coef[:4,:]
assert Ct==J4
assert Ct**4==sp.zeros(4)
assert Ct**3!=sp.zeros(4)
assert sp.expand(Ct.charpoly(lam).as_expr()-lam**4)==0

seed=sp.eye(4)[:,0]
Reach=sp.Matrix.hstack(*[(Ct**r)*seed for r in range(4)])
assert Reach.rank()==4

Pq=sp.Matrix([
    [1,1,0,0],
    [0,1,1,0],
    [0,0,1,1],
    [0,0,0,1],
])
Ct2=Pq.inv()*Ct*Pq
assert sp.expand(Ct2.charpoly(lam).as_expr()-lam**4)==0
assert Ct2**4==sp.zeros(4) and Ct2**3!=sp.zeros(4)

Us=sp.Matrix([
    [1,1,0,0],
    [0,1,1,0],
    [0,0,1,1],
    [0,0,0,1],
])
Syz2=Syz*Us
assert sp.Matrix.hstack(Syz,Syz2).rank()==4

C_alt=sp.diag(1,2,3,4)
assert C_alt.charpoly(lam).as_expr()!=Ct.charpoly(lam).as_expr()

print("v0.60 Syzygy-to-Constraint Propagator verifier: PASS")
print("syzygy rank =",Syz.rank())
print("quotient dim = 4")
print("propagator char =",sp.factor(Ct.charpoly(lam).as_expr()))
print("reachability rank =",Reach.rank())
