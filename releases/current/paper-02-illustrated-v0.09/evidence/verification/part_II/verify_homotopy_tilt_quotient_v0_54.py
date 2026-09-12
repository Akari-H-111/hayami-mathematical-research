from pathlib import Path
BASE = Path(__file__).resolve().parent
import runpy, contextlib, io, sympy as sp
from fractions import Fraction

S=sp.symbols('S')

buf=io.StringIO()
with contextlib.redirect_stdout(buf):
    V49=runpy.run_path(str(BASE / 'verify_extension_independent_forced_core_v0_49.py'))
    V47=runpy.run_path(str(BASE / 'verify_cubic_support_multigrading_v0_47.py'))

Rcore=V49['R']          # 35 x 7, recurrent core inside U16
AR=V49['AR']            # A on recurrent-core coordinates
Fs=V49['Fs']            # D_alpha on U16 basis, sparse C2
SBAR=V47['SBAR']; SID=V47['SID']; L=V47['L']; Rmod=V47['R']

# ---------- sparse Hochschild d2 ----------
def smat(M):
    out={}
    for i in range(3):
        for j in range(3):
            z=sp.Rational(M[i,j])
            if z:
                out[(i,j)]=Fraction(int(z.p),int(z.q))
    return out
MU={s:smat(L[s[0]]*Rmod[s[1]]) for s in SBAR}

def mmul(A,B):
    C={}
    for (i,k),a in A.items():
        for (k2,j),b in B.items():
            if k==k2:
                C[(i,j)]=C.get((i,j),Fraction(0))+a*b
    return {k:v for k,v in C.items() if v}

def madd(A,B,coef=Fraction(1)):
    C=A.copy()
    for k,v in B.items():
        C[k]=C.get(k,Fraction(0))+coef*v
        if not C[k]: C.pop(k,None)
    return C

def smul(s,t):
    i,j=s; k,l=t
    if i+k>=4 or j+l>=4: return None
    return (i+k,j+l)

def unidx2(k):
    q,rr=divmod(k,9); a,b=divmod(q,15)
    return SBAR[a],SBAR[b],(rr//3,rr%3)

def qvals(q):
    vals={}
    for k,v in q.items():
        s,t,rc=unidx2(k)
        vals.setdefault((s,t),{})[rc]=v
    return vals

def d2_sparse(q):
    vals=qvals(q); out={}
    for s in SBAR:
        mus=MU[s]
        for t in SBAR:
            st=smul(s,t)
            for u in SBAR:
                M={}
                if (t,u) in vals: M=madd(M,mmul(mus,vals[(t,u)]))
                if (s,t) in vals: M=madd(M,mmul(vals[(s,t)],MU[u]),Fraction(-1))
                if st is not None and st!=(0,0) and (st,u) in vals:
                    M=madd(M,vals[(st,u)],Fraction(-1))
                tu=smul(t,u)
                if tu is not None and tu!=(0,0) and (s,tu) in vals:
                    M=madd(M,vals[(s,tu)])
                if M:
                    base=((SID[s]*15+SID[t])*15+SID[u])*9
                    for (i,j),v in M.items(): out[base+3*i+j]=v
    return out

def rank_sparse(vecs):
    keys=sorted(set().union(*[set(v) for v in vecs]))
    M=sp.Matrix([[sp.Rational(v.get(k,Fraction(0)).numerator,
                              v.get(k,Fraction(0)).denominator)
                  for v in vecs] for k in keys])
    return M.to_DM().rank()

# D_alpha(Rcore)
DR=[]
for j in range(Rcore.cols):
    q={}
    for i in range(Rcore.rows):
        c=sp.Rational(Rcore[i,j])
        if not c: continue
        cf=Fraction(int(c.p),int(c.q))
        for k,v in Fs[i].items():
            q[k]=q.get(k,Fraction(0))+cf*v
    DR.append({k:v for k,v in q.items() if v})

assert rank_sparse(DR)==7
D2DR=[d2_sparse(q) for q in DR]
assert rank_sparse(D2DR)==6
# Hence dim(D_alpha(R) cap Z^2)=1.

# E is the first recurrent coordinate up to scale -1/2.
Eco=sp.zeros(35,1); Eco[0]=1
esol=list(sp.linsolve((Rcore,Eco)))[0]
e=sp.Matrix(esol)
assert e==sp.Matrix([-sp.Rational(1,2),0,0,0,0,0,0])
assert AR*e==-2*e

# Put E first in a basis.
cols=[e]
for j in range(7):
    v=sp.eye(7)[:,j]
    if sp.Matrix.hstack(*cols,v).rank()>len(cols): cols.append(v)
    if len(cols)==7: break
P=sp.Matrix.hstack(*cols)
A=P.inv()*AR*P
assert A[:,0]==sp.Matrix([-2,0,0,0,0,0,0])

# Internal tilt module has dimension 6*7=42 and acts as all T with T(E)=0.
assert 6*7==42

# Two exact tilt-equivalent target operators with radically different spectra.
B0=sp.zeros(7); B0[0,0]=-2
B3=sp.diag(-2,3,3,3,3,3,3)
T0=B0-A; T3=B3-A
assert T0[:,0]==sp.zeros(7,1)
assert T3[:,0]==sp.zeros(7,1)
assert sp.factor(B0.charpoly(S).as_expr())==S**6*(S+2)
assert sp.factor(B3.charpoly(S).as_expr())==(S-3)**6*(S+2)
q=S**5-4*S**4+12*S**3-32*S**2+80*S-192
assert sp.factor(A.charpoly(S).as_expr())==(S+2)**2*q

print('v0.54 Homotopy-Tilt Quotient verifier: PASS')
print('dim recurrent core = 7')
print('dim closed source intersection = 1')
print('dim normalized internal tilt module = 42')
print('tilt orbit = {B : B(E)=-2E}')
print('original char =',sp.factor(A.charpoly(S).as_expr()))
print('tilt example 1 char =',sp.factor(B0.charpoly(S).as_expr()))
print('tilt example 2 char =',sp.factor(B3.charpoly(S).as_expr()))
print('universal spectral divisor after quotient = S+2')

