import sympy as sp
S=sp.symbols("S")

Jm2=sp.Matrix([[-2,1],[0,-2]])
AK=sp.diag(Jm2,sp.Matrix([[3]]))
kdim=AK.rows
qdim=3
n=kdim+qdim

def block(B,D):
    return sp.Matrix.vstack(
        sp.Matrix.hstack(AK,B),
        sp.Matrix.hstack(sp.zeros(qdim,kdim),D)
    )

Azero=block(sp.zeros(kdim,qdim),sp.zeros(qdim))
Afive=block(sp.zeros(kdim,qdim),5*sp.eye(qdim))
Am2=block(sp.zeros(kdim,qdim),-2*sp.eye(qdim))

chiK=sp.factor(AK.charpoly(S).as_expr())
muK=sp.expand((S+2)**2*(S-3))

def pmat(poly,M):
    p=sp.Poly(sp.expand(poly),S)
    out=sp.zeros(M.rows)
    for j in range(p.degree()+1):
        out += p.nth(j)*(M**j)
    return sp.simplify(out)

assert pmat(muK,AK)==sp.zeros(kdim)
assert pmat((S+2)*(S-3),AK)!=sp.zeros(kdim)

chi0=sp.factor(Azero.charpoly(S).as_expr())
chi5=sp.factor(Afive.charpoly(S).as_expr())
chim2=sp.factor(Am2.charpoly(S).as_expr())
assert sp.expand(chi0-chiK*S**3)==0
assert sp.expand(chi5-chiK*(S-5)**3)==0
assert sp.expand(chim2-chiK*(S+2)**3)==0

gchi=sp.gcd(sp.Poly(chi0,S),sp.Poly(chi5,S)).as_expr()
assert sp.expand(gchi-chiK)==0

mu0=sp.expand(muK*S)
mu5=sp.expand(muK*(S-5))
mum2=muK
assert pmat(mu0,Azero)==sp.zeros(n)
assert pmat(mu5,Afive)==sp.zeros(n)
assert pmat(mum2,Am2)==sp.zeros(n)
assert pmat((S+2)*(S-3),Am2)!=sp.zeros(n)

gmu=sp.gcd(sp.Poly(mu0,S),sp.Poly(mu5,S)).as_expr()
gmu=sp.gcd(sp.Poly(gmu,S),sp.Poly(mum2,S)).as_expr()
assert sp.expand(gmu-muK)==0

assert n*qdim==18
print("v0.57 general spectral-floor verifier: PASS")
print("chi_forced =",chiK)
print("mu_forced =",sp.factor(muK))
print("tilt dimension =",n*qdim)
