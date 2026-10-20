#!/usr/bin/env python3
"""Exact rational diagnostics for the deck maps and finite reflection quotient.

This is deliberately finite-model evidence, not an assertion about zeta zeros.
Run: python3 -B verification/check_exact.py
"""
from fractions import Fraction

T = Fraction(5, 1)

def c(p):
    x, t = p
    return x, -t

def f(p):
    x, t = p
    return -x, -t

def r(p):
    x, t = p
    return -x, t

def cylinder_deck(p, n):
    x, t = p
    return x, t + n * T

def mobius_deck(p, n):
    x, t = p
    return ((-x) if n % 2 else x), t + n * T

def main():
    if not __debug__:
        raise RuntimeError("Assertions must be enabled")
    points = [(Fraction(x), Fraction(t)) for x in range(-2, 3) for t in range(-2, 3)]
    for p in points:
        assert c(c(p)) == p
        assert f(f(p)) == p
        assert r(r(p)) == p
        assert c(f(p)) == r(p) == f(c(p))
    for p in points:
        for m in range(-4, 5):
            for n in range(-4, 5):
                assert cylinder_deck(cylinder_deck(p, m), n) == cylinder_deck(p, m + n)
                assert mobius_deck(mobius_deck(p, m), n) == mobius_deck(p, m + n)
    # Reflection quotient on the circle: fixed classes are precisely [0], [T/2].
    reps = [Fraction(k, 20) * T for k in range(20)]
    fixed = [u for u in reps if (2 * u) % T == 0]
    assert fixed == [Fraction(0), T / 2]
    print("exact deck/symmetry checks: PASS")

if __name__ == "__main__":
    main()
