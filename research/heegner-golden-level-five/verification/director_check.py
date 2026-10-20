"""Exact algebra and a rational enclosure for the discriminant -163 branch."""
import json
from fractions import Fraction as F
from math import gcd, isqrt
from pathlib import Path

if not __debug__:
    raise RuntimeError("Assertions must remain enabled; do not use python -O")

import mpmath as mp
import sympy as sp

x = sp.symbols("x")
J163 = -640320**3


def level5(j):
    return sp.Poly((x**4 - 228*x**3 + 494*x**2 + 228*x + 1)**3
                   + j*x*(x**2 + 11*x - 1)**5, x)


A = sp.Poly(x**6 - 131268706320384342*x**5 - 2896632145572621515*x**4
            - 15717124384666951860*x**3 + 2896632145572621515*x**2
            - 131268706320384342*x - 1, x)
B = sp.Poly(-58705150130167150*x**5 - 1295413276662289800*x**4
            - 7028911706986972100*x**3 + 1295413276662289800*x**2
            - 58705150130167150*x, x)
assert A*A - 5*B*B == level5(J163)
assert sp.gcd(A, B).degree() == 0
u = sp.symbols("u")
sextic = sp.Poly((u*u-228*u+496)**3+J163*(u+11)**5, u)
assert sp.cancel(level5(J163).as_expr()/x**6
                 - sextic.as_expr().subs(u, x-1/x)) == 0
assert sextic.is_irreducible
assert sorted(int(sp.degree(f, u)) for f, _ in
              sp.factor_list(sextic.as_expr(), extension=sp.sqrt(5))[1]) == [3, 3]
alpha = (u**3-131268706320384342*u**2-2896632145572621512*u
         -15979661797307720544)
beta = -58705150130167150*u**2-1295413276662289800*u-7146322007247306400
golden_cubic = sp.Poly(alpha+sp.sqrt(5)*beta, u, extension=sp.sqrt(5))
assert golden_cubic.is_irreducible
assert sp.expand(alpha**2-5*beta**2-sextic.as_expr()) == 0
_, cb, cc, cd = golden_cubic.all_coeffs()
disc_by_formula = sp.expand(cb**2*cc**2-4*cc**3-4*cb**3*cd-27*cd**2+18*cb*cc*cd)
disc = sp.expand(sp.discriminant(golden_cubic.as_expr(), u))
disc_square = (sp.Integer(130605881159290836097272600000000)
               + sp.Integer(58408725706686669664104300000000)*sp.sqrt(5))
assert disc == disc_by_formula
assert sp.expand(disc+163*disc_square**2) == 0
assert sextic.count_roots(-sp.oo, sp.oo) == 2
companion = sp.zeros(6)
for k in range(5):
    companion[k+1, k] = 1
for k in range(6):
    companion[k, 5] = -sextic.nth(k)
traces, power = [], sp.eye(6)
for k in range(11):
    traces.append(sp.trace(power))
    power = power*companion
trace_form = sp.Matrix(6, 6, lambda i, j: traces[i+j])
lower, diagonal = trace_form.LDLdecomposition(hermitian=False)
assert lower*diagonal*lower.T == trace_form
assert companion.T*trace_form == trace_form*companion
assert [sp.sign(diagonal[i, i]) for i in range(6)] == [1, 1, -1, 1, -1, 1]
phi_exact = (1+sp.sqrt(5))/2
assert sp.simplify(phi_exact**-2 + phi_exact-2) == 0


def interval(poly, lo, hi):
    a = b = F(0)
    for coefficient in poly.all_coeffs():
        products = (a*lo, a*hi, b*lo, b*hi)
        c = F(int(coefficient))
        a, b = min(products)+c, max(products)+c
    return a, b


def exp_bounds(z, n=200):
    term = total = F(1)
    for k in range(1, n+1):
        term *= F(z, k)
        total += term
    following = term * F(z, n+1)
    ratio = F(z, n+2)
    assert ratio < 1
    return total, total + following/(1-ratio)


assert F(314, 100)*F(1276, 100) > 40
assert F(22, 7)*F(1277, 100) < 41
assert F(1276, 100)**2 < 163 < F(1277, 100)**2
assert exp_bounds(40)[0] > 23*10**16
assert exp_bounds(41)[1] < 7*10**17
# Classical 3.14 < pi < 22/7 then gives 40 < pi*sqrt(163) < 41.
q_hi = F(1, 23*10**16)
assert 5*q_hi/(1-q_hi)**2 < F(1, 1000)
# |log(product^5)| < 1/1000 implies 99/100 < product^5 < 101/100.
assert F(1, 1)-F(1, 1000) > F(99, 100)
assert F(1, 1)/(1-F(1, 1000)) < F(101, 100)
lo, hi = -F(5, 10**18), -F(1, 10**18)
assert F(101, 100)*q_hi < -lo
assert F(99, 100)*F(1, 7*10**17) > -hi
assert interval(A, lo, hi)[1] < 0
assert interval(B, lo, hi)[0] > 0
assert level5(J163).count_roots(sp.Rational(lo.numerator, lo.denominator),
                              sp.Rational(hi.numerator, hi.denominator)) == 1

