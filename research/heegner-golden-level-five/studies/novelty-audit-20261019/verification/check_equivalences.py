"""Exact prior-art equivalence checks; does not run or rewrite older packets."""
import json
from sympy import Matrix, simplify, sqrt

s = sqrt(5)
phi = (1 + s) / 2
c0 = (3 - s) / 2
delta2 = 163 * (1 + c0)
assert simplify(phi**-2 - c0) == 0
assert simplify(phi**4 * delta2 - 163 * (5 + 2*s)) == 0
assert simplify(5 - 2*delta2/163 - s) == 0
assert simplify(phi**2 * ((1-s)/2)**2 - 1) == 0
# sigma(phi)=(1-s)/2 and sigma(delta)=phi*delta.
beta_ratio = simplify(phi**2 / (((1-s)/2)**2 * phi))
assert simplify(beta_ratio - phi**3) == 0
assert (163 + 2) % 4 == 1
conductor = 163 * 5  # Spearman-Williams case 3(b): ell=0.
assert conductor == 815
assert 5 * conductor**2 == 3321125
gamma = 1 / phi
matrix = Matrix([[-1, gamma], [gamma, 1]])
assert (matrix**2 - (1+c0)*Matrix.eye(2)).applyfunc(simplify).is_zero_matrix
print(json.dumps({
    "status": "PASS",
    "standard_parameters": {"A": 163, "D": 5, "B": 2, "C": 1},
    "standard_generator_squared": "163*(5+2*sqrt(5))",
    "alternate_positive_conjugate_ratio": "phi^3",
    "conductor_from_external_theorem": conductor,
    "discriminant_from_external_theorem": 5 * conductor**2,
    "scope": "exact algebra checks; external theorems are not proved here"
}, indent=2))
