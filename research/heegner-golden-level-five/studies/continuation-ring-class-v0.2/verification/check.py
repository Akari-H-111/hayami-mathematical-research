"""Exact checks for the conductor-5 identification; run with the registered Python -B."""
import hashlib
import json
from fractions import Fraction
from math import gcd, isqrt
from pathlib import Path

if not __debug__:
    raise RuntimeError("Assertions must remain enabled; do not run with python -O")

import mpmath as mp
import sympy as sp


ROOT = Path(__file__).resolve().parents[1]
U, Y = sp.symbols("u Y")
J163 = -640320**3
G = sp.Poly((U**2 - 228 * U + 496)**3 + J163 * (U + 11)**5, U)
EXPECTED_HASHES = {
    "logs/sources/duke-bams4.pdf": "fcf69ec30dae5fb372818aef3152b7adf326f244dda52844df5fa5048d38cbe5",
    "logs/sources/bruinier-funke-imamoglu.pdf": "e04d45790cc82bc1dfc5ea4dc601140694fd2c550701e20c591e79fddebdc805",
    "logs/sources/bengoechea-imamoglu.pdf": "7daece19c2e6fd4c9614c03cb98061ce41bf55bf3361f000cabdfe28a827c376",

    "logs/sources/maier.pdf": "ca51653bb995355b0191fb0acc04a72f742e08ca67873f7e84a036bacf81ead5",
    "logs/sources/cox.pdf": "f7ad9babf95257295d21114774c48b38967c1f604eecdbeb04749252ab829c34",
    "logs/sources/luo-rudnick-sarnak.pdf": "4226b4c9d9af5a7f1ce08e28cd693eef48dc2edf51a41cd489286985ae698410",
}
EXPECTED_H = [
    1,
    1247257156019637304856107520018074552566824585862995272173368815794085495792299621089280,
    -4639796612478190683980432654525770873723843904020069491990531249067242924053663574455746560,
    5676192994124845302961495367285934992661012738565045163590318545337507001358527681694321868800,
    -2530123180606721645060899046691076382780085382180063288738379701466385821402803681978244451532800,
    307678260252363847142518557058020616760886195569701698589818485393365264653517720247611686912000000,
    327449218015598326103658292188693405775089450022293408267511192500873413185838399911936381646297628672000,
]


def digest(path):
    hasher = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            hasher.update(chunk)
    return hasher.hexdigest()


