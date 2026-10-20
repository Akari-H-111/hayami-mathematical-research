#!/usr/bin/env python3
"""Reproduce the bounded level-5/Golden-field research result.

This is deliberately a small checker.  It verifies exact polynomial identities,
certified rational branch intervals, finite factorization controls, and separate
100/200-digit q-product and continued-fraction diagnostics.  It does not prove
the classical CM or modular-function inputs recorded in SOURCES.md.
"""

from __future__ import annotations

import json
import sys
from fractions import Fraction
from pathlib import Path

if not __debug__:
    raise RuntimeError("Assertions must remain enabled; do not use python -O")

import mpmath as mp
import sympy as sp


x, u, s = sp.symbols("x u s")
J163 = -640320**3


def level5(j: int) -> sp.Poly:
    """Klein's equation for t=r(tau)^5, with j(tau)=j."""
    q4 = x**4 - 228 * x**3 + 494 * x**2 + 228 * x + 1
    q2 = x**2 + 11 * x - 1
    return sp.Poly(q4**3 + j * x * q2**5, x)


def factor_degrees(expr: sp.Expr, variable: sp.Symbol, extension: sp.Expr | None = None) -> list[int]:
    kwargs = {} if extension is None else {"extension": extension}
    return sorted(
        int(sp.degree(factor, variable))
        for factor, multiplicity in sp.factor_list(expr, **kwargs)[1]
        for _ in range(multiplicity)
    )


def factor_components(expr: sp.Expr, variable: sp.Symbol) -> list[dict[str, object]]:
    records = []
    for factor, multiplicity in sp.factor_list(expr)[1]:
        records.append(
            {
                "degree_Q": int(sp.degree(factor, variable)),
                "multiplicity": int(multiplicity),
                "degrees_Qsqrt5": factor_degrees(factor, variable, sp.sqrt(5)),
            }
        )
    return records


def as_sympy(q: Fraction) -> sp.Rational:
    return sp.Rational(q.numerator, q.denominator)


def interval(poly: sp.Poly, lo: Fraction, hi: Fraction) -> tuple[Fraction, Fraction]:
    """Exact Horner enclosure of a polynomial on a rational interval."""
    lower = upper = Fraction(0)
    for coefficient in poly.all_coeffs():
        values = (lower * lo, lower * hi, upper * lo, upper * hi)
        c = Fraction(int(coefficient))
        lower, upper = min(values) + c, max(values) + c
    return lower, upper


def exp_bounds(z: int, terms: int = 200) -> tuple[Fraction, Fraction]:
    """Rational lower/upper bounds for exp(z) from its positive Taylor tail."""
    term = total = Fraction(1)
    for k in range(1, terms + 1):
        term *= Fraction(z, k)
        total += term
    next_term = term * Fraction(z, terms + 1)
    ratio = Fraction(z, terms + 2)
    assert ratio < 1
    return total, total + next_term / (1 - ratio)


def finite_product_t(discriminant: int, q_sign: int, digits: int) -> tuple[mp.mpf, int]:
    """Direct finite-product evaluation of t; its truncation is diagnostic only."""
    with mp.workdps(digits + 30):
        q = q_sign * mp.exp(-mp.pi * mp.sqrt(discriminant))
        terms = max(20, int(mp.ceil((digits + 30) / (-mp.log10(abs(q))))) + 2)
        product = mp.mpf(1)
        for n in range(1, terms + 1):
            product *= (1 - q ** (5 * n - 4)) * (1 - q ** (5 * n - 1))
            product /= (1 - q ** (5 * n - 3)) * (1 - q ** (5 * n - 2))
        return q * product**5, terms


