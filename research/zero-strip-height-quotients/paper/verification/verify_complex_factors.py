"""Exact Gaussian-rational checks; finite diagnostics for the written product proof."""

from fractions import Fraction as Q
from verify_canonical_product import majorant

if not __debug__:
    raise RuntimeError("Assertions must be enabled for verification")


def add(z, w):
    return z[0] + w[0], z[1] + w[1]


def mul(z, w):
    return z[0]*w[0] - z[1]*w[1], z[0]*w[1] + z[1]*w[0]


def inverse(z):
    denominator = z[0]**2 + z[1]**2
    if denominator == 0:
        raise ZeroDivisionError("Gaussian-rational inverse at zero")
    return z[0]/denominator, -z[1]/denominator


def factor(w, z):
    value = mul(mul(w, w), inverse(mul(z, z)))
    return add((Q(1), Q(0)), (-value[0], -value[1]))


def paired(w, a, b):
    return mul(factor(w, (a, b)), factor(w, (a, -b)))


def norm_squared(z):
    return z[0]**2 + z[1]**2


def main():
    checks = 0
    a = Q(1, 4)
    for radius in range(1, 4):
        for u in range(-radius, radius+1):
            for v in range(-radius, radius+1):
                if u*u+v*v > radius*radius:
                    continue
                w = (Q(u), Q(v))
                for n in range(2, 6):
                    bound = majorant(radius, n)
                    assert bound < 1
                    product = (Q(1), Q(0))
                    for k in range(n+1, n+9):
                        b = Q(2**k)
                        value = paired(w, a, b)
                        delta = add(value, (Q(-1), Q(0)))
                        point_bound = Q(2*radius**2, b*b) + Q(radius**4, b**4)
                        assert norm_squared(delta) <= point_bound**2
                        product = mul(product, value)
                        checks += 1
                    delta = add(product, (Q(-1), Q(0)))
                    assert norm_squared(delta) <= (bound/(1-bound))**2
                    checks += 1
    for k in range(1, 7):
        b = Q(2**k)
        for sx in (-1, 1):
            for st in (-1, 1):
                assert paired((sx*a, st*b), a, b) == (0, 0)
                checks += 1
        for t in range(-3, 4):
            for w in ((Q(t), Q(0)), (Q(0), Q(t))):
                value = paired(w, a, b)
                assert value[1] == 0 and value[0] > 0
                checks += 1
    for k in range(1, 10):
        for shift, expected in ((Q(-1, 2), k-1), (Q(0), k), (Q(1, 2), k)):
            height = 2**k + shift
            count = sum(Q(2**n) <= height for n in range(1, 12))
            assert count == expected
            checks += 1
    print(f"complex-factor finite checks: PASS ({checks} exact cases)")


if __name__ == "__main__":
    main()
