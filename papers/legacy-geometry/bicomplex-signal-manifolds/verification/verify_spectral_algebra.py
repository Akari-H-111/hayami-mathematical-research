#!/usr/bin/env python3
"""Small symbolic checks for the self-contained v12 Section 7 algebra."""

from __future__ import annotations

import sympy as sp


def main() -> None:
    x = sp.symbols("x", positive=True)
    sigma, omega = sp.symbols("sigma omega", real=True)
    f = x ** (-(sigma + sp.I * omega))
    t_f = -sp.I * (x * sp.diff(f, x) + sigma * f)
    if sp.simplify(t_f + omega * f) != 0:
        raise AssertionError("formal Mellin eigenfunction identity failed")
    print("PASS v12 Corollary 7.3 formal eigenvalue identity")

    n, m, horizon = sp.symbols("n m horizon", positive=True)
    frequency = sp.log(n / m)
    gram = (sp.exp(-sp.I * horizon * frequency) - 1) / (-sp.I * horizon * frequency)
    time = sp.symbols("time", real=True)
    antiderivative = sp.exp(-sp.I * time * frequency) / (-sp.I * frequency)
    if sp.simplify(sp.diff(antiderivative, time) - sp.exp(-sp.I * time * frequency)) != 0:
        raise AssertionError("finite-time Gram antiderivative failed")
    endpoint_difference = sp.simplify((antiderivative.subs(time, horizon) - antiderivative.subs(time, 0)) / horizon)
    if sp.simplify(gram - endpoint_difference) != 0:
        raise AssertionError("finite-time Gram entry identity failed")
    print("PASS v12 Theorem 7.4 finite-time Gram entry identity")


if __name__ == "__main__":
    main()
