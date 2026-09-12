# Inverse Leibniz Problem — Three-Level Extension Stratification (v0.40)

## 1. The three invariants

For the fixed cubic \(x_5\) extension, write

\[
R=\mathbb C[S],
\qquad
E=S+2,
\]

\[
m_A=Eq,
\qquad
p_4=E^3q,
\qquad
p_5=E^4q^2,
\]

where

\[
q(S)=S^5-4S^4+12S^3-32S^2+80S-192.
\]

The admissible data module is

\[
\mathscr D_5\simeq R/(p_4).
\]

Every datum has a unique canonical polynomial representative

\[
\boxed{
r_d(S)=d_0+d_1S+\cdots+d_7S^7
}
\]

of degree \(<8\).

Define

\[
\boxed{
g_H(d)=\gcd(m_A,r_d),
}
\]

\[
\boxed{
g_F(d)=\gcd(p_4,r_d),
}
\]

and the new higher-contact invariant

\[
\boxed{
g_X(d)=\gcd(p_5,r_d).
}
\]

The corresponding surviving polynomials are

\[
\boxed{
\mu_H=\frac{m_A}{g_H},
\qquad
\mu_F=\frac{p_4}{g_F},
\qquad
\mu_X^{\mathrm{can}}=\frac{p_5}{g_X}.
}
\]

Here \(\mu_X^{\mathrm{can}}\) is the exact annihilator of the **canonical degree-\(<8\) lift** of \(d\) in \(R/(p_5)\).

It should not be confused with an arbitrary noncanonical lift of the same class modulo \(p_4\).

---

# 2. Three-Level Truncation Theorem

Since

\[
m_A\mid p_4\mid p_5,
\]

for every datum,

\[
\boxed{
g_H\mid g_F\mid g_X.
}
\]

More precisely,

\[
\boxed{
g_H=\gcd(m_A,g_X),
}
\]

and

\[
\boxed{
g_F=\gcd(p_4,g_X).
}
\]

### Proof

For monic divisors \(a\mid b\),

\[
\gcd(a,r)=\gcd(a,\gcd(b,r)).
\]

Apply this first to

\[
m_A\mid p_5
\]

and then to

\[
p_4\mid p_5.
\]

Therefore the finest invariant is \(g_X\).

The first two layers are deterministic truncations of the third.

Thus the three-level stratification is **not** a product of three independent gcd axes.

---

# 3. Splitting-field contact coordinates

Over a splitting field,

\[
q(S)=\prod_{i=1}^5Q_i(S),
\qquad
Q_i(S)=S-\beta_i,
\]

where the \(\beta_i\) are distinct and none equals \(-2\).

For a nonzero canonical representative define

\[
\boxed{
a(d)
=
\min\{4,\operatorname{ord}_{E}r_d\}
\in\{0,1,2,3,4\},
}
\]

and

\[
\boxed{
b_i(d)
=
\min\{2,\operatorname{ord}_{Q_i}r_d\}
\in\{0,1,2\}.
}
\]

Then

\[
\boxed{
g_X
=
E^a\prod_{i=1}^5Q_i^{b_i}.
}
\]

The two lower gcds are obtained by truncating exponents:

\[
\boxed{
g_F
=
E^{\min(3,a)}
\prod_{i=1}^5Q_i^{\min(1,b_i)},
}
\]

\[
\boxed{
g_H
=
E^{\min(1,a)}
\prod_{i=1}^5Q_i^{\min(1,b_i)}.
}
\]

Thus the complete three-level information is:

- \(g_H\) sees only whether each spectral mode is present or absent;
- \(g_F\) refines the resonant \(E\)-mode to depth \(3\), but still sees each \(q\)-root only to first order;
- \(g_X\) refines resonance to depth \(4\) and each \(q\)-root to second order.

---

# 4. Fine contact strata

For

\[
a\in\{0,1,2,3,4\},
\qquad
\mathbf b=(b_1,\ldots,b_5)\in\{0,1,2\}^5,
\]

set the contact weight

\[
\boxed{
w(a,\mathbf b)
=
a+\sum_{i=1}^5b_i.
}
\]

Define

\[
\boxed{
\mathscr T_{a,\mathbf b}
=
\left\{
d\neq0:
a(d)=a,\quad b_i(d)=b_i
\right\}.
}
\]

