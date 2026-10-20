# Mathematics: the level-5 golden subfield and its boundary

## 1. Conventions and classical baseline

Let

\[
 \tau_{163}=\frac{1+i\sqrt{163}}2,
 \quad q=e^{2\pi i\tau_{163}}=-e^{-\pi\sqrt{163}},
\]

and use the specified fifth-root convention

\[
 r(\tau)=e^{2\pi i\tau/5}
 \prod_{n\geq1}
 \frac{(1-q^{5n-4})(1-q^{5n-1})}
 {(1-q^{5n-3})(1-q^{5n-2})},\qquad t=r(\tau)^5.
\]

The classical inputs are

\[
 j(\tau_{163})=-640320^3,
\]

and Klein's level-5 equation

\[
 P_j(t):=(t^4-228t^3+494t^2+228t+1)^3
      +j\,t(t^2+11t-1)^5=0. \tag{1}
\]

They are not reproved here.  The nine positive Heegner numbers are

\[
 1,2,3,7,11,19,43,67,163,
\]

with maximal-order discriminants (-4,-8,-3,-7,-11,-19,-43,-67,-163),
respectively.  The nonmaximal class-number-one order discriminants used below
are (-12,-16,-27,-28).  The famous near-integer phenomenon comes from

\[
 j(\tau)=q^{-1}+744+196884q+\cdots;
\]

here (q=-e^{-\pi\sqrt{163}}), so

\[
 e^{\pi\sqrt{163}}=640320^3+744-\varepsilon,
\]

where (\varepsilon>0) is extremely small.  That asymptotic fact motivates
the (-163) branch but is not used to manufacture the field identity.

Put

\[
 \phi=\frac{1+\sqrt5}{2},\qquad
 \gamma=\phi^{-1}=\frac{\sqrt5-1}{2},\qquad
 c_0=\phi^{-2}=\frac{3-\sqrt5}{2}=\gamma^2. \tag{2}
\]

The last number is the (c_0) occurring in the current HMR ruled-surface
rank-singularity classification; $\gamma$ is the explicit quadratic
parameter in the current Information Topology Boolean no-go example.

## 2. The universal sextic quotient

Set (u=t-t^{-1}).  The elementary identities

\[
 \frac{t^4-228t^3+494t^2+228t+1}{t^2}=u^2-228u+496,
 \qquad
 \frac{t^2+11t-1}{t}=u+11
\]

give the following proposition.

**Proposition 2.1 (proved here).**  For every scalar (j),

\[
 P_j(t)=t^6G_j(t-t^{-1}),
 \quad
 G_j(u)=(u^2-228u+496)^3+j(u+11)^5. \tag{3}
\]

Equivalently, (P_j(-1/t)=t^{-12}P_j(t)).  Thus the degree-12 fibre always
has a degree-6 reciprocal quotient.  This fact alone has no golden-field
content.

**Proof.**  Substitute the two displayed identities in (1).  The second
term satisfies

\[
 \frac{t(t^2+11t-1)^5}{t^6}=(u+11)^5,
\]

which proves (3).  \(\square\)

The exact controls (j=1,2) show that (P_j) is irreducible of degree 12
over both $\mathbb Q$ and $\mathbb Q(\sqrt5)$.  Consequently the sextic
quotient is universal, while golden-field inclusion is not.

## 3. Exact reconstruction in the (-163) fibre

For (j=-640320^3), define the following integers:

\[
\begin{aligned}
 a&=131268706320384342,& b&=2896632145572621515,\\
 c&=15717124384666951860,& d&=58705150130167150,\\
 e&=1295413276662289800,& f&=7028911706986972100,
\end{aligned}
\]

and polynomials in (u)

\[
\begin{aligned}
 \alpha(u)&=u^3-au^2+(3-b)u-(2a+c),\\
 \beta(u)&=-du^2-eu-(2d+f).
\end{aligned}
\]

Define (A(t)=t^3\alpha(t-t^{-1})) and
(B(t)=t^3\beta(t-t^{-1})).  The negative powers cancel, so both belong to
$\mathbb Z[t]$; explicitly,

\[
\begin{aligned}
A(t)={}&t^6-at^5-bt^4-ct^3+bt^2-at-1,\\
B(t)={}&-dt^5-et^4-ft^3+et^2-dt.
\end{aligned} \tag{4}
\]

Exact expansion gives

\[
 G_{-640320^3}(u)=\alpha(u)^2-5\beta(u)^2,
\]

and hence

\[
 P_{163}(t)=A(t)^2-5B(t)^2. \tag{5}
\]

The checker also verifies (gcd(A,B)=1), that (P_{163}) is irreducible
of degree 12 over $\mathbb Q$, and that it factors into two degree-6
polynomials over $\mathbb Q(\sqrt5)$.  Irreducibility is useful control
information but is not needed in the next proof.