controls = []
values = [(-3, 0), (-4, 1728), (-7, -3375), (-8, 8000), (-11, -32768),
          (-19, -96**3), (-43, -960**3), (-67, -5280**3), (-163, J163),
          (-12, 54000), (-16, 287496), (-27, -12288000), (-28, 16581375),
          (None, 1), (None, 2)]
for discriminant, j in values:
    factors = []
    for poly, multiplicity in sp.factor_list(level5(j).as_expr())[1]:
        factors.append({"degree_Q": int(sp.degree(poly, x)),
                        "multiplicity": int(multiplicity),
                        "degrees_Qsqrt5": [int(sp.degree(f, x)) for f, _ in
                                            sp.factor_list(poly, extension=sp.sqrt(5))[1]]})
    controls.append({"discriminant": discriminant, "j": j, "factors": factors})
assert controls[-1]["factors"] == controls[-2]["factors"] == [
    {"degree_Q": 12, "multiplicity": 1, "degrees_Qsqrt5": [12]}]

diagnostics = []
for digits in (100, 200):
    mp.mp.dps = digits
    q = -mp.exp(-mp.pi*mp.sqrt(163))
    product = mp.qp(q, q**5)*mp.qp(q**4, q**5)/(mp.qp(q**2, q**5)*mp.qp(q**3, q**5))
    t = q*product**5
    av = mp.polyval([int(c) for c in A.all_coeffs()], t)
    bv = mp.polyval([int(c) for c in B.all_coeffs()], t)
    phi = (1+mp.sqrt(5))/2
    recovered = (bv-av)/(2*bv)
    assert abs(recovered-phi) < mp.mpf(10)**(-digits+5)
    assert abs((3*bv+av)/(2*bv)-phi**-2) < mp.mpf(10)**(-digits+5)
    diagnostics.append({"digits": digits, "phi_error": mp.nstr(abs(recovered-phi), 8),
                        "t": mp.nstr(t, 50)})

forms = []
discriminant = -25*163
for a in range(1, isqrt((-discriminant)//3)+1):
    for b in range(-a, a+1):
        if (b*b-discriminant) % (4*a):
            continue
        c = (b*b-discriminant)//(4*a)
        if c < a or gcd(gcd(a, b), c) != 1 or ((abs(b) == a or a == c) and b < 0):
            continue
        represented = a if a % 5 else c
        assert represented % 5
        forms.append({"form": [a, b, c], "chi5": 1 if represented % 5 in (1, 4) else -1})
assert [z["form"] for z in forms] == [[1, 1, 1019], [25, -15, 43], [25, -5, 41],
                                     [25, 5, 41], [25, 15, 43], [25, 25, 47]]
assert sum(z["chi5"] == 1 for z in forms) == 3

result = {"status": "PASS", "exact": ["P=A^2-5B^2", "gcd(A,B)=1",
          "rational q-product branch enclosure", "A<0<B on branch interval",
          "one root in branch interval"],
          "classical_inputs": ["CM j(tau_163)=-640320^3", "Klein level-5 identity",
                               "3.14<pi<22/7", "Rogers-Ramanujan product formula"],
          "interval_t": [str(lo), str(hi)], "controls": controls,
          "field_tower": {"u": "t-1/t", "degree_Q_u_over_Q": 6,
                          "degrees_sextic_over_Qsqrt5": [3, 3],
                          "degree_Q_u_over_Qsqrt5": 3, "real_embeddings": 2,
                          "complex_embedding_pairs": 2,
                          "trace_form_signature": [4, 2],
                          "trace_form_LDL_signs": [1, 1, -1, 1, -1, 1],
                          "multiplication_trace_self_adjoint": True,
                          "cubic_discriminant_square_class": "-163 over Q(sqrt(5))",
                          "cubic_discriminant_square_factor": str(disc_square),
                          "cubic_irreducible_over_Qsqrt5": True,
                          "written_galois_consequence": {
                              "group_over_Qsqrt5": "S3",
                              "quadratic_resolvent": "Q(sqrt(5),sqrt(-163))",
                              "proof": "CUBIC_RESOLVENT.md; irreducible cubic with nonsquare discriminant"}},
          "numerical_diagnostics": diagnostics,
          "reduced_primitive_forms_D_minus4075": forms,
          "limits": "No novelty, intrinsic geometry map, or RH claim is certified."}
destination = Path(__file__).resolve().with_name("DIRECTOR_RESULTS.json")
destination.write_text(json.dumps(result, indent=2)+"\n")
print("PASS: exact golden-field reconstruction and branch signs; 15 control j-values; 100/200-digit diagnostics")