def reduced_primitive_forms(discriminant):
    forms = []
    for a in range(1, isqrt((-discriminant) // 3) + 1):
        for b in range(-a, a + 1):
            if (b * b - discriminant) % (4 * a):
                continue
            c = (b * b - discriminant) // (4 * a)
            if c < a or gcd(gcd(a, b), c) != 1:
                continue
            if (abs(b) == a or a == c) and b < 0:
                continue
            forms.append((a, b, c))
    return forms


def j_from_e4_eta(tau):
    q = mp.exp(2j * mp.pi * tau)
    e4 = 1 + 240 * mp.fsum(n**3 * q**n / (1 - q**n) for n in range(1, 201))
    return e4**3 / (q * mp.qp(q, q)**24)


def weighted_residual(coefficients, value):
    numerator = abs(mp.polyval(coefficients, value))
    denominator = mp.fsum(
        abs(coefficient) * abs(value) ** (len(coefficients) - 1 - index)
        for index, coefficient in enumerate(coefficients)
    )
    return numerator / denominator


def diagnostics(coefficients):
    forms = [(1, 1, 1019), (25, -15, 43), (25, -5, 41),
             (25, 5, 41), (25, 15, 43), (25, 25, 47)]
    output = []
    for digits in (120, 180):
        with mp.workdps(digits):
            roots = [j_from_e4_eta((-b + 1j * mp.sqrt(4075)) / (2 * a))
                     for a, b, _ in forms]
            root_error = max(weighted_residual(coefficients, root) for root in roots)
            tau = (1 + 1j * mp.sqrt(163)) / 2
            q = mp.exp(2j * mp.pi * tau)
            product = (mp.qp(q, q**5) * mp.qp(q**4, q**5)
                       / (mp.qp(q**2, q**5) * mp.qp(q**3, q**5)))
            t = q * product**5
            u_value = t - 1 / t
            rational_j5 = -(u_value**2 + 12 * u_value + 16)**3 / (u_value + 11)
            direct_j5 = j_from_e4_eta(5 * tau)
            bridge_error = abs(rational_j5 / direct_j5 - 1)
            assert root_error < mp.mpf(10) ** (-digits + 25)
            assert bridge_error < mp.mpf(10) ** (-digits + 25)
            output.append({
                "digits": digits,
                "six_form_weighted_H_residual": mp.nstr(root_error, 10),
                "r_to_j5_relative_error": mp.nstr(bridge_error, 10),
            })
    return output


def main():
    source_hashes = {name: digest(ROOT / name) for name in EXPECTED_HASHES}
    assert source_hashes == EXPECTED_HASHES

    x = -(U + 11)
    numerator = -(U**2 + 12 * U + 16)**3
    denominator = U + 11
    maier_t5 = 125 / x
    assert G.is_irreducible
    assert sp.gcd(G, sp.Poly(denominator, U)).degree() == 0
    assert sp.cancel((maier_t5**2 + 10 * maier_t5 + 5)**3 / maier_t5
                     - (x**2 + 250 * x + 3125)**3 / x**5) == 0
    assert sp.cancel((maier_t5**2 + 250 * maier_t5 + 3125)**3 / maier_t5**5
                     - numerator / denominator) == 0
    assert sp.rem((x**2 + 250 * x + 3125)**3 - J163 * x**5, G.as_expr(), U) == 0

    resultant = sp.resultant(G.as_expr(), Y * denominator - numerator, U)
    H = sp.Poly(resultant, Y, domain=sp.QQ).monic()
    assert all(value.q == 1 for value in H.all_coeffs())
    coefficients = [int(value) for value in H.all_coeffs()]
    assert coefficients == EXPECTED_H
    assert H.is_irreducible
    relation = sp.cancel(H.as_expr().subs(Y, numerator / denominator) * denominator**6)
    assert sp.rem(sp.Poly(relation, U), G).is_zero

    sqrt5 = sp.sqrt(5)
    alpha = (U**3 - 131268706320384342 * U**2
             - 2896632145572621512 * U - 15979661797307720544)
    beta = (-58705150130167150 * U**2 - 1295413276662289800 * U
            - 7146322007247306400)
    golden_cubic = sp.Poly(alpha + sqrt5 * beta, U, extension=sqrt5)
    square_factor = (130605881159290836097272600000000
                     + 58408725706686669664104300000000 * sqrt5)
    factor_degrees = sorted(
        sp.degree(factor, U)
        for factor, _ in sp.factor_list(G.as_expr(), extension=sqrt5)[1]
    )
    assert factor_degrees == [3, 3]
    assert golden_cubic.is_irreducible
    assert sp.expand(alpha**2 - 5 * beta**2 - G.as_expr()) == 0
    assert sp.expand(sp.discriminant(golden_cubic.as_expr(), U)
                     + 163 * square_factor**2) == 0

    forms_163 = reduced_primitive_forms(-163)
    forms_4075 = reduced_primitive_forms(-4075)
    expected_forms_4075 = [
        (1, 1, 1019), (25, -15, 43), (25, -5, 41),
        (25, 5, 41), (25, 15, 43), (25, 25, 47),
    ]
    assert forms_163 == [(1, 1, 41)]
    assert forms_4075 == expected_forms_4075
    assert pow((-163) % 5, 2, 5) == 4  # Euler criterion: (-163/5) = -1.
    class_number = Fraction(5) * (1 - Fraction(-1, 5))
    assert class_number == 6

    result = {
        "status": "PASS",
        "source_sha256": source_hashes,
        "external_dependencies": [
            "Duke Eq. (7.7): eta/Rogers-Ramanujan identity",
            "Maier Table 2 and Table 7: X0(5) normalization and j maps",
            "Cox Theorem 7.24 and Theorem 11.1: class number and CM",
            "BFI Theorem 1.2: separate director theta-lift application; source pinned, theorem external",
        ],
        "exact_checks": [
            "G irreducible over Q and the j(tau) eta-coordinate identity modulo G",
            "exact resultant H for j(5 tau), irreducible over Q, and H(R(u))=0 modulo G",
            "G factors as two irreducible cubics over Q(sqrt(5))",
            "cubic discriminant is -163 times the displayed Q(sqrt(5))-square",
            "complete reduced primitive-form enumerations for -163 and -4075",
        ],
        "ring_class": {
            "K_discriminant": -163,
            "conductor": 5,
            "order_discriminant": -4075,
            "kronecker_D_over_5": -1,
            "class_number_formula_value": 6,
            "class_group": "cyclic C6 (abelian group of order 6)",
            "reduced_forms_D_minus163": [list(form) for form in forms_163],
            "reduced_forms_D_minus4075": [list(form) for form in forms_4075],
        },
        "resultant_minimal_polynomial_coefficients": [str(value) for value in coefficients],
        "field_conclusions": {
            "Q(u)": "Q(j(5*tau))",
            "K(u)": "H_5, conditional on the first main theorem of CM",
            "quadratic_genus_layer_over_K": "K(sqrt(5))",
            "splitting_field_over_Qsqrt5": "H_5 with group S3",
        },
        "numerical_diagnostics": diagnostics(coefficients),
        "limits": [
            "Numerical diagnostics are not used to prove coefficients or field identities.",
            "The biquadratic resolvent also contains Q(sqrt(-815)); the CM order marks K.",
            "No canonical HMR map, novelty claim, or RH consequence is established.",
        ],
    }
    (ROOT / "RESULTS.json").write_text(json.dumps(result, indent=2) + "\n")
    print("PASS: conductor-5 ring-class identification, exact resultant, genus layer, and diagnostics")


if __name__ == "__main__":
    main()
