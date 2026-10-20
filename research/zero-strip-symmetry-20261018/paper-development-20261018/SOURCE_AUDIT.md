# Source audit: retrieved primary inputs

Retrieved and inspected on 2026-10-18. Page numbers refer to the PDF pages
printed by the papers. The parent SOURCES.md remains the record for xi and the
initial Riemann--von Mangoldt/topology work.

| ID | Source/version and exact location | Status used here |
|---|---|---|
| FZ | K. Ford and A. Zaharescu, *On the distribution of imaginary parts of zeros of the Riemann zeta function*, arXiv:math/0405459v2, pp. 2, 3, 7, https://arxiv.org/pdf/math/0405459 | Primary research source. Its introduction reports Hlawka's unconditional uniform distribution and Fujii's unconditional \(O(\log\log H/\log H)\) discrepancy; (1.3) defines an all-zero sum with multiplicity; (1.6) gives RvM; Lemma 2 records Selberg's density estimate; Theorem 1 and Corollary 2 prove the smooth-test secondary statement. |
| RvM | H. von Mangoldt, “Zu Riemann's Abhandlung ‘Ueber die Anzahl der Primzahlen unter einer gegebenen Grösse’,” *Journal für die reine und angewandte Mathematik* 127 (1905), 1–20 | Original source lineage for the zero-count formula; the exact modern endpoint convention is supplied by the directly retrieved FZ equation (1.6). |
| H | E. Hlawka, “Uber die Gleichverteilung gewisser Folgen, welche mit den Nullstellen der Zetafunktionen zusammenhangen,” *Sitzungsber. Osterr. Akad. Wiss. Math.-Naturw. Kl. Abt. II* 184 (1975), 459–471; bibliographic entry [7] on FZ p. 13 | Original theorem cited through the directly retrieved FZ paper which states the exact unconditional consequence used. The Hlawka paper was not separately fetched here; no stronger quantitative version is used. |
| BCY | H. M. Bui, B. Conrey, M. Young, *More than 41% of the zeros of the zeta function are on the critical line*, arXiv:1002.4127v2, p. 1, Theorem 1.1, https://arxiv.org/pdf/1002.4127 | Primary source. It defines \(N_0^*(T)\) as simple critical-line zeros and proves \(\kappa^*\ge0.4058\). This work uses only the conservative eventual lower bound 0.4. |
| FSZ | K. Ford, K. Soundararajan, A. Zaharescu, *On the distribution of imaginary parts of zeros of the Riemann zeta function, II*, arXiv:0805.2745v3, pp. 1–3, https://arxiv.org/pdf/0805.2745 | Cross-check. (1.1) is all-zero uniform distribution for continuous tests; (1.4) is smooth-test; the interval formulation is explicitly Conjecture 1. |
| DLMF | NIST DLMF §25.4, equations 25.4.3–25.4.4, https://dlmf.nist.gov/25.4 | Parent-used source for the completed xi definition and functional equation. |

## Input-to-claim map

- Theorem 2.1 uses FZ's report of Hlawka plus local finiteness of xi zeros. It
  is our corollary, not a theorem stated in FZ.
- Theorem 3.1 uses Hlawka and FZ Lemma 2. Its quotient/topology proof is ours.
  It never applies equidistribution to critical-line-only zeros.
- Theorem 4.1 uses BCY Theorem 1.1 and FZ (1.6). It is an elementary packing
  corollary; 0.4 is deliberately weaker than 0.4058.
- Theorem 5.3 uses FZ Theorem 1 and Corollary 2 only for transfer of the
  already-proved smooth second-order statistic. The canonical product and
  sparse-stability argument are ours.

## Prohibited upgrades

FZ Conjecture A and FSZ Conjecture 1 are interval statements and are not used.
FZ's unbounded signed secondary measures are not the probability measures in
Theorem 3.1. BCY proves neither all-zero simplicity nor critical-line-only
equidistribution. No citation here supports RH.

## Final-manuscript additions

The authoritative numbering and full dependency map are now in CLAIMS.md,
using stable LaTeX labels in manuscript/main.tex. Earlier section numbers
above belong to the CLI research core.

- FZ Lemma 1 supplies the uniform Landau error
  O(x log^2(2xH) + log(2H)/log x); only its first component is needed to
  absorb the sparse perturbation. Equation (1.1) supplies the fixed-x class.
- DLMF 25.4.3-4 was directly rechecked for the xi definition and reflection
  formula; the manuscript now displays the normalization explicitly.
- J. Kaczorowski, G. Molteni and A. Perelli, *A converse theorem for Dirichlet
  L-functions*, Comment. Math. Helv. 85 (2010), 463-483, Introduction p. 1:
  https://sites.unimi.it/molteni/research/papers-pdf/23-molteni-A_converse_theorem_for_Dirichlet_L-functions.pdf .
  Directly inspected precise Hamburger hypotheses: ordinary Dirichlet series
  absolutely convergent for Re(s)>1; (s-1)f and (s-1)g entire of finite order;
  paired zeta gamma-factor equation. Used as context, not a proof dependency
  of our real-axis obstruction.
- T. Nakamura, *L-functions with the Lindelof and Riemann hypotheses and trivial
  zeros at even negative integers*, Ann. Mat. Pura Appl. (2026),
  https://doi.org/10.1007/s10231-026-01726-9 . Directly inspected the abstract
  and Introduction 1.2 on non-Dirichlet functions satisfying Riemann's
  functional equation. Used only as related work; none of its new analytic
  results is needed for our theorems.

The projected critical-line closure bound is our Portmanteau corollary, not
a claim attributed to BCY. BCY bounds the simple-zero proportion, not the
distribution of a chosen subsequence on a circle.
