#!/usr/bin/env python3
"""Exact finite algebra checks for selected self-contained v12 local claims."""

from __future__ import annotations

import sympy as sp


def main() -> None:
    c, x, y, a, b, z = sp.symbols("c x y a b z", real=True)
    core = c**2 - 3 * c + 1
    c0 = (3 - sp.sqrt(5)) / 2
    if sp.simplify(core.subs(c, c0)) != 0 or sp.simplify(abs(2 * c0 - 3) - sp.sqrt(5)) != 0:
        raise AssertionError("v12 Lemma 5.1 failed")
    print("PASS v12 Lemma 5.1: |P'(c0)|=sqrt(5)")

    # The explicit complex coordinate change X=x sqrt(1+y^2), Y=y
    # gives the A3 normal form algebraically wherever the chosen square root is holomorphic.
    residual = x**2 * (1 + y**2) + y**4
    X = sp.symbols("X")
    if sp.simplify((residual - (X**2 + y**4)).subs(X, x * sp.sqrt(1 + y**2))) != 0:
        raise AssertionError("A3 coordinate identity failed")
    print("PASS v12 Theorem 5.6 algebraic coordinate identity")

    # The phase-orbit action has primitive weights (2,1).
    phase = sp.symbols("phase", real=True)
    lhs = (a * sp.exp(2 * sp.I * phase)) ** 2 + (b * sp.exp(sp.I * phase)) ** 4
    rhs = sp.exp(4 * sp.I * phase) * (a**2 + b**4)
    if sp.simplify(lhs - rhs) != 0:
        raise AssertionError("weighted phase covariance failed")
    print("PASS v12 Theorem 5.9 weighted covariance")

    energy_reduced = 4 + z - 4 * z**2
    if sp.diff(energy_reduced, z).subs(z, sp.Rational(1, 8)) != 0 or sp.diff(energy_reduced, z, 2) >= 0:
        raise AssertionError("v12 Proposition 5.10 concavity check failed")
    print("PASS v12 Proposition 5.10 interior critical point is a strict maximum")


if __name__ == "__main__":
    main()
