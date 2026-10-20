"""Exact editorial lemmas and separately identified finite diagnostics."""
import json
from pathlib import Path
import sympy as sp
import mpmath as mp

assert __debug__, "Assertions must remain enabled."
x = sp.symbols("x")
s5 = sp.sqrt(5)
phi = (1+s5)/2
gamma = 1/phi
c0 = gamma**2
k = gamma/(1+sp.sqrt(1+c0))
P = x*x-3*x+1
assert sp.discriminant(P, x) == 5
assert sp.simplify(P-(x-phi**2)*(x-c0)) == 0
assert sp.simplify(2*sp.cos(2*sp.pi/5)-gamma) == 0
norm = (x*x+2*phi*x-1)*(x*x-2*gamma*x-1)
assert sp.simplify(norm-(x**4+2*x**3-6*x*x-2*x+1)) == 0
assert sp.simplify((phi+2)*(3-phi)-5) == 0
assert sp.simplify(k-2*sp.cos(sp.pi/10)+2*sp.cos(sp.pi/5)) == 0
assert sp.simplify(2*k/(1-k*k)-gamma) == 0
assert sp.simplify((1-k*k)/(1+k*k)-1/sp.sqrt(1+c0)) == 0
assert sp.simplify(2*k/(1+k*k)-gamma/sp.sqrt(1+c0)) == 0
A = sp.Matrix([[1,gamma],[gamma,-1]])/sp.sqrt(1+c0)
assert (A*sp.Matrix([1,k])-sp.Matrix([1,k])).applyfunc(sp.simplify).is_zero_matrix
assert (A*sp.Matrix([k,-1])+sp.Matrix([k,-1])).applyfunc(sp.simplify).is_zero_matrix
mixed=sp.Matrix([1,0])
assert not (A*mixed-mixed).applyfunc(sp.simplify).is_zero_matrix
assert not (A*mixed+mixed).applyfunc(sp.simplify).is_zero_matrix

mp.mp.dps = 90
km = ((mp.sqrt(5)-1)/2)/(1+mp.sqrt(1+((mp.sqrt(5)-1)/2)**2))
errors = []
for epsilon, coeff in [(1,[1,km,-km,-1]),(-1,[1,-1/km,1/km,-1])]:
    def completed(z):
        f = mp.fsum(a*mp.zeta(z,mp.mpf(j)/5) for j,a in enumerate(coeff,1))*mp.power(5,-z)
        return mp.power(5/mp.pi,(z+1)/2)*mp.gamma((z+1)/2)*f
    for z in [mp.mpc('.37','.91'),mp.mpc('1.25','2.5')]:
        left, right = completed(z), epsilon*completed(1-z)
        err = abs(left-right)/max(1,abs(left),abs(right))
        assert err < mp.mpf('1e-80')
        errors.append({'epsilon':epsilon,'s':str(z),'relative_error':mp.nstr(err,8)})
    if epsilon == -1:
        assert abs(completed(mp.mpf('.5'))) < mp.mpf('1e-80')

finite = []
for N in range(3,22,2):
    d=(N-1)//2
    T=mp.matrix([[2/mp.sqrt(N)*mp.sin(2*mp.pi*(j+1)*(n+1)/N)
                  for n in range(d)] for j in range(d)])
    T2=T*T
    err=max(abs(T2[j,n]-int(j==n)) for j in range(d) for n in range(d))
    assert err < mp.mpf('1e-80')
    finite.append({'N':N,'dimension':d,'involution_error':mp.nstr(err,8)})

out={'exact_status':'PASS: discriminant, norm, trigonometric and eigenline identities',
     'functional_equation_diagnostics':errors,'finite_odd_N_diagnostics':finite,
     'scope':'Exact algebra plus finite numerical checks; the general odd-N theorem and Dirichlet-series injectivity require their written proofs.'}
Path(__file__).with_name('DIRECTOR_LEMMA_RESULTS.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
