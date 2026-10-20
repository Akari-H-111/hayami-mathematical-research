"""Exact level-5 orbit, chord-metric, quotient-recovery and multiplier checks."""
import json
from itertools import combinations, product
from pathlib import Path
import sympy as sp

if not __debug__:
    raise RuntimeError("Assertions must remain enabled; do not use Python -O.")

# Same residue model as v0.3: theta^2=theta-1 modulo 5.
def mul(x, y):
    a, b = x
    c, d = y
    return ((a*c-b*d) % 5, (a*d+b*c+b*d) % 5)

def sign(v):
    return min(v, tuple(-x % 5 for x in v))

def line(v):
    a, b = v
    return (1, b*pow(a, -1, 5) % 5) if a else (0, 1)

def act(m, v):
    a, b, c, d = m
    x, y = v
    return ((a*x+b*y) % 5, (c*x+d*y) % 5)

def order(p):
    q, n = tuple(range(len(p))), 0
    while True:
        q = tuple(p[j] for j in q)
        n += 1
        if q == tuple(range(len(p))):
            return n

vertices = sorted({sign(v) for v in product(range(5), repeat=2) if v != (0, 0)})
assert len(vertices) == 12
index = {v:i for i,v in enumerate(vertices)}
sl = [m for m in product(range(5), repeat=4) if (m[0]*m[3]-m[1]*m[2]) % 5 == 1]
perms = {tuple(index[sign(act(m, v))] for v in vertices) for m in sl}
assert len(sl) == 120 and len(perms) == 60
assert sorted({order(p) for p in perms}) == [1, 2, 3, 5]
pairs = set(combinations(range(12), 2))
orbits = []
while pairs:
    i, j = min(pairs)
    orbit = {tuple(sorted((p[i], p[j]))) for p in perms}
    orbits.append(orbit)
    pairs -= orbit
assert sorted(map(len, orbits)) == [6, 30, 30]
anti = next(o for o in orbits if len(o) == 6)
edges, diagonals = sorted((o for o in orbits if len(o) == 30), key=lambda o: sorted(o))
assert {tuple(sorted((i,index[sign(tuple(2*x % 5 for x in v))]))) for i,v in enumerate(vertices)} == anti

def adjacency(orbit):
    return sp.Matrix(12, 12, lambda i,j: int(tuple(sorted((i,j))) in orbit))

