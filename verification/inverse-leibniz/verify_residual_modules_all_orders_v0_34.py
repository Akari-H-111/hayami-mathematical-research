from fractions import Fraction
from pathlib import Path
import argparse
import json, hashlib
import sympy as sp

CERTIFICATE_NAME = "low_rail_oos_arity23_factorization_v0_33_certificate.json"
parser = argparse.ArgumentParser(description="Verify all-order residual modules.")
parser.add_argument(
    "--certificate",
    type=Path,
    default=Path(__file__).resolve().with_name(CERTIFICATE_NAME),
    help=f"path to {CERTIFICATE_NAME}",
)
args = parser.parse_args()
if not args.certificate.is_file():
    raise FileNotFoundError(
        f"certificate not found: {args.certificate}; "
        f"place {CERTIFICATE_NAME} beside this verifier or pass --certificate"
    )
DATA = json.loads(args.certificate.read_text(encoding="utf-8"))

def F(n,d): return Fraction(int(n),int(d))

def dec_c1(rows):
    out={}
    for s,rc,n,d in rows:
        s=tuple(s); rc=tuple(rc)
        out.setdefault(s,{})[rc]=F(n,d)
    return out

def dec_c2(rows):
    return {int(k):F(n,d) for k,n,d in rows}

def madd(A,B,scale=Fraction(1)):
    C=A.copy()
    for k,v in B.items():
        C[k]=C.get(k,Fraction(0))+scale*v
        if not C[k]: C.pop(k)
    return C

def mmul(A,B):
    C={}
    for (i,k),a in A.items():
        for (k2,j),b in B.items():
            if k==k2:
                C[(i,j)]=C.get((i,j),Fraction(0))+a*b
    return {k:v for k,v in C.items() if v}

def mscale(A,c): return {k:c*v for k,v in A.items() if c*v}

def c1_add(A,B,scale=Fraction(1)):
    C={s:m.copy() for s,m in A.items()}
    for s,m in B.items():
        C[s]=madd(C.get(s,{}),m,scale)
        if not C[s]: C.pop(s)
    return C

def c1_scale(A,c):
    return {s:mscale(m,c) for s,m in A.items() if mscale(m,c)}

def c2_add(A,B,scale=Fraction(1)):
    C=A.copy()
    for k,v in B.items():
        C[k]=C.get(k,Fraction(0))+scale*v
        if not C[k]: C.pop(k)
    return C

SBAR=[(i,j) for i in range(4) for j in range(4) if (i,j)!=(0,0)]
SID={s:k for k,s in enumerate(SBAR)}
def idx2(s,t,rc): return (SID[s]*15+SID[t])*9+rc[0]*3+rc[1]

def bracket(f,g):
    out={}
    for s,fs in f.items():
        for t,gt in g.items():
            M=mmul(fs,gt)
            for rc,v in M.items():
                k=idx2(s,t,rc); out[k]=out.get(k,Fraction(0))+v
    for s,gs in g.items():
        for t,ft in f.items():
            M=mmul(gs,ft)
            for rc,v in M.items():
                k=idx2(s,t,rc); out[k]=out.get(k,Fraction(0))+v
    return {k:v for k,v in out.items() if v}

def flat_c1(v):
    return {(s,rc):val for s,M in v.items() for rc,val in M.items() if val}

def direct_Y(rails,k):
    y={}
    for b in (2,3,4,5):
        for key,val in flat_c1(rails[b][k]).items():
            y[(b,key)]=val
    return y

def y_add(A,B,scale=Fraction(1)):
    C=A.copy()
    for k,v in B.items():
        C[k]=C.get(k,Fraction(0))+scale*v
        if not C[k]: C.pop(k)
    return C

def serialize_c1(v):
    return [
        [list(s),list(rc),val.numerator,val.denominator]
        for s,M in sorted(v.items())
        for rc,val in sorted(M.items()) if val
    ]

