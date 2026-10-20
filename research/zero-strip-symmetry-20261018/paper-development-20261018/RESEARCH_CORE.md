# Height Quotients of the Riemann Zero Divisor: analytical core

**Status, 2026-10-18.** This continuation-only record does not change the
parent first-cycle conclusions. A “zero” is nontrivial and is counted with
multiplicity unless *support* is explicitly used. RH is not assumed.

## 1. Inputs and notation

Write a positive zero as \(\rho=\tfrac12+x_\rho+i\gamma\), and let \(N(H)\)
be the multiplicity count through \(H\). We use four audited external inputs:

1. \(N(H)=(H/2\pi)\log(H/2\pi e)+O(\log H)\).
2. For every \(\alpha\ne0\), the multiset \(\{\alpha\gamma\}\) is uniformly
   distributed on \(\mathbb R/\mathbb Z\), unconditionally (Hlawka).
3. Uniformly for \(1/2\le\sigma\le1\),
   \[
   N(\sigma,H)\ll H^{1-(\sigma-1/2)/4}\log H. \tag{ZD}
   \]
4. \(\liminf N_0^*(H)/N(H)\ge0.4058\), where \(N_0^*\) counts simple
   positive critical-line zeros.

See SOURCE_AUDIT.md for exact citations. For \(L>0\), set
\(\mathbb T_L=\mathbb R/L\mathbb Z\). Let \(S\) be the unweighted zero support
in centered coordinates, and let \(\Gamma\) be the set of distinct positive
critical-line ordinates. These are not interchangeable objects.

## 2. Support theorem

### Theorem 2.1 (dense height support and no eventual period)

For every \(L>0\), the projected positive-height support in \(\mathbb T_L\)
is dense; indeed every nonempty open arc contains infinitely many *distinct*
projected ordinates. The complete unweighted support has neither a full nor an
eventual vertical translation period, and neither a full nor eventual
half-twisted glide period.

Here eventual translation period means: for some \(H_0\), tail membership is
invariant in both directions under \((x,t)\mapsto(x,t+L)\), whenever both
heights exceed \(H_0\). The glide definition replaces this map by
\((x,t)\mapsto(-x,t+L)\).

**Proof.** Hlawka with \(\alpha=1/L\) gives, for every arc \(I\) with
irrelevant boundary convention,
\[
 \#\{\rho:0<\gamma\le H,\ \gamma\bmod L\in I\}
 =(|I|/L+o(1))N(H). \tag{2.1}
\]
This count includes multiplicity, so it is eventually positive in every arc.
If an arc had only finitely many distinct support residues, a smaller nonempty
subarc avoiding them would contradict the same conclusion. Thus every arc has
infinitely many distinct residues.

Eventual translation invariance would represent every tail residue by a support
point in the compact slab \([H_0,H_0+L]\). The zero support in that slab is
finite because xi is entire and its zeros are locally finite. That contradicts
the preceding infinitude. A glide squares to vertical translation by \(2L\),
so an eventual glide is impossible as well. \(\square\)

This is stronger than the parent divisor-count no-go: it needs
equidistribution to address unweighted support.

### Corollary 2.2 (infinite raw sector mass)

For every nonempty open \(I\subset\mathbb T_L\), the zero-counting mass of
\(\{\rho:0<\gamma,\gamma\bmod L\in I\}\) is infinite.

**Proof.** The right side of (2.1) tends to infinity. This is a claim about
open height sectors, not a claim that every central-circle arc contains
infinitely many critical-line zeros. \(\square\)

## 3. Cylinder and Mobius empirical measures

