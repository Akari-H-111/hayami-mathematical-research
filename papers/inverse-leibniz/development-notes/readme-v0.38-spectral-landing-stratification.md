# Inverse Leibniz Problem — Spectral Landing Stratification Theorem (v0.38)

## 1. Starting point

For the fixed cubic contraction, v0.37 established

\[
\mathscr D_5\simeq \mathbb C[S]/(p_4),
\qquad
\dim\mathscr D_5=8,
\]

\[
\mathcal H_5\simeq \mathbb C[S]/(m_A),
\qquad
\dim\mathcal H_5=6,
\]

and the complete landing operator

\[
\Lambda_5:\mathscr D_5\to\mathcal H_5
\]

is surjective with two-dimensional kernel.

For

\[
d=(d_0,\ldots,d_7),
\qquad
r_d(S)=\sum_{j=0}^7d_jS^j,
\]

the landing is

\[
\boxed{
\Lambda_5(d)=r_d(A)y_5.
}
\]

The homogeneous polynomial is

\[
\boxed{
m_A(S)
=
(S+2)q(S)
}
\]

with

\[
\boxed{
q(S)
=
S^5-4S^4+12S^3-32S^2+80S-192.
}
\]

---

# 2. GCD Landing Lemma

Let

\[
R=\mathbb C[S],
\qquad
\mathcal H=R/(m)
\]

with cyclic generator \(y=[1]\).

For \(r\in R\), let

\[
v=r(A)y.
\]

Set

\[
g=\gcd(m,r).
\]

Then

\[
\boxed{
\operatorname{Ann}_R(v)
=
\left(\frac{m}{g}\right).
}
\]

Hence the exact landing multiplier is

\[
\boxed{
d_v(S)
=
\frac{m(S)}{\gcd(m(S),r(S))}.
}
\]

### Proof

Write

\[
m=gm_1,
\qquad
r=gr_1,
\qquad
\gcd(m_1,r_1)=1.
\]

A polynomial \(f\) annihilates \(v\) iff

\[
m\mid fr,
\]

equivalently

\[
gm_1\mid fgr_1.
\]

Thus

\[
m_1\mid fr_1.
\]

Since

\[
\gcd(m_1,r_1)=1,
\]

this is equivalent to

\[
m_1\mid f.
\]

Therefore the annihilator ideal is exactly

\[
(m_1)
=
\left(\frac{m}{g}\right).
\]

No squarefreeness assumption is needed for this lemma.

Applied to the cubic landing,

\[
\boxed{
d_v
=
\frac{m_A}{\gcd(m_A,r_d)}.
}
\]

This is the closed-form answer to the spectral landing problem.

---

# 3. Exact spectral health of \(m_A\)

Exact symbolic calculation gives

\[
\boxed{
q(-2)=-672\neq0,
}
\]