rails={int(b):{int(k):dec_c1(v) for k,v in seq.items()} for b,seq in DATA["rails"].items()}
pred={int(b):dec_c1(v) for b,v in DATA["Y18_prediction"].items()}
actual={int(b):dec_c1(v) for b,v in DATA["Y18_actual"].items()}
rec=[F(n,d) for n,d in DATA["frozen_recurrence"]]

# Frozen prediction digest and exact OOS equality.
Y18={}
for j,c in enumerate(rec):
    Y18=y_add(Y18,direct_Y(rails,4+j),c)
split={2:{},3:{},4:{},5:{}}
for (b,(s,rc)),val in Y18.items():
    split[b].setdefault(s,{})[rc]=val
assert split==pred==actual

pred_record={
    "recurrence":[[c.numerator,c.denominator] for c in rec],
    "shift_k":4,
    "Y18":{str(b):serialize_c1(pred[b]) for b in (2,3,4,5)}
}
blob=json.dumps(pred_record,sort_keys=True,separators=(",",":")).encode()
assert hashlib.sha256(blob).hexdigest()==DATA["Y18_prediction_sha256"]

# Frozen order-14 recurrence holds on k=0,...,4, with k=4 second true OOS shift.
for k in range(5):
    rhs={}
    for j,c in enumerate(rec):
        rhs=y_add(rhs,direct_Y(rails,k+j),c)
    assert rhs==direct_Y(rails,k+14)

# Reconstruct original triangular arity-23 source R23^(18,5).
alpha=dec_c1(DATA["alpha"])
xi=dec_c1(DATA["xi"])
q=bracket(alpha,rails[5][17])
q=c2_add(q,bracket(xi,rails[4][18]))
conv={}
for a in range(19):
    b=18-a
    conv=c2_add(conv,bracket(rails[2][a],rails[3][b]),Fraction(1,2))
    conv=c2_add(conv,bracket(rails[3][b],rails[2][a]),Fraction(1,2))
q=c2_add(q,conv)
assert q==dec_c2(DATA["arity23_source_18_5"])

# Exact homotopy provenance reduction.
HB={}
for item in DATA["homotopy_basis"]:
    HB[int(item["pivot"])]=(dec_c2(item["source"]),dec_c1(item["h"]))

def reduce_h(vec):
    v=vec.copy(); hout={}
    while v:
        p=min(v)
        assert p in HB
        b,hb=HB[p]; c=v[p]
        v=c2_add(v,b,-c)
        hout=c1_add(hout,hb,c)
    return v,hout

rem,hv=reduce_h(q)
assert not rem
assert actual[5]==c1_scale(hv,Fraction(-1))

# Helpers for temporal mode analysis.
def rank_seq(seq):
    flats=[flat_c1(v) for v in seq]
    keys=sorted(set().union(*[set(f) for f in flats]))
    M=sp.Matrix([[sp.Rational(f.get(k,Fraction(0))) for f in flats] for k in keys])
    return M.rank()

def poly_apply(seqdict,coeff):
    order=len(coeff)-1
    out={}
    for k in range(min(seqdict),max(seqdict)-order+1):
        v={}
        for j,c in enumerate(coeff):
            if c: v=c1_add(v,seqdict[k+j],Fraction(c))
        out[k]=v
    return out

# g3=(S+2)x3 is the homogeneous A-orbit.
g3={k:c1_add(rails[3][k+1],rails[3][k],Fraction(2)) for k in range(18)}
assert rank_seq(list(g3.values()))==6
gcoef=[384,32,-16,8,-4,2]
for k in range(12):
    rhs={}
    for j,c in enumerate(gcoef):
        rhs=c1_add(rhs,g3[k+j],Fraction(c))
    assert rhs==g3[k+6]

lam=sp.symbols("lam")
qpoly=lam**5-4*lam**4+12*lam**3-32*lam**2+80*lam-192
mA=(lam+2)*qpoly
Astar=sp.Matrix([[sp.Rational(x) for x in row] for row in DATA["Astar"]])
assert sp.expand(Astar.charpoly(lam).as_expr())==sp.expand(mA)

