"""Exact finite certificates for the restricted odd-quotient research section.

The infinite-dimensional obstruction is a written proof. This script checks
its polynomial identities and a finite independent set, not a versal theorem.
"""
import platform
import sympy as sp

if not __debug__:
    raise SystemExit("FAIL assertions must be enabled; run without -O")


def main():
    print("Python", platform.python_version(), "SymPy", sp.__version__)
    x, y, v, s = sp.symbols("x y v s", real=True)
    h00, h10, h01, h20, h11, h02 = sp.symbols("h00 h10 h01 h20 h11 h02")
    H = h00+h10*x+h01*v+h20*x**2+h11*x*v+h02*v**2
    second = sp.Poly(x*y**2+y**4+y**5*H.subs(v, y**2), x, y)
    assert second.coeff_monomial(y**5) == h00
    assert second.coeff_monomial(y**7) == h01
    assert second.coeff_monomial(x*y**5) == h10
    assert second.coeff_monomial(x**2*y**3) == 0
    invariant = (second.coeff_monomial(y**7)-2*second.coeff_monomial(x*y**5)
                 +4*second.coeff_monomial(x**2*y**3))
    assert invariant == h01-2*h10
    assert sp.diff(H.subs({x: -2*s, v: s}), s).subs(s, 0) == invariant
    assert invariant.subs({h01: 1, h10: 0}) == 1
    assert invariant.subs({h01: 0, h10: 1}) == -2
    print("PASS restricted recognition coefficients: H(0,0), H_v(0,0)-2 H_x(0,0)")

    h = x*y**2+y**4
    xi, zeta, target_a, target_b = sp.symbols("xi zeta target_a target_b")
    source_normal = sp.diff(h, x)*xi+sp.diff(h, y)*zeta-y**2*xi
    assert sp.expand(source_normal.subs(x, -2*y**2)) == 0
    assert sp.expand(h.subs(x, -2*y**2)) == -y**4
    target_normal = target_b-y**2*target_a
    assert sp.expand(target_normal-target_normal.subs(y, -y)) == 0
    print("PASS odd-trace obstruction: source and common-target tangent terms vanish")

    witnesses = [y**5*(v**j).subs(v, y**2) for j in range(12)]
    matrix = sp.Matrix([[sp.Poly(p, y).coeff_monomial(y**(5+2*i))
                         for p in witnesses] for i in range(12)])
    assert matrix == sp.eye(12)
    print("PASS finite tangent witness matrix: rank 12; all-orders independence is written")

    amplitude = sp.symbols("amplitude", nonzero=True)
    scaled = ((x*y**2+y**4+amplitude*y**5)
              .subs({x: x/amplitude**2, y: y/amplitude}, simultaneous=True)*amplitude**4)
    assert sp.expand(scaled-(x*y**2+y**4+y**5)) == 0
    print("PASS nonzero constant odd amplitude: exact weighted rescaling to the y^5 representative")
    print("PASS restricted symmetry breaking: exact certificates; no versality assertion")


if __name__ == "__main__":
    main()
