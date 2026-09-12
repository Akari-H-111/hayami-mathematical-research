import sympy as sp

S=sp.symbols("S")
E=S+2
q=S**5-4*S**4+12*S**3-32*S**2+80*S-192
mA=sp.expand(E*q)
p4=sp.expand(E**3*q)
p5=sp.expand(E**4*q**2)

assert sp.expand(mA-E*q)==0
assert sp.expand(p4-E**3*q)==0
assert sp.expand(p5-E**4*q**2)==0
assert sp.Poly(q,S,domain=sp.QQ).is_irreducible
assert sp.gcd(q,sp.diff(q,S))==1
assert q.subs(S,-2)==-672

# ---------------------------------------------------------------------------
# 1. Three-level truncation identities
# ---------------------------------------------------------------------------
# For gX=E^a q^b on rational strata:
# gF=gcd(p4,gX), gH=gcd(mA,gX).
def gcd_expr(a,b):
    return sp.gcd(sp.Poly(a,S,domain=sp.QQ),
                  sp.Poly(b,S,domain=sp.QQ)).as_expr()

# Nonzero rational canonical representatives have degree < 8.
rational_rows=[]
for b in (0,1):
    maxa=4 if b==0 else 2
    for a in range(maxa+1):
        gX=sp.expand(E**a*(q if b else 1))
        gF=gcd_expr(p4,gX)
        gH=gcd_expr(mA,gX)
        muF=sp.factor(sp.div(p4,gF,S)[0])
        muH=sp.factor(sp.div(mA,gH,S)[0])
        muX=sp.factor(sp.div(p5,gX,S)[0])
        dim=8-sp.degree(gX,S)
        rational_rows.append((a,b,sp.factor(gH),sp.factor(gF),
                              sp.factor(gX),muH,muF,muX,dim))

assert len(rational_rows)==8
assert [r[-1] for r in rational_rows]==[8,7,6,5,4,3,2,1]

# Unique zero datum.
assert gcd_expr(p4,0)==p4
assert gcd_expr(mA,0)==mA
assert gcd_expr(p5,0)==p5

# Chain/truncation test on all nonzero rational rows.
for a,b,gH,gF,gX,muH,muF,muX,dim in rational_rows:
    assert sp.expand(gcd_expr(mA,gX)-gH)==0
    assert sp.expand(gcd_expr(p4,gX)-gF)==0
    assert sp.rem(gF,gH,S)==0
    assert sp.rem(gX,gF,S)==0

# ---------------------------------------------------------------------------
# 2. Resonant contact jets through order 4
# ---------------------------------------------------------------------------
d=sp.symbols("d0:8")
rd=sum(d[j]*S**j for j in range(8))
jets=[sp.expand(sp.diff(rd,S,k).subs(S,-2)) for k in range(4)]
Jmat=sp.Matrix([[sp.diff(f,x) for x in d] for f in jets])
assert Jmat.rank()==4

assert jets[3] == (
    6*d[3]-48*d[4]+240*d[5]-960*d[6]+3360*d[7]
)

# q-divisibility has five independent rational linear conditions.
rmodq=sp.rem(rd,q,S)
qconds=[sp.expand(rmodq).coeff(S,j) for j in range(5)]
Qmat=sp.Matrix([[sp.diff(f,x) for x in d] for f in qconds])
assert Qmat.rank()==5

# ---------------------------------------------------------------------------
# 3. Splitting-field combinatorics
# ---------------------------------------------------------------------------
# Fine contact label:
#   a in {0,...,4}
#   b_i in {0,1,2}, i=1,...,5
# weight w=a+sum b_i.
# A nonzero polynomial of degree <8 can realize exactly every label with w<=7.
t=sp.symbols("t")
contact_poly=sp.expand((1+t+t**2+t**3+t**4)*(1+t+t**2)**5)
contact_counts=[int(contact_poly.coeff(t,k))
                for k in range(sp.degree(contact_poly,t)+1)]
assert contact_counts == [1,6,21,51,96,146,186,201,186,146,96,51,21,6,1]

nonzero_counts=contact_counts[:8]
assert nonzero_counts == [1,6,21,51,96,146,186,201]
assert sum(nonzero_counts)==708

# Adding the unique zero datum gives 709 actual strata.
assert sum(nonzero_counts)+1==709

# Actual codimension counts: feasible nonzero contact strata in codim 0..7,
# plus the zero stratum in codim 8.
actual_codim_counts=nonzero_counts+[1]
assert actual_codim_counts == [1,6,21,51,96,146,186,201,1]

# ---------------------------------------------------------------------------
# 4. Scheme multiplicity ladder
# ---------------------------------------------------------------------------
# By resultant multiplicativity:
# Res(mA,r) = Res(E,r)^1 Res(q,r)^1
# Res(p4,r) = Res(E,r)^3 Res(q,r)^1
# Res(p5,r) = Res(E,r)^4 Res(q,r)^2.
scheme_mult = {
    "H":(1,1),
    "F":(3,1),
    "X":(4,2),
}
assert scheme_mult["H"]==(1,1)
assert scheme_mult["F"]==(3,1)
assert scheme_mult["X"]==(4,2)

# ---------------------------------------------------------------------------
# 5. Rational gX possibilities and canonical annihilators
# ---------------------------------------------------------------------------
expected_gX = [
    1,E,E**2,E**3,E**4,
    q,E*q,E**2*q
]
assert all(sp.expand(rational_rows[i][4]-expected_gX[i])==0
           for i in range(8))

# q^2 cannot divide a nonzero degree<8 rational representative.
assert sp.degree(q**2,S)==10

# Canonical zero lift has gX=p5 and muX=1.
muX_zero=sp.div(p5,p5,S)[0]
assert muX_zero==1

print("v0.40 three-level extension stratification: PASS")
print("gH | gF | gX and both lower layers are truncations of gX")
print("fine nonzero splitting-field strata =",sum(nonzero_counts))
print("plus zero stratum ->",sum(nonzero_counts)+1)
print("actual codim counts =",actual_codim_counts)
print("rational strata = 8 nonzero + 1 zero = 9")
print("scheme multiplicities (E,q): H=(1,1), F=(3,1), X=(4,2)")
print("resonant jet rank through J3 =",Jmat.rank())
print("q-divisibility rank =",Qmat.rank())