def numerical_component(j: int, t_value: mp.mpf, digits: int) -> dict[str, object]:
    """Match a q-product value to one exact Q-factor without claiming isolation."""
    with mp.workdps(digits + 30):
        choices = []
        for factor, multiplicity in sp.factor_list(level5(j).as_expr())[1]:
            value = mp.polyval([int(c) for c in sp.Poly(factor, x).all_coeffs()], t_value)
            choices.append(
                {
                    "degree_Q": int(sp.degree(factor, x)),
                    "multiplicity": int(multiplicity),
                    "degrees_Qsqrt5": factor_degrees(factor, x, sp.sqrt(5)),
                    "residual": abs(value),
                }
            )
        best = min(choices, key=lambda record: record["residual"])
        assert best["residual"] < mp.mpf(10) ** (-digits + 5)
        return best


def string_number(value: mp.mpf, significant: int = 12) -> str:
    return mp.nstr(value, significant)


def exact_core() -> dict[str, object]:
    """Exact universal reduction, -163 reconstruction, and branch certificates."""
    P = level5(J163)
    Q = x**4 - 228 * x**3 + 494 * x**2 + 228 * x + 1
    R = x**2 + 11 * x - 1
    G = (u**2 - 228 * u + 496) ** 3 + J163 * (u + 11) ** 5
    assert sp.expand(x**6 * G.subs(u, x - 1 / x) - P.as_expr()) == 0

    a0 = 131268706320384342
    b0 = 2896632145572621515
    c0 = 15717124384666951860
    d0 = 58705150130167150
    e0 = 1295413276662289800
    f0 = 7028911706986972100
    alpha = u**3 - a0 * u**2 + (3 - b0) * u - (2 * a0 + c0)
    beta = -d0 * u**2 - e0 * u - (2 * d0 + f0)
    assert sp.expand(G - (alpha**2 - 5 * beta**2)) == 0

    A = sp.Poly(
        x**6
        - a0 * x**5
        - b0 * x**4
        - c0 * x**3
        + b0 * x**2
        - a0 * x
        - 1,
        x,
    )
    B = sp.Poly(-d0 * x**5 - e0 * x**4 - f0 * x**3 + e0 * x**2 - d0 * x, x)
    assert sp.expand(x**3 * alpha.subs(u, x - 1 / x) - A.as_expr()) == 0
    assert sp.expand(x**3 * beta.subs(u, x - 1 / x) - B.as_expr()) == 0
    assert A * A - 5 * B * B == P
    assert sp.gcd(A, B).degree() == 0
    assert factor_degrees(P.as_expr(), x) == [12]
    assert factor_degrees(P.as_expr(), x, sp.sqrt(5)) == [6, 6]

    # Exact polynomial versions of gamma^2+gamma-1=0 and c0^2-3c0+1=0.
    A_expr, B_expr = A.as_expr(), B.as_expr()
    gamma_num = -(A_expr + B_expr)
    c0_num = 3 * B_expr + A_expr
    assert sp.expand(gamma_num**2 + 2 * B_expr * gamma_num - (2 * B_expr) ** 2 - P.as_expr()) == 0
    assert sp.expand(c0_num**2 - 3 * c0_num * (2 * B_expr) + (2 * B_expr) ** 2 - P.as_expr()) == 0

    # Certified enclosure for the analytic t branch.  This uses only rational
    # Taylor bounds plus the classical product formula; it does not use a float.
    assert Fraction(314, 100) * Fraction(1276, 100) > 40
    assert Fraction(22, 7) * Fraction(1277, 100) < 41
    assert Fraction(1276, 100) ** 2 < 163 < Fraction(1277, 100) ** 2
    assert exp_bounds(40)[0] > 23 * 10**16
    assert exp_bounds(41)[1] < 7 * 10**17
    q_upper = Fraction(1, 23 * 10**16)
    q_lower = Fraction(1, 7 * 10**17)
    # If F is the positive product, |log(F^5)| is bounded by this quantity.
    eta = 5 * q_upper / (1 - q_upper) ** 2
    assert eta < Fraction(1, 1000)
    f5_lower = 1 - Fraction(1, 1000)
    f5_upper = 1 / (1 - Fraction(1, 1000))
    t_lo, t_hi = -Fraction(5, 10**18), -Fraction(1, 10**18)
    assert f5_upper * q_upper < -t_lo
    assert f5_lower * q_lower > -t_hi
    assert interval(A, t_lo, t_hi)[1] < 0
    assert interval(B, t_lo, t_hi)[0] > 0
    assert P.count_roots(as_sympy(t_lo), as_sympy(t_hi)) == 1

    # The real positive branch s has t=-s^5.  Its smaller degree-12 factor is
    # certified separately, so phase conventions are not hidden in a decimal.
    P_sub = sp.Poly(P.as_expr().subs(x, -s**5), s)
    H = sp.Poly(
        s**12
        + 3049 * s**11
        + 6824 * s**10
        - 2600 * s**9
        - 26275 * s**8
        - 13636 * s**7
        + 21661 * s**6
        + 13636 * s**5
        - 26275 * s**4
        + 2600 * s**3
        + 6824 * s**2
        - 3049 * s
        + 1,
        s,
    )
    a_s = 2 * s**6 + 3049 * s**5 + 4935 * s**4 + 1160 * s**3 - 4935 * s**2 + 3049 * s - 2
    b_s = -1363 * s**5 - 2209 * s**4 - 522 * s**3 + 2209 * s**2 - 1363 * s
    assert sp.expand(a_s**2 - 5 * b_s**2 - 4 * H.as_expr()) == 0
    assert sp.rem(P_sub, H).is_zero
    cofactor = sp.exquo(P_sub, H)
    assert factor_degrees(P_sub.as_expr(), s) == [12, 24, 24]
    assert factor_degrees(H.as_expr(), s) == [12]
    assert factor_degrees(H.as_expr(), s, sp.sqrt(5)) == [6, 6]
    s_lo, s_hi = Fraction(1, 4000), Fraction(1, 2500)
    assert s_lo**5 < -t_hi < -t_lo < s_hi**5
    assert H.count_roots(as_sympy(s_lo), as_sympy(s_hi)) == 1
    assert cofactor.count_roots(as_sympy(s_lo), as_sympy(s_hi)) == 0
    assert interval(sp.Poly(a_s, s), s_lo, s_hi)[1] < 0
    assert interval(sp.Poly(b_s, s), s_lo, s_hi)[1] < 0

    return {
        "universal_quotient": "P_j(t)=t^6*((u^2-228u+496)^3+j*(u+11)^5), u=t-t^-1",
        "d163_factor": "P_163=A^2-5B^2 with gcd(A,B)=1",
        "d163_Q_factor_degrees": factor_degrees(P.as_expr(), x),
        "d163_Qsqrt5_factor_degrees": factor_degrees(P.as_expr(), x, sp.sqrt(5)),
        "t_interval": [str(t_lo), str(t_hi)],
        "t_signs": "A(t)<0<B(t), hence A(t)/B(t)=-sqrt(5)",
        "s_interval": [str(s_lo), str(s_hi)],
        "s_signs": "a_s(s)<0 and b_s(s)<0, hence a_s(s)/b_s(s)=sqrt(5)",
        "real_branch_factor_degrees": factor_degrees(P_sub.as_expr(), s),
        "real_branch_H_factor_degrees_Qsqrt5": factor_degrees(H.as_expr(), s, sp.sqrt(5)),
    }


