#!/usr/bin/env python3
"""Exact certificate for the -163 golden ray-class continuation.

Run with the registered interpreter and without ``-O``:
  /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/check.py
"""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import mpmath as mp
import sympy as sp


if not __debug__:
    raise RuntimeError("Run without Python -O: this verifier uses assertions.")


ROOT = Path(__file__).resolve().parents[1]
RESULTS = ROOT / "RESULTS.json"
SOURCE_SHA256 = {
    "logs/sources/cais-conrad.pdf": "b35daca31a0b20a487723f87cc60c4ed91fa7f5e71b3fca85f455a4e4628de2c",
    "logs/sources/cais-conrad.txt": "cf5157405db4c0da792e803cc266d836755194b41f36d9c8d15ff805ebcff03d",
    "logs/sources/milne-cft.pdf": "50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5",
    "logs/sources/milne-cft.txt": "933791dff22cc727f98628fd7f1230e03e40c0eaf78d053570c284fa34b56f0e",
}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def field_multiply(left: tuple[int, int], right: tuple[int, int]) -> tuple[int, int]:
    """Multiply a+b*theta modulo 5, where theta^2=theta-1."""
    a, b = left
    c, d = right
    return ((a * c - b * d) % 5, (a * d + b * c + b * d) % 5)


def field_power(value: tuple[int, int], exponent: int) -> tuple[int, int]:
    result = (1, 0)
    while exponent:
        if exponent & 1:
            result = field_multiply(result, value)
        value = field_multiply(value, value)
        exponent //= 2
    return result


for relative_path, expected_hash in SOURCE_SHA256.items():
    assert sha256(ROOT / relative_path) == expected_hash

U = sp.symbols("U")
G = (U**2 - 228 * U + 496) ** 3 - 640320**3 * (U + 11) ** 5
ALPHA = (
    U**3
    - 131268706320384342 * U**2
    - 2896632145572621512 * U
    - 15979661797307720544
)
BETA = (
    -58705150130167150 * U**2
    - 1295413276662289800 * U
    - 7146322007247306400
)

# w(U)=sum(W_NUMERATORS[i] U^(5-i))/W_DENOMINATOR.
W_DENOMINATOR = 36379027361268900000000000
W_NUMERATORS = (
    10032184018936,
    -2633823635467525896114151113195,
    -115712687728690506769685317605640,
    -1906355528351506425904447779674640,
    -13958593196667408481064116830792320,
    -38327281745357972136346029647288064,
)
W = sum(
    sp.Rational(coefficient, W_DENOMINATOR) * U ** (5 - index)
    for index, coefficient in enumerate(W_NUMERATORS)
)
S = sp.symbols("S")
COMPACT_DENOMINATOR = 1574580000
COMPACT_NUMERATOR = (
    (312119004989 - 139583862445 * S) * U**2
    + (6858643496508 - 3067324783740 * S) * U
    + 37679427598544
    - 16850735555920 * S
)

assert sp.Poly(G, U, domain=sp.QQ).is_irreducible
assert sp.expand(G - (ALPHA**2 - 5 * BETA**2)) == 0
assert sp.gcd(BETA, G) == 1
assert sp.gcd(U**2 + 4, G) == 1

# In Q[U]/(G), sqrt(5)=-ALPHA/BETA on the selected cubic factor, so
# 1+c0=(5*BETA+ALPHA)/(2*BETA).  This is the requested exact certificate.
square_remainder = sp.rem(
    2 * BETA * (U**2 + 4) - 163 * (5 * BETA + ALPHA) * W**2,
    G,
    U,
)
assert square_remainder == 0
sqrt5_in_E = sp.rem(-ALPHA * sp.invert(BETA, G, U), G, U)
assert sp.rem(sqrt5_in_E**2 - 5, G, U) == 0
compact_residual = sp.rem(
    163 * (5 - S) * COMPACT_NUMERATOR**2
    - 2 * COMPACT_DENOMINATOR**2 * (U**2 + 4),
    ALPHA + S * BETA,
    U,
)
compact_residual = sp.rem(compact_residual, S**2 - 5, S)
assert compact_residual == 0
compact_difference = sp.rem(
    W - COMPACT_NUMERATOR / COMPACT_DENOMINATOR,
    ALPHA + S * BETA,
    U,
)
assert sp.rem(compact_difference, S**2 - 5, S) == 0

