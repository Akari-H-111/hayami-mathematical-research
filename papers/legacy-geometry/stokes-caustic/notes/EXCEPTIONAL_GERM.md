# The exceptional germ of the Stokes v5 observation map

2026-10-16. Research extension beyond the published paper and sealed companion
v0.04. The paper, PDFs, releases, receipts and manifests are unchanged.

## Result and evidence

**Written theorem (real analytic, hence smooth).** The observation germ
\(F:(\mathbb R^2,(0,0))\to(\mathbb R^2,(0,1))\) is
\(\mathcal A\)-equivalent to
\[
 f_\infty(X,y)=(X,Xy^2+y^4).
\]
The source diffeomorphism intertwines \((t,u)\mapsto(-t,u)\) with
\((X,y)\mapsto(X,-y)\). This classifies the full germ, rather than a finite
Taylor polynomial. Ordinary analytic inverse and implicit function theorems,
a positive analytic square root, and an exact quadratic factorization suffice.

**Written consequence using an external theorem.** The germ is not finitely
\(\mathcal A\)-determined. The Mather–Gaffney necessary condition is used
in precisely its real-analytic direction below.

**Written stability statement.** The class persists at the nearby intersection
of the quotient critical curve with the reflection axis under sufficiently
small even perturbations. At a prescribed fixed origin one must retain the
critical-point incidence condition. An unrestricted fixed-origin persistence
claim is false.

**External classification correction.** In Rieger's notation as reproduced
by Kabata, the odd perturbations
\((X,Xy^2+y^4+y^{2k+1})\), \(k\ge2\), have labels
\(11_{2k+1}\), not \(4_k\). The latter labels concern
\((x,y^3\mathbin{\pm}x^ky)\). A versal unfolding for the even base germ
is not established here; it is not an unrestricted finite-parameter
\(\mathcal A\)-versal problem of finite codimension.

The accompanying Lean module and replay results are recorded in the companion's
2026-10-16 status entries. Analyticity, the general perturbation statement and
the external classification/determinacy results are written mathematics, not
consequences of a CAS run or of the pre-existing four-jet Lean theorem.

## 1. An ordinary fold before ramification

