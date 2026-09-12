import sympy as sp
from math import comb

S=sp.symbols("S")
E=S+2
q=S**5-4*S**4+12*S**3-32*S**2+80*S-192
mA=sp.expand(E*q)
p4=sp.expand(E**2*mA)

# ---------------------------------------------------------------------------
# 1. Exact spectral polynomial health
# ---------------------------------------------------------------------------
assert sp.Poly(q,S,domain=sp.QQ).is_irreducible
assert sp.gcd(q,sp.diff(q,S)) == 1
assert sp.gcd(mA,sp.diff(mA,S)) == 1
assert q.subs(S,-2) == -672
assert sp.discriminant(q,S) == 1087616581632
assert sp.discriminant(mA,S) == 491150246399705088

# ---------------------------------------------------------------------------
# 2. Complete landing operator from v0.37
# ---------------------------------------------------------------------------
A=sp.Matrix([
    [0,0,0,0,0,384],
    [1,0,0,0,0,32],
    [0,1,0,0,0,-16],
    [0,0,1,0,0,8],
    [0,0,0,1,0,-4],
    [0,0,0,0,1,2],
])
e0=sp.Matrix([1,0,0,0,0,0])
assert sp.expand(A.charpoly(S).as_expr()-mA)==0

B5=sp.Matrix.hstack(*[(A**j)*e0 for j in range(8)])
assert B5.rank()==6

mcoeff=[sp.expand(mA).coeff(S,j) for j in range(8)]
Smcoeff=[0]+[sp.expand(mA).coeff(S,j) for j in range(7)]
K=sp.Matrix.hstack(sp.Matrix(mcoeff),sp.Matrix(Smcoeff))
assert K.rank()==2
assert B5*K == sp.zeros(6,2)

# ---------------------------------------------------------------------------
# 3. Rational CRT coordinates: resonant evaluation + q-remainder
# ---------------------------------------------------------------------------
d=sp.symbols("d0:8")
r=sum(d[j]*S**j for j in range(8))

ellE=sp.expand(r.subs(S,-2))
assert ellE == (
    d[0]-2*d[1]+4*d[2]-8*d[3]+16*d[4]-32*d[5]+64*d[6]-128*d[7]
)

rmodq=sp.rem(r,q,S)
avec=[sp.expand(rmodq).coeff(S,j) for j in range(5)]
assert avec == [
    d[0]+192*d[5]+768*d[6]+768*d[7],
    d[1]-80*d[5]-128*d[6]+448*d[7],
    d[2]+32*d[5]+48*d[6],
    d[3]-12*d[5]-16*d[6],
    d[4]+4*d[5]+4*d[6],
]

ME=sp.Matrix([[sp.diff(ellE,x) for x in d]])
MQ=sp.Matrix([[sp.diff(a,x) for x in d] for a in avec])
assert MQ.rank()==5
assert sp.Matrix.vstack(ME,MQ).rank()==6

# Therefore the six spectral coordinates are independent after extension
# to a splitting field.  The common intersection has dimension 8-6=2,
# matching ker Lambda5.

# ---------------------------------------------------------------------------
# 4. Quintic norm hypersurface over Q
# ---------------------------------------------------------------------------
Cq=sp.Matrix([
    [0,0,0,0,192],
    [1,0,0,0,-80],
    [0,1,0,0,32],
    [0,0,1,0,-12],
    [0,0,0,1,4],
])
assert sp.expand(Cq.charpoly(S).as_expr()-q)==0

a=sp.symbols("a0:5")
Rq=sp.zeros(5)
for j in range(5):
    Rq += a[j]*(Cq**j)
Nq=sp.expand(Rq.det(method="domain-ge"))
PNq=sp.Poly(Nq,*a,domain=sp.QQ)
assert PNq.total_degree()==5
assert len(PNq.terms())==126
assert sp.factor(Nq)==Nq

# Resultant multiplicativity gives:
# Res(mA,r)=Res(E,r) Res(q,r)=r(-2) N_q(r mod q).
# The first factor is the rational resonant hyperplane.
# The second is an irreducible degree-5 norm hypersurface over Q.

# ---------------------------------------------------------------------------
# 5. GCD multiplier formula
# ---------------------------------------------------------------------------
def landing_multiplier(poly):
    g=sp.gcd(sp.Poly(mA,S,domain=sp.QQ),
             sp.Poly(poly,S,domain=sp.QQ)).as_expr()
    return sp.div(mA,g,S)[0]

assert sp.factor(landing_multiplier(1)) == sp.factor(mA)
assert sp.factor(landing_multiplier(E)) == q
assert sp.factor(landing_multiplier(q)) == E
assert landing_multiplier(mA) == 1

# For rational d, q irreducibility implies precisely four possible gcds:
# 1, E, q, mA.

# ---------------------------------------------------------------------------
# 6. Complex squarefree stratification combinatorics
# ---------------------------------------------------------------------------
# mA has six distinct roots.  A stratum losing k roots has:
#   number = C(6,k)
#   codimension k in D5
#   dimension 8-k
#   multiplier degree 6-k.
counts=[comb(6,k) for k in range(7)]
assert counts == [1,6,15,20,15,6,1]
assert sum(counts)==64
dims=[8-k for k in range(7)]
degs=[6-k for k in range(7)]
assert dims == [8,7,6,5,4,3,2]
assert degs == [6,5,4,3,2,1,0]

print("v0.38 spectral landing stratification: PASS")
print("q irreducible over Q and m_A squarefree")
print("q(-2)=-672")
print("Res(m_A,r)=r(-2)*Res(q,r)")
print("q-norm form: degree 5, 126 terms, irreducible over Q")
print("complex splitting-field strata counts by lost modes:",counts)
print("stratum dimensions:",dims)
print("landing multiplier degrees:",degs)
print("rational-data multipliers: m_A, q, E, 1")
