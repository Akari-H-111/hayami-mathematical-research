"""Check the local rank-loss iff and the manuscript's renamed CM coefficients."""
from pathlib import Path
import json,re
import sympy as sp

assert __debug__, 'Assertions must remain enabled'
root=Path(__file__).resolve().parents[1]
c,s,u=sp.symbols('c s u',real=True)
q=sp.sqrt(c*(2-c));P=c*c-3*c+1
St=sp.Matrix([s*(2*u-1),(1-u)*c,-u*s*(1-c)/q])
Su=sp.Matrix([2*(1-c),-s,q])
V=St.cross(Su).applyfunc(lambda e:sp.simplify(e.subs(s*s,1-c*c)))
assert sp.simplify(V[2]-(1-c)*(1-c-2*u))==0
reduced=V.subs(u,(1-c)/2)
assert sp.simplify(reduced[0]+(1+c)*P/(2*q))==0
assert sp.simplify(reduced[1]+s*P/q)==0
assert sp.simplify(reduced[2])==0
c0=(3-sp.sqrt(5))/2
assert sp.simplify(P.subs(c,c0))==0 and 0<c0<1
# The nonzero first prefactor supplies necessity and sufficiency once V_3=0.
assert (1+c0)/(2*sp.sqrt(c0*(2-c0)))>0
assert sp.simplify(Su[2].subs(c,c0))>0
source=(root/'main.tex').read_text()
coeff={name:int(n) for name,n in re.findall(r'([pd]_[123])=(\d+)',source)}
expected={'p_1':131268706320384342,'p_2':2896632145572621515,'p_3':15717124384666951860,
'd_1':58705150130167150,'d_2':1295413276662289800,'d_3':7028911706986972100}
assert coeff==expected,coeff
out={'status':'PASS','local_rank_loss':'For 0<c<1, rank(dS)<2 iff u=(1-c)/2 and P(c)=0; Su has nonzero third component.',
'cross_product_on_necessary_locus':[str(sp.simplify(x)) for x in reduced],
'CM_coefficient_renaming':'All six p_i,d_i values agree with the prior exact certificate.',
'scope':'Exact local algebra and coefficient preservation; no boundary/global surface classification or external CM theorem is certified here.'}
Path(__file__).with_name('SURFACE_REVISION_RESULTS.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
