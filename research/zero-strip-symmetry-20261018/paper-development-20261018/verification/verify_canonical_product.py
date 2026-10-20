"""Exact regression checks for the displayed canonical-product tail bound."""

from fractions import Fraction

if not __debug__:
    raise RuntimeError("Assertions must be enabled for verification")


def geometric_tail(base: int, n: int) -> Fraction:
    """Return sum_{k>n} base**(-k) by the geometric-series identity."""
    return Fraction(1, base**n * (base - 1))


def majorant(radius: int, n: int) -> Fraction:
    return Fraction(2 * radius * radius, 3 * 4**n) + Fraction(radius**4, 15 * 16**n)


def direct_majorant_sum(radius: int, n: int) -> Fraction:
    return 2 * radius * radius * geometric_tail(4, n) + radius**4 * geometric_tail(16, n)


def paired_deviation_on_real_axis(w: int, a: int, b: int) -> Fraction:
    """Compute |A(w)-1| directly from the paired factor, with exact rationals."""
    norm_squared = (a * a + b * b) ** 2
    deviation = Fraction(w**4 - 2 * w * w * (a * a - b * b), norm_squared)
    return abs(deviation)


def main() -> None:
    for radius in range(1, 9):
        for n in range(0, 12):
            assert majorant(radius, n) == direct_majorant_sum(radius, n)
            partial = sum(
                Fraction(2 * radius * radius, 4**k) + Fraction(radius**4, 16**k)
                for k in range(n + 1, n + 80)
            )
            assert partial < majorant(radius, n)
        # Independent factor-level check: use the exact paired factor at a=1,
        # b=2**k, rather than reusing the displayed majorant algebra.
        for w in range(-radius, radius + 1):
            for k in range(1, 20):
                b = 2**k
                actual = paired_deviation_on_real_axis(w, 1, b)
                bound = Fraction(2 * radius * radius, b * b) + Fraction(radius**4, b**4)
                assert actual <= bound
    tail = majorant(3, 5)
    assert tail < 1
    assert Fraction(0, 1) < tail / (1 - tail)
    print("canonical-product exact tail checks: PASS")


if __name__ == "__main__":
    main()
