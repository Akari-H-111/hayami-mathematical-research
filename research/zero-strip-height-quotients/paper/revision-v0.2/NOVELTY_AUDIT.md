> Final reading order: see NOVELTY_VERDICT.md for the supervisor
> additions (especially Gauthier-Xarles) and corrected bibliography.

# Adversarial novelty audit: height-quotient package

Date: 2026-10-18.  Scope: the theorem package in `../manuscript/main.tex`,
not a general history of RH.  This is a bounded, evidence-based literature
comparison.  It does **not** certify worldwide priority or exhaustiveness.

## Bottom-line verdict

The manuscript must not present any of its all-zero mod-one distribution,
discrepancy, prime-resonant secondary, or functional-equation-nonuniqueness
content as new.  The first three are directly in Ford--Zaharescu and
Ford--Soundararajan--Zaharescu (with Hlawka and Fujii as antecedents); the
last has strong, explicit predecessors (Koshliakov, Knopp, Burnol, and recent
Nakamura constructions).  The compact cylinder/Mobius language, the
zero-density transverse-moment calculation, and the BCY packing/closure
consequences are elementary repackagings or corollaries, not independent
analytic advances.

The exact dyadic even-product construction, together with the particular
simultaneous transfer of (i) these compact-quotient probability limits,
(ii) the FZ smooth secondary functional, (iii) the stated counting/density
big-O classes, and (iv) fixed-
`x` Landau error classes, was **not located in this documented search**.
That is an assembled-package verdict, not a priority claim.  Its individual
ingredients are standard.  The generic conclusion that a functional equation,
pole normalization, and coarse zero asymptotics do not characterize zeta is
already well represented in prior work, so it cannot bear a novelty claim.

**Gap assessment.**  The broad claimed gap collapses: neither circle-valued
all-zero statistics nor functional-equation nonuniqueness beyond ordinary
Dirichlet series is new.  The narrower gap—this exact sparse-product example
and this stated list of elementary transfers—was not located, but its status
is a documented assembled example, not a claimed first theorem.

## Per-claim verdicts

| Manuscript claim(s) | Verdict | Exact comparison and required framing |
| --- | --- | --- |
| E2; all-zero `\{alpha gamma\}` equidistribution and Fujii discrepancy | **Known theorem** | FZ, pp. 1--2, explicitly attributes unconditional uniform distribution to Hlawka and the unconditional `O(log log T/log T)` discrepancy to Fujii.  FSZ, pp. 2--3, repeats the latter and develops the interval/discrepancy context.  State these solely as inputs. |
| E4; smooth prime-resonant secondary limit | **Already matched prior statement** | FZ, Theorem 1 and Corollary 2 (pp. 3--4) give the secondary measure limit and `C^2` consequence, including the displayed density.  FSZ, pp. 1--3, calls the interval form a conjecture.  Do not call this a new “invariant statistic.” |
| D1; infinitely many residues in every arc; no eventual full/glide support period | **Elementary corollary / standard technique** | The infinite-in-every-arc conclusion follows immediately from all-zero equidistribution plus local finiteness; the period contradiction is a finite-slab argument.  No exact prior statement was located, but this is too direct to describe as an independent theorem. |
| D2; quotient metric, compact cylinder/Mobius band, central retraction | **Standard topology** | This is the ordinary metric quotient of a strip by an isometric `Z`-action.  No zeta-specific predecessor is needed or claimed.  It is notation/geometric packaging, not a research contribution. |
| D3; central-circle weak limit and Lipschitz rate from density plus discrepancy | **Elementary corollary / standard technique** | The circle marginal and rate are consequences of Hlawka/Fujii; the transverse collapse is the layer-cake use of Selberg's density bound.  No exact cylinder/Mobius theorem was located in the bounded search, but the proof is a short pushforward/retraction argument rather than a new zero-distribution theorem. |
| D4; infinite raw mass near the central circle | **Elementary corollary / standard technique** | Combine an arc count with the negligible off-line proportion.  It is a useful warning about normalization, not a novelty-bearing analytic claim. |
| E3; BCY 0.4058 simple-line proportion | **Known theorem** | BCY, Theorem 1.1, p. 1, gives `kappa^* >= .4058`.  The manuscript's 0.4 is a weakening. |
| D5; logarithmically many simple-line residues | **Elementary corollary / standard technique** | A capacity bound of at most `floor(H/L)+1` heights per residue, combined with BCY and Riemann--von Mangoldt.  No exact prior formulation was located.  Call it a packing corollary. |
| D6; Haar measure at least 0.4 for the closure of projected simple-line heights | **Elementary corollary / standard technique** | The closed-set Portmanteau argument plus BCY and all-zero equidistribution is valid in the stated direction.  BCY itself does not state any distribution/closure theorem.  Label it explicitly as a consequence, not “BCY residue equidistribution.” |
| D7; bounded-test stability | **Standard technique** | This is the elementary total-variation/normalization estimate for adding mass.  Lean checking of scalar algebra does not change its novelty status. |
| D8; even real entire sparse product and its tails | **Standard canonical-product technique** | Locally uniform convergence from summable factor deviations and symmetric prescribed zeros are classical Weierstrass-product material.  The dyadic quartet choice and written bounds are concrete, but not a new theory of canonical products. |
| D9; dyadic added roots preserve the named quotient, smooth-secondary, and asymptotic classes | **Assembled package not located within the documented search** | No inspected source gave this exact multiplier `xi(s)P(s-1/2)`, this divisor, and all listed transfer targets together.  Each transfer is an immediate mass-`O(log H)` estimate.  The claim must be “we exhibit an explicit example/obstruction,” never “first sparse perturbation” or a generic functional-equation nonuniqueness result. |
| D10; fixed-`x` Landau leading term/error class and FZ uniform error class survive | **Elementary corollary / standard technique** | Added terms have modulus at most `x` and there are `O(log H)` of them.  FZ Lemma 1 supplies a prior uniform Landau bound, but not this product perturbation statement.  The claim is an absorption observation, not preservation of an explicit formula. |
| D11; same functional equation, pole residue and trivial-zero orders but no ordinary absolutely convergent Dirichlet series | **Already matched prior statement for the generic phenomenon; elementary direct proof for this multiplier** | Koshliakov/Knopp already give nonuniqueness after weakening Hamburger-type hypotheses.  Burnol sharpens the Hamburger boundary.  Nakamura gives explicit non-ordinary-Dirichlet examples with Riemann's gamma factor, pole/trivial-zero behavior, Riemann--von Mangoldt analogues, and in some cases off-line zeros.  The manuscript's growth-at-positive-infinity proof does establish its *specific* product is not an ordinary Dirichlet series, but cannot be sold as discovering the boundary. |
| Abstract/Introduction claim that functional equation plus normalization is insufficient | **Already matched prior statement** | Must cite and attribute the broad phenomenon to the foregoing literature.  Retain only the particular sparse-product test object as the manuscript's worked example. |