# Exact residue-field certificate for the Artin subgroup calculation.
# theta has irreducible polynomial X^2-X+1 over F_5, and gamma=1+theta.
gamma = (1, 1)
nonzero_residues = {(a, b) for a in range(5) for b in range(5)} - {(0, 0)}
powers = {field_power(gamma, exponent) for exponent in range(24)}
assert powers == nonzero_residues
assert field_power(gamma, 6) == (3, 0)
assert field_power(gamma, 12) == (4, 0)
assert field_multiply(gamma, field_power(gamma, 5)) == field_power(gamma, 6)

# In F_25^*/{+/-1}=<gamma_bar> of order 12, these are respectively the
# scalar stabilizer for H_5 and the norm kernel for K(zeta_5).
scalar_subgroup = {0, 6}
cyclotomic_kernel = {0, 4, 8}
generated_subgroup = {
    (left + right) % 12
    for left in scalar_subgroup
    for right in cyclotomic_kernel
}
assert scalar_subgroup & cyclotomic_kernel == {0}
assert generated_subgroup == {0, 2, 4, 6, 8, 10}

# Cyclotomic radical identities in Q[zeta_5].
Z = sp.symbols("Z")
PHI_5 = Z**4 + Z**3 + Z**2 + Z + 1
sqrt5_in_cyclotomic = 1 + 2 * (Z + Z**4)
cyclotomic_a = Z**2 - Z**3  # zeta^2-zeta^(-2)
cyclotomic_b = Z - Z**4  # zeta-zeta^(-1)
remainder = lambda expression: sp.rem(expression, PHI_5, Z)
assert remainder(sqrt5_in_cyclotomic**2 - 5) == 0
assert remainder(cyclotomic_a**2 + (5 - sqrt5_in_cyclotomic) / 2) == 0
assert remainder(cyclotomic_b**2 + (5 + sqrt5_in_cyclotomic) / 2) == 0
assert remainder(
    cyclotomic_b - (1 + sqrt5_in_cyclotomic) * cyclotomic_a / 2
) == 0

sqrt5 = sp.sqrt(5)
c0 = (3 - sqrt5) / 2
phi = (1 + sqrt5) / 2
assert sp.simplify((4 - c0) / (1 + c0) - phi**2) == 0

# The strongest direct c0/163 refinement: an embedded cyclic quartic.
X = sp.symbols("X")
QUARTIC = X**4 - 815 * X**2 + 132845
assert sp.Poly(QUARTIC, X, domain=sp.QQ).is_irreducible
assert all(int(coefficient) % 5 == 0 for coefficient in sp.Poly(QUARTIC, X).all_coeffs()[1:])
assert int(sp.Poly(QUARTIC, X).TC()) % 25 != 0  # Eisenstein at 5.
quartic_phi = 3 - X**2 / 163
quartic_sigma = 3 * X - X**3 / 163
assert sp.rem(quartic_phi**2 - quartic_phi - 1, QUARTIC, X) == 0
assert sp.rem(quartic_sigma - quartic_phi * X, QUARTIC, X) == 0
quartic_iterate = X
quartic_images = []
for _ in range(4):
    quartic_iterate = sp.rem(quartic_iterate.subs(X, quartic_sigma), QUARTIC, X)
    quartic_images.append(quartic_iterate)
assert quartic_images == [quartic_sigma, -X, -quartic_sigma, X]
quartic_b = (X + quartic_phi) / 2
assert sp.rem(quartic_b**2 - quartic_phi * quartic_b + 41 * quartic_phi - 122, QUARTIC, X) == 0
quartic_basis = [sp.Integer(1), quartic_phi, quartic_b, quartic_phi * quartic_b]


def quartic_trace(value: sp.Expr) -> sp.Expr:
    polynomial = sp.Poly(sp.rem(value, QUARTIC, X), X)
    return 4 * polynomial.nth(0) + 1630 * polynomial.nth(2)


quartic_gram = sp.Matrix(
    [[quartic_trace(left * right) for left in quartic_basis] for right in quartic_basis]
)
assert quartic_gram.det() == 125 * 163**2
assert sp.legendre_symbol(5, 163) == -1

