#!/usr/bin/env python3
"""Exact checks for v4's interior observation-field formulas.

Run from verification/legacy-reconstruction/ with:
    .venv/bin/python -B ../../papers/legacy-geometry/orthogonal-circle-ruled-surface/verification/verify_observation_field.py
"""

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
    """Differentiate an expression in c and q along t on the Q != 0 chart."""
    return -s * sp.diff(expression, c) + s * (c - 1) * sp.diff(expression, q) / q


def main() -> None:
    n_field = (1 - c) * (1 - c - 2 * u)
    numerator = (1 - u) * c**2 * (2 - c) - u * (1 - c) ** 2 * (1 + c)
    m_field = numerator / q
    phase_denominator = 1 - c + c**2
    a_poly = (1 - c) * c * (2 - c) * (1 + 2 * c - c**2)
    b_poly = c**3 - 3 * c + 1
    jacobian = sp.factor(dt(n_field) * sp.diff(m_field, u) - sp.diff(n_field, u) * dt(m_field))

    assert_zero(
        "phase-skeleton numerator identity",
        numerator - (c**2 * (2 - c) - u * phase_denominator),
    )
    assert_zero("phase skeleton", numerator.subs(u, c**2 * (2 - c) / phase_denominator))
    assert_zero("observation Jacobian factorization", jacobian + 2 * s * (a_poly + u * b_poly) / q**3)

    quintic = c**5 - 3 * c**4 + 5 * c**3 - 6 * c**2 + c + 1
    u_skeleton = c**2 * (2 - c) / phase_denominator
    u_fold = -a_poly / b_poly
    assert_zero("skeleton-fold quintic", sp.together(u_skeleton - u_fold) * phase_denominator * b_poly / (c * (2 - c)) - quintic)
    if sp.Poly(quintic, c).count_roots(0, 1) != 1:
        raise AssertionError("absolute-singularity quintic should have exactly one root in (0,1)")
    print("PASS absolute-singularity quintic has exactly one root in (0,1)")

    # On the fold, dJ evaluated on ker(DF) reduces, up to nonzero chart
    # factors, to the following seventh-degree polynomial.  This is the
    # missing non-vanishing check behind v4 Lemma 5.1.
    fold_transversality = (
        3 * c**7
        - 8 * c**6
        - 12 * c**5
        + 60 * c**4
        - 69 * c**3
        + 30 * c**2
        - 6 * c
        - 1
    )
    if sp.Poly(fold_transversality, c).count_roots(0, 1) != 0:
        raise AssertionError("fold kernel-transversality factor vanishes in (0,1)")
    print("PASS Whitney-fold kernel transversality factor is root-free on (0,1)")

    c0 = (3 - sp.sqrt(5)) / 2
    u0 = (sp.sqrt(5) - 1) / 4
    q0 = sp.sqrt(c0 * (2 - c0))
    s0 = sp.sqrt(1 - c0**2)
    lateral_jacobian = sp.simplify(jacobian.subs({c: c0, u: u0, q: q0, s: s0}))
    target_lateral_jacobian = -5 * s0 * (1 - c0) ** 2 / q0
    if sp.simplify(lateral_jacobian - target_lateral_jacobian) != 0:
        raise AssertionError("lateral dipole determinant does not match the PDF formula")
    print("PASS nondegenerate positive-lateral dipole determinant")

    # The polar point is a third, degenerate F-zero.  The PDF's two points are
    # precisely the nondegenerate lateral zeros, not the entire zero set.
    if sp.simplify(n_field.subs({c: 1, u: 1})) != 0 or sp.simplify(m_field.subs({c: 1, u: 1, q: 1})) != 0:
        raise AssertionError("polar point should be an observation-field zero")
    if sp.simplify(jacobian.subs({c: 1, u: 1, q: 1, s: 0})) != 0:
        raise AssertionError("polar observation-field zero should be degenerate")
    print("PASS polar observation-field zero is degenerate")

    print("PASS v4 observation-field algebra on Q != 0")


if __name__ == "__main__":
    main()
