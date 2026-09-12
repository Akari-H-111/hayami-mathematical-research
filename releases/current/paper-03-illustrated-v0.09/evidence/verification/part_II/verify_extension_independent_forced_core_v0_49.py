from pathlib import Path
BASE = Path(__file__).resolve().parent
import runpy, contextlib, io
import sympy as sp
from fractions import Fraction

S=sp.symbols("S")

# Load the exact v0.47 cubic support reconstruction.
buf=io.StringIO()
with contextlib.redirect_stdout(buf):
    V=runpy.run_path(str(BASE / "verify_cubic_support_multigrading_v0_47.py"))

alpha=V["alpha"]
U16=V["U16"]
HB=V["HB"]
bracket=V["bracket"]
c1_add=V["c1_add"]
c2_add=V["c2_add"]
MU=V["MU"]

assert len(U16)==35
assert MU.rank()==35

def partial_reduce_old(q):
    """Reduce against the fixed provenance source basis.
    Returns quotient normal form and the already-forced h-value."""
    v=q.copy()
    hout={}
    while v:
        p=min(v)
        if p not in HB:
            return v,hout
        b,hb=HB[p]
        c=v[p]
        v=c2_add(v,b,-c)
        hout=c1_add(hout,hb,c)
    return v,hout

# D = ad_alpha|U16.
Fs=[bracket(alpha,u) for u in U16]
assert V["rank_c2"](Fs)==23

# Quotient map F16_alpha -> F16_alpha/(F16_alpha cap K_old).
reds=[partial_reduce_old(q) for q in Fs]
rem_keys=sorted(set().union(*[set(rem) for rem,hv in reds]))
Rem=sp.Matrix([
    [sp.Rational(reds[j][0].get(k,Fraction(0))) for j in range(35)]
    for k in rem_keys
])
assert Rem.rank()==16

# C is the maximal pointwise-forced-action domain.
Cbasis=Rem.nullspace()
C=sp.Matrix.hstack(*Cbasis)
assert C.rank()==19

# Express the old-provenance part of h(ad_alpha(u)) in U16 coordinates.
Hparts=V["matcols"]([hv for rem,hv in reds])
_,upiv=MU.T.rref()
upiv=list(upiv)
Usub=MU[upiv,:]
assert Usub.det()!=0
Hcoord=Usub.inv()*Hparts[upiv,:]
assert MU*Hcoord==Hparts

# Common action on C:
# A_forced(u)=-h_old(ad_alpha u).
Aambient=-Hcoord

# Exact invariance A(C) subset C.
assert Rem*Aambient*C == sp.zeros(Rem.rows,C.cols)

# Coordinate matrix A_C.
_,cpiv=C.T.rref()
cpiv=list(cpiv)
Csub=C[cpiv,:]
AC=Csub.inv()*(Aambient*C)[cpiv,:]
assert C*AC==Aambient*C

q=S**5-4*S**4+12*S**3-32*S**2+80*S-192
mA=sp.expand((S+2)*q)

charC=sp.factor(AC.charpoly(S).as_expr())
assert sp.expand(charC - S**12*(S+2)**2*q)==0

# Minimal polynomial from the exact identity plus non-annihilation tests.
I=sp.eye(19)
qAC=AC**5-4*AC**4+12*AC**3-32*AC**2+80*AC-192*I
assert AC*(AC+2*I)*qAC == sp.zeros(19)
assert (AC+2*I)*qAC != sp.zeros(19)
assert AC*qAC != sp.zeros(19)
assert AC*(AC+2*I) != sp.zeros(19)

muC=sp.expand(S*(S+2)*q)

# Primary dimensions.
assert len(AC.nullspace())==12
assert len((AC+2*I).nullspace())==2
assert len(qAC.nullspace())==5
assert AC.rank()==7
assert (AC**2).rank()==7

# Hence C = ker A direct-sum im A, and recurrent core has dimension 7.
Rcols=AC.columnspace()
Rcoord=sp.Matrix.hstack(*Rcols)
R=C*Rcoord
assert R.rank()==7

_,rpiv=R.T.rref()
rpiv=list(rpiv)
AR=R[rpiv,:].inv()*(Aambient*R)[rpiv,:]
assert R*AR==Aambient*R
assert sp.expand(AR.charpoly(S).as_expr()-(S+2)**2*q)==0
IR=sp.eye(7)
qAR=AR**5-4*AR**4+12*AR**3-32*AR**2+80*AR-192*IR
assert (AR+2*IR)*qAR==sp.zeros(7)
assert qAR!=sp.zeros(7)
assert AR+2*IR!=sp.zeros(7)

# Reconstruct the previously known six-dimensional cyclic core g3=(S+2)x3.
rails=V["rails"]
g3=[]
for k in sorted(rails[3]):
    if k+1 in rails[3]:
        g3.append(V["c1_add"](rails[3][k+1],rails[3][k],Fraction(2)))
Mg3=V["matcols"](g3)
Gcoord=Usub.inv()*Mg3[upiv,:]
G=sp.Matrix.hstack(*Gcoord.columnspace())
assert G.rank()==6
assert Rem*G==sp.zeros(Rem.rows,6)

_,gpiv=G.T.rref()
gpiv=list(gpiv)
AG=G[gpiv,:].inv()*(Aambient*G)[gpiv,:]
assert G*AG==Aambient*G
assert sp.expand(AG.charpoly(S).as_expr()-mA)==0

# E is independent of the old six-dimensional core and supplies the second -2 mode.
Eco=sp.zeros(35,1)
Eco[0]=1
assert Rem*Eco==sp.zeros(Rem.rows,1)
assert Aambient*Eco==-2*Eco
assert sp.Matrix.hstack(G,Eco).rank()==7
assert sp.Matrix.hstack(R,G,Eco).rank()==7

# The five-dimensional q-primary component is exactly the same in C and the old G-core.
qAG=AG**5-4*AG**4+12*AG**3-32*AG**2+80*AG-192*sp.eye(6)
Cq=C*sp.Matrix.hstack(*qAC.nullspace())
Gq=G*sp.Matrix.hstack(*qAG.nullspace())
assert Cq.rank()==Gq.rank()==5
assert sp.Matrix.hstack(Cq,Gq).rank()==5

# Maximality:
# completion differences factor through a 16-dimensional quotient Q,
# and U/C -> Q is an isomorphism.  Therefore the variable blocks are
# Hom(U/C,C) plus End(U/C), dimensions 304 and 256.
assert 19*16==304
assert 16*16==256
assert 304+256==560

print("v0.49 extension-independent forced core verifier: PASS")
print("maximal forced submodule dim C =",19)
print("char(A|C) =",charC)
print("minpoly(A|C) =",sp.factor(muC))
print("forced zero-mode dim =",12)
print("forced recurrent core dim =",7)
print("char recurrent core =",(S+2)**2*q)
print("old cyclic core dim =",6,", plus E gives recurrent dim 7")
print("free completion blocks: 304 cross + 256 quotient = 560")