A nonzero degree-\(<8\) polynomial can realize this exact contact pattern iff

\[
\boxed{
w(a,\mathbf b)\le7.
}
\]

### Necessity

If \(g_X\mid r_d\), then

\[
\deg r_d\ge
\deg g_X
=
w(a,\mathbf b).
\]

Since

\[
\deg r_d\le7,
\]

one must have \(w\le7\).

### Sufficiency

If \(w\le7\), choose

\[
r_d=
E^a\prod_iQ_i^{b_i}.
\]

Its degree is \(w\le7\), and it has exactly the required truncated contact orders.

Thus every such label is nonempty.

---

# 5. Dimension

The contact condition

\[
E^a\prod_iQ_i^{b_i}\mid r_d
\]

imposes

\[
w(a,\mathbf b)
\]

independent linear Hermite conditions on the eight coefficients of \(r_d\).

Therefore

\[
\boxed{
\dim\mathscr T_{a,\mathbf b}
=
8-w(a,\mathbf b).
}
\]

Equivalently,

\[
\boxed{
\operatorname{codim}\mathscr T_{a,\mathbf b}
=
w(a,\mathbf b).
}
\]

This follows from Hermite interpolation at the six distinct spectral points.

---

# 6. The zero datum

The unique zero datum satisfies

\[
r_d=0.
\]

Hence

\[
\boxed{
g_H=m_A,\qquad
g_F=p_4,\qquad
g_X=p_5.
}
\]

Its three surviving polynomials are all trivial:

\[
\boxed{
\mu_H=\mu_F=\mu_X^{\mathrm{can}}=1.
}
\]

The formal maximal contact tuple

\[
a=4,\qquad b_1=\cdots=b_5=2
\]

has total contact weight \(14\).

No nonzero degree-\(<8\) polynomial can realize it.

It is realized only by the zero datum.

---

# 7. Number of strata

The formal contact generating function is

\[
\boxed{
(1+t+t^2+t^3+t^4)(1+t+t^2)^5.
}
\]

Its coefficients are

\[
1,6,21,51,96,146,186,201,186,146,96,51,21,6,1.
\]

Only contact weights \(0,\ldots,7\) occur for nonzero canonical data.

Hence the number of nonzero fine strata is

\[
\boxed{
1+6+21+51+96+146+186+201
=
708.
}
\]

Adding the unique zero stratum gives

\[
\boxed{
709
}
\]

actual three-level strata.

The actual counts by ambient codimension are

\[
\boxed{
1,6,21,51,96,146,186,201,1
}
\]

for codimensions \(0,\ldots,8\), where the final \(1\) is the zero datum.

---

# 8. Closure order

For two feasible nonzero contact labels,

\[
(a,\mathbf b)
\preceq
(a',\mathbf b')
\]

iff

\[
a\le a',
\qquad
b_i\le b_i'
\quad\text{for every }i.
\]

Thus

\[
\boxed{
\overline{\mathscr T_{a,\mathbf b}}
=
\bigsqcup_{\substack{
a'\ge a,\ b_i'\ge b_i\\
w(a',\mathbf b')\le7
}}
\mathscr T_{a',\mathbf b'}
\;\sqcup\;
\{0\}.
}
\]

The closure geometry is therefore the low-degree truncation of

\[
C_5\times C_3^5
\]

with all inaccessible high-contact directions collapsing at the zero datum.

This is the correct replacement for the simpler \(C_4\times B_5\) poset of v0.39.

---

# 9. Exact three multipliers on every fine stratum

Let

\[
Q_{\bar Z}^{(1)}
=
\prod_{i:b_i=0}Q_i,
\]

and retain the individual multiplicities \(b_i\).

On \(\mathscr T_{a,\mathbf b}\),

\[
\boxed{
\mu_X^{\mathrm{can}}
=
E^{4-a}
\prod_{i=1}^5Q_i^{2-b_i}.
}
\]

The forcing-memory polynomial is

\[
\boxed{
\mu_F
=
E^{3-\min(3,a)}
\prod_{i=1}^5Q_i^{1-\min(1,b_i)}.
}
\]

The homogeneous landing multiplier is

\[
\boxed{
\mu_H
=
E^{1-\min(1,a)}
\prod_{i=1}^5Q_i^{1-\min(1,b_i)}.
}
\]

Thus \(g_X\) simultaneously records:

