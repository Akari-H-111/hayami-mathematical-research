"""Exact finite checks for the supervisor's written polynomial countermodel."""

from fractions import Fraction as Q


def add(z, w):
    return z[0] + w[0], z[1] + w[1]


def mul(z, w):
    return z[0] * w[0] - z[1] * w[1], z[0] * w[1] + z[1] * w[0]


def polynomial(w, a, b):
    left = add(mul(add(w, (-a, 0)), add(w, (-a, 0))), (b * b, 0))
    right = add(mul(add(w, (a, 0)), add(w, (a, 0))), (b * b, 0))
    return mul(left, right)


def main():
    if not __debug__:
        raise RuntimeError("Assertions must be enabled")
    checks = 0
    for a, b in ((Q(1, 4), Q(1)), (Q(1, 3), Q(7, 2))):
        roots = {(sx * a, st * b) for sx in (-1, 1) for st in (-1, 1)}
        assert len(roots) == 4
        assert all(polynomial(w, a, b) == (0, 0) for w in roots)
        checks += 5
        for x in range(-3, 4):
            for t in range(-3, 4):
                w = (Q(x), Q(t))
                w2 = mul(w, w)
                expanded = add(add(mul(w2, w2), mul((2 * (b*b-a*a), 0), w2)),
                               ((a*a+b*b)**2, 0))
                value = polynomial(w, a, b)
                assert value == expanded
                assert value == polynomial((-w[0], -w[1]), a, b)
                assert (value[0], -value[1]) == polynomial((w[0], -w[1]), a, b)
                if x == 0 or t == 0:
                    assert value[1] == 0 and value[0] > 0
                checks += 3 + int(x == 0 or t == 0)
    print(f"PASS: {checks} exact finite polynomial checks; analytic inputs remain external")


if __name__ == "__main__":
    main()