# A branch diagnostic only: it is not used in any field or polynomial proof.
with mp.workdps(260):
    tau = (1 + 1j * mp.sqrt(163)) / 2
    q = mp.exp(2 * mp.pi * 1j * tau)
    r = mp.exp(2 * mp.pi * 1j * tau / 5)
    for n in range(1, 40):
        r *= (1 - q ** (5 * n - 1)) * (1 - q ** (5 * n - 4))
        r /= (1 - q ** (5 * n - 2)) * (1 - q ** (5 * n - 3))
    t = r**5
    u = t - 1 / t
    w_value = mp.mpf(W_NUMERATORS[0]) / W_DENOMINATOR
    for coefficient in W_NUMERATORS[1:]:
        w_value = w_value * u + mp.mpf(coefficient) / W_DENOMINATOR
    c0_value = (3 - mp.sqrt(5)) / 2
    relative_square_residual = abs(
        u**2 + 4 - 163 * (1 + c0_value) * w_value**2
    ) / (abs(u**2 + 4) + abs(163 * (1 + c0_value) * w_value**2))
    phase_error = abs(mp.arg(r) / mp.pi - mp.mpf("0.2"))
    relative_t_imaginary_part = abs(mp.im(t)) / abs(mp.re(t))
    assert mp.re(t) < 0
    assert mp.re(w_value) < 0
    assert phase_error < mp.mpf("1e-150")
    assert relative_t_imaginary_part < mp.mpf("1e-150")
    assert relative_square_residual < mp.mpf("1e-100")
    numerical_diagnostic = {
        "precision_decimal_digits": 260,
        "arg_r_over_pi": mp.nstr(mp.arg(r) / mp.pi, 50),
        "t": mp.nstr(t, 70),
        "u": mp.nstr(u, 70),
        "w_u": mp.nstr(w_value, 70),
        "relative_square_residual": mp.nstr(relative_square_residual, 12),
        "relative_imaginary_part_of_t": mp.nstr(relative_t_imaginary_part, 12),
    }

result = {
    "status": "PASS",
    "source_sha256": SOURCE_SHA256,
    "exact_checks": [
        "G is irreducible over Q and equals ALPHA^2-5 BETA^2.",
        "gcd(BETA,G)=1 and the displayed rational degree-5 w has zero cleared remainder modulo G.",
        "The selected quotient contains sqrt(5)=-ALPHA/BETA.",
        "F_25=F_5[theta]/(theta^2-theta+1) has primitive gamma=1+theta.",
        "The scalar subgroup has order 2 modulo {+/-1}; the cyclotomic norm kernel has order 3 and intersects it trivially.",
        "The two cyclotomic radical squares and their phi ratio hold modulo Phi_5.",
    ],
    "square_certificate": {
        "denominator": str(W_DENOMINATOR),
        "numerator_coefficients_descending": [str(value) for value in W_NUMERATORS],
        "cleared_identity": "2*BETA*(U^2+4)=163*(5*BETA+ALPHA)*w(U)^2 mod G(U)",
        "compact_Qsqrt5_numerator": str(COMPACT_NUMERATOR),
        "compact_Qsqrt5_denominator": COMPACT_DENOMINATOR,
    },
    "artin_subgroups": {
        "ray_group": "F_25^*/{+/-1}=C_12",
        "ring_class_scalar_subgroup_exponents": [0, 6],
        "cyclotomic_norm_kernel_exponents": [0, 4, 8],
        "intersection_exponents": [0],
        "generated_subgroup_exponents": [0, 2, 4, 6, 8, 10],
    },
    "written_field_conclusions": [
        "Cais-Conrad Eq. (4.8) and Cor. 5.7 give K(r(tau))=K_(5).",
        "The Artin calculation gives K_(5)=H_5(zeta_5) and H_5 intersection K(zeta_5)=K(sqrt(5)).",
        "The exact certificate gives Q(t)=Q(u)(sqrt(163*(1+c0)))=Q(u)(sqrt(163*(4-c0))).",
        "Thus K(t)=K(r)=K_(5), with [Q(t):Q]=12 and [K_(5):K]=12.",
    ],
    "embedded_cyclic_quartic": {
        "generator": "delta=sqrt(163*(1+c0))",
        "minimal_polynomial": "X^4-815*X^2+132845",
        "galois_group": "C4",
        "automorphism": "delta -> 3*delta-delta^3/163=phi*delta",
        "integral_trace_gram_discriminant": str(125 * 163**2),
        "written_conductor_conclusion": 815,
    },
    "numerical_branch_diagnostic": numerical_diagnostic,
    "limits": [
        "The high-precision product check diagnoses the analytic branch only; it is not a proof of an algebraic identity.",
        "Class-field identifications and the quartic conductor use the explicitly cited external inputs in MATHEMATICS.md.",
        "No HMR/RH bridge, novelty claim, or broad uniform polynomial formula is asserted.",
    ],
}
RESULTS.write_text(json.dumps(result, indent=2) + "\n")
print("PASS: exact golden ray-class certificate and branch diagnostic")