**Proposition 3.1 (proved here, conditional on (1) and the CM value).**
For the analytic (t=r(\tau_{163})^5),

\[
 \mathbb Q(\sqrt5)\subseteq\mathbb Q(t),\qquad
 \sqrt5=-\frac{A(t)}{B(t)}, \tag{6}
\]

and consequently

\[
 \phi=\frac{B(t)-A(t)}{2B(t)},\quad
 \gamma=-\frac{A(t)+B(t)}{2B(t)},\quad
 c_0=\frac{3B(t)+A(t)}{2B(t)}. \tag{7}
\]

**Algebraic proof.**  Equation (5) and (P_{163}(t)=0) imply
((A(t)/B(t))^2=5), provided (B(t)\ne0).  If (B(t)=0), (5) would give
(A(t)=0), contradicting (gcd(A,B)=1) by Bézout.  Thus (A(t)/B(t)) is a
square root of 5 already in (\mathbb Q(t)).  The rational interval argument
below selects its negative sign.  Formula (7) follows by substituting (6)
into (2).  For example, the numerator of

\[
 \left(\frac{3B+A}{2B}\right)^2
 -3\left(\frac{3B+A}{2B}\right)+1
\]

is (A^2-5B^2).  \(\square\)

This proves a genuine field inclusion.  It is stronger than choosing
$\sqrt5$ externally and rewriting a decimal with it.

## 4. Certified branch sign

Let

\[
 F(q)=\prod_{n\geq1}
 \frac{(1-q^{5n-4})(1-q^{5n-1})}
 {(1-q^{5n-3})(1-q^{5n-2})}.
\]

For (q=-e^{-\pi\sqrt{163}}), all factors are positive, so

\[
 t=qF(q)^5<0.
\]

The checker uses rational bounds

\[
 3.14<\pi<22/7,\quad 12.76<\sqrt{163}<12.77,
\]

positive Taylor bounds for (e^{40}) and (e^{41}), and

\[
 |\log F(q)|\leq \frac{|q|}{(1-|q|)^2}.
\]

They yield the fully rational enclosure

\[
 -5\cdot10^{-18}<t<-10^{-18}. \tag{8}
\]

Exact interval-Horner arithmetic gives (A<0<B) on all of (8), while a
Sturm count gives exactly one real root of (P_{163}) there.  Thus the sign
in (6) is certified without selecting a floating-point root.

## 5. The real branch and phase convention

The specified (r) is not real.  Define instead

\[
 s=e^{-\pi\sqrt{163}/5}F(-e^{-\pi\sqrt{163}})>0.
\]

Then

\[
 r=e^{\pi i/5}s,\qquad t=-s^5. \tag{9}
\]

The substitution (P_{163}(-s^5)) factors over $\mathbb Q$ with degrees
(12,24,24).  Its real small branch is the degree-12 factor

\[
\begin{aligned}
H(s)={}&s^{12}+3049s^{11}+6824s^{10}-2600s^9-26275s^8-13636s^7\\
 &+21661s^6+13636s^5-26275s^4+2600s^3+6824s^2-3049s+1.
\end{aligned} \tag{10}
\]

With

\[
\begin{aligned}
 a_s={}&2s^6+3049s^5+4935s^4+1160s^3-4935s^2+3049s-2,\\
 b_s={}&-1363s^5-2209s^4-522s^3+2209s^2-1363s,
\end{aligned}
\]

the exact identity is

\[
 4H(s)=a_s(s)^2-5b_s(s)^2. \tag{11}
\]

Equation (8) gives (1/4000<s<1/2500).  Exact Sturm counts show one root
of (H) and none of the degree-48 cofactor in that interval; interval
arithmetic gives (a_s<0) and (b_s<0).  Hence

\[
 \frac{a_s(s)}{b_s(s)}=\sqrt5,
\]

and the equivalent real formulas are

\[
 \phi=\frac{b_s+a_s}{2b_s},\qquad
 \gamma=\frac{a_s-b_s}{2b_s},\qquad
 c_0=\frac{3b_s-a_s}{2b_s}. \tag{12}
\]

This resolves the phase ambiguity explicitly.  The earlier director 100-digit probe in
`logs/supervisor-degree-probe.json` numerically selects a degree-24 factor
for complex (r). This is a numerical match, not certified complex isolation.

## 6. Controls: what is and is not special to 163

The exact factorization controls use (P_j(t)).  The middle column is the
$\mathbb Q$-factor numerically matched by the direct (q)-product at both
100 and 200 digits; the final column is its exact factorization over
$\mathbb Q(\sqrt5)$.