Put
\[
 q(c)=\sqrt{c(2-c)},\quad
 N(c,u)=(1-c)(1-c-2u),
\]
\[
 M(c,u)=\frac{(1-u)c^2(2-c)-u(1-c)^2(1+c)}{q(c)},\quad
 G=(N,M).
\]
Then exactly \(F(t,u)=G(\cos t,u)\). All expressions are analytic on a
neighborhood of \((1,0)\), since \(q(1)=1\). With the manuscript polynomials
\[
 A(c)=(1-c)c(2-c)(1+2c-c^2),\qquad B(c)=c^3-3c+1,
\]
direct differentiation gives
\[
 DG(1,0)=\begin{pmatrix}0&0\\1&-1\end{pmatrix},\qquad
 J_G=\frac{2(A+uB)}{q^3}.
\]
For \(k=(1,1)\),
\[
 dJ_G(1,0)k=-6,\qquad D^2G(1,0)(k,k)=(6,-3).
\]
Thus the rank is one and the second derivative in the kernel direction is
outside the image \(\operatorname{span}(0,1)\). This is an ordinary fold;
actual charts are constructed below, so recognition is not an extra assumption.
Its critical curve \(u=U(c)=-A(c)/B(c)\) has \(U(1)=0\), \(U'(1)=-2\).
Both its tangent \((1,-2)\) and the kernel \((1,1)\) are transverse to
\(L=\{c=1\}\). The ramification satisfies
\(1-\cos t=2\sin^2(t/2)\), with an odd analytic square-root coordinate.

## 2. Reduction in the nonsingular observation coordinate

For comparison with the proposed calculation, set \(\delta=1-c\), \(x=1-M\),
\[
 a(\delta)=(1-\delta)^2(1+\delta),\quad
 w(\delta)=1-\delta+\delta^2,\quad q_\delta=\sqrt{1-\delta^2}.
\]
Then
\[
 M=\frac{a-uw}{q_\delta},\quad
 u=\frac{a-q_\delta(1-x)}w,\quad N=\mathcal A(\delta)-x\mathcal B(\delta),
\]
\[
 \mathcal A=\delta^2-\frac{2\delta(a-q_\delta)}w
 =3\delta^2+3\delta^3+O(\delta^4),\qquad
 \mathcal B=\frac{2\delta q_\delta}w=2\delta+2\delta^2-\delta^3+O(\delta^4).
\]
Consequently the critical curve in these coordinates is
\(x=\mathcal A'/\mathcal B'=3\delta+O(\delta^2)\).
The quotient source coordinate \((x,\delta)\) is a local chart since
\(x_u(1,0)=1\).

Here is a full germ proof, including the step not supplied by a jet calculation.
Write \(h(x,\delta)=\mathcal A(\delta)-x\mathcal B(\delta)\).
Since \(h_{\delta\delta}(0,0)=6\), the analytic implicit function theorem gives
a unique analytic \(\Delta(x)\) with \(h_\delta(x,\Delta(x))=0\),
\(\Delta(0)=0\), \(\Delta'(0)=1/3\). Put
\(\Gamma(x)=h(x,\Delta(x))\). Taylor's formula at this critical point gives
\[
 h(x,\delta)-\Gamma(x)=(\delta-\Delta(x))^2H(x,\delta),\qquad H(0,0)=3.
\]
The coefficient is analytic: for example, expand the analytic function in the
transverse variable \(\delta-\Delta(x)\); its constant and linear coefficients
vanish. For smooth maps the same assertion follows from Taylor's integral
remainder. This written argument is not a claim that Mathlib supplies that
parametric integral theorem.

Take the positive square root and let
\[
 S=(\delta-\Delta(x))\sqrt H,\quad
 S(x,0)=-\gamma(x),\quad R=S+\gamma(x).
\]
Then \(\gamma(0)=0\), \(\gamma'(0)=\sqrt3/3\), and
\(R(x,0)=0\), \(R_\delta(0,0)=\sqrt3>0\). After subtracting
\(\Gamma(x)+\gamma(x)^2\) in the target, the second component is
\(R^2-2\gamma(x)R\). In fact this target subtraction is zero, since
\(h(x,0)=0\) implies \(\Gamma(x)+\gamma(x)^2=0\).
Set \(X=-2\gamma(x)\); its derivative is nonzero.
There is an analytic positive \(\rho\) with \(R=\delta\rho\),
\(\rho(0,0)=\sqrt3\). Therefore
\[
 y=\sqrt{2\rho(x,1-\cos t)}\sin(t/2),\qquad R=y^2,
\]
and the exact identity is \((X,N)=(X,Xy^2+y^4)\).
Both source derivatives \(X_u(0,0)=-2\sqrt3/3\) and
\(y_t(0,0)=\sqrt{2\sqrt3}/2\) are nonzero, with
\(X_t=y_u=0\). The target \((N,M)\mapsto(X(1-M),N)\) also has nonzero
determinant. The analytic inverse function theorem supplies two-sided local
analytic inverses. Evenness of \(X\) and \(\rho\), and oddness of the sine,
prove the equivariance. This proves the theorem.

## 3. Closed-form charts for independent replay and Lean

The following exact formulas avoid division by \(1-c\) and avoid parametric
integration. They also specify the numerical chart check completely.
Use \(n(a)=N(a,U(a))\), \(m(a)=M(a,U(a))\), and
\[
 W(c)=1-c+c^2,\quad P(c)=-c^4+3c^3-3c+1,\quad
 T(m,c)=\frac{P(c)+2(1-c)mq(c)}{W(c)}.
\]
Eliminating \(u\) gives \(N=T(M,c)\). Define
\[
 \ell(a)=\frac{1-a}{q(a)},\quad
 E(c,a)=-\frac{1+\ell(a)^2}{q(c)+q(a)+\ell(a)(c-a)},
\]
\[
 P_2(c,a)=-3a^2-2ac+6a-c^2+3c,
\]
\[
 K(c,a)=\frac{P_2(c,a)+2m(a)((1-c)E(c,a)-\ell(a))-n(a)}{W(c)}.
\]
Rationalizing the square root proves exactly
\[
 q(c)=q(a)+\ell(a)(c-a)+(c-a)^2E(c,a),
\]
and polynomial subtraction, using the critical-point equation, proves
\[
 T(m(a),c)-n(a)=(c-a)^2K(c,a),\qquad K(1,1)=3.
\]
All denominators are nonzero near \((1,1)\). Since \(m(1)=1\), \(m'(1)=3\),
let \(r\) be its local inverse, \(r(1)=1\), \(r'(1)=1/3\).
Already this gives actual Whitney charts for \(G\):
\[
 s_G(c,u)=\big(r(M)-1,(c-r(M))\sqrt{K(c,r(M))}\big),
\]
\[
 h_G(N,M)=\big(r(M)-1,N-n(r(M))\big).
\]
Their Jacobian determinants at the base points are respectively
\(\sqrt3/3\) and \(-1/3\); the exact fold identity follows from the preceding
factorization. The Lean quotient-fold proof equivalently completes the square
in the boundary coordinate below: its second source coordinate is
\(R+X(a)/2\) and its second target coordinate is \(N+X(a)^2/4\).
That source determinant is \(-\sqrt3/3\).

For the boundary-preserving lift define
\[
 L(c,a)=\frac{2-2a-c-2m(a)E(c,a)-cK(1,a)}{W(c)},
 \qquad K(1,a)-K(c,a)=(1-c)L(c,a),
\]
\[
 \rho(c,a)=\sqrt{K(c,a)}+
 \frac{(1-a)L(c,a)}{\sqrt{K(1,a)}+\sqrt{K(c,a)}},\quad
 X(a)=-2(1-a)\sqrt{K(1,a)}.
\]
Then \(\rho(1,1)=\sqrt3>0\) and exactly
\[
 (1-c)\rho(c,a)=(1-a)\sqrt{K(1,a)}-(c-a)\sqrt{K(c,a)}.
\]
The factorization at \(c=1\) gives \(n(a)=-(1-a)^2K(1,a)\). Squaring the
last identity proves
\[
 T(m(a),c)=R^2+X(a)R,\qquad R=(1-c)\rho(c,a).
\]
Thus explicit final charts, agreeing with Section 2, are
\[
 s_F(t,u)=\left(X(r(M(t,u))),
 \sqrt{2\rho(\cos t,r(M(t,u)))}\sin(t/2)\right),
 \quad h_F(N,M)=(X(r(M)),N).
\]
Only \(r\) is specified implicitly, by a nonsingular scalar inverse.
No computation is substituted for existence or smoothness of that inverse.

## 4. Non-finite determinacy

**Written proof; external Mather–Gaffney input.** For
\(f_\infty(x,y)=(x,xy^2+y^4)\),
\[
 J=2y(x+2y^2).
\]
At \(p_\pm=(-2b^2,\pm b)\), \(b\ne0\), each point is an ordinary fold:
the derivative has rank one and the kernel second derivative is \(8b^2\ne0\).
Their common image is \((-2b^2,-b^4)\). Both discriminant tangents are
\(\operatorname{span}(1,b^2)\); indeed the two critical-value arcs coincide.
This bi-germ is unstable: in an infinitesimal trivialization, the source
vector fields contribute vectors in that same image line at both points,
and the target vector field has a single value at the common target point.
The difference between the two deformation values must therefore lie in that
line. A deformation normal to the line on just one branch violates this
necessary condition. Equivalently a small independent translation of one
fold separates the coincident discriminant arcs, which a common target
coordinate change cannot undo.

These unstable bi-germs occur at nonzero target values arbitrarily close to
zero. The necessary isolated-instability condition for finite determinacy
therefore fails. The precise checked reference is Moya-Pérez and
Nuño-Ballesteros, *Finite C0-determinacy of real analytic map germs with
isolated instability*, Publicacions Matemàtiques 64 (2020), 563–575,
Section 2, Theorem 2.1 and **Corollary 2.2(3)**, pp. 565–566,
[full text](https://ddd.uab.cat/pub/pubmat/pubmat_a2020v64n2/pubmat_a2020v64n2p563.pdf),
[DOI](https://doi.org/10.5565/PUBLMAT6422008).
We use only finite determinacy implies local stability away from the zero
fibre, not a real converse. The smooth definition is left-right equivalence
by smooth diffeomorphism germs. This proves non-finite smooth
\(\mathcal A\)-determinacy of \(f_\infty\), and hence of \(F\).
Kabata also explicitly records non-finite determinacy of this germ in
Section 2.2, immediately following Table 2, manuscript p. 4.

## 5. Even perturbations: precise persistence statement

**Written theorem.** Let a smooth (respectively analytic) map factor as
\(H(t,u)=g(t^2,u)\), with reflection axis \(L=\{v=0\}\) in the quotient
coordinates \((v,u)\). Suppose at \((0,u_*)\):

1. \(g\) has rank one and is an ordinary fold;
2. its kernel is transverse to \(L\);
3. its critical curve is transverse to \(L\).

Then, after centering source and target at that point and value, \(H\) has
normal form \((X,Xy^2+y^4)\) by a reflection-intertwining source chart.
Here is a proof that includes the role of each hypothesis. Since the kernel
is transverse to \(L\), \(g|_L\) is an immersion. Choose a scalar target
coordinate \(x\) nonzero on its tangent and take quotient source coordinates
\((x,v)\). Write \(g=(x,h(x,v))\). At the point,
\(h_v=0\), \(h_{vv}\ne0\); reverse the second target coordinate if necessary
to make \(h_{vv}>0\). Subtract \(h(x,0)\) in the target. The critical curve
is \(v=\Delta(x)\). Its transversality to \(v=0\) says exactly
\(\Delta'(0)\ne0\). The construction of Section 2 now applies, with
\(R=v\rho\), \(\rho(0)>0\), and \(y=t\sqrt\rho\). The inverse function
theorem proves both charts are local diffeomorphisms. This proves the claim.

For the Stokes map, the quotient coordinate \(v=t^2\) differs from
\(\delta=1-\cos t\) by a positive analytic unit, so the checked fold and
transversality hypotheses apply. Nonvanishing conditions on the quotient
2-jet are open. Moreover the restriction of the quotient Jacobian to \(L\)
has a simple zero. Thus every sufficiently close quotient perturbation has a
unique nearby intersection with \(L\), by the implicit function theorem;
all three conditions persist there. Closeness means \(C^2\) on a fixed
quotient neighborhood; in the original even variables a sufficiently small
\(C^4\) neighborhood controls the requisite jets on the axis. Shrink the
neighborhood so the derivative giving the simple zero keeps its sign and the
endpoint signs bracket it. Continuity then gives the intersection and the
open conditions. For analytic families the conclusion is analytic.

Every smooth even germ has a smooth quotient extension in \((t^2,u)\), by
the smooth invariant-function theorem for the reflection representation
(the basic invariant polynomials are \(t^2,u\)); the quotient extension to
\(v<0\) need not be unique, but its jets on the axis are determined.
The external source is G. W. Schwarz, *Smooth functions invariant under the
action of a compact Lie group*, Topology 14 (1975), 63–68,
[DOI](https://doi.org/10.1016/0040-9383(75)90036-1), Theorem 1.
The precise theorem statement was additionally checked in M. Davis,
*Smooth G-manifolds as collections of fiber bundles*, Pacific J. Math. 77
(1978), Chapter II, Theorem 1.1 (Schwarz), p. 324,
[full text](https://msp.org/pjm/1978/77-2/pjm-v77-n2-p05-s.pdf).
A componentwise invariant cutoff reduces the germ statement to that theorem.
For analytic even germs the quotient follows directly by their convergent
power series.

**Fixed-origin correction.** The even perturbation
\((x,xy^2+y^4+\epsilon y^2)\) is an ordinary fold at the origin whenever
\(\epsilon\ne0\); its exceptional point is \((-\epsilon,0)\).
Consequently persistence without recentering is false. If the quotient
critical incidence at the chosen origin is imposed, the three nonvanishing
conditions form an open condition *within that incidence class* and the germ
classification persists there. No unrestricted \(\mathcal A\)-stability
claim is made.

**Written relative determinacy corollary.** Among even germs
\(H(x,-y)=H(x,y)\) with the same ordinary four-jet as
\((x,xy^2+y^4)\), the full germ is determined up to the reflection-preserving
source equivalence used here. Indeed, the quotient \(H(x,y)=g(v,x)\),
\(v=y^2\), has the same ordinary two-jet as \((x,xv+v^2)\).
Every even monomial of original degree greater than four has quotient degree
at least three. At the origin the quotient kernel is the \(v\)-axis,
the critical curve has tangent \(x=-2v\), and its kernel second derivative
in the second target component is \(2\). The three hypotheses above follow,
so the general construction proves the corollary. This relative even
four-jet statement is compatible with failure of unrestricted finite
A-determinacy; odd perturbations are excluded from this relative assertion.

## 6. Symmetry breaking and the remaining problem

**External labels, checked 2026-10-16.** J. H. Rieger,
*Families of maps from the plane to the plane*, J. London Math. Soc. (2)
36 (1987), 351–369,
[DOI](https://doi.org/10.1112/jlms/s2-36.2.351), is verified bibliographically
on the [author's publication list](https://www2.mathematik.uni-halle.de/rieger/sel6.html).
The publisher full text was not accessible in this replay. The actual
normal forms and notation were checked in Y. Kabata, *Recognition of
plane-to-plane map-germs*, Topology Appl. 202 (2016), 216–238,
[author manuscript](https://eprints.lib.hokudai.ac.jp/repo/huscap/all/68650/kabataTA-rev.pdf),
[DOI](https://doi.org/10.1016/j.topol.2016.01.011): Tables 1–2 and
Proposition 3.5(2), manuscript pp. 4, 10–11.
The types with terms \(y^5,y^7,y^9\) are \(11_5,11_7,11_9\);
Table 2 writes the family \(11_{2k+1}\), \(k\ge2\).
We do not infer an all-orders recognition theorem from Kabata's low-codimension
criteria. The restriction \(k\ge2\) matters: lower odd powers change the
specified jet. A nonzero coefficient of the sole odd monomial can be
normalized by real weighted scalings; this does not say that arbitrary odd
perturbations are determined by their first odd coefficient. Mixed terms
enter the recognition conditions.

**Open next problem.** Specify a restricted symmetry-breaking deformation
category, compute its tangent quotient, and construct and verify a versal
family there, or do so for a chosen finite-codimension odd-perturbed member.
There is also a direct **written infinitesimal obstruction** for the even
base, without assuming a versality theorem. Define the extended tangent space
of \(f_\infty\) to be
\[
 T_e=df_\infty\,\theta_2+\{\eta\circ f_\infty:\eta\in\theta_2\},
\]
where \(\theta_2\) denotes all smooth vector-field germs; this is the
extended version of the tangent-space construction in Kabata, Section 2.1.
For a deformation vector \((a,b)\), take the odd part in \(y\) of
\[
 b(-2y^2,y)-y^2a(-2y^2,y).
\]
This linear operation vanishes on \(T_e\): source tangent terms reduce to
\(h_y\xi_y=0\) on \(x=-2y^2\), while target tangent terms are even because
\(f_\infty(-2y^2,y)=f_\infty(-2y^2,-y)\). Its values on \((0,y^{2k+1})\)
are the linearly independent germs \(y^{2k+1}\), for every \(k\ge2\).
Thus the extended tangent quotient is infinite dimensional. Finitely many
parameter derivatives cannot span it, so a finite-parameter family cannot be
infinitesimally unrestricted A-versal at this base. This is a linear spanning
obstruction, not a claimed unfolding theorem. No finite codimension or versal
family for a Rieger member is calculated here.

## Lean-checked scope

`StokesV5/ExceptionalNormalForm.lean` adds the following public named
statements to the root import, status checks and exhaustive axiom audit:

| Statement | Exact Lean scope |
| --- | --- |
| `observationMap_factors` | Exact composition through the cosine quotient |
| `exceptional_exact_fold_factor` | Exact square factor with the stated positive-domain and nonzero-denominator hypotheses |
| `exceptional_remainder_boundary_difference` | Closed boundary divided difference, with no division by `1-c` |
| `exceptional_coefficients_at_one` | Remainder value `3`, boundary unit `sqrt 3`, axis value `0` |
| `exceptionalRemainder_contDiffAt`, `exceptionalRho_contDiffAt` | Smoothness at `(1,1)` of the actual remainder and boundary unit |
| `exceptionalNormalSource_equivariant` | Global reflection law for the explicit source formula, for every `r` |
| `exceptional_equivariant_charts` | Existence of actual source/target charts, centering, exact eventual germ identity and reflection law for the same witnesses |
| `exceptional_hasFoldOfFoldNormalFormAt` | Full smooth fold-of-fold normal form of `observationMap` at `(0,0)` |
| `quotient_hasWhitneyNormalFormAt` | Actual smooth Whitney normal form of `quotientObservationMap` at `(1,0)` |

The Lean statement is smooth, not analytic. General even-map persistence,
the Mather–Gaffney application, the infinite tangent-quotient argument and
the external Rieger labels are not included in this Lean scope. No new
assumption is introduced to stand for any of them.

## Reproduction and scope

Run `python3 -B papers/legacy-geometry/stokes-caustic/verification/verify_exceptional_germ.py`
from the worktree root. It prints Python, SymPy and mpmath versions and asserts
the exact derivative, elimination, quadratic-remainder, boundary-factor and
bi-germ identities. Separate finite diagnostics check the normal-form Taylor
identity through degree 11 on three specified paths and the actual charts at
four points with 60-digit arithmetic. These do not prove an infinite germ
classification or the cited determinacy theorem.

From `companions/lean/stokes-caustic-v5/`, run `python3 -B verify_lean.py`.
Lean's `IsSmoothChartAt` requires smooth two-sided local inverses. Its
`HasFoldOfFoldNormalFormAt` requires an eventual exact normal-form identity.
The public theorem inventory, status and complete axiom audit are maintained
in the companion. Neither a whole paper nor an external classification list
is called Lean-formalized.

## Verification record, 2026-10-16

Runtime: Python 3.9.6, SymPy 1.14.0, mpmath 1.3.0; pinned Lean 4.33.1 /
Mathlib v4.33.1. Each companion's `python3 -B verify_lean.py` was run from
its own directory. The first line is the pre-extension Stokes baseline;
the next three are the completed working Stokes, Ruled and Bicomplex replays.

```text
PASS 258 public named theorems; build/status/axioms/proof-hole scan
PASS 268 public named theorems; build/status/axioms/proof-hole scan
PASS 224 public named theorems; build/status/full axiom audit/proof-hole scan
PASS 33 public named theorems; build/status/full axiom audit/proof-hole scan
```

`verification/verify_exceptional_germ.py` in this paper directory:

```text
PASS exact factorization/reduction/fold/remainder/boundary/bi-germ certificates
PASS Taylor normal-form identity through degree 11 on 3 specified paths
PASS numerical actual-chart spot checks (4 points, 60 digits; error < 1e-50)
PASS exceptional germ: exact certificates, Taylor diagnostics, numerical charts
```

The unchanged `verify_exact_geometry.py` and `verify_sturm_certificate.py`
were also replayed:

```text
PASS full Jacobian factorization
PASS C0 ordinary-fold determinant is -2u for u>0
PASS C1 kernel transversality factor
PASS third-component derivative factor
PASS radial endpoint norm identity
PASS rational branch starts with u_fold=2 delta+O(delta^3)
PASS radial starting derivative is (0,1,0)
PASS v5 exact algebra on Q != 0
PASS p_b on (0,1): variations 4 -> 3, roots=1
PASS p_b isolation interval: variations 4 -> 3, roots=1
PASS R7 on physical interval: variations 3 -> 3, roots=0
PASS Q17 on physical interval: variations 9 -> 9, roots=0
PASS B has no physical-interval pole: variations 1 -> 1, roots=0
PASS physical-boundary polynomial identity p_b=n-d
```

The root navigation replay returned:

```text
PASS: 13 reading guides, 118 local links, ten current papers, 35 source hashes and TeX inputs.
```

Additional checks passed for the new note/companion Markdown destinations,
the exhaustive 268-theorem source inventory, the proof-hole scan including
`sorryAx`, and `git diff --check`. Initial Lean elaboration failures were
fixed before the successful full replay; there is no outstanding failed
verification. An early duplicate baseline invocation was an execution error;
subsequent Lean builds and both final regressions were sequential. No commit,
push, tag, git-configuration edit or protected publication-file change was made.
