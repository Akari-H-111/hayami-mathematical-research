from pathlib import Path
BASE = Path(__file__).resolve().parent
import json
import sympy as sp
from fractions import Fraction
from collections import defaultdict
from pathlib import Path

DATA=json.loads(Path(str(BASE / "low_rail_oos_arity23_factorization_v0_33_certificate.json")).read_text(encoding="utf-8"))

SBAR=[(i,j) for i in range(4) for j in range(4) if (i,j)!=(0,0)]
SID={s:k for k,s in enumerate(SBAR)}
def idx2(s,t,rc): return (SID[s]*15+SID[t])*9+rc[0]*3+rc[1]
def unidx2(k):
    q,rr=divmod(k,9); a,b=divmod(q,15)
    return SBAR[a],SBAR[b],(rr//3,rr%3)

def dec_c1(rows):
    out=defaultdict(dict)
    for s,rc,n,d in rows: out[tuple(s)][tuple(rc)]=Fraction(n,d)
    return dict(out)
def dec_c2(rows): return {int(k):Fraction(n,d) for k,n,d in rows}

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
            if k==k2: C[(i,j)]=C.get((i,j),Fraction(0))+a*b
    return {k:v for k,v in C.items() if v}
def c1_add(A,B,scale=Fraction(1)):
    C={s:m.copy() for s,m in A.items()}
    for s,m in B.items():
        mm=C.setdefault(s,{})
        for rc,v in m.items():
            mm[rc]=mm.get(rc,Fraction(0))+scale*v
            if not mm[rc]: del mm[rc]
        if not mm: del C[s]
    return C
def c1_scale(A,c):
    return {s:{rc:c*v for rc,v in M.items() if c*v} for s,M in A.items()
            if any(c*v for v in M.values())}
def c2_add(A,B,scale=Fraction(1)):
    C=A.copy()
    for k,v in B.items():
        C[k]=C.get(k,Fraction(0))+scale*v
        if not C[k]: C.pop(k)
    return C
def bracket(f,g):
    out={}
    for s,fs in f.items():
        for t,gt in g.items():
            for rc,v in mmul(fs,gt).items():
                k=idx2(s,t,rc); out[k]=out.get(k,Fraction(0))+v
    for s,gs in g.items():
        for t,ft in f.items():
            for rc,v in mmul(gs,ft).items():
                k=idx2(s,t,rc); out[k]=out.get(k,Fraction(0))+v
    return {k:v for k,v in out.items() if v}

alpha=dec_c1(DATA["alpha"])
assert alpha=={
    (0,1):{(0,2):Fraction(1)},
    (1,0):{(0,2):Fraction(-1)}
}

# Matrix-incidence grading.
# 0-index rc=(r,c): alpha multiplication is nonzero iff r=2 or c=0.
inactive={(0,1),(0,2),(1,1),(1,2)}
active={(0,0),(1,0),(2,0),(2,1),(2,2)}

def basis_c1(s,rc): return {s:{rc:Fraction(1)}}

for s in SBAR:
    for rc in inactive:
        assert bracket(alpha,basis_c1(s,rc))=={}
    for rc in active:
        assert bracket(alpha,basis_c1(s,rc))!={}

# Exact formula for output matrix support.
for s in SBAR:
    for r,c in active:
        q=bracket(alpha,basis_c1(s,(r,c)))
        mats={unidx2(k)[2] for k in q}
        expected=set()
        if r==2: expected.add((0,c))  # E13 E_rc = E_1c
        if c==0: expected.add((r,2))  # E_rc E13 = E_r3
        assert mats==expected

# Reconstruct the nine-dimensional weak factor-axis sector.
N=sp.Matrix([[0,1,0],[0,0,1],[0,0,0]])
I=sp.eye(3); Z=sp.zeros(3)
L=[I,N,N**2,Z]; R1=N+N**2; R=[I,R1,R1**2,R1**3]
B={(a,b):sp.zeros(3,1) for a in range(4) for b in range(4)}
for pair,val in {(1,1):(3,1,1),(1,2):(3,2,0),(2,1):(3,2,0),
                 (1,3):(3,0,0),(3,1):(3,0,0),(2,2):(4,0,0)}.items():
    B[pair]=sp.Matrix(val)
syms=sp.symbols('c0:54')
def decode(v):
    X={0:Z};Y={0:Z}
    for p in range(1,4):
        X[p]=sp.Matrix(3,3,[v[(p-1)*9+i] for i in range(9)])
        Y[p]=sp.Matrix(3,3,[v[(3+p-1)*9+i] for i in range(9)])
    return X,Y
Xs,Ys=decode(sp.Matrix(syms))
expr=[]
for a in range(4):
  for b in range(4):
    for c in range(4):
      expr += list(Xs[a]*B[(b,c)] + Ys[b]*B[(a,c)])
      expr += list(Ys[c]*B[(a,b)] + Xs[b]*B[(a,c)])
WM,_=sp.linear_eq_to_matrix(expr,syms)
WI=sp.Matrix.hstack(*WM.nullspace())
assert WI.shape==(54,9)

def matsparse(M):
    out={}
    for r in range(3):
      for c in range(3):
        z=sp.Rational(M[r,c])
        if z: out[(r,c)]=Fraction(int(z.p),int(z.q))
    return out
def weak_col(j):
    X,Y=decode(WI[:,j]); out={}
    for p in range(1,4):
        sx=matsparse(X[p]); sy=matsparse(Y[p])
        if sx: out[(p,0)]=sx
        if sy: out[(0,p)]=sy
    return out

weak=[weak_col(j) for j in range(9)]
hook_mixed=[(1,1),(1,2),(1,3),(2,1)]
Vhook=weak[:]
for s in hook_mixed:
    for r in range(3):
        for c in range(3):
            Vhook.append(basis_c1(s,(r,c)))
assert len(Vhook)==45

def rank_c2(vecs):
    keys=sorted(set().union(*[set(v) for v in vecs if v]))
    M=sp.Matrix([[sp.Rational(v.get(k,Fraction(0))) for v in vecs] for k in keys])
    return M.rank()
Dimgs=[bracket(alpha,v) for v in Vhook]
assert rank_c2(Dimgs)==24
assert rank_c2(Dimgs[:9])==4
for j in range(4):
    assert rank_c2(Dimgs[9+9*j:9+9*(j+1)])==5

# Homotopy provenance basis.
HB={}
for item in DATA["homotopy_basis"]:
    HB[int(item["pivot"])]=(dec_c2(item["source"]),dec_c1(item["h"]))
def reduce_h(vec):
    v=vec.copy(); hout={}
    while v:
        p=min(v); assert p in HB
        b,hb=HB[p]; c=v[p]
        v=c2_add(v,b,-c); hout=c1_add(hout,hb,c)
    return v,hout

# Every stored h-value lies in the hook support box.
axis={(i,0) for i in range(1,4)}|{(0,j) for j in range(1,4)}
hook_support=axis|set(hook_mixed)
hvals=[dec_c1(item["h"]) for item in DATA["homotopy_basis"]]
assert len(hvals)==100
assert all(set(v).issubset(hook_support) for v in hvals)

# Reconstruct U16 exactly and compare spans.
E=dec_c1(DATA["rails"]["2"]["0"])
K=weak[5]; P=weak[7]; Q=weak[4]; RR=weak[8]
def mixed(i,j,r): return basis_c1((i,j),(r//3,r%3))
U=[E,K,P,Q,RR,mixed(1,1,0),mixed(1,1,1)]
U += [mixed(1,1,r) for r in range(3,7)]
U += [mixed(1,1,r) for r in range(7,9)] + [mixed(1,2,r) for r in range(3)]
U += [mixed(1,2,r) for r in range(3,9)]
U += [mixed(1,3,r) for r in range(7)]
assert len(U)==29
U16=U+[
    mixed(1,3,7), mixed(1,3,8),
    mixed(2,1,0), mixed(2,1,3), mixed(2,1,6), mixed(2,1,7)
]
assert len(U16)==35

coords=sorted(set((s,rc) for v in hvals+U16 for s,M in v.items() for rc in M))
def matcols(vecs):
    return sp.Matrix([[sp.Rational(v.get(s,{}).get(rc,Fraction(0))) for v in vecs]
                      for s,rc in coords])
MH=matcols(hvals); MU=matcols(U16)
assert MH.rank()==35
assert MU.rank()==35
assert MH.row_join(MU).rank()==35

# ad_alpha on U16: 23-dimensional active quotient.
assert rank_c2([bracket(alpha,u) for u in U16])==23

# Low rails stay in the same hook envelope.
rails={int(b):{int(k):dec_c1(v) for k,v in seq.items()} for b,seq in DATA["rails"].items()}
railvecs=[v for b in (2,3,4,5) for v in rails[b].values()]
assert all(set(v).issubset(hook_support) for v in railvecs)
rcoords=sorted(set((s,rc) for v in railvecs for s,M in v.items() for rc in M))
MR=sp.Matrix([[sp.Rational(v.get(s,{}).get(rc,Fraction(0))) for v in railvecs]
              for s,rc in rcoords])
assert MR.rank()==19
assert len(rcoords)==46

# Strict word-degree triangularity fails, and strict descent is impossible.
QAE=bracket(alpha,E)
rem,hQ=reduce_h(QAE)
assert not rem
assert hQ==c1_scale(E,Fraction(2))

def max_c2_total(q):
    return max(sum(s)+sum(t) for k in q for s,t,rc in [unidx2(k)])
def max_c1_total(v):
    return max(sum(s) for s,M in v.items() for rc in M)
assert max_c2_total(QAE)==2
assert max_c1_total(hQ)==3

# A(E)=-h[alpha,E]=-2E: a genuine nonnilpotent recurrent loop.
assert c1_scale(hQ,Fraction(-1))==c1_scale(E,Fraction(-2))

print("v0.47 cubic support multigrading verifier: PASS")
print("alpha support: x -> -E13, y -> +E13")
print("mixed-block alpha kernel = span{E12,E13,E22,E23}")
print("hook box dim = 45; rank ad_alpha|hook = 24")
print("U16 dim = 35; rank ad_alpha|U16 = 23")
print("span(stored h-values) = U16 exactly")
print("low-rail span rank = 19 inside 46 hook coordinates")
print("naive word-degree triangularity fails: 2 -> 3 on Q_alphaE")
print("recurrent loop gives A(E)=-2E")

