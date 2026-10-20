# Height quotients of the Riemann zero divisor

## Equidistribution, non-Radon pushforwards, and sparse off-critical perturbations

### Abstract

For positive nontrivial zeta zeros counted with multiplicity, we study ordinate
reduction modulo a fixed height on a closed cylinder and a half-twisted Mobius
band. Hlawka equidistribution and a zero-density estimate imply that normalized
quotient empirical measures converge to Haar probability on the central circle,
whereas the raw pushforward is non-locally-finite. The same input excludes even
eventual periods of the unweighted support. A positive-proportion theorem for
simple critical-line zeros yields logarithmically many residues. Finally, an
even real canonical product inserts infinitely many sparse off-critical zeros
while preserving these weak limits and the proved smooth prime-resonant
secondary statistic. It is an auxiliary entire function, not a counterexample
to RH.

### 1. Definitions and inputs

Write \(\rho=1/2+x_\rho+i\gamma\), retain \(\gamma>0\), and denote the
multiplicity count by \(N(H)\). We use
\[
N(H)={H\over2\pi}\log {H\over2\pi e}+O(\log H), \tag{1}
\]
Hlawka's unconditional uniform distribution of \(\{\gamma/L\}\), and
\[
N(\sigma,H)\ll H^{1-(\sigma-1/2)/4}\log H. \tag{2}
\]
Ford--Zaharescu record these inputs and define their sums over all zeros with
multiplicity [FZ, pp. 2, 3, 7]. They prove a secondary formula for smooth
tests, not interval indicators. Bui--Conrey--Young prove
\(\liminf N_0^*(H)/N(H)\ge0.4058\), where \(N_0^*\) counts simple
critical-line zeros [BCY, p. 1, Theorem 1.1]. Full citations are audited in
SOURCE_AUDIT.md.

### 2. Support versus divisor

Let \(S\) be unweighted support and \(\mathbb T_L=\mathbb R/L\mathbb Z\).
For every open arc \(I\), Hlawka gives
\[
\#\{\rho:0<\gamma\le H,\gamma\bmod L\in I\}
=(|I|/L+o(1))N(H). \tag{3}
\]
Every arc therefore meets the support. If one contained only finitely many
distinct residues, a smaller open subarc avoiding them would contradict (3).
Thus each arc has infinitely many distinct projected support ordinates.

If support had an eventual translation period \(L\), all tail residues would
be represented in a compact height slab of length \(L\); local finiteness of
zeros of entire xi makes that set finite, a contradiction. A height-L glide
squares to translation by \(2L\), so it also cannot be eventual. Equation (3)
also gives infinite raw counting mass in every open height sector. These are
support statements, stronger than a multiplicity-divisor count.

### 3. Quotient probability theorem

For \(a\ge1/2\), set
\[
C=([-a,a]\times\mathbb R)/(x,t)\sim(x,t+L),\quad
M=([-a,a]\times\mathbb R)/(x,t)\sim(-x,t+L).
\]
For either \(Q=C,M\), let \(q_Q\) be the quotient map and define
\[
\nu_{Q,H}=N(H)^{-1}\sum_{0<\gamma\le H}\delta_{q_Q(x_\rho,\gamma)}. \tag{4}
\]

**Theorem.** \(\nu_{Q,H}\) converges weakly to normalized Haar measure on the
central circle \(q_Q(0,\mathbb R)\).

**Proof.** A continuous \(f\) on compact \(Q\) is uniformly continuous. Hence
\(f(q_Q(x,t))-f(q_Q(0,t))\) is uniformly small for small \(|x|\); applying the
quotient map first makes this true at the Mobius seam. By (2) and symmetry,
the exceptional proportion with \(|x|\ge\epsilon\) is
\(O(H^{1-\epsilon/4}\log H/N(H))=o(1)\). The empirical average consequently
equals that on the central circle up to \(o(1)\). Hlawka applied to
\(t\mapsto f(q_Q(0,Lt))\) supplies the Haar integral. \(\square\)