For \(a\ge1/2\), define
\[
 C_{a,L}=([-a,a]\times\mathbb R)/((x,t)\sim(x,t+L)),
 \quad
 M_{a,L}=([-a,a]\times\mathbb R)/((x,t)\sim(-x,t+L)).
\]
They are respectively a closed cylinder and Mobius band. Both have a central
circle \(j:\mathbb T_L\to Q\), \(j([t])=q_Q(0,t)\). Let \(m_L\) be normalized
Haar probability. For \(Q=C_{a,L}\) or \(M_{a,L}\), put
\[
 \nu_{Q,H}={1\over N(H)}\sum_{0<\gamma\le H}
   \delta_{q_Q(x_\rho,\gamma)}. \tag{3.1}
\]
For a metric-level model, if \(e=1\) for \(C\) and \(e=-1\) for \(M\), then
\[
 d_Q([(x,t)],[(y,u)])=\inf_{n\in\mathbb Z}
 \sqrt{(x-e^ny)^2+(t-u-nL)^2}. \tag{3.1a}
\]
The deck action is isometric and properly discontinuous, so this is a metric
inducing the quotient topology. In particular the retraction
\(r([(x,t)])=[(0,t)]\) is well-defined and continuous, with
\(d_Q([(x,t)],r([(x,t)])=|x|\).

### Theorem 3.1 (central-circle weak limit)

For either \(Q\), \(\nu_{Q,H}\Rightarrow j_*m_L\). Equivalently, for every
continuous \(f:Q\to\mathbb C\),
\[
 {1\over N(H)}\sum_{0<\gamma\le H}f(q_Q(x_\rho,\gamma))
 \longrightarrow {1\over L}\int_0^L f(q_Q(0,t))\,dt. \tag{3.2}
\]

**Proof.** Each quotient is compact metrizable, hence \(f\) is uniformly
continuous. Given \(\eta>0\), choose \(\epsilon>0\) such that
\[
 |f(q_Q(x,t))-f(q_Q(0,t))|<\eta\quad (|x|<\epsilon). \tag{3.3}
\]
Applying the quotient map before comparing values makes this valid at the
twisted seam. By symmetry about the critical line and (ZD), the number of
exceptional zeros is
\[
 O(H^{1-\epsilon/4}\log H)=o(N(H)). \tag{3.4}
\]
The normalized averages of \(f(q_Q(x_\rho,\gamma))\) and
\(f(q_Q(0,\gamma))\) consequently differ by at most \(\eta+o(1)\). Hlawka
applied to the continuous circle function \(t\mapsto f(q_Q(0,Lt))\) gives the
right side of (3.2). Let \(\eta\downarrow0\). \(\square\)

The conclusion is a probability weak limit. A zero-density off-line set has
the same limit, so this theorem does not imply RH.

### Corollary 3.1a (a quantitative Lipschitz form)

Let \(D_L^*(H)\) be the star discrepancy of the multiplicity multiset
\(\{\gamma/L:0<\gamma\le H\}\). For a real 1-Lipschitz \(f\) on the metric
(3.1a),
\[
\left|\int f\,d\nu_{Q,H}-\int f\,d(j_*m_L)\right|
\ll {1\over\log H}+L D_L^*(H). \tag{3.5}
\]
Fujii's unconditional discrepancy estimate, recorded by FZ, therefore makes
the right side \(O_L(\log\log H/\log H)\).

**Proof.** The retraction changes the average by at most
\(N(H)^{-1}\sum|x_\rho|\). Layer cake, critical-line symmetry, and (ZD) with
constant \(C\) bound this sum by
\[
2CH\log H\int_0^{1/2}e^{-u\log H/4}\,du\le8CH.
\]
Divide by \(N(H)\asymp H\log H\). On the center circle,
\(u\mapsto f(j([Lu]))\) has total variation at most \(L\). The
one-dimensional discrepancy inequality bounds its empirical/Haar difference
by \(L D_L^*(H)\). \(\square\)

### Proposition 3.2 (raw pushforward fails local finiteness)

\(\mathcal D_Q=\sum_{\rho:\gamma>0}\delta_{q_Q(x_\rho,\gamma)}\) is not
locally finite and hence is not Radon. More strongly, the open height sector
\(q_Q([-a,a]\times\pi^{-1}I)\) has infinite mass for every nonempty arc \(I\).

**Proof.** Its inverse image is the whole relative first factor times an open
periodic height set, hence is open. Corollary 2.2 gives it infinite mass.
Taking \(I=\mathbb T_L\) proves the compact-space assertion. \(\square\)

Every neighbourhood of every point of the *central* circle also has infinite
raw mass. Indeed, it contains a set \(q_Q((-\delta,\delta)\times\pi^{-1}I)\).
Equation (2.1) counts \(\asymp N(H)\) zeros in that height arc, whereas (3.4)
shows that only \(o(N(H))\) can lie outside \(|x|<\delta\). This strengthened
statement must not be extended to off-centre points: under RH such a
neighbourhood can have zero mass.

## 4. Critical-line residue complexity

### Theorem 4.1 (unconditional logarithmic lower bound)

Let \(D_L(H)\) be the number of residues modulo \(L\) represented by simple
critical-line zero ordinates in \((0,H]\). For every fixed \(L>0\), eventually
\[
 D_L(H)\gg_L\log H,\qquad
 \liminf_{H\to\infty}{D_L(H)\over\log H}\ge {0.4L\over2\pi}. \tag{4.1}
\]
Thus \(\Gamma\) has no full or eventual translation period (nor glide period).

**Proof.** The Bui--Conrey--Young liminf theorem gives
\(N_0^*(H)\ge0.4N(H)\) eventually. Its zeros are simple, so they give distinct
ordinates. A residue class contains at most \(\lfloor H/L\rfloor+1\) values in
\((0,H]\). Hence
\[
 D_L(H)\ge {N_0^*(H)\over\lfloor H/L\rfloor+1}. \tag{4.2}
\]
Divide (4.2) by \(\log H\), use
\(N(H)/(H\log H)\to1/(2\pi)\), and
\(H/(\lfloor H/L\rfloor+1)\to L\). The liminf theorem gives (4.1).
An eventual period leaves only finitely many tail residues; on \(x=0\) a glide
is a translation. \(\square\)

No equidistribution assertion for the critical-line-only sequence is made.

## 5. Sparse entire perturbations

Choose \(0<a<1/2\), \(b_n\ge2^n\), \(z_n=a+ib_n\), and define
\[
 P(w)=\prod_{n\ge1}(1-w^2/z_n^2)(1-w^2/\bar z_n^2),\qquad
 X(s)=\xi(s)P(s-\tfrac12). \tag{5.1}
\]
All multiplicities below are multiset multiplicities; \(b_n=2^n\) makes the
prescribed quartets mutually distinct.

### Theorem 5.1 (product, divisor, and axes)

\(P\) converges normally to an even entire function, real on the real axis.
Its divisor is exactly the multiset union of
\(\{z_n,-z_n,\bar z_n,-\bar z_n\}\). The divisor of \(X\) is the additive sum
of this divisor and the xi divisor. Also \(P(u)>0\) and \(P(iv)>0\) for all
real \(u,v\). Thus critical-line zero locations and multiplicities are
preserved. Moreover the real-valued functions
\(t\mapsto\xi(1/2+it)\) and \(t\mapsto X(1/2+it)\) have the same sign away
from their common zeros, since the latter is the former times \(P(it)>0\).
Their values generally are not preserved.

**Proof.** Put \(A_n(w)=(1-w^2/z_n^2)(1-w^2/\bar z_n^2)\). On \(|w|\le R\),
\[
 |A_n(w)-1|\le {2R^2\over b_n^2}+{R^4\over b_n^4}. \tag{5.2}
\]
Indeed, \(|z_n|\ge b_n\) and
\(|z_n^{-2}+\bar z_n^{-2}|\le2/b_n^2\). The majorant is summable, proving
normal convergence and the stated zero divisor by the standard nonzero
infinite-product criterion. For real \(u,v\),
\[
 A_n(u)=|1-u^2/z_n^2|^2,\qquad A_n(iv)=|1+v^2/z_n^2|^2.
\]
Both are strictly positive because \(z_n^2\) is nonreal. The convergent tails
are nonzero on these axes, proving the assertion. Evenness and real structure
are factorwise. \(\square\)

### Proposition 5.2 (certified compact tail)

For \(|w|\le R\), after factors through \(N\),
\[
 \sum_{n>N}|A_n(w)-1|\le B_N(R):={2R^2\over3}4^{-N}
 +{R^4\over15}16^{-N}. \tag{5.3}
\]
If \(B_N(R)<1\), then
\[
 \left|\prod_{n>N}A_n(w)-1\right|\le {B_N(R)\over1-B_N(R)}. \tag{5.4}
\]

**Proof.** Sum (5.2), using
\(\sum_{n>N}4^{-n}=4^{-N}/3\) and
\(\sum_{n>N}16^{-n}=16^{-N}/15\). If nonnegative \(u_n\) have sum \(B<1\),
expanding \(\prod(1+u_n)\) bounds it by \(\sum_{k\ge0}B^k\). Apply this to
\(u_n=|A_n-1|\). \(\square\)

### Theorem 5.3 (asymptotic blindness)

Let \(A(H)=\#\{n:b_n\le H\}\). Then \(A(H)\le\lfloor\log_2H\rfloor\) and
\[
 N_X(H)=N(H)+2A(H). \tag{5.5}
\]
Thus X preserves the Riemann--von Mangoldt main terms and \(O(\log H)\)
remainder class, and has the same quotient weak limits as zeta. For every
\(C^2\) circle test \(h\),
\[
 {1\over H}\left(\sum_{\gamma_X\le H}h(\gamma_X/L)-N_X(H)\int h\right)
 -
 {1\over H}\left(\sum_{\gamma\le H}h(\gamma/L)-N(H)\int h\right)\to0. \tag{5.6}
\]

**Proof.** \(2^n\le b_n\le H\) gives the first bound. Every factor supplies
exactly two positive-height divisor points, \(z_n\) and \(-\bar z_n\), so
(5.5) holds even at coincidences, with additive multiplicity. A bounded
quotient test changes normalized average by \(O(A(H)/N(H))=o(1)\), proving the
weak-limit transfer. The absolute value in (5.6) is at most
\(4\|h\|_\infty A(H)/H=O(\log H/H)\). Ford--Zaharescu's proved smooth-test
secondary statistic therefore transfers after the essential subtraction
\(N_X(H)\). \(\square\)

X has no asserted Euler product or zeta interpretation. It is an entire
countermodel to inferences from these diagnostics, not a counterexample to RH.