def controls() -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    """Exact CM-order factorization controls plus numerical branch matching."""
    class_number_one = [
        ("D=-3", 3, 0, -1, "maximal"),
        ("D=-4", 4, 1728, 1, "maximal"),
        ("D=-7", 7, -3375, -1, "maximal"),
        ("D=-8", 8, 8000, 1, "maximal"),
        ("D=-11", 11, -32768, -1, "maximal"),
        ("D=-19", 19, -96**3, -1, "maximal"),
        ("D=-43", 43, -960**3, -1, "maximal"),
        ("D=-67", 67, -5280**3, -1, "maximal"),
        ("D=-163", 163, J163, -1, "maximal"),
        ("D=-12", 12, 54000, 1, "nonmaximal class-number-one order"),
        ("D=-16", 16, 287496, 1, "nonmaximal class-number-one order"),
        ("D=-27", 27, -12288000, -1, "nonmaximal class-number-one order"),
        ("D=-28", 28, 16581375, 1, "nonmaximal class-number-one order"),
    ]
    rows = []
    for label, discriminant, j, q_sign, kind in class_number_one:
        P = level5(j)
        exact_components = factor_components(P.as_expr(), x)
        samples = []
        selected_degrees = []
        for digits in (100, 200):
            t_value, terms = finite_product_t(discriminant, q_sign, digits)
            selected = numerical_component(j, t_value, digits)
            assert len(selected["degrees_Qsqrt5"]) > 1
            assert sum(selected["degrees_Qsqrt5"]) == selected["degree_Q"]
            selected_degrees.append(selected["degree_Q"])
            samples.append(
                {
                    "digits": digits,
                    "product_terms": terms,
                    "selected_degree_Q": selected["degree_Q"],
                    "selected_degrees_Qsqrt5": selected["degrees_Qsqrt5"],
                    "selected_residual": string_number(selected["residual"], 8),
                    "t": string_number(t_value, 16),
                }
            )
        assert selected_degrees[0] == selected_degrees[1]
        rows.append(
            {
                "control": label,
                "kind": kind,
                "j": str(j),
                "exact_Q_components": exact_components,
                "analytic_component_match": "NUMERICAL q-product, stable at 100 and 200 digits",
                "analytic_component_samples": samples,
            }
        )

    generic = []
    for j in (1, 2):
        P = level5(j)
        q_degrees = factor_degrees(P.as_expr(), x)
        qsqrt5_degrees = factor_degrees(P.as_expr(), x, sp.sqrt(5))
        assert q_degrees == [12]
        assert qsqrt5_degrees == [12]
        generic.append(
            {
                "control": f"rational j={j}",
                "exact_Q_factor_degrees": q_degrees,
                "exact_Qsqrt5_factor_degrees": qsqrt5_degrees,
                "conclusion": "No Q(sqrt(5)) subfield in a root field of this irreducible fibre.",
            }
        )
    return rows, generic