| CM order discriminant | matched factor degree over $\mathbb Q$ | degrees over $\mathbb Q(\sqrt5)$ |
| --- | ---: | ---: |
| (-3) | 4 | 2+2 |
| (-4) | 4 | 2+2 |
| (-7) | 12 | 6+6 |
| (-8) | 12 | 6+6 |
| (-11) | 8 | 4+4 |
| (-19) | 8 | 4+4 |
| (-43) | 12 | 6+6 |
| (-67) | 12 | 6+6 |
| (-163) | 12 | 6+6 |
| (-12) | 12 | 6+6 |
| (-16) | 8 | 4+4 |
| (-27) | 12 | 6+6 |
| (-28) | 12 | 6+6 |

This is a finite exact factorization table plus numerical branch matching.  It
does **not** classify all CM orders or prove a general ray-class criterion.
It does show that the field phenomenon is not unique to 163 among these
class-number-one controls.

For the rational non-CM controls (j=1,2), the full degree-12 (P_j)
remains irreducible over $\mathbb Q(\sqrt5)$.  A root field therefore does
not contain $\mathbb Q(\sqrt5)$.  This refutes the tempting but false claim
that the universal sextic (3) automatically extracts $\phi$ from every
rational (j)-fibre.

There is a separate classical $\sqrt5$-control at discriminant (-15):

\[
 j\!\left(\frac{-1+i\sqrt{15}}2\right)
 =-52515-85995\phi
 =85995c_0-224505. \tag{13}
\]

At discriminant (-20), likewise,

\[
 j=632000+282880\sqrt5=1480640-565760c_0. \tag{14}
\]

These are exact shared-field identities.  Since (j=J(t)) is rational in
(t), a non-rational (j) already puts $\mathbb Q(\sqrt5)$ in
(\mathbb Q(t)); (13)--(14) are therefore controls against mistaking a
simple affine field overlap for an intrinsic HMR geometric map.

## 7. What reaches HMR, and what stops there

The current ruled-surface source uses (c_0=(3-\sqrt5)/2) as the root of
(c^2-3c+1) in a rank-singularity classification.  The current Information
Topology arithmetic manuscript uses
(gamma=(\sqrt5-1)/2) as the badly approximable comparator in its explicit
Boolean no-go example.  Equations (7) and (2) give a concrete parameter map

\[
 t\longmapsto \gamma(t)\longmapsto c_0=\gamma(t)^2. \tag{15}
\]

That is the legitimate HMR-facing addition: the same locally used quadratic
parameter can be recovered internally from a specified level-5 CM value,
with the branch convention exposed.

It is also an obstruction.  The Information Topology manuscript defines the
Boolean exact-fillability sequence (epsilon_q(x)) and proves that every
non-torsion parameter has the constant sequence ((1,1,\ldots)).  Both
$\gamma$ and (c_0) are irrational.  The irreducibility check for
(P_{163}) makes (t) irrational as well.  Therefore their corresponding
one-coordinate torus points have identical Boolean data.  No observable that
depends only on this Boolean sequence can recover the field mark
$\mathbb Q(\sqrt5)$, distinguish the CM parameter from the local HMR
parameter, or make (15) an intrinsic bridge.

This is a short corollary of the existing HMR no-go proposition and the new
exact field calculation.  A nontrivial next construction would need a
separately defined marked observable that retains the quadratic character
(for example a canonical CM/ray-class mark) and a theorem that it transports
through an HMR structure.  Merely adding a scalar equal to $\phi$ would not
meet that requirement.

## 8. Literature position and next target

The Rogers--Ramanujan level-5 function, its icosahedral equation, and CM
singular-value algebra are classical.  Duke already frames (r(\tau)) at CM
points through the icosahedron and complex multiplication.  Cais--Conrad give
a ray-class-field description for a standard level-5 modular coordinate under
explicit hypotheses. Duke's Theorem 3 concerns the standard r(tau) for all
algebraic tau in the upper half-plane; it is not a theorem about the
phase-stripped real s-branch. The latter is checked separately in Section 5.
Thus this packet does **not** claim discovery of a new CM mechanism.

In particular, it does not rediscover or weaken Duke's stated degree-
at-most-two exclusion for CM values of the real Rogers--Ramanujan branch.  The
degree-12 real (s)-factor here and the numerically selected degree-24 complex
(r)-factor are fully compatible with that classical boundary.

What this package adds locally is a compact, branch-certified reconstruction
of the actual HMR (c_0), a universal-versus-special control test, and a
precise marking obstruction.  The exact stabilizer statement explaining why
the quadratic character survives in the listed fibres has not been derived.
The next target is to compute that stabilizer using Shimura reciprocity and
compare it with the factor degrees in Section 6.  A positive result would need
to identify a canonical mark; a counterexample is a CM order whose selected
level-5 component remains irreducible over $\mathbb Q(\sqrt5)$.
