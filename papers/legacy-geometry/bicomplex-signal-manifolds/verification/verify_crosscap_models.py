#!/usr/bin/env python3
"""Exact checks for the finite local formulas used in v12 Sections 5 and 8."""

from __future__ import annotations

import sympy as sp


def assert_zero(expression: sp.Expr, label: str) -> None:
    if sp.simplify(expression) != 0:
        raise AssertionError(f"{label}: {sp.factor(expression)}")


def main() -> None:
    x, y, xi, z = sp.symbols("x y xi z", real=True)

    # Standard cross-cap f=(x,xy,y^2), its induced metric, and squared radius.
    metric = sp.Matrix([[1 + y**2, x * y], [x * y, x**2 + 4 * y**2]])
    determinant = sp.factor(metric.det())
    expected_determinant = x**2 + 4 * y**2 + 4 * y**4
    assert_zero(determinant - expected_determinant, "cross-cap metric determinant")
    rho2 = x**2 * (1 + y**2) + y**4

    # Formula (7): work with d(log rho)=d(rho2)/2rho2 to avoid branch choices.
    dlog = sp.Matrix([sp.diff(rho2, x), sp.diff(rho2, y)]) / (2 * rho2)
    grad_rho_sq = sp.simplify(rho2 * (dlog.T * metric.inv() * dlog)[0])
    expected_defect = x**2 * y**4 / (expected_determinant * rho2)
    assert_zero(1 - grad_rho_sq - expected_defect, "radial gradient defect")
    print("PASS v12 Proposition 8.12: metric determinant and radial defect (7)")

    # Seam chart x=xi, y=xi*z. The sign of x does not affect these identities.
    jacobian = sp.Matrix([[1, 0], [z, xi]])
    seam_metric = sp.simplify(jacobian.T * metric.subs({x: xi, y: xi * z}) * jacobian)
    w2 = 1 + 4 * z**2 + 4 * xi**2 * z**4
    assert_zero(seam_metric.det() - xi**4 * w2, "seam metric determinant")

    # A=sqrt(det g) g^{-1}; the square root cancels in the Schur complement test.
    inv = sp.simplify(seam_metric.inv())
    schur_without_density = sp.simplify(inv[1, 1] - inv[0, 1] ** 2 / inv[0, 0])
    expected_without_density = 1 / (xi**4 * (1 + 4 * z**2))
    assert_zero(schur_without_density - expected_without_density, "seam inverse Schur complement")
    print("PASS v12 Proposition 8.12: seam determinant and Schur complement (6)")

    # The fold sublevel constant follows from one beta-function substitution.
    t = sp.symbols("t", positive=True)
    beta_integral = 4 * sp.integrate(sp.sqrt(1 - t**4), (t, 0, 1))
    assert_zero(beta_integral - sp.beta(sp.Rational(1, 4), sp.Rational(3, 2)), "fold beta constant")
    print("PASS v12 Theorem 5.3: epsilon^(3/4) scaling constant")

    # A3 Milnor number and topological bookkeeping: mu=(2-1)(4-1)=3,
    # two ends, and mu=2g+r-1 imply genus one and b1=3.
    mu = (2 - 1) * (4 - 1)
    ends = sp.gcd(2, 4)
    genus = sp.Rational(mu - ends + 1, 2)
    if (mu, ends, genus, 2 * genus + ends - 1) != (3, 2, 1, 3):
        raise AssertionError("A3 Milnor-fiber bookkeeping failed")
    eigenvalues = [sp.simplify(sp.exp(2 * sp.pi * sp.I * (sp.Rational(1, 2) + sp.Rational(k, 4)))) for k in (1, 2, 3)]
    if set(eigenvalues) != {-sp.I, sp.Integer(1), sp.I}:
        raise AssertionError(f"unexpected A3 monodromy spectrum: {eigenvalues}")
    print("PASS v12 Theorems 5.6--5.7: mu=3, genus=1, two ends, spectrum {-i,1,i}")

    # The actual kernel direction calculation quoted in (43).
    c0 = (3 - sp.sqrt(5)) / 2
    s2 = 1 - c0**2
    q2 = c0 * (2 - c0)
    modulus2 = s2 * (1 - 2 * c0) ** 2 + s2 * (15 * c0 - 4) ** 2 / (4 * q2 * (1 - c0) ** 2)
    assert_zero(modulus2 - (sp.Rational(655, 4) - 72 * sp.sqrt(5)), "kernel observation norm")
    print("PASS v12 Theorem 8.22: exact kernel observation norm (43)")

    # The source power coordinates use disjoint canonical pairs and Poisson commute.
    q1, p1, q2s, p2 = sp.symbols("q1 p1 q2 p2", real=True)
    power1 = (q1**2 + p1**2) / 2
    power2 = (q2s**2 + p2**2) / 2
    bracket = sum(
        sp.diff(power1, q) * sp.diff(power2, p) - sp.diff(power1, p) * sp.diff(power2, q)
        for q, p in ((q1, p1), (q2s, p2))
    )
    assert_zero(bracket, "power-coordinate Poisson bracket")
    print("PASS v12 Proposition 9.3: {X,Y}=0")

    # Anti-periodic circle eigenvalues n+1/2 pair exactly with -(n+1/2).
    n = sp.symbols("n", integer=True, nonnegative=True)
    assert_zero((n + sp.Rational(1, 2)) + (-n - 1 + sp.Rational(1, 2)), "eta spectral pairing")
    print("PASS v12 Proposition 9.5: anti-periodic eta-spectrum pairing")


if __name__ == "__main__":
    main()
