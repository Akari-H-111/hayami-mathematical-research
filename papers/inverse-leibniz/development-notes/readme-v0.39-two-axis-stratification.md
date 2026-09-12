# Inverse Leibniz Problem — Two-Axis Memory/Spectral Stratification (v0.39)

## 1. Setup

Let

\[
R=\mathbb C[S],\qquad E=S+2,
\]

\[
q(S)=S^5-4S^4+12S^3-32S^2+80S-192,
\]

and

\[
m_A=Eq,\qquad p_4=E^3q,\qquad p_5=m_Ap_4=E^4q^2.
\]

The admissible forcing-data module is

\[
\mathscr D_5\simeq R/(p_4).
\]

Represent a datum by the unique polynomial of degree \(<8\),

\[
r_d(S)=d_0+d_1S+\cdots+d_7S^7.
\]

Define

\[
\boxed{g_F(d):=\gcd(p_4,r_d)}
\]

and

\[
\boxed{g_H(d):=\gcd(m_A,r_d)}.
\]

Their surviving-memory polynomials are

\[
\boxed{\mu_F(d)=\frac{p_4}{g_F(d)}}
\]

and

\[
\boxed{\mu_H(d)=\frac{m_A}{g_H(d)}}.
\]

Here \(\mu_F\) is the exact annihilator of the cyclic datum in \(R/(p_4)\), while \(\mu_H\) is the exact homogeneous landing multiplier.

## 2. Compatibility theorem

Since \(m_A\mid p_4\),

\[
\boxed{
g_H(d)=\gcd(m_A,g_F(d)).
}
\]

Thus the two axes are not independent.

The homogeneous spectral loss is obtained by truncating the forcing divisor to the factors visible in \(m_A\).

## 3. Splitting-field form

Over a splitting field,

\[
q(S)=\prod_{i=1}^5(S-\beta_i)
\]

with distinct roots \(\beta_i\neq-2\).

Define

\[
\nu(d)=\min\{3,\operatorname{ord}_{S=-2}r_d\}\in\{0,1,2,3\}
\]

and

\[
Z(d)=\{i:r_d(\beta_i)=0\}.
\]

Then

\[
\boxed{
g_F(d)=E^{\nu(d)}
\prod_{i\in Z(d)}(S-\beta_i),
}
\]

whereas

\[
\boxed{
g_H(d)=E^{\min(1,\nu(d))}
\prod_{i\in Z(d)}(S-\beta_i).
}
\]

The quintic spectral losses are identical on both axes.  The only extra forcing-side information is the higher resonant \(E\)-adic depth.

## 4. Common-refinement strata

For

\[
\nu\in\{0,1,2,3\},
\qquad
Z\subseteq\{1,\ldots,5\},
\]

define

\[
\boxed{
\mathscr S_{\nu,Z}
=
\{d:\nu(d)=\nu,\ Z(d)=Z\}.
}
\]

All such strata are nonempty.  Therefore there are

\[
\boxed{4\cdot2^5=128}
\]

strata.

Their dimensions are

\[
\boxed{
\dim\mathscr S_{\nu,Z}=8-\nu-|Z|.
}
\]

The closure relation is

\[
\boxed{
\overline{\mathscr S_{\nu,Z}}
=
\bigsqcup_{\nu'\ge\nu,\ Z'\supseteq Z}
\mathscr S_{\nu',Z'}.
}
\]

Hence the closure poset is

\[
\boxed{C_4\times B_5}.
\]

The codimension generating polynomial is

\[
(1+t+t^2+t^3)(1+t)^5,
\]

giving the counts

\[
\boxed{
1,6,16,26,30,26,16,6,1.
}
\]

## 5. Multipliers on every stratum

Write

\[
q_{\bar Z}
=
\prod_{i\notin Z}(S-\beta_i).
\]

Then on \(\mathscr S_{\nu,Z}\),

\[
\boxed{
\mu_F(\nu,Z)=E^{3-\nu}q_{\bar Z},
}
\]

while

\[
\boxed{
\mu_H(\nu,Z)
=
E^{1-\min(1,\nu)}q_{\bar Z}.
}
\]

Thus:

- \(\nu=0\):
  \[
  \mu_F=E^3q_{\bar Z},\qquad \mu_H=Eq_{\bar Z};
  \]
- \(\nu=1\):
  \[
  \mu_F=E^2q_{\bar Z},\qquad \mu_H=q_{\bar Z};
  \]
- \(\nu=2\):
  \[
  \mu_F=Eq_{\bar Z},\qquad \mu_H=q_{\bar Z};
  \]
- \(\nu=3\):
  \[
  \mu_F=q_{\bar Z},\qquad \mu_H=q_{\bar Z}.
  \]

The two axes coincide only at \(\nu=3\).

## 6. Map to the v0.38 spectral stratification

The homogeneous stratum remembers only

\[
\delta=\min(1,\nu)
\]

and \(Z\).  Hence

\[
\boxed{
(\nu,Z)\longmapsto(\min(1,\nu),Z).
}
\]

The \(32\) homogeneous strata retaining \(E\) have one forcing refinement (\(\nu=0\)).

The \(32\) homogeneous strata losing \(E\) each have three forcing refinements (\(\nu=1,2,3\)).

Therefore

\[
32\cdot1+32\cdot3=128.
\]

## 7. Scheme-theoretic meaning

Resultant multiplicativity gives

\[
\boxed{
\operatorname{Res}(p_4,r_d)
=
r_d(-2)^3\operatorname{Res}(q,r_d),
}
\]

while

\[
\boxed{
\operatorname{Res}(m_A,r_d)
=
r_d(-2)\operatorname{Res}(q,r_d).
}
\]

