#!/usr/bin/env python3
"""Exact SymPy reconstruction of the algebraic v5 geometry claims."""

from __future__ import annotations

import sympy as sp


c, s, q, u = sp.symbols("c s q u", real=True)
RELATIONS = sp.groebner(
    [s**2 - (1 - c**2), q**2 - c * (2 - c)], s, q, u, c, order="lex"
)


def assert_zero(name: str, expression: sp.Expr) -> None:
    numerator, _denominator = sp.fraction(sp.cancel(expression))
    remainder = RELATIONS.reduce(sp.expand(numerator))[1]
    if remainder != 0:
        raise AssertionError(f"{name}: nonzero remainder {sp.factor(remainder)}")
    print(f"PASS {name}")


def dt(expression: sp.Expr) -> sp.Expr:
    return -s * sp.diff(expression, c) + s * (c - 1) * sp.diff(expression, q) / q


def main() -> None:
    n_field = (1 - c) * (1 - c - 2 * u)
    numerator = (1 - u) * c**2 * (2 - c) - u * (1 - c) ** 2 * (1 + c)
    m_field = numerator / q
    a_poly = (1 - c) * c * (2 - c) * (1 + 2 * c - c**2)
    b_poly = c**3 - 3 * c + 1
    u_fold = -a_poly / b_poly
    jacobian = sp.factor(dt(n_field) * sp.diff(m_field, u) - sp.diff(n_field, u) * dt(m_field))

    assert_zero("full Jacobian factorization", jacobian + 2 * s * (a_poly + u * b_poly) / q**3)

    t = sp.symbols("t", real=True)
    c_t = sp.cos(t)
    q_t = sp.sqrt(c_t * (2 - c_t))
    n_t = (1 - c_t) * (1 - c_t - 2 * u)
    m_t = ((1 - u) * c_t**2 * (2 - c_t) - u * (1 - c_t) ** 2 * (1 + c_t)) / q_t
    if sp.simplify(sp.diff(n_t, u).subs(t, 0)) != 0 or sp.simplify(sp.diff(m_t, u).subs(t, 0) + 1) != 0:
        raise AssertionError("unexpected F_u on the symmetry component")
    if sp.simplify(sp.diff(n_t, t, 2).subs(t, 0) + 2 * u) != 0:
        raise AssertionError("unexpected N_tt on the symmetry component")
    print("PASS C0 ordinary-fold determinant is -2u for u>0")

    # The C1 kernel-transversality expression of v5 Theorem 2.4.
    kernel_vector = sp.Matrix([sp.diff(n_field, u), -dt(n_field)])
    directional_jacobian = kernel_vector[0] * dt(jacobian) + kernel_vector[1] * sp.diff(jacobian, u)
    r7 = 3 * c**7 - 8 * c**6 - 12 * c**5 + 60 * c**4 - 69 * c**3 + 30 * c**2 - 6 * c - 1
    expected_directional = -4 * s**2 * (c - 1) * r7 / (q**3 * b_poly)
    assert_zero("C1 kernel transversality factor", directional_jacobian.subs(u, u_fold) - expected_directional)

    # The rational radial image: C^2=Z^2/(X^2+Y^2+Z^2).
    x = c + 2 * u_fold * (1 - c)
    y_squared = (1 - u_fold) ** 2 * (1 - c**2)
    z_squared = u_fold**2 * c * (2 - c)
    c_squared = sp.factor(z_squared / (x**2 + y_squared + z_squared))
    q17 = (
        2 * c**17 - 36 * c**16 + 306 * c**15 - 1588 * c**14 + 5462 * c**13 - 12800 * c**12
        + 20432 * c**11 - 21630 * c**10 + 14160 * c**9 - 4868 * c**8 + 798 * c**7 - 810 * c**6
        + 856 * c**5 - 346 * c**4 + 64 * c**3 + 14 * c**2 - 12 * c
    )
    n_fold = -a_poly
    numerator_c_squared, denominator_c_squared = sp.together(c_squared).as_numer_denom()
    assert_zero(
        "third-component derivative factor",
        sp.diff(c_squared, c) - n_fold * q17 / denominator_c_squared**2,
    )

    # Endpoint algebra is exact for c=1,u=0 and c=cb,u=1.
    cb = sp.symbols("cb", real=True)
    endpoint_norm_sq = (2 - cb) ** 2 + cb * (2 - cb)
    if sp.factor(endpoint_norm_sq - 2 * (2 - cb)) != 0:
        raise AssertionError("boundary endpoint norm identity failed")
    print("PASS radial endpoint norm identity")

    delta = sp.symbols("delta", real=True)
    delta_u = sp.series(u_fold.subs(c, 1 - delta), delta, 0, 4)
    if delta_u != 2 * delta + 3 * delta**3 + sp.Order(delta**4):
        raise AssertionError(f"unexpected fold-branch expansion {delta_u}")
    print("PASS rational branch starts with u_fold=2 delta+O(delta^3)")

    c_t = sp.cos(t)
    q_t = sp.sqrt(c_t * (2 - c_t))
    u_t = u_fold.subs(c, c_t)
    x_t = c_t + 2 * u_t * (1 - c_t)
    y_t = (1 - u_t) * sp.sin(t)
    z_t = u_t * q_t
    radius_t = sp.sqrt(x_t**2 + y_t**2 + z_t**2)
    phi = [x_t / radius_t, y_t / radius_t, z_t / radius_t]
    derivative_at_start = [sp.simplify(sp.diff(component, t).subs(t, 0)) for component in phi]
    if derivative_at_start != [0, 1, 0]:
        raise AssertionError(f"unexpected radial starting derivative {derivative_at_start}")
    print("PASS radial starting derivative is (0,1,0)")
    print("PASS v5 exact algebra on Q != 0")


if __name__ == "__main__":
    main()
