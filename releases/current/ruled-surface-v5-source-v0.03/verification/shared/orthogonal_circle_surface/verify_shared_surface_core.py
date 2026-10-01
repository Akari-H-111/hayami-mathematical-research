#!/usr/bin/env python3
"""Exact algebraic checks for the interior orthogonal-circle surface chart.

The final v4 PDF is the statement authority.  This program independently
checks the formulas that are meaningful where Q != 0.  It deliberately does
not certify smoothness at the two Q = 0 parameter-boundary components.

Run with SymPy 1.14.0:
    python -B verify_shared_surface_core.py
"""

from __future__ import annotations

import sympy as sp


c, s, q, u = sp.symbols("c s q u", real=True)
P = c**2 - 3 * c + 1

# The real interior chart has c in (0, 1), q > 0, c^2+s^2=1, q^2=c(2-c).
RELATIONS = sp.groebner(
    [s**2 - (1 - c**2), q**2 - c * (2 - c)], s, q, u, c, order="lex"
)


def assert_zero(name: str, expression: sp.Expr) -> None:
    """Prove a rational expression vanishes in the stated algebraic quotient."""
    numerator, _denominator = sp.fraction(sp.cancel(expression))
    remainder = RELATIONS.reduce(sp.expand(numerator))[1]
    if remainder != 0:
        raise AssertionError(f"{name}: nonzero remainder {sp.factor(remainder)}")
    print(f"PASS {name}")


def main() -> None:
    su = sp.Matrix([2 * (1 - c), -s, q])
    st = sp.Matrix([(2 * u - 1) * s, (1 - u) * c, u * s * (c - 1) / q])
    stu = sp.Matrix([2 * s, -c, s * (c - 1) / q])
    cross = st.cross(su)

    # v4 equations (3)--(12), with every denominator restricted to q != 0.
    assert_zero("Q_t identity", q * (s * (c - 1) / q) - s * (c - 1))
    assert_zero("scalar triple product", sp.det(sp.Matrix.hstack(st, su, stu)) + P * s / q)
    assert_zero("first fundamental form G", su.dot(su) - (2 * c**2 - 6 * c + 5))
    assert_zero("first fundamental form F", st.dot(su) - s * ((3 - 2 * c) * u - (2 - c)))
    assert_zero(
        "first fundamental form E",
        st.dot(st)
        - (
            1
            + (-4 * s**2 - 2 * c**2) * u
            + (4 * s**2 + c**2 + s**2 * (1 - c) ** 2 / q**2) * u**2
        ),
    )
    assert_zero(
        "cross-product x component",
        cross[0] - ((1 - u) * c**2 * (2 - c) - u * (1 - c) ** 2 * (1 + c)) / q,
    )
    assert_zero("cross-product y component", cross[1] + s * (2 * u - c * (2 - c)) / q)
    assert_zero("cross-product z component", cross[2] - (1 - c) * (1 - c - 2 * u))

    c0 = (3 - sp.sqrt(5)) / 2
    u0 = (sp.sqrt(5) - 1) / 4
    if sp.simplify(P.subs(c, c0)) != 0:
        raise AssertionError("claimed interior root does not annihilate P")
    if sp.simplify(u0 - (1 - c0) / 2) != 0:
        raise AssertionError("lateral u0 does not satisfy V_z = 0")
    if sp.simplify(u0 - c0 * (2 - c0) / 2) != 0:
        raise AssertionError("lateral u0 does not satisfy V_y = 0")
    print("PASS lateral root and parameter")

    # The PDF's range statement is elementary but worth binding explicitly.
    G = 2 * c**2 - 6 * c + 5
    if sp.simplify((G - 1) - (c - 1) * (2 * c - 4)) != 0:
        raise AssertionError("unexpected factorization for G - 1")
    if sp.simplify((5 - G) - c * (6 - 2 * c)) != 0:
        raise AssertionError("unexpected factorization for 5 - G")
    print("PASS G range certificate on 0 <= c <= 1")

    print("BOUNDARY_SCOPE_REQUIRED: q=0 at c=0; all t-derivative identities above require q != 0.")
    print("PASS interior shared-surface algebra")


if __name__ == "__main__":
    main()