def d163_diagnostics() -> list[dict[str, object]]:
    """Independent product and continued-fraction evaluations of the specified r branch."""
    P = level5(J163)
    a0 = [int(c) for c in P.all_coeffs()]
    A = sp.Poly(
        x**6
        - 131268706320384342 * x**5
        - 2896632145572621515 * x**4
        - 15717124384666951860 * x**3
        + 2896632145572621515 * x**2
        - 131268706320384342 * x
        - 1,
        x,
    )
    B = sp.Poly(
        -58705150130167150 * x**5
        - 1295413276662289800 * x**4
        - 7028911706986972100 * x**3
        + 1295413276662289800 * x**2
        - 58705150130167150 * x,
        x,
    )
    diagnostics = []
    for digits in (100, 200):
        with mp.workdps(digits + 30):
            magnitude = mp.exp(-mp.pi * mp.sqrt(163))
            q = -magnitude
            terms = max(20, int(mp.ceil((digits + 30) / (-mp.log10(abs(q))))) + 2)
            product = mp.mpf(1)
            for n in range(1, terms + 1):
                product *= (1 - q ** (5 * n - 4)) * (1 - q ** (5 * n - 1))
                product /= (1 - q ** (5 * n - 3)) * (1 - q ** (5 * n - 2))
            q_one_fifth = mp.exp(mp.j * mp.pi / 5) * magnitude ** (mp.mpf(1) / 5)
            r_product = q_one_fifth * product
            denominator = mp.mpf(1)
            for n in range(terms, 0, -1):
                denominator = 1 + q**n / denominator
            r_fraction = q_one_fifth / denominator
            t_product = r_product**5
            a_value = mp.polyval([int(c) for c in A.all_coeffs()], t_product)
            b_value = mp.polyval([int(c) for c in B.all_coeffs()], t_product)
            phi = (1 + mp.sqrt(5)) / 2
            gamma = 1 / phi
            c0 = phi**-2
            phi_recovered = (b_value - a_value) / (2 * b_value)
            gamma_recovered = -(a_value + b_value) / (2 * b_value)
            c0_recovered = (3 * b_value + a_value) / (2 * b_value)
            r_difference = abs(r_product - r_fraction)
            polynomial_residual = abs(mp.polyval(a0, t_product))
            assert r_difference < mp.mpf(10) ** (-digits + 5)
            assert polynomial_residual < mp.mpf(10) ** (-digits + 3)
            assert abs(phi_recovered - phi) < mp.mpf(10) ** (-digits + 5)
            assert abs(gamma_recovered - gamma) < mp.mpf(10) ** (-digits + 5)
            assert abs(c0_recovered - c0) < mp.mpf(10) ** (-digits + 5)
            diagnostics.append(
                {
                    "digits": digits,
                    "product_terms": terms,
                    "t": string_number(mp.re(t_product), 50),
                    "product_vs_continued_fraction_error": string_number(r_difference, 8),
                    "level5_polynomial_residual": string_number(polynomial_residual, 8),
                    "phi_reconstruction_error": string_number(abs(phi_recovered - phi), 8),
                    "gamma_reconstruction_error": string_number(abs(gamma_recovered - gamma), 8),
                    "c0_reconstruction_error": string_number(abs(c0_recovered - c0), 8),
                }
            )
    return diagnostics