1. the fourth resonant \(E\)-contact invisible to \(g_F\);
2. second-order contact at each quintic eigenmode, invisible to both \(g_F\) and \(g_H\).

---

# 10. Forgetful maps between the three stratifications

The fine three-level label

\[
(a,b_1,\ldots,b_5)
\]

maps to the v0.39 forcing/spectral label by

\[
\boxed{
a\mapsto\min(3,a),
\qquad
b_i\mapsto\min(1,b_i).
}
\]

It maps to the v0.38 homogeneous spectral label by

\[
\boxed{
a\mapsto\min(1,a),
\qquad
b_i\mapsto\min(1,b_i).
}
\]

Therefore the successive stratifications are literally quotient maps obtained by forgetting higher contact multiplicity.

The hierarchy is

\[
\boxed{
\text{three-level multijet strata}
\longrightarrow
\text{two-axis forcing/spectral strata}
\longrightarrow
\text{reduced spectral strata}.
}
\]

---

# 11. Scheme-theoretic multiplicity ladder

The three exceptional resultants have the formal factorizations

\[
\boxed{
\operatorname{Res}(m_A,r_d)
=
r_d(-2)\operatorname{Res}(q,r_d),
}
\]

\[
\boxed{
\operatorname{Res}(p_4,r_d)
=
r_d(-2)^3\operatorname{Res}(q,r_d),
}
\]

and

\[
\boxed{
\operatorname{Res}(p_5,r_d)
=
r_d(-2)^4\operatorname{Res}(q,r_d)^2.
}
\]

Over a splitting field:

\[
\boxed{
\mathscr E_H^{\mathrm{scheme}}
=
H_E+\sum_iH_{\beta_i},
}
\]

\[
\boxed{
\mathscr E_F^{\mathrm{scheme}}
=
3H_E+\sum_iH_{\beta_i},
}
\]

\[
\boxed{
\mathscr E_X^{\mathrm{scheme}}
=
4H_E+2\sum_iH_{\beta_i}.
}
\]

Thus the three levels encode the multiplicity ladder

\[
\boxed{
E:\ 1\to3\to4,
}
\]

\[
\boxed{
Q_i:\ 1\to1\to2.
}
\]

This gives a scheme-theoretic interpretation of the three extension levels.

---

# 12. Finite jet test for \(E\)-contact

For

\[
r_d(S)=\sum_{j=0}^7d_jS^j,
\]

define

\[
J_k=r_d^{(k)}(-2),
\qquad
k=0,1,2,3.
\]

Then:

\[
a=0
\iff
J_0\neq0,
\]

\[
a=1
\iff
J_0=0,\quad J_1\neq0,
\]

\[
a=2
\iff
J_0=J_1=0,\quad J_2\neq0,
\]

\[
a=3
\iff
J_0=J_1=J_2=0,\quad J_3\neq0,
\]

\[
a=4
\iff
J_0=J_1=J_2=J_3=0.
\]

The new fourth jet is

\[
\boxed{
J_3
=
6d_3-48d_4+240d_5-960d_6+3360d_7.
}
\]

The four jet functionals have exact rank \(4\).

Thus the third extension level adds precisely one new resonant jet beyond v0.39.

---

# 13. Quintic second-contact test

For each root \(\beta_i\), set

\[
L_i(d)=r_d(\beta_i),
\]

\[
M_i(d)=r_d'(\beta_i).
\]

Then

\[
b_i=0
\iff
L_i\neq0,
\]

\[
b_i=1
\iff
L_i=0,\quad M_i\neq0,
\]

\[
b_i=2
\iff
L_i=M_i=0.
\]

Thus \(g_X\) adds derivative information at each spectral hyperplane.

The independence of all feasible collections of these jet conditions follows from confluent Vandermonde / Hermite interpolation.

---

# 14. Rational three-level stratification

Over \(\mathbb Q\), \(q\) is irreducible.

A nonzero rational polynomial of degree \(<8\) cannot be divisible by \(q^2\), because

\[
\deg q^2=10.
\]

Therefore the nonzero rational canonical \(g_X\)-divisors are exactly

\[
\boxed{
1,\ E,\ E^2,\ E^3,\ E^4,\ q,\ Eq,\ E^2q.
}
\]

This gives \(8\) nonzero rational strata.

Adding the zero datum gives

\[
\boxed{
9
}
\]

rational three-level strata.

They are:

| \(g_X\) | \(g_F\) | \(g_H\) | \(\mu_X^{\rm can}\) | dim |
|---|---|---|---|---:|
| \(1\) | \(1\) | \(1\) | \(E^4q^2\) | 8 |
| \(E\) | \(E\) | \(E\) | \(E^3q^2\) | 7 |
| \(E^2\) | \(E^2\) | \(E\) | \(E^2q^2\) | 6 |
| \(E^3\) | \(E^3\) | \(E\) | \(Eq^2\) | 5 |
| \(E^4\) | \(E^3\) | \(E\) | \(q^2\) | 4 |
| \(q\) | \(q\) | \(q\) | \(E^4q\) | 3 |
| \(Eq\) | \(Eq\) | \(Eq\) | \(E^3q\) | 2 |
| \(E^2q\) | \(E^2q\) | \(Eq\) | \(E^2q\) | 1 |
| zero | \(p_4\) | \(m_A\) | \(1\) | 0 |

This is the complete rational canonical-lift classification.

---

# 15. Resolution of the v0.39 counterexample

v0.39 observed

\[
r_1=E^3,
\qquad
r_2=E^4
\]

with identical lower invariants:

\[
g_F(r_1)=g_F(r_2)=E^3,
\]

\[
g_H(r_1)=g_H(r_2)=E.
\]

The third invariant separates them immediately:

\[
\boxed{
g_X(r_1)=E^3,
}
\]

\[
\boxed{
g_X(r_2)=E^4.
}
\]

Hence

\[
\mu_X^{\mathrm{can}}(r_1)
=
Eq^2,
\]

while

\[
\mu_X^{\mathrm{can}}(r_2)
=
q^2.
\]

Thus the three-level refinement resolves exactly the information loss identified in v0.39.

---

# 16. Three-Level Extension Stratification Theorem

For the canonical degree-\(<8\) representative of every admissible \(x_5\) datum:

\[
\boxed{
g_H\mid g_F\mid g_X,
}
\]

with

\[
\boxed{
g_H=\gcd(m_A,g_X),
\qquad
g_F=\gcd(p_4,g_X).
}
\]

Over a splitting field, every nonzero stratum is uniquely indexed by

\[
\boxed{
(a,b_1,\ldots,b_5)
\in
\{0,\ldots,4\}\times\{0,1,2\}^5
}
\]

subject to

\[
\boxed{
a+\sum_i b_i\le7.
}
\]

On this stratum,

\[
\boxed{
g_X
=
E^a\prod_iQ_i^{b_i},
}
\]

and the lower gcds are obtained by exponent truncation.

There are

\[
\boxed{
708
}
\]

nonzero fine strata and one zero stratum, for a total of

\[
\boxed{
709.
}
\]

The canonical full lift annihilator is exactly

\[
\boxed{
\mu_X^{\mathrm{can}}
=
\frac{p_5}{g_X}.
}
\]

Thus the three-level hierarchy completely classifies the canonical higher lift contact.

---

# 17. What has now become complete

The theorem chain now separates three geometrically different layers:

\[
\boxed{
\text{homogeneous spectral support}
}
\]

measured by \(g_H\),

\[
\boxed{
\text{forcing quotient memory}
}
\]

measured by \(g_F\),

and

\[
\boxed{
\text{canonical higher lift contact}
}
\]

measured by \(g_X\).

Each is obtained from the next by truncating spectral multiplicities.

This is the complete extension stratification attached to the fixed cubic \(x_5\) module and the canonical polynomial lift.

---

# 18. Next research direction

At this point the extension/landing branch is mathematically closed enough to be written as a coherent paper section.

The next useful step is **not** to introduce a fourth gcd.

Instead, consolidate v0.34--v0.40 into a formal theorem package:

1. Residual Module Theorem;
2. Triangular Spectral Extension Lemma;
3. Residual Landing Selection Theorem;
4. Complete Landing Operator Theorem;
5. Spectral Landing Stratification;
6. Two-Axis Stratification;
7. Three-Level Extension Stratification.

Then update the current TeX/PDF manuscript so that the low-rail story appears as one theorem chain rather than seven research checkpoints.

After consolidation, a separate research direction would be to ask which parts of this package survive for a general triangular contraction with

\[
p_j=\prod_\lambda (S-\lambda)^{e_{j,\lambda}}.
\]
