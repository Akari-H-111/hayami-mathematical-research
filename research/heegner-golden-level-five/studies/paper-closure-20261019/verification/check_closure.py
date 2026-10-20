"""Exact scalar/matrix bridges and separately labeled high-precision diagnostics."""
import json
from pathlib import Path
import sympy as sp
import mpmath as mp

if not __debug__:
    raise RuntimeError("Run without Python -O; assertions are required.")

c, s, q, u, x = sp.symbols('c s q u x', real=True)
P = c*c-3*c+1
surface = sp.Matrix([c+2*u*(1-c),(1-u)*s,u*q])
St = surface.applyfunc(lambda f:-s*sp.diff(f,c)+c*sp.diff(f,s)+s*(c-1)/q*sp.diff(f,q))
Su = surface.diff(u)
V = St.cross(Su)
relations = sp.groebner([s*s+c*c-1,q*q-c*(2-c)],s,q,u,c)
expected = sp.Matrix([(c*c*(2-c)-u*(1-c+c*c))/q,-s*(2*u-c*(2-c))/q,(1-c)*(1-c-2*u)])
for e in V-expected:
    numerator = sp.fraction(sp.cancel(e))[0]
    assert relations.reduce(sp.expand(numerator))[1] == 0
u_line = (1-c)/2
assert sp.simplify(expected[1].subs(u,u_line)+s*P/q) == 0
assert sp.simplify(q*expected[0].subs(u,u_line)+(1+c)*P/2) == 0

S5 = sp.sqrt(5)
c0 = (3-S5)/2
phi = (1+S5)/2
gamma = 1/phi
u0 = (1-c0)/2
kappa = (sp.sqrt(10-2*S5)-2)/(S5-1)
r_i = sp.sqrt((5+S5)/2)-phi
assert sp.simplify(P.subs(c,c0)) == 0
assert sp.simplify(gamma-(1-c0)) == 0
assert sp.simplify(u0-sp.cos(2*sp.pi/5)) == 0
assert sp.simplify(kappa-r_i) == 0
assert sp.simplify(kappa-gamma/(1+sp.sqrt(1+c0))) == 0
assert sp.simplify(kappa**2+2*phi*kappa-1) == 0
assert sp.Poly(sp.minimal_polynomial(kappa,x),x).as_expr() == x**4+2*x**3-6*x*x-2*x+1
assert sp.simplify(u0-kappa/(1-kappa*kappa)) == 0
assert sp.simplify(c0-(2*kappa/(1-kappa*kappa))**2) == 0

M = sp.Matrix([[-1,gamma],[gamma,1]])/sp.sqrt(1+c0)
J = sp.Matrix([[0,1],[1,0]])
A = 2/S5*sp.Matrix([[sp.sin(2*sp.pi/5),sp.sin(sp.pi/5)],
                    [sp.sin(sp.pi/5),-sp.sin(2*sp.pi/5)]])
assert (A-J*M*J).applyfunc(sp.simplify).is_zero_matrix
assert (A*A-sp.eye(2)).applyfunc(sp.simplify).is_zero_matrix
assert (A*sp.Matrix([1,kappa])-sp.Matrix([1,kappa])).applyfunc(sp.simplify).is_zero_matrix
assert sp.simplify(M.det()+1) == 0
assert sp.simplify(1+kappa*kappa) > 0  # a6-a2*a3; coprime indices 2 and 3.

diagnostics = []
roots = []
for digits in (80,120):
    with mp.workdps(digits):
        k = (mp.sqrt(10-2*mp.sqrt(5))-2)/(mp.sqrt(5)-1)
        nome = mp.exp(-2*mp.pi)
        rr = nome**(mp.mpf(1)/5)*mp.fprod(
            (1-nome**(5*n+1))*(1-nome**(5*n+4))/
            ((1-nome**(5*n+2))*(1-nome**(5*n+3))) for n in range(100))
        assert abs(rr-k) < mp.mpf(10)**(-digits+10)
        coeff = [mp.mpf(1),k,-k,mp.mpf(-1)]
        def f(z):
            return mp.power(5,-z)*sum(a*mp.zeta(z,mp.mpf(j)/5) for j,a in enumerate(coeff,1))
        def completed(z):
            return mp.power(mp.mpf(5)/mp.pi,(z+1)/2)*mp.gamma((z+1)/2)*f(z)
        fe_errors = []
        for z in (mp.mpc('.37','.91'),mp.mpc('1.25','2.5')):
            left,right = completed(z),completed(1-z)
            error = abs(left-right)/max(abs(left),abs(right))
            assert error < mp.mpf(10)**(-digits+10)
            fe_errors.append(mp.nstr(error,8))
        root = mp.findroot(f,(mp.mpc('.8','85.7'),mp.mpc('.81','85.69')),
                           tol=mp.mpf(10)**(-digits+15),maxsteps=40)
        residual = abs(f(root))
        assert residual < mp.mpf(10)**(-digits+15)
        assert mp.re(root) > mp.mpf('.8')
        roots.append(mp.nstr(root,65))
        diagnostics.append({'digits':digits,'rr_product_terms':100,'rr_error':mp.nstr(abs(rr-k),8),
                            'completed_fe_relative_errors':fe_errors,'root':mp.nstr(root,65),
                            'uncompleted_f_root_residual':mp.nstr(residual,8)})
assert roots[0] == roots[1]

result = {'exact_status':'PASS','surface_rank_elimination':'P(c)=c^2-3c+1',
          'hmr_ruling_coordinate':'u0=cos(2*pi/5)',
          'dh_rr_identity':'kappa_DH=r(i)',
          'same_involution':'A_sine=J*M_RR*J',
          'round_trip':'u0=kappa/(1-kappa^2); c0=(2*kappa/(1-kappa^2))^2',
          'minimal_polynomial':'X^4+2X^3-6X^2-2X+1',
          'numeric_status':'PASS diagnostics; no interval zero certificate',
          'diagnostics':diagnostics,'scope':'scalar and matrix dictionary; no global surface/modular-curve equivalence or RH result'}
target=Path(__file__).resolve().parents[1]/'RESULTS.json'
target.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