Thus the reduced exceptional support is the same, but the forcing divisor has multiplicity \(3\) on the resonant hyperplane:

\[
\boxed{
\mathscr E_F^{\mathrm{scheme}}
=
3H_E+\sum_{i=1}^5H_{\beta_i},
}
\]

\[
\boxed{
\mathscr E_H
=
H_E+\sum_{i=1}^5H_{\beta_i}.
}
\]

So the forcing-memory stratification is a resonant jet refinement of the reduced spectral normal-crossings arrangement.

## 8. Resonant jet test

Set

\[
J_0=r_d(-2),\qquad
J_1=r_d'(-2),\qquad
J_2=r_d''(-2).
\]

Then

\[
\nu=0\iff J_0\neq0,
\]

\[
\nu=1\iff J_0=0,\ J_1\neq0,
\]

\[
\nu=2\iff J_0=J_1=0,\ J_2\neq0,
\]

\[
\nu=3\iff J_0=J_1=J_2=0.
\]

Explicitly,

\[
\begin{aligned}
J_0
={}&d_0-2d_1+4d_2-8d_3+16d_4\\
&-32d_5+64d_6-128d_7,
\end{aligned}
\]

\[
J_1
=
d_1-4d_2+12d_3-32d_4+80d_5-192d_6+448d_7,
\]

\[
J_2
=
2d_2-12d_3+48d_4-160d_5+480d_6-1344d_7.
\]

The three jet functionals are linearly independent.

## 9. Rational double-axis stratification

Over \(\mathbb Q\), \(q\) is irreducible.  Thus the quintic side has only the flag

\[
\varepsilon=0
\quad\text{or}\quad
\varepsilon=1\ (q\mid r_d).
\]

Hence rational strata are indexed by

\[
\boxed{
(\nu,\varepsilon)\in C_4\times C_2.
}
\]

There are exactly \(8\) rational strata:

| \(\nu\) | \(q\mid r_d\)? | \(g_F\) | \(g_H\) | \(\mu_F\) | \(\mu_H\) | dim |
|---:|:---:|---|---|---|---|---:|
| 0 | no | \(1\) | \(1\) | \(E^3q\) | \(Eq\) | 8 |
| 1 | no | \(E\) | \(E\) | \(E^2q\) | \(q\) | 7 |
| 2 | no | \(E^2\) | \(E\) | \(Eq\) | \(q\) | 6 |
| 3 | no | \(E^3\) | \(E\) | \(q\) | \(q\) | 5 |
| 0 | yes | \(q\) | \(q\) | \(E^3\) | \(E\) | 3 |
| 1 | yes | \(Eq\) | \(Eq\) | \(E^2\) | \(1\) | 2 |
| 2 | yes | \(E^2q\) | \(Eq\) | \(E\) | \(1\) | 1 |
| 3 | yes | \(E^3q=p_4\) | \(Eq=m_A\) | \(1\) | \(1\) | 0 |

## 10. Important limitation

The pair

\[
\bigl(g_F,g_H\bigr)
\]

completely classifies forcing-quotient memory and homogeneous landing spectrum, but it does not determine higher contact with

\[
p_5=E^4q^2.
\]

A rational counterexample is

\[
r_1=E^3,\qquad r_2=E^4.
\]

Both have

\[
\gcd(p_4,r_1)=\gcd(p_4,r_2)=E^3
\]

and

\[
\gcd(m_A,r_1)=\gcd(m_A,r_2)=E.
\]

However

\[
\gcd(p_5,r_1)=E^3,
\qquad
\gcd(p_5,r_2)=E^4.
\]

Therefore their canonical full annihilators are different:

\[
\boxed{
\frac{p_5}{E^3}=Eq^2,
}
\]

versus

\[
\boxed{
\frac{p_5}{E^4}=q^2.
}
\]

So the two-axis invariant is complete for the two requested layers, but not for the entire \(p_5\)-contact geometry.

## 11. Two-Axis Stratification Theorem

For the fixed cubic \(x_5\) extension, the common forcing-memory / homogeneous-spectral stratification is exactly indexed by

\[
\boxed{
(\nu,Z)\in C_4\times B_5.
}
\]

On \(\mathscr S_{\nu,Z}\),

\[
g_F
=
E^\nu\prod_{i\in Z}(S-\beta_i),
\]

\[
g_H
=
E^{\min(1,\nu)}
\prod_{i\in Z}(S-\beta_i),
\]

\[
\mu_F
=
E^{3-\nu}\prod_{i\notin Z}(S-\beta_i),
\]

\[
\mu_H
=
E^{1-\min(1,\nu)}
\prod_{i\notin Z}(S-\beta_i).
\]

The closure order is

\[
(\nu,Z)\preceq(\nu',Z')
\iff
\nu\le\nu',
\quad
Z\subseteq Z'.
\]

Thus the requested double-axis stratification exists, but it is constrained rather than a free Cartesian product of two independent loss variables.

## 12. Next research direction

The exact missing invariant is

\[
\boxed{
g_X(d):=\gcd(p_5,r_d).
}
\]

Since

\[
p_5=E^4q^2,
\]

this detects the information invisible to both \(g_F\) and \(g_H\):

- fourth-order resonant \(E\)-contact;
- second-order contact with individual \(q\)-eigenmodes.

The natural next refinement is therefore

\[
\boxed{
g_F,\ g_H,\ g_X
}
\]

or equivalently

\[
\boxed{
\text{forcing memory}
+
\text{homogeneous spectral support}
+
\text{higher lift contact}.
}
\]

For the canonical representative this third invariant gives the exact full annihilator

\[
\boxed{
\mu_X^{\mathrm{can}}=\frac{p_5}{g_X}.
}
\]
