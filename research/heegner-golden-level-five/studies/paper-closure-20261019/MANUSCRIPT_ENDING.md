# A golden coordinate and two realizations of one involution

Proposed final section for the Heegner-golden paper. All statements retain the
normalizations given below. The underlying surface, modular curve and Dirichlet
series remain distinct objects; the maps concern specified scalar parameters
and two-dimensional transformations.

## 1. The geometric parameter is already a pentagonal coordinate

Consider the orthogonal-circle ruled surface from HMR,

\[
 S(t,u)=\bigl(c+2u(1-c),(1-u)s,uQ\bigr),\qquad
 c=\cos t,\ s=\sin t,\ Q=\sqrt{c(2-c)}.
\]

For the interior lateral rank-loss points, \(0<c<1\), the cross-product
equations force

\[
 u=\frac{1-c}{2},\qquad P(c)=c^2-3c+1=0.
\]

Indeed the third component of \(S_t\times S_u\) is
\((1-c)(1-c-2u)\). After substituting \(u=(1-c)/2\), its other two
components are respectively \(-(1+c)P(c)/(2Q)\) and \(-sP(c)/Q\).
There is exactly one root of \(P\) in \((0,1)\). Hence

\[
 c_0=\frac{3-\sqrt5}{2}=\phi^{-2},\quad
 \gamma=1-c_0=\phi^{-1},\quad
 u_0=\frac{\gamma}{2}=\cos\frac{2\pi}{5}.
\]

Thus the surface's affine ruling coordinate at rank loss is precisely a
pentagonal cosine. This interpretation concerns the selected singularity
parameters; it does not identify the entire ruled surface with a pentagon or
a modular curve. The two points \(t=\pm\arccos c_0\) share these parameters,
so their opposite orientation information is not contained in \((c_0,u_0)\).

## 2. A common involution theorem

Let \(r(\tau)\) denote the Rogers-Ramanujan function with
\(q=e^{2\pi i\tau}\) and the analytic factor \(q^{1/5}=e^{2\pi i\tau/5}\).
Its classical inversion law is

\[
 r(-1/\tau)=\frac{\gamma-r(\tau)}{1+\gamma r(\tau)}.
\]

**Theorem.** Define

\[
 M=\frac1{\sqrt{1+c_0}}
 \begin{pmatrix}-1&\gamma\\\gamma&1\end{pmatrix},
 \qquad J=\begin{pmatrix}0&1\\1&0\end{pmatrix}.
\]

For an odd five-periodic vector \(a=(x,y,-y,-x,0)\), put

\[
 (\mathcal F a)_m=\frac1{\sqrt5}
       \sum_{n=1}^{5}a_n e^{2\pi i mn/5},\qquad
 \mathcal T=-i\mathcal F.
\]

The real matrix of \(\mathcal T\) on the coordinates \((x,y)\) is

\[
 A=\frac2{\sqrt5}
 \begin{pmatrix}
 \sin(2\pi/5)&\sin(\pi/5)\\
 \sin(\pi/5)&-\sin(2\pi/5)
 \end{pmatrix}
 =JMJ.
\]

Consequently the positive projective fixed coordinate of RR inversion and
the normalized \(+1\) Fourier eigenline are given by the same number:

\[
 \boxed{\quad \kappa=r(i)
 =\sqrt{\frac{5+\sqrt5}{2}}-\phi
 =\frac{\sqrt{10-2\sqrt5}-2}{\sqrt5-1}
 =\frac{\gamma}{1+\sqrt{1+c_0}}.\quad}
\]

In particular,

\[
 A\binom1\kappa=\binom1\kappa,
 \qquad
 a=(1,\kappa,-\kappa,-1,0).
\]

The scalar dictionary is reversible on the specified positive branch:

\[
 \boxed{\quad u_0=\frac{\kappa}{1-\kappa^2},\qquad
 c_0=\left(\frac{2\kappa}{1-\kappa^2}\right)^2.\quad}
\]

**Proof.** Since \(\gamma^2=c_0\), \(M^2=I\). For an odd vector,
the residue classes \(n\) and \(5-n\) contribute twice the sine term
in the finite Fourier transform. Multiplying by \(-i\) gives the displayed
real matrix \(A\). The elementary identities

\[
 \frac{2\sin(2\pi/5)}{\sqrt5}=\frac1{\sqrt{1+c_0}},\qquad
 \frac{2\sin(\pi/5)}{\sqrt5}=\frac{\gamma}{\sqrt{1+c_0}}
\]

give \(A=JMJ\).

Because \(-1/i=i\), inversion makes \(r(i)\) a fixed point of
\(z\mapsto(\gamma-z)/(1+\gamma z)\). Its positive product expansion
selects the unique positive solution of

\[
 \gamma\kappa^2+2\kappa-\gamma=0.
\]

Solving gives the stated radical forms. In homogeneous coordinates the
\(+1\) eigenvector of \(M\) is \((\kappa,1)\); exchange of coordinates
gives the \(+1\) eigenvector \((1,\kappa)\) of \(A\). Finally,
\(\gamma=2\kappa/(1-\kappa^2)\), \(u_0=\gamma/2\) and
\(c_0=\gamma^2\) yield the inverse formulas. \(\square\)