A, B, P = map(adjacency, (edges, diagonals, anti))
assert all(sum(A.row(i)) == 5 for i in range(12))
assert sp.trace(A**3) // 6 == 20
s = sp.sqrt(5)
G = sp.eye(12) - P + (A-B)/s
Gc = sp.eye(12) - P - (A-B)/s
assert (G**2-4*G).applyfunc(sp.simplify).is_zero_matrix
assert sp.trace(G) == 12  # Eigenvalues 4 (multiplicity 3), 0 (multiplicity 9).
assert (Gc**2-4*Gc).applyfunc(sp.simplify).is_zero_matrix
phi = (1+s)/2
c0 = (3-s)/2
chord_ratio = sp.simplify((2-2/s)/(2+2/s))
assert sp.simplify(chord_ratio-c0) == 0
# Match the complete Gram matrix to the standard regular icosahedron.
triangle = next(t for t in combinations(range(12),3) if all(tuple(sorted(e)) in edges for e in combinations(t,2)))
standard = [(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
standard += [(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
standard += [(b*phi,0,a) for a,b in product((-1,1),repeat=2)]
H = sp.Matrix(12,12,lambda i,j:sp.simplify(sum(a*b for a,b in zip(standard[i],standard[j]))/(1+phi**2)))
standard_triangle = [standard.index(v) for v in [(0,1,phi),(1,phi,0),(phi,0,1)]]
signatures = {tuple(H[i,j] for j in standard_triangle):i for i in range(12)}
assert len(signatures) == 12
matching = [signatures[tuple(G[i,j] for j in triangle)] for i in range(12)]
assert (G-sp.Matrix(12,12,lambda i,j:H[matching[i],matching[j]])).applyfunc(sp.simplify).is_zero_matrix

# Multiplication by 1+theta: determinant=norm=3; exact CM lift has norm 43.
generator = (1, 4, 1, 2)
p = tuple(index[sign(act(generator,v))] for v in vertices)
assert order(p) == 12
assert {tuple(sorted((p[i],p[j]))) for i,j in edges} == diagonals
assert {tuple(sorted((p[i],p[j]))) for i,j in anti} == anti
assert (sp.Matrix(12,12,lambda i,j:G[p[i],p[j]])-Gc).applyfunc(sp.simplify).is_zero_matrix

states, v = [], (1, 0)
for k in range(12):
    a, b = v
    norm = (a*a+a*b+b*b) % 5
    assert norm == pow(3,k,5)
    states.append({"k":k,"sign_class":sign(v),"line":line(v),"norm":norm,
                   "line_exponent_mod6":k%6,"norm_exponent_mod4":k%4})
    v = mul(v,(1,1))
assert len({r['sign_class'] for r in states}) == 12
assert v == (4,0)
assert len({r['line'] for r in states}) == 6
assert len({r['norm'] for r in states}) == 4
assert all(sum(r['line']==t['line'] for t in states)==2 for r in states)
assert all(sum(r['norm']==t['norm'] for t in states)==3 for r in states)
assert len({(r['line'],r['norm']) for r in states}) == 12
compatible = {(a,b) for a in range(6) for b in range(4) if a%2==b%2}
assert {(r['line_exponent_mod6'],r['norm_exponent_mod4']) for r in states} == compatible

x, q = sp.symbols('x q')
gamma = 1/phi
f = 1/(1+x)
f2 = (1+x)/(2+x)
assert sp.simplify(f.subs(x,gamma)-gamma) == 0
assert sp.simplify(sp.diff(f,x).subs(x,gamma)+c0) == 0
assert sp.simplify(sp.diff(f2,x).subs(x,gamma)-c0**2) == 0
hyperbolic = sp.Matrix([[1,1],[1,2]])
assert hyperbolic.det() == 1 and sp.trace(hyperbolic)**2-4 == 5
assert ((hyperbolic**5+sp.eye(2)) % 5).is_zero_matrix
hyperbolic_perm = tuple(index[sign(act((1,1,1,2),v))] for v in vertices)
assert order(hyperbolic_perm) == 5
assert sum(i==j for i,j in enumerate(hyperbolic_perm)) == 2
# Independent modern j coefficient check; Hermite's scan prints 196880.
E4 = 1+240*q+2160*q**2+6720*q**3
Delta = q-24*q**2+252*q**3-1472*q**4
modern_j = sp.series(E4**3/Delta,q,0,3).removeO().expand()
assert modern_j.coeff(q,0) == 744
assert modern_j.coeff(q,1) == 196884
assert modern_j.coeff(q,2) == 21493760

# Cyclotomic observable from the inherited, branch-selected radical delta.
S, D, Kappa = sp.symbols('S D Kappa')
Phi = (1+S)/2
zeta = (Phi-1+Phi*D*Kappa/163)/2
def reduce_cm(expr):
    expr = sp.rem(sp.expand(expr), Kappa**2+163, Kappa)
    expr = sp.rem(expr, D**2-163*(5-S)/2, D)
    return sp.rem(expr,S**2-5,S).expand()
assert reduce_cm(sum(zeta**k for k in range(5))) == 0
assert reduce_cm(zeta+zeta**4-(Phi-1)) == 0

result = {
    "status":"PASS", "sign_classes":12, "geometric_group_order":60,
    "geometric_element_orders":[1,2,3,5], "pair_orbit_sizes":[6,30,30],
    "icosahedral_gram_rank":3, "gram_eigenvalues":{"4":3,"0":9},
    "squared_short_long_chord_ratio":"phi^-2", "arithmetic_cycle_order":12,
    "arithmetic_action":"exchanges edges and long diagonals; conjugates sqrt(5)",
    "projective_fiber_size":2,"norm_fiber_size":3,"combined_fiber_size":1,
    "compatibility":"k mod 6 and k mod 4 have the same parity",
    "continued_fraction_multiplier":"-phi^-2; square has phi^-4",
    "hyperbolic_reduction_order":5,"hyperbolic_reduction_fixed_vertices":2,
    "modern_j_coefficients":[744,196884,21493760],"states":states,
    "rr_cyclotomic_observable":"zeta5=(phi-1+phi*delta*sqrt(-163)/163)/2",
    "scope":"exact finite model and algebra; no cryptographic security theorem"
}
target = Path(__file__).resolve().parents[1]/'RESULTS.json'
target.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='states'},indent=2))
