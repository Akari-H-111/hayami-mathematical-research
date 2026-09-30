#!/usr/bin/env python3
"""Pure-standard-library reconstruction of the v5 Sturm certificate."""

from __future__ import annotations

from fractions import Fraction


Polynomial = list[Fraction]


def trim(poly: Polynomial) -> Polynomial:
    result = [Fraction(x) for x in poly]
    while len(result) > 1 and result[-1] == 0:
        result.pop()
    return result


def derivative(poly: Polynomial) -> Polynomial:
    return trim([i * poly[i] for i in range(1, len(poly))] or [Fraction(0)])


def divmod_poly(dividend: Polynomial, divisor: Polynomial) -> tuple[Polynomial, Polynomial]:
    remainder = trim(dividend[:])
    divisor = trim(divisor)
    if divisor == [0]:
        raise ZeroDivisionError("zero polynomial")
    quotient = [Fraction(0)] * max(1, len(remainder) - len(divisor) + 1)
    while len(remainder) >= len(divisor) and remainder != [0]:
        degree = len(remainder) - len(divisor)
        coefficient = remainder[-1] / divisor[-1]
        quotient[degree] += coefficient
        for index, entry in enumerate(divisor):
            remainder[index + degree] -= coefficient * entry
        remainder = trim(remainder)
    return trim(quotient), trim(remainder)


def sturm_sequence(poly: Polynomial) -> list[Polynomial]:
    sequence = [trim(poly), derivative(poly)]
    while sequence[-1] != [0]:
        _quotient, remainder = divmod_poly(sequence[-2], sequence[-1])
        if remainder == [0]:
            break
        sequence.append(trim([-entry for entry in remainder]))
    return sequence


def evaluate(poly: Polynomial, point: Fraction) -> Fraction:
    value = Fraction(0)
    for coefficient in reversed(poly):
        value = value * point + coefficient
    return value


def variations(sequence: list[Polynomial], point: Fraction) -> int:
    signs: list[int] = []
    for poly in sequence:
        value = evaluate(poly, point)
        if value:
            signs.append(1 if value > 0 else -1)
    return sum(left != right for left, right in zip(signs, signs[1:]))


def root_count(poly: Polynomial, left: Fraction, right: Fraction) -> tuple[int, int, int]:
    sequence = sturm_sequence(poly)
    v_left = variations(sequence, left)
    v_right = variations(sequence, right)
    return v_left, v_right, v_left - v_right


def require_count(name: str, poly: Polynomial, left: Fraction, right: Fraction, expected: tuple[int, int, int]) -> None:
    actual = root_count(poly, left, right)
    if actual != expected:
        raise AssertionError(f"{name}: expected {expected}, got {actual}")
    print(f"PASS {name}: variations {actual[0]} -> {actual[1]}, roots={actual[2]}")


def main() -> None:
    # Coefficients are in increasing degree order, as specified in v5 Appendix A.
    pb = [-1, 1, -1, 6, -5, 1]
    r7 = [-1, -6, 30, -69, 60, -12, -8, 3]
    q17 = [0, -12, 14, 64, -346, 856, -810, 798, -4868, 14160, -21630, 20432, -12800, 5462, -1588, 306, -36, 2]
    denominator_b = [1, -3, 0, 1]

    require_count("p_b on (0,1)", pb, Fraction(0), Fraction(1), (4, 3, 1))
    require_count("p_b isolation interval", pb, Fraction(613, 1000), Fraction(614, 1000), (4, 3, 1))
    require_count("R7 on physical interval", r7, Fraction(613, 1000), Fraction(1), (3, 3, 0))
    require_count("Q17 on physical interval", q17, Fraction(613, 1000), Fraction(1), (9, 9, 0))
    require_count("B has no physical-interval pole", denominator_b, Fraction(613, 1000), Fraction(1), (1, 1, 0))

    # u_fold=1 iff n-d=p_b, with n=-(1-c)c(2-c)(1+2c-c^2).
    n = [0, -2, -1, 7, -5, 1]
    d = [1, -3, 0, 1]
    if [n_i - d_i for n_i, d_i in zip(n, d + [0] * (len(n) - len(d)))] != pb:
        raise AssertionError("p_b is not the reconstructed numerator n-d")
    print("PASS physical-boundary polynomial identity p_b=n-d")


if __name__ == "__main__":
    main()