def local_identities() -> dict[str, str]:
    sqrt5 = sp.sqrt(5)
    phi = (1 + sqrt5) / 2
    c0 = (3 - sqrt5) / 2
    gamma = (sqrt5 - 1) / 2
    j15 = (-191025 - 85995 * sqrt5) / 2
    j20 = 632000 + 282880 * sqrt5
    assert sp.simplify(c0 - gamma**2) == 0
    assert sp.simplify(j15 - (-52515 - 85995 * phi)) == 0
    assert sp.simplify(j15 - (85995 * c0 - 224505)) == 0
    assert sp.simplify(j20 - (1480640 - 565760 * c0)) == 0
    return {
        "c0_equals_gamma_squared": "(3-sqrt(5))/2=((sqrt(5)-1)/2)^2",
        "D_minus_15": "j=(-191025-85995*sqrt(5))/2=85995*c0-224505",
        "D_minus_20": "j=632000+282880*sqrt(5)=1480640-565760*c0",
    }


def main() -> None:
    exact = exact_core()
    cm_controls, generic_controls = controls()
    diagnostics = d163_diagnostics()
    result = {
        "status": "PASS",
        "environment": {
            "python": sys.version.split()[0],
            "sympy": sp.__version__,
            "mpmath": mp.__version__,
        },
        "exact": exact,
        "class_number_one_controls": cm_controls,
        "generic_rational_j_controls": generic_controls,
        "numerical_diagnostics": diagnostics,
        "local_exact_identities": local_identities(),
        "limits": [
            "Classical CM values and the level-5 equation are external inputs, not reproved here.",
            "The 13 CM analytic-component matches are numerical at 100/200 digits; only the -163 branch is rationally isolated here.",
            "No novelty, intrinsic geometric map, ray-class stabilizer theorem, or RH implication is certified.",
        ],
    }
    destination = Path(__file__).resolve().with_name("RESULTS.json")
    destination.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(
        "PASS: universal sextic; certified -163 t/s branches; "
        "13 CM-order controls; j=1,2 countercontrols; 100/200-digit independent diagnostics"
    )


if __name__ == "__main__":
    main()