## Directly inspected primary sources

The page numbers below are printed/PDF pages.  “Inspected” means the cited
pages/sections were read, rather than inferred from a search snippet.

| Source, inspected version/date | Pages/sections inspected | What it establishes for this audit |
| --- | --- | --- |
| K. Ford and A. Zaharescu, *On the distribution of imaginary parts of zeros of the Riemann zeta function*, [arXiv:math/0405459v2](https://arxiv.org/pdf/math/0405459), v2 dated 2004-09-30 | pp. 1--7, especially (1.3)--(1.10), Theorem 1, Corollary 2, Lemmas 1--2 | Reports Hlawka and Fujii; defines the all-zero secondary measure; proves the smooth-test limit and records Landau/density inputs. |
| K. Ford, K. Soundararajan, A. Zaharescu, *... II*, [arXiv:0805.2745v3](https://arxiv.org/pdf/0805.2745), v3 dated 2009-01-10 | pp. 1--3 (equations (1.1)--(1.4), Conjectures 1--2); pp. 14--15 for the `L`-function extension | Makes the interval refinement explicitly conjectural and records the unconditional Fujii discrepancy.  This blocks any interval upgrade. |
| H. M. Bui, B. Conrey, M. P. Young, *More than 41% ...*, [arXiv:1002.4127v2](https://arxiv.org/pdf/1002.4127), v2 dated 2011-03-11 | p. 1, definitions of `N_0^*`, `kappa^*`, and Theorem 1.1 | The direct source for `kappa^* >= .4058`; it contains no claimed mod-one distribution of the selected subsequence. |
| T. Nakamura, *L-functions with the Lindelof and Riemann hypotheses and trivial zeros at even negative integers*, [Jxiv preprint v2](https://jxiv.jst.go.jp/index.php/jxiv/preprint/download/620/2150/1971), 2024-02-16 | pp. 2--5, especially §1.2, Theorems 1.3 and 1.5, Proposition 1.6; pp. 16--17 references | Gives explicit same-gamma-factor non-ordinary-Dirichlet examples, discusses Koshliakov and Knopp, and gives Riemann--von Mangoldt analogues.  It is material prior art against broad nonuniqueness rhetoric, but does not match the dyadic product or quotient-statistic preservation. |
| T. Nakamura, *Functional equation and zeros on the critical line of the quadrilateral zeta function*, [arXiv:1910.09837v4](https://arxiv.org/pdf/1910.09837), v4 dated 2021-07-14 | pp. 1--4, including §1.1 and contents §§1.3--1.4 | Further directly relevant family: Riemann-type functional equation in the Hamburger/Hecke/Knopp setting, but a different construction and different zero statement. |
| J.-F. Burnol, *Deux extensions de Théorèmes de Hamburger*, [arXiv:1106.4749](https://arxiv.org/pdf/1106.4749), submitted 2011-06-23 | pp. 1--2 (Introduction); pp. 10--12 (support-on-arithmetic-progressions discussion) | Proves/extends Hamburger-type rigidity under weaker hypotheses.  It concerns Dirichlet/Mellin support, not the zero divisor, so it is boundary context rather than a predecessor of the quotient theorem. |
| A. Dixit and R. Gupta, *Koshliakov zeta functions I: modular relations*, [arXiv:2108.00810v1](https://arxiv.org/pdf/2108.00810), v1 dated 2021-08-02 | pp. 3--6, especially (2.3)--(2.13) | Inspected primary research treatment of Koshliakov's generalized functional-equation pairs and the Hamburger hypotheses.  It confirms that these are not ordinary `sum a_n n^{-s}` examples in the relevant slot. |

## Earlier primary sources: identified but not directly fetched

These sources are relevant historical antecedents, but this audit did not
obtain a readable primary full text.  They must not be represented as
independently inspected.

| Source | Status and permissible use |
| --- | --- |
| E. Hlawka, *Uber die Gleichverteilung gewisser Folgen, welche mit den Nullstellen der Zetafunktionen zusammenhangen*, Sitzungsber. Osterr. Akad. Wiss. II 184 (1975), 459--471 | Bibliographic details verified in FZ p. 13 and the Austrian Academy catalogue; the direct paper was unavailable in this pass.  Use FZ/FSZ as the directly inspected source for the stated consequence. |
| A. Fujii, *Some problems of Diophantine approximation ... (IV)*, Comment. Math. Univ. St. Pauli 43 (1994), 217--244 | Identified in FZ p. 13 as its Fujii discrepancy reference.  A later Fujii 2002 repository scan was found but returned HTTP 429 on direct inspection. |
| M. I. Knopp, *On Dirichlet series satisfying Riemann's functional equation*, Invent. Math. 117 (1994), 361--372 | Bibliographic record inspected at [NUMDAM/EuDML](https://geodesic.mathdoc.fr/item/IM_1994__117_1_144219/); primary full text was unavailable.  Nakamura pp. 2--3 gives the limited comparison used here. |
| H. Hamburger, *Uber die Riemannsche Funktionalgleichung der zeta-Funktion*, Math. Z. 10 (1921), 240--254; N. S. Koshliakov's original work | Not directly retrieved.  Their hypotheses/constructions are described in the inspected Burnol, Nakamura, and Dixit--Gupta primary research papers. |
| J. Kaczorowski, G. Molteni, G. Perelli, *A converse theorem for Dirichlet L-functions* (2010) | The author-hosted PDF URL in the parent material returned an internal retrieval error in this pass.  It is not needed for the audit's direct product proof; do not label it newly inspected here. |

## Search result on direct geometric-overlap terminology

Focused searches for `"Mobius band" "Riemann zeta" zeros`,
`"cylinder" "Riemann zeta" zeros equidistribution`,
`"quotient measure" "Riemann zeta" zeros`, and
`"pushforward" "Riemann zeta" zeros equidistribution` produced only
unrelated physics/spectral papers, generic topology, or unverified recent
preprints.  No primary work matching the fixed-height cylinder/Mobius
pushforward theorem was located.  This absence supports only the bounded
“not located” result above; it does not establish novelty.

## Required manuscript changes

1. Replace contribution language with the qualified wording in
   `CONTRIBUTION_WORDING.md`.  Delete any implication that the circle
   statistics, their prime bias, or functional-equation nonuniqueness are
   new.
2. Add direct prior-work discussion/citations for FSZ, Burnol, and the
   inspected Nakamura preprint.  Verify final publisher metadata before
   citing the 2026 DOI version; the inspected source was the 2024 Jxiv text.
3. In the BCY section say “packing/Portmanteau corollaries from BCY plus
   all-zero equidistribution,” not a new critical-line distribution theorem.
4. In the product section call the result an “explicit sparse-product
   example” or “worked obstruction.”  State precisely which observations it
   preserves and that exact explicit formulas, Euler products, and ordinary
   Dirichlet series are not preserved.
5. Add the figure cautions in `CONTRIBUTION_WORDING.md`.  The proposed
   graphics are schematic or formula-derived bounds, never numerical evidence
   for an analytic theorem or RH.