\[
\boxed{
\gcd(q,q')=1,
}
\]

and

\[
\boxed{
\gcd(m_A,m_A')=1.
}
\]

Thus \(m_A\) is squarefree.

Moreover \(q\) is irreducible in

\[
\mathbb Q[S].
\]

Hence over \(\mathbb C\),

\[
q(S)=\prod_{i=1}^5(S-\beta_i)
\]

with five pairwise distinct roots, none equal to \(-2\).

Write

\[
\Sigma
=
\{-2,\beta_1,\ldots,\beta_5\}.
\]

Then

\[
\boxed{
m_A(S)
=
\prod_{\lambda\in\Sigma}(S-\lambda)
}
\]

has six distinct roots.

---

# 4. Chinese-remainder spectral coordinates

Since \(m_A\) is squarefree,

\[
\boxed{
\mathcal H_5
\simeq
\bigoplus_{\lambda\in\Sigma}\mathbb C_\lambda.
}
\]

Under this decomposition,

\[
\Lambda_5(d)
\]

has spectral coordinates

\[
\boxed{
u_\lambda(d)=r_d(\lambda).
}
\]

Thus

\[
\Lambda_5(d)
\longleftrightarrow
\bigl(
r_d(-2),
r_d(\beta_1),\ldots,r_d(\beta_5)
\bigr).
\]

Since \(\Lambda_5\) is surjective, these six linear spectral coordinates are independent modulo the common two-dimensional kernel.

Equivalently, after a linear change of coordinates,

\[
\boxed{
\mathscr D_5
\simeq
\ker\Lambda_5\oplus\mathbb C^6.
}
\]

---

# 5. Exceptional divisor

The cyclicity/resultant polynomial is

\[
\Delta_A(\Lambda_5(d))
=
\operatorname{Res}(m_A,r_d).
\]

Since \(m_A\) is monic and squarefree,

\[
\boxed{
\operatorname{Res}(m_A,r_d)
=
\prod_{\lambda\in\Sigma}r_d(\lambda).
}
\]

Therefore the exceptional locus is

\[
\boxed{
\mathscr E_5
=
\bigcup_{\lambda\in\Sigma}H_\lambda,
}
\]

where

\[
\boxed{
H_\lambda
=
\{d\in\mathscr D_5:r_d(\lambda)=0\}.
}
\]

These are six distinct linear hyperplanes.

Every subset of the six spectral functionals is independent modulo

\[
\ker\Lambda_5.
\]

Consequently the exceptional divisor is linearly equivalent to

\[
\boxed{
\mathbb C^2
\times
\{u_0u_1u_2u_3u_4u_5=0\}
\subset
\mathbb C^2\times\mathbb C^6.
}
\]

Thus it is a simple normal-crossings hyperplane arrangement, with common deepest intersection

\[
\boxed{
\bigcap_{\lambda\in\Sigma}H_\lambda
=
\ker\Lambda_5
}
\]

of dimension \(2\).

---

# 6. Complete complex spectral strata

For each subset

\[
Z\subseteq\Sigma,
\]

define

\[
\boxed{
\mathscr S_Z
=
\left\{
d:
r_d(\lambda)=0
\iff
\lambda\in Z
\right\}.
}
\]

In words, \(Z\) is exactly the set of homogeneous eigenmodes lost by the landing.

Because the six spectral coordinates are independent, every \(\mathscr S_Z\) is nonempty.

There are

\[
\boxed{2^6=64}
\]

strata.

For

\[
d\in\mathscr S_Z,
\]

squarefreeness gives

\[
\gcd(m_A,r_d)
=
\prod_{\lambda\in Z}(S-\lambda).
\]

Hence the true landing multiplier is

\[
\boxed{
d_Z(S)
=
\prod_{\lambda\in\Sigma\setminus Z}(S-\lambda).
}
\]

Equivalently,

\[
\boxed{
d_Z
=
\frac{m_A}{
\prod_{\lambda\in Z}(S-\lambda)
}.
}
\]

This assigns the exact multiplier to every stratum.

---

# 7. Dimension and closure

If

\[
|Z|=k,
\]

then \(k\) independent spectral coordinates vanish.

Therefore

\[
\boxed{
\operatorname{codim}_{\mathscr D_5}\mathscr S_Z=k
}
\]

and

\[
\boxed{
\dim\mathscr S_Z=8-k.
}
\]

The multiplier degree is

\[
\boxed{
\deg d_Z=6-k.
}
\]

The closure is

\[
\boxed{
\overline{\mathscr S_Z}
=
\bigcap_{\lambda\in Z}H_\lambda
=
\bigsqcup_{Z'\supseteq Z}\mathscr S_{Z'}.
}
\]

Thus the closure poset is precisely the Boolean lattice of subsets of six spectral modes, ordered by inclusion.

The number of strata with \(k\) lost modes is

\[
\boxed{
\binom6k.
}
\]

Hence:

| lost modes \(k\) | number of strata | dimension | multiplier degree |
|---:|---:|---:|---:|
| 0 | 1 | 8 | 6 |
| 1 | 6 | 7 | 5 |
| 2 | 15 | 6 | 4 |
| 3 | 20 | 5 | 3 |
| 4 | 15 | 4 | 2 |
| 5 | 6 | 3 | 1 |
| 6 | 1 | 2 | 0 |

---

# 8. Resonant/quintic form of the classification

Write

\[
Z
=
Z_E\sqcup Z_q,
\]

where

\[
Z_E\subseteq\{-2\}
\]

and

\[
Z_q\subseteq\{\beta_1,\ldots,\beta_5\}.
\]

Let

\[
\varepsilon=
\begin{cases}
1,&-2\in Z,\\
0,&-2\notin Z.
\end{cases}
\]

Then

\[
\boxed{
d_Z(S)
=
(S+2)^{1-\varepsilon}
\prod_{\beta_i\notin Z_q}(S-\beta_i).
}
\]

Important special strata are:

### Full landing

\[
Z=\varnothing:
\qquad
\boxed{d_Z=m_A.}
\]

### Pure resonant loss

\[
Z=\{-2\}:
\qquad
\boxed{d_Z=q.}
\]

### Lose exactly one quintic eigenmode

\[
Z=\{\beta_i\}:
\qquad
\boxed{
d_Z=\frac{m_A}{S-\beta_i}.
}
\]

### Lose the complete \(q\)-block but keep resonance

\[
Z=\{\beta_1,\ldots,\beta_5\}:
\qquad
\boxed{d_Z=E.}
\]

### Zero landing

\[
Z=\Sigma:
\qquad
\boxed{d_Z=1.}
\]

The zero stratum is exactly

\[
\boxed{
\mathscr S_\Sigma=\ker\Lambda_5
}
\]

and has dimension \(2\).

---

# 9. Rational geometry of the exceptional locus

Over \(\mathbb Q\), the factorization is coarser.

By multiplicativity of the resultant,

\[
\boxed{
\operatorname{Res}(m_A,r_d)
=
r_d(-2)\,
\operatorname{Res}(q,r_d).
}
\]

The resonant factor is the explicit rational linear form

\[
\boxed{
\begin{aligned}
L_E(d)
={}&
d_0-2d_1+4d_2-8d_3+16d_4\\
&-32d_5+64d_6-128d_7.
\end{aligned}
}
\]

To describe the \(q\)-factor, reduce \(r_d\) modulo \(q\):

\[
r_d\bmod q
=
a_0+a_1S+a_2S^2+a_3S^3+a_4S^4
\]

with

\[
\boxed{
a_0=d_0+192d_5+768d_6+768d_7,
}
\]

\[
\boxed{
a_1=d_1-80d_5-128d_6+448d_7,
}
\]

\[
\boxed{
a_2=d_2+32d_5+48d_6,
}
\]

\[
\boxed{
a_3=d_3-12d_5-16d_6,
}
\]

\[
\boxed{
a_4=d_4+4d_5+4d_6.
}
\]

Then

\[
\boxed{
N_q(d)
:=
\operatorname{Res}(q,r_d)
=
N_{\mathbb Q[S]/(q)/\mathbb Q}
(a_0+a_1S+\cdots+a_4S^4).
}
\]

Exact symbolic verification gives:

\[
\boxed{\deg N_q=5,}
\]

and \(N_q\) is irreducible over \(\mathbb Q\).

Thus the rational exceptional divisor has exactly two irreducible components:

\[
\boxed{
\mathscr E_5
=
V(L_E)\cup V(N_q).
}
\]

After extension to the splitting field, the quintic norm component splits into the five hyperplanes

\[
H_{\beta_1},\ldots,H_{\beta_5}.
\]

---

# 10. Rational-data corollary

Suppose

\[
d_0,\ldots,d_7\in\mathbb Q.
\]

Because \(q\) is irreducible over \(\mathbb Q\),

\[
\gcd(m_A,r_d)
\]

can only be

\[
\boxed{
1,\quad E,\quad q,\quad m_A.
}
\]

Therefore rational data have exactly four possible landing multipliers:

\[
\boxed{
m_A,\quad q,\quad E,\quad 1.
}
\]

Explicitly:

| gcd \(\gcd(m_A,r_d)\) | spectral loss | multiplier \(d_v\) |
|---|---|---|
| \(1\) | none | \(m_A=Eq\) |
| \(E\) | resonant mode only | \(q\) |
| \(q\) | entire quintic block | \(E\) |
| \(m_A\) | all six modes | \(1\) |

Thus a rational exact computation can never lose only one or two individual roots of the irreducible quintic \(q\).

Those finer strata appear only after passing to complex/splitting-field data.

---

# 11. Spectral Landing Stratification Theorem

For the complete \(x_5\) landing operator of the fixed cubic contraction:

\[
\boxed{
\Lambda_5:
\mathscr D_5\to\mathcal H_5
}
\]

with

\[
\mathscr D_5\simeq\mathbb C[S]/(p_4),
\qquad
\mathcal H_5\simeq\mathbb C[S]/(m_A),
\]

the following hold.

1. For every datum \(d\),

   \[
   \boxed{
   d_v
   =
   \frac{m_A}{\gcd(m_A,r_d)}.
   }
   \]

2. \(m_A\) is squarefree with six distinct complex roots.

3. The exceptional locus

   \[
   \operatorname{Res}(m_A,r_d)=0
   \]

   is the union of six independent spectral hyperplanes over the splitting field.

4. The complete spectral stratification consists of \(64\) nonempty locally closed strata

   \[
   \mathscr S_Z,\qquad Z\subseteq\Sigma.
   \]

5. On \(\mathscr S_Z\),

   \[
   \boxed{
   d_v
   =
   \prod_{\lambda\notin Z}(S-\lambda).
   }
   \]

6. The stratum has

   \[
   \boxed{
   \dim\mathscr S_Z=8-|Z|.
   }
   \]

7. Its closure is obtained by allowing additional spectral modes to vanish:

   \[
   \boxed{
   \overline{\mathscr S_Z}
   =
   \bigsqcup_{Z'\supseteq Z}\mathscr S_{Z'}.
   }
   \]

8. Over \(\mathbb Q\), the divisor has the coarse factorization

   \[
   \boxed{
   \operatorname{Res}(m_A,r_d)
   =
   L_E(d)\,N_q(d),
   }
   \]

   with \(L_E\) linear and \(N_q\) an irreducible quintic norm form.

This is a complete classification of every possible partial homogeneous spectral landing.

---

# 12. Scope and relation to the full rail annihilator

The theorem classifies the **landing multiplier**

\[
d_v
=
\mu(A|_{\mathbb C[A]\Lambda_5(d)}).
\]

This part is exact and requires no additional genericity assumption.

To conclude that the complete temporal annihilator of the corresponding triangular rail is exactly

\[
p_4\,d_v,
\]

one still applies the minimality/no-cancellation hypothesis from the Triangular Spectral Extension Lemma.

Thus the landing stratification is unconditional at the homogeneous residual level, while total-rail minimality is a separate question.

---

# 13. Next research direction

The natural next step is now to investigate the **forcing-side cancellation strata**.

The landing theorem completely classifies the homogeneous multiplier \(d_v\), but the total rail can in principle have additional cancellation inside the forcing killer \(p_4\).

For a datum represented by \(r_d\in R/(p_4)\), study

\[
\gcd(p_4,r_d)
\]

simultaneously with

\[
\gcd(m_A,r_d).
\]

The goal is a two-axis classification:

\[
\boxed{
\text{forcing-memory loss}
\times
\text{homogeneous spectral loss}.
}
\]

That would determine the exact full temporal annihilator of every admissible \(x_5\) datum, not only its residual landing multiplier.
