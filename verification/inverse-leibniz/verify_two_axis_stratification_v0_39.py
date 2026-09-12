import sympy as sp

S=sp.symbols("S")
E=S+2
q=S**5-4*S**4+12*S**3-32*S**2+80*S-192
mA=sp.expand(E*q)
p4=sp.expand(E**3*q)
p5=sp.expand(mA*p4)

assert sp.expand(p4-E**3*q)==0
assert sp.expand(mA-E*q)==0
assert sp.expand(p5-E**4*q**2)==0
assert sp.Poly(q,S,domain=sp.QQ).is_irreducible
assert sp.gcd(mA,sp.diff(mA,S))==1

# 1. Rational divisor table
rows=[]
for nu in range(4):
    for eps in range(2):
        gF=sp.expand(E**nu*(q if eps else 1))
        gH=sp.gcd(sp.Poly(mA,S,domain=sp.QQ),
                  sp.Poly(gF,S,domain=sp.QQ)).as_expr()
        muF=sp.factor(sp.div(p4,gF,S)[0])
        muH=sp.factor(sp.div(mA,gH,S)[0])
        dim=8-sp.degree(gF,S)
        rows.append((nu,eps,sp.factor(gF),sp.factor(gH),muF,muH,dim))

assert len(rows)==8
assert rows[0][6]==8 and rows[-1][6]==0

# 2. Resonant jet filtration
d=sp.symbols("d0:8")
rd=sum(d[j]*S**j for j in range(8))
J0=sp.expand(rd.subs(S,-2))
J1=sp.expand(sp.diff(rd,S).subs(S,-2))
J2=sp.expand(sp.diff(rd,S,2).subs(S,-2))
jets=[J0,J1,J2]

Jmat=sp.Matrix([[sp.diff(f,x) for x in d] for f in jets])
assert Jmat.rank()==3

rmodq=sp.rem(rd,q,S)
qconds=[sp.expand(rmodq).coeff(S,j) for j in range(5)]
Qmat=sp.Matrix([[sp.diff(f,x) for x in d] for f in qconds])
assert Qmat.rank()==5

for nu in range(4):
    for eps in range(2):
        mats=[]
        if nu:
            mats.append(Jmat[:nu,:])
        if eps:
            mats.append(Qmat)
        M=sp.Matrix.vstack(*mats) if mats else sp.zeros(0,8)
        assert M.rank()==nu+5*eps

# 3. Splitting-field combinatorics
t=sp.symbols("t")
P=sp.expand((1+t+t**2+t**3)*(1+t)**5)
counts=[P.coeff(t,k) for k in range(9)]
assert counts==[1,6,16,26,30,26,16,6,1]
assert sum(counts)==128
assert 32*1+32*3==128

# 4. Scheme multiplicities follow formally from resultant multiplicativity:
# Res(E^3 q,r)=Res(E,r)^3 Res(q,r)
# Res(E q,r)=Res(E,r) Res(q,r)
# and Res(E,r)=r(-2)=J0.
assert sp.degree(p4,S)==8
assert sp.degree(mA,S)==6

# 5. Two-axis pair is not complete for p5 contact.
def gcd_expr(a,b):
    return sp.gcd(sp.Poly(a,S,domain=sp.QQ),
                  sp.Poly(b,S,domain=sp.QQ)).as_expr()

r1=sp.expand(E**3)
r2=sp.expand(E**4)

assert sp.expand(gcd_expr(p4,r1)-E**3)==0
assert sp.expand(gcd_expr(p4,r2)-E**3)==0
assert sp.expand(gcd_expr(mA,r1)-E)==0
assert sp.expand(gcd_expr(mA,r2)-E)==0

assert sp.expand(gcd_expr(p5,r1)-E**3)==0
assert sp.expand(gcd_expr(p5,r2)-E**4)==0

muX1=sp.factor(sp.div(p5,gcd_expr(p5,r1),S)[0])
muX2=sp.factor(sp.div(p5,gcd_expr(p5,r2),S)[0])
assert sp.expand(muX1-E*q**2)==0
assert sp.expand(muX2-q**2)==0

print("v0.39 two-axis stratification: PASS")
print("splitting-field strata =",128)
print("codimension counts =",counts)
print("rational strata =",8)
print("resonant jet rank =",Jmat.rank())
print("q-divisibility rank =",Qmat.rank())
print("same (gF,gH), different gX counterexample: E^3 vs E^4")
print("canonical full annihilators:",muX1,"vs",muX2)
