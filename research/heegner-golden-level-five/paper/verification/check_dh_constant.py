#!/usr/bin/env python3
"""Check the Davenport--Heilbronn parameter identity used in Section 5.

The paper identifies the normalized positive eigenvector of the odd
period-five sine-Fourier involution with the Davenport--Heilbronn coefficient
sequence and states

    kappa = r(i) = (sqrt(10 - 2 sqrt(5)) - 2) / (sqrt(5) - 1).

This script evaluates the Rogers--Ramanujan product at i and compares it with
the closed form and with the equivalent golden expressions.  It also checks
that the normalized positive sequence is nonmultiplicative at the first
possible index and that the mixed vector (1,0) has neither scalar sign.

Run with assertions enabled; never use Python -O.
"""
import json
from pathlib import Path

import mpmath as mp

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "verification/DH_CONSTANT_CHECK.json"
mp.mp.dps = 90

# Rogers--Ramanujan product at tau = i.  The nome is real and tiny.
q = mp.e ** (-2 * mp.pi)
q5 = q ** (mp.mpf(1) / 5)
product = mp.mpf(1)
terms = 240
for n in range(1, terms + 1):
    product *= ((1 - q ** (5 * n - 4)) * (1 - q ** (5 * n - 1))) / (
        (1 - q ** (5 * n - 3)) * (1 - q ** (5 * n - 2))
    )
kappa_product = q5 * product

sqrt5 = mp.sqrt(5)
kappa_formula = (mp.sqrt(10 - 2 * sqrt5) - 2) / (sqrt5 - 1)
phi = (1 + sqrt5) / 2
gamma = 1 / phi
c0 = gamma ** 2
kappa_golden = gamma / (1 + mp.sqrt(1 + c0))
kappa_trig = 2 * mp.cos(mp.pi / 10) - 2 * mp.cos(mp.pi / 5)

# The positive eigenline and the tangent double-angle expressions.
A = (2 / sqrt5) * mp.matrix(
    [[mp.sin(2 * mp.pi / 5), mp.sin(mp.pi / 5)],
     [mp.sin(mp.pi / 5), -mp.sin(2 * mp.pi / 5)]]
)
eig_error = max(
    abs(A[0, 0] + A[0, 1] * kappa_product - 1),
    abs(A[1, 0] + A[1, 1] * kappa_product - kappa_product),
)
theta = mp.atan(gamma) / 2
half_angle_error = max(
    abs(mp.tan(theta) - kappa_product),
    abs(mp.cos(2 * theta) - 1 / mp.sqrt(1 + c0)),
    abs(mp.sin(2 * theta) - gamma / mp.sqrt(1 + c0)),
)

# The normalized positive five-periodic sequence and its first product check.
a = [mp.mpf(1), kappa_product, -kappa_product, mp.mpf(-1), mp.mpf(0)]
a2a3 = a[1] * a[2]
nonmultiplicative_error = abs(a2a3 + kappa_product ** 2)

# A mixed vector has neither scalar sign.
mixed = mp.matrix([1, 0])
Amixed = A * mixed
mixed_plus = max(abs(Amixed[0] - 1), abs(Amixed[1]))
mixed_minus = max(abs(Amixed[0] + 1), abs(Amixed[1]))

checks = {
    "product_vs_closed_form": abs(kappa_product - kappa_formula),
    "product_vs_golden_expression": abs(kappa_product - kappa_golden),
    "product_vs_trigonometric_expression": abs(kappa_product - kappa_trig),
    "positive_eigenline": eig_error,
    "half_angle_identities": half_angle_error,
    "nonmultiplicative_a2a3_plus_kappa_squared": nonmultiplicative_error,
}
tol = mp.mpf("1e-70")
for name, value in checks.items():
    assert value < tol, (name, value)

# The mixed vector must fail both scalar equations by a wide margin.
assert mixed_plus > mp.mpf("1e-3") and mixed_minus > mp.mpf("1e-3"), (
    mixed_plus,
    mixed_minus,
)
mixed_error = min(mixed_plus, mixed_minus)

result = {
    "date": "2026-10-20",
    "status": "PASS",
    "precision_digits": 90,
    "product_terms": terms,
    "kappa": mp.nstr(kappa_product, 60),
    "closed_form": mp.nstr(kappa_formula, 60),
    "identities": {
        "r(i) = (sqrt(10-2sqrt5)-2)/(sqrt5-1)": mp.nstr(
            abs(kappa_product - kappa_formula), 8
        ),
        "r(i) = gamma/(1+sqrt(1+c0))": mp.nstr(
            abs(kappa_product - kappa_golden), 8
        ),
        "r(i) = 2cos(18deg)-2cos(36deg)": mp.nstr(
            abs(kappa_product - kappa_trig), 8
        ),
        "A(1,kappa)=(1,kappa)": mp.nstr(eig_error, 8),
        "tan(atan(gamma)/2)=kappa": mp.nstr(half_angle_error, 8),
        "a=(1,kappa,-kappa,-1,0) has a2*a3=-kappa^2": mp.nstr(
            nonmultiplicative_error, 8
        ),
        "mixed vector (1,0) misses the nearer scalar sign by": mp.nstr(
            mixed_error, 8
        ),
    },
    "scope": (
        "Numerical verification of a closed-form constant and finite algebraic "
        "identities at 90 digits; the sequence interpretation and the analytic "
        "classification rest on the written text and cited literature."
    ),
}
OUT.write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps(result, indent=2))