# A-eliminated residuals r_b=m_A(S)x_b.
mAcoeff=[sp.Rational(x) for x in DATA["mA_coeff_low_to_high"]]
res={b:poly_apply(rails[b],mAcoeff) for b in (3,4,5)}
assert rank_seq(list(res[3].values()))==1
assert rank_seq(list(res[4].values()))==2
assert rank_seq(list(res[5].values()))==8

# r3: (S+2)
for k in range(min(res[3]),max(res[3])):
    assert c1_add(res[3][k+1],res[3][k],Fraction(2))=={}

# r4: (S+2)^2 = S^2+4S+4
for k in range(min(res[4]),max(res[4])-1):
    v=c1_add(res[4][k+2],res[4][k+1],Fraction(4))
    v=c1_add(v,res[4][k],Fraction(4))
    assert not v

# r5: p4=(S+2)^3 q, recurrence order 8:
# r(k+8)=1536r(k)+1664r(k+1)+448r(k+2)-2r(k+7).
for k in range(min(res[5]),max(res[5])-7):
    rhs={}
    for j,c in enumerate([1536,1664,448,0,0,0,0,-2]):
        rhs=c1_add(rhs,res[5][k+j],Fraction(c))
    assert rhs==res[5][k+8]

p3=(lam+2)*mA
p4=(lam+2)**2*mA
p5=mA*p4
assert sp.factor(p3)==(lam+2)**2*qpoly
assert sp.factor(p4)==(lam+2)**3*qpoly
assert sp.factor(p5)==(lam+2)**4*qpoly**2

print("v0.33 compact certificate: PASS")
print("Y18 frozen prediction == independent arity23 actual")
print("prediction SHA256 =",DATA["Y18_prediction_sha256"])
print("x5(18) nonzero cochain coordinates =",len(serialize_c1(actual[5])))
print("g3 homogeneous A-orbit rank = 6")
print("m_A(lambda) = (lambda+2) q(lambda)")
print("A-eliminated residual ranks r3,r4,r5 = 1,2,8")
print("p3=(lambda+2)^2 q")
print("p4=(lambda+2)^3 q")
print("p5=(lambda+2)^4 q^2")


# ===========================================================================
# v0.34 all-orders residual-module theorem for the present cubic contraction
# ===========================================================================

# Notation:
# S = forward temporal shift, E=S+2.
# m_A=(S+2)q(S).
# p3=E*m_A=E^2 q, p4=E*p3=E^3 q, p5=m_A*p4=E^4 q^2.

Epoly = lam + 2
p3poly = sp.expand(Epoly*mA)
p4poly = sp.expand(Epoly*p3poly)
p5poly = sp.expand(mA*p4poly)

def coeffs(poly):
    P=sp.Poly(poly,lam)
    return [sp.Rational(P.nth(j)) for j in range(P.degree()+1)]

p3c=coeffs(p3poly)
p4c=coeffs(p4poly)
p5c=coeffs(p5poly)

def Aop(v):
    rem,hv=reduce_h(bracket(alpha,v))
    assert not rem
    return c1_scale(hv,Fraction(-1))

def shift_plus_two(seq):
    return {
        k:c1_add(seq[k+1],seq[k],Fraction(2))
        for k in range(min(seq),max(seq))
    }

# ---------------------------------------------------------------------------
# R3 ≅ C[S]/(S+2)
# ---------------------------------------------------------------------------

r3=poly_apply(rails[3],mAcoeff)
Er3=shift_plus_two(r3)
assert all(not v for v in Er3.values())
assert r3[0]
# Explicit nonzero witness.
assert flat_c1(r3[0])[((0,1),(1,0))] == Fraction(32,3)

# g3=(S+2)x3 is a cyclic homogeneous A-orbit.
g3={k:c1_add(rails[3][k+1],rails[3][k],Fraction(2)) for k in range(18)}
g3basis=[g3[k] for k in range(6)]
assert rank_seq(g3basis)==6

for j in range(5):
    assert Aop(g3basis[j]) == g3basis[j+1]