Eliminating \(\phi\) also gives the quartic

\[
 \kappa^4+2\kappa^3-6\kappa^2-2\kappa+1=0,
\]

the familiar polynomial for \(r(i)\). The equalities above thus identify
the exact branches and transformations, rather than just their number fields.

## 3. Why the same eigenline produces the Davenport-Heilbronn symmetry

The vector \((1,\kappa,-\kappa,-1,0)\) is precisely the coefficient
convention used for the Davenport-Heilbronn function. For clarity, its
functional equation can be derived from the Fourier calculation, using the
classical Poisson summation formula as the analytic input.

Extend any odd five-periodic vector \(a\) to all integers, and define

\[
 F_a(s)=\sum_{n\ge1}\frac{a_n}{n^s}\quad(\Re s>1),\qquad
 \Theta_a(t)=\sum_{n\in\mathbb Z}n a_n e^{-\pi n^2t/5}.
\]

Put \(a'=\mathcal T a\). Poisson summation on the residue classes modulo
5, applied to \(x e^{-\pi t x^2/5}\), whose Fourier transform is
\(-i(5/t)^{3/2}\xi e^{-5\pi\xi^2/t}\), gives

\[
 \Theta_a(t)=t^{-3/2}\Theta_{a'}(1/t).
\]

Both theta series decrease exponentially at infinity; the transformation
gives exponential decrease up to a power at zero. Therefore

\[
 \Lambda_a(s)=\frac12\int_0^\infty
      \Theta_a(t)t^{(s+1)/2}\frac{dt}{t}
\]

defines an entire function of \(s\). For \(\Re s>1\), absolute
convergence permits termwise integration, giving

\[
 \Lambda_a(s)=\left(\frac5\pi\right)^{(s+1)/2}
       \Gamma\left(\frac{s+1}{2}\right)F_a(s).
\]

Changing variables \(t\mapsto1/t\) in the integral yields
\(\Lambda_a(s)=\Lambda_{a'}(1-s)\). For the \(+1\) eigenvector selected
by the theorem, \(a'=a\), so

\[
 \Lambda_a(s)=\Lambda_a(1-s).
\]

This makes the shared mechanism explicit: the modular fixed value \(r(i)\)
is exactly the mixing coordinate that selects the self-dual odd
five-periodic Dirichlet series. These are two analytic realizations of the
same normalized two-dimensional involution.

The coefficients are not multiplicative: \(a_6=1\), whereas
\(a_2a_3=-\kappa^2\), even though 2 and 3 are coprime. They therefore
do not yield an ordinary Dirichlet-series Euler product. Classical
Davenport-Heilbronn theory provides off-critical-line zeros for this function.
The example shows what the shared symmetry determines and what it leaves
undetermined. It is not a statement against RH for the Riemann zeta function,
and no claim that Euler products alone force critical-line zeros is used.

## 4. Returning to Hermite

The two CM evaluations in this paper play different, complementary roles:

| CM point | Nome | Modular value | Role |
| --- | --- | --- | --- |
| \(i\) | \(e^{-2\pi}\) | \(j(i)=1728\) | A fixed point of modular inversion, selecting \(r(i)=\kappa\) |
| \(\tau_{163}=(1+i\sqrt{163})/2\) | \(-e^{-\pi\sqrt{163}}\) | \(-640320^3\) | An integral CM value with an exponentially small nome, giving Hermite's near-integer phenomenon |

They are evaluations of the same level-five modular function, with the same
golden inversion law. The earlier sections supply the explicit golden field
inside the singular-value field at \(\tau_{163}\); the theorem above shows
that the inversion's positive fixed coordinate is already present in the
independently encountered Davenport-Heilbronn coefficients. HMR supplies an
equally concrete geometric entry through \(u_0=\cos(2\pi/5)\).

The unifying object is consequently more precise than a recurring decimal:
it is a pentagonal parameter and an exact involution, read respectively as
a singularity coordinate, a modular fixed coordinate, and a Fourier
coefficient line. Hermite's near-integer phenomenon and the golden ratio's
appearance belong to a common modular language, with their distinct
arithmetic roles kept visible.

### References for this section

HMR ruled-surface v5, Definition 1 and its rank-loss theorem (exact local
source pinned in SOURCE_MAP.md); W. Duke, *Continued Fractions and Modular
Functions*, Eq. (2.3), printed p. 2 and Proposition 2, Eq. (3.2), printed p. 7;
NIST DLMF Section 1.8(iv), Poisson summation; E. P. Balanzario and J.
Sanchez-Ortiz, *Zeros of the Davenport-Heilbronn counterexample*, Math. Comp.
76 (2007), 2045-2049, Eq. (1) and introductory historical statement.
Hermite's 1859 original, printed pp. 47-48, is the historical starting point.
The 2007 first page was read through indexed primary-source text; complete
PDF retrieval failed, and its zero-existence proof is not reproduced here.