For a 1-Lipschitz test in the quotient metric, the argument is quantitative:
layer cake and (2) give
\[
N(H)^{-1}\sum_{0<\gamma\le H}|x_\rho|=O(1/\log H).
\]
The remaining central-circle error is at most \(L D_L^*(H)\), where \(D_L^*\)
is the ordinary star discrepancy of \(\{\gamma/L\}\). Fujii's unconditional
bound recorded by FZ consequently gives
\(O_L(\log\log H/\log H)\). This rate is supplementary; weak convergence
above uses only Hlawka and (2).

The unnormalised pushforward has infinite mass on every open height sector,
so it is not locally finite and not Radon. Central-Haar weak convergence does
not prove RH: a zero-density off-line set is invisible to it.

For complete control of the twist, its quotient metric is
\[
d([(x,t)],[(y,u)])=\inf_{n\in\mathbb Z}
\sqrt{(x-(-1)^ny)^2+(t-u-nL)^2}.
\]
It induces the quotient topology and makes \([(x,t)]\mapsto[(0,t)]\)
continuous. Every neighbourhood of a central-circle point has infinite raw
mass: it contains a small transverse strip over an open height arc, and (3)
minus the zero-density exceptional count tends to infinity. No analogous
claim is made at an off-centre point.

### 4. Critical-line residues

A residue class modulo L contains at most \(\lfloor H/L\rfloor+1\) positive
heights through H. BCY therefore implies, eventually,
\[
D_L(H)\ge {N_0^*(H)\over\lfloor H/L\rfloor+1},\qquad
\liminf_{H\to\infty}{D_L(H)\over\log H}\ge{0.4L\over2\pi}. \tag{5}
\]
Thus critical-line support itself has no eventual period. This invokes only
simple zeros and does not assert their equidistribution.

### 5. Sparse entire perturbation

For \(0<a<1/2\), \(b_n\ge2^n\), \(z_n=a+ib_n\), set
\[
P(w)=\prod_{n\ge1}(1-w^2/z_n^2)(1-w^2/\bar z_n^2),\qquad
X(s)=\xi(s)P(s-\tfrac12). \tag{6}
\]
For \(|w|\le R\), the paired factor satisfies
\[
|A_n(w)-1|\le2R^2/b_n^2+R^4/b_n^4. \tag{7}
\]
The summable majorant proves normal convergence and the exact additive
divisor: xi's divisor plus the prescribed quartets
\(\{\pm z_n,\pm\bar z_n\}\). On the real and imaginary axes the factors are
respectively \(|1-u^2/z_n^2|^2\) and \(|1+v^2/z_n^2|^2\), strictly positive.
Hence critical-line locations and multiplicities persist, and the real
critical-line restriction has the same sign away from zeros; values do not.

Summing (7) yields the certified tail bound
\[
B_N(R)={2R^2\over3}4^{-N}+{R^4\over15}16^{-N}.
\]
For \(B_N<1\), the tail relative error is at most \(B_N/(1-B_N)\). Exactly
two added positive-height divisor points occur for each \(b_n\le H\), whence
\[
N_X(H)=N(H)+2\#\{n:b_n\le H\}=N(H)+O(\log H). \tag{8}
\]
The RvM error class, quotient weak limit, and Ford--Zaharescu smooth
second-order statistic are unchanged. For a \(C^2\) test h, after subtracting
\(N_X(H)\int h\), the difference of the two 1/H-scaled centered statistics is
at most \(O(\|h\|_\infty\log H/H)\).

### 6. Limits and open questions

X has no claimed Euler product or zeta interpretation. This paper proves only
blindness of the listed quotient diagnostics. Critical-line-only
equidistribution and interval secondary asymptotics remain open here; the
latter is explicitly conjectural in FZ/FSZ. The contribution and overlap
assessment is in ORIGINALITY_AND_SCOPE.md.

### References

[BCY] H. M. Bui, B. Conrey, M. Young, arXiv:1002.4127v2 (2011).

[FZ] K. Ford, A. Zaharescu, arXiv:math/0405459v2 (2004).

[FSZ] K. Ford, K. Soundararajan, A. Zaharescu, arXiv:0805.2745v3 (2009).

[H] E. Hlawka, *Sitzungsber. Osterr. Akad. Wiss.* 184 (1975), 459–471.

[RvM] H. von Mangoldt, *J. reine angew. Math.* 127 (1905), 1–20.