last = {}
for j,c in enumerate([384,32,-16,8,-4,2]):
    last=c1_add(last,g3basis[j],Fraction(c))
assert Aop(g3basis[5]) == last

# Since g3(0) is cyclic of dimension 6, m_A is minimal.
# q(S)g3 cannot vanish, hence r3=q(S)g3 is nonzero.
assert sp.factor(Astar.charpoly(lam).as_expr()) == sp.factor(mA)

# ---------------------------------------------------------------------------
# R4 ≅ C[S]/(S+2)^2
# ---------------------------------------------------------------------------

r4=poly_apply(rails[4],mAcoeff)
y4=poly_apply(rails[4],p3c)  # y4=p3(S)x4=(S+2)r4

# Polynomial identity y4=E r4 on the exact trajectory.
Er4=shift_plus_two(r4)
for k in y4:
    assert y4[k] == Er4[k]

# The inhomogeneous forcing has been removed; y4 is homogeneous under A.
for k in range(min(y4),max(y4)):
    assert Aop(y4[k]) == y4[k+1]

# Exact initial eigenvector certificate.
assert y4[0]
assert flat_c1(y4[0])[((0,1),(0,0))] == Fraction(-3200)
assert Aop(y4[0]) == c1_scale(y4[0],Fraction(-2))

# Therefore y4(k)=(-2)^k y4(0), so E y4=0 and E^2 r4=0.
Ey4=shift_plus_two(y4)
assert all(not v for v in Ey4.values())
# But E r4=y4 !=0, so minimal polynomial of cyclic R4 is exactly E^2.

# ---------------------------------------------------------------------------
# R5 has minimal polynomial p4=(S+2)^3 q(S)
# ---------------------------------------------------------------------------

r5=poly_apply(rails[5],mAcoeff)
y5=poly_apply(rails[5],p4c)  # y5=p4(S)x5

# After p4 kills both triangular forcing branches, y5 is homogeneous.
for k in range(min(y5),max(y5)):
    assert Aop(y5[k]) == y5[k+1]

# Its first six values are cyclic and carry exactly the same A_*.
y5basis=[y5[k] for k in range(6)]
assert rank_seq(y5basis)==6
for j in range(5):
    assert Aop(y5basis[j]) == y5basis[j+1]

last5={}
for j,c in enumerate([384,32,-16,8,-4,2]):
    last5=c1_add(last5,y5basis[j],Fraction(c))
assert Aop(y5basis[5]) == last5

# Hence m_A(S)y5=0, i.e. p5(S)x5=0.
p5x5=poly_apply(rails[5],p5c)
assert all(not v for v in p5x5.values())

# Since r5=m_A(S)x5, p4(S)r5=0.
p4r5=poly_apply(r5,p4c)
assert all(not v for v in p4r5.values())

# Exact minimality: r5(0),...,r5(7) are linearly independent.
first8=[r5[k] for k in range(8)]
assert rank_seq(first8)==8

# Explicit nonzero 8x8 minor certificate.
keys=sorted(set().union(*[set(flat_c1(v)) for v in first8]))
M=sp.Matrix([
    [sp.Rational(flat_c1(v).get(key,Fraction(0))) for v in first8]
    for key in keys
])
pivot_rows=M.T.rref()[1]
assert len(pivot_rows)==8
minor=M[list(pivot_rows),:]
DET_R5=sp.factor(minor.det())
assert DET_R5 == -1974127506397904857128197160960

# deg p4=8, so no polynomial of degree <8 can annihilate r5.
assert sp.degree(p4poly,lam)==8

print("v0.34 residual-module theorem: PASS")
print("R3 ≅ C[S]/(S+2)")
print("R4 ≅ C[S]/(S+2)^2")
print("mu_R5 = p4 = (S+2)^3 q(S)")
print("y4 nonzero witness ((0,1),(0,0)) =",flat_c1(y4[0])[((0,1),(0,0))])
print("r5 first-8 determinant =",DET_R5)
print("p5=(S+2)^4 q(S)^2 annihilates x5")
