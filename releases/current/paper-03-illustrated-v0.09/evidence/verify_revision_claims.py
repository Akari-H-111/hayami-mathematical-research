"""Exact regression checks for the v0.02 proof corrections (not a full proof audit)."""
from itertools import product
from pathlib import Path
import contextlib
import io
import runpy
import sympy as sp

S = sp.symbols("S")


def minimal_polynomial(matrix):
    """Find the first exact linear dependence of I,A,...,A^n."""
    n = matrix.rows
    if n == 0:
        return sp.Poly(1, S)
    columns = []
    for j in range(n + 1):
        columns.append((matrix ** j).reshape(n * n, 1))
        null = sp.Matrix.hstack(*columns).nullspace()
        if null:
            coeff = null[0] / null[0][-1]
            return sp.Poly(sum(coeff[i] * S ** i for i in range(j + 1)), S)
    raise AssertionError("Cayley-Hamilton bound failed")


# Two distinct complementary scalars, including eigenvalue collisions.
J = sp.Matrix([[-2, 1], [0, -2]])
for AK in [sp.zeros(0), sp.Matrix([[-2]]), sp.diag(J, -2, 3), sp.eye(3)]:
    chi = AK.charpoly(S).as_poly()
    mu = minimal_polynomial(AK)
    for c, d, r in [(-2, 3, 1), (0, 1, 2), (2, 5, 0)]:
        Bc, Bd = sp.diag(AK, c * sp.eye(r)), sp.diag(AK, d * sp.eye(r))
        assert sp.gcd(Bc.charpoly(S).as_poly(), Bd.charpoly(S).as_poly()) == chi
        assert sp.gcd(minimal_polynomial(Bc), minimal_polynomial(Bd)) == mu
# A deliberately noncyclic forced sector separates characteristic and minimal floors.
assert sp.degree(sp.diag(J, -2, 3).charpoly(S).as_expr(), S) == 4
assert minimal_polynomial(sp.diag(J, -2, 3)).degree() == 3
print("PASS: two-representative floors, empty/full sectors, noncyclic Jordan example")

# Correctly typed naturality formula on different primitive and boundary bases.
dbar = sp.Matrix([[2, 1], [0, 3]])
Dbar = sp.Matrix([[1, 4], [2, 0]])
PhiP = sp.Matrix([[1, 1], [0, 1]])
PhiL = sp.Matrix([[2, 0], [1, 1]])
dprime = PhiL * dbar * PhiP.inv()
Dprime = PhiL * Dbar * PhiP.inv()
assert Dprime * dprime.inv() == PhiL * Dbar * dbar.inv() * PhiL.inv()
print("PASS: naturality with the primitive differential inverse")

# DGLA on alpha,xi,E in degree 1 and beta in degree 2.
basis = [sp.eye(4)[:, i] for i in range(4)]
degrees = [1, 1, 1, 2]
dmat = sp.zeros(4)
dmat[3, 2] = 1


def bracket(x, y):
    return (2 * x[1] * y[1] + 2 * x[0] * y[2] + 2 * x[2] * y[0]) * basis[3]


for i, j in product(range(4), repeat=2):
    x, y = basis[i], basis[j]
    assert bracket(x, y) == -(-1) ** (degrees[i] * degrees[j]) * bracket(y, x)
    assert dmat * bracket(x, y) == bracket(dmat * x, y) + (-1) ** degrees[i] * bracket(x, dmat * y)
for i, j, k in product(range(4), repeat=3):
    # All nested brackets vanish because beta is central.
    assert bracket(basis[i], bracket(basis[j], basis[k])) == sp.zeros(4, 1)
assert dmat ** 2 == sp.zeros(4)
assert 3 - dmat[:, :3].rank() == 2
assert 1 - dmat.rank() == 0
a, b = sp.symbols("a b")
response_direction = a * basis[0] + b * basis[1]
assert bracket(response_direction, basis[1]) == 2 * b * basis[3]
assert bracket(basis[0], basis[2]) == 2 * dmat * basis[2]
u, v, w = sp.symbols("u v w")
gamma = u * basis[0] + v * basis[1] + w * basis[2]
mc = dmat * gamma + bracket(gamma, gamma) / 2
assert mc[3] == w + v ** 2 + 2 * u * w
assert sp.cancel(mc[3].subs(w, -v ** 2 / (1 + 2 * u))) == 0
print("PASS: DGLA identities, response domain C*alpha, Artin MC cancellation")

# Landing descent is indispensable for the shorter stable-core quotient formula.
Lambda = sp.Matrix([[1, 0]])
T = sp.Matrix([[0, 1], [0, 0]])
Gamma = Lambda
O = sp.Matrix.vstack(Gamma, Gamma * T)
assert O.rank() == 2
assert sp.Matrix.vstack(Lambda, Lambda * T).rank() > Lambda.rank()
assert not O.nullspace()
assert Lambda.rank() - O.rank() == -1  # Invalid formula if descent is omitted.
# With descent, the unstable normalization has a legitimate maximal invariant core.
T = sp.Matrix([[0, 0, 0], [0, 2, 0], [1, 0, 3]])
Lambda = sp.eye(3)
Gamma = sp.Matrix([[0, 0, 1]])
O = sp.Matrix.vstack(*(Gamma * T ** j for j in range(3)))
Mcore = sp.Matrix.hstack(*O.nullspace())
assert Mcore == sp.Matrix([0, 1, 0])
assert T * Mcore == 2 * Mcore
assert (Lambda * Mcore).rank() == Lambda.rank() - O.rank() == 1
print("PASS: stable-core formula and missing-descent counterexample")

# An invertible ambient map alone need not preserve the generated seed module onto.
PhiF = sp.eye(2)
R0 = sp.Matrix([[1], [0]])
R0prime = sp.eye(2)
PhiW = sp.Matrix([[1], [0]])
assert PhiF * R0 == R0prime * PhiW
assert R0.rank() == 1 and R0prime.rank() == 2
print("PASS: ambient isomorphism alone does not ensure generated-source equality")

# The actual cubic cochains, using the bundled exact v0.47 certificate reader.
with contextlib.redirect_stdout(io.StringIO()):
    cubic = runpy.run_path(str(Path(__file__).parent / "verification/part_II/verify_cubic_support_multigrading_v0_47.py"))
alpha = cubic["alpha"]
xi = cubic["dec_c1"](cubic["DATA"]["xi"])
E = cubic["U16"][0]
br = cubic["bracket"]
assert not br(alpha, alpha) and not br(alpha, xi)
assert br(xi, xi)


def dense(m):
    out = sp.zeros(3)
    for (i, j), value in m.items():
        out[i, j] = sp.Rational(value.numerator, value.denominator)
    return out


dE = {}
for s, t in product(cubic["SBAR"], repeat=2):
    st = (s[0] + t[0], s[1] + t[1])
    mus = cubic["L"][s[0]] * cubic["R"][s[1]]
    mut = cubic["L"][t[0]] * cubic["R"][t[1]]
    value = mus * dense(E.get(t, {})) - dense(E.get(st, {})) + dense(E.get(s, {})) * mut
    for i, j in product(range(3), repeat=2):
        if value[i, j]:
            dE[cubic["idx2"](s, t, (i, j))] = value[i, j]
assert br(alpha, E) == {k: 2 * v for k, v in dE.items()}
assert br(xi, xi) == {k: -2 * v for k, v in dE.items()}
print("PASS: actual cubic response direction, D_alpha E=2dE, [xi,xi]=-2dE")
