# Claim and dependency ledger

Authoritative manuscript: `manuscript/main.tex`. Its LaTeX labels below are
stable locators; earlier Markdown drafts retain their earlier numbering.
EXTERNAL means a cited analytic input. DERIVED means a complete written
argument, not an assertion of priority. LEAN identifies exactly kernel-checked
algebra. EXACT FINITE CHECK never denotes an infinite analytic proof.

| ID | Claim and scope | Status | Manuscript locator / evidence |
|---|---|---|---|
| E1 | Entire xi, its divisor and reflection/conjugation symmetries | EXTERNAL | Opening definitions; DLMF 25.4.3-4; parent source record |
| E2 | RvM count, all-zero Hlawka equidistribution, Fujii discrepancy, uniform Selberg density | EXTERNAL | `eq:rvm`, `eq:fujii`, `eq:density`; FZ Introduction and Lemma 2, scopes in SOURCE_AUDIT.md |
| E3 | Simple critical-line proportion liminf at least 0.4058 | EXTERNAL | `eq:bcy`; BCY Theorem 1.1; our conservative constant is 0.4 |
| E4 | Prime-resonant secondary limit for C2 smooth circle tests | EXTERNAL | `eq:bias`; FZ Theorem 1 and Corollary 2; no interval upgrade |
| D1 | Infinitely many distinct residues in every arc; no eventual unweighted support period or glide | DERIVED classical corollary | `thm:support`: E1 + E2; finite slab and downward equivalence |
| D2 | Quotient metric, compact cylinder/Mobius band, central retraction distance | DERIVED standard topology | `lem:metric`; isometric deck action, fundamental rectangle |
| D3 | Central Haar probability limit and Lipschitz rate O_L(log log H/log H) | DERIVED synthesis | `thm:limit`: D2 + E2; layer cake and circle discrepancy |
| D4 | Infinite raw mass in every central-circle neighborhood; non-Radon | DERIVED | `prop:raw`: D3 proof ingredients; no claim at every off-center point |
| D5 | At least order log H distinct simple-critical-line residues; no period of all critical-line heights | DERIVED packing corollary | `thm:residue`: E2 + E3; capacity floor(H/L)+1 per residue |
| D6 | Closure of projected critical-line heights, including any fixed tail, has Haar measure at least 0.4 | DERIVED | `prop:closure`: E2 + E3 + closed-set weak-limit inequality; no density assertion |
| D7 | Normalized and centered bounded-test perturbation estimates | DERIVED; real scalar algebra also LEAN | `lem:stability`; Lean/EmpiricalStability.lean: normalized_perturbation_bound, centered_perturbation_bound |
| D8 | Even real entire sparse product; simple prescribed divisor; positive axes; tail majorant; order zero | DERIVED standard product analysis | `thm:product`; normal convergence, logarithmic tail, growth split |
| D9 | Infinitely many off-line roots, exact added count 2 floor(log2 H), unchanged quotient limits/rate, smooth secondary limits and RvM/density asymptotic classes | DERIVED obstruction theorem | `thm:blindness` and following paragraph: D7 + D8 + E2/E4; coincidences add multiplicities |
| D10 | Fixed-x Landau leading term and O_x(log H) error class, and cited uniform error class, survive | DERIVED | `prop:landau`; each added term bounded by x; not an exact explicit formula |
| D11 | Normalized zeta multiplier preserves functional equation, pole/residue and trivial-zero orders, but has no ordinary absolutely convergent Dirichlet series on any right half-plane | DERIVED | `prop:dirichlet`; real-axis product growth versus Dirichlet-series limit a1 |
| F1 | Rational tail identities and finite real-factor deviations | EXACT FINITE CHECK | verification/verify_canonical_product.py |
| F2 | Complex rational factor/tail inequalities, prescribed roots, axis positivity and dyadic count endpoints | EXACT FINITE CHECK | verification/verify_complex_factors.py; 1827 cases |
| F3 | Both assert-based verifiers reject assertion-stripped compiled execution | REGRESSION CHECK | verification/test_assertion_guard.py; two scripts, optimization levels 1 and 2 |

The parent Lean modules remain historical limited formal coverage; they do
not formalize E2-E4, D1-D6, or the analytic applications of D7-D11. D7's two
real scalar inequalities use only standard Lean axioms propext,
Classical.choice and Quot.sound; no custom conclusion axioms or sorry.

Not established here: RH; global simplicity; critical-line-only
 equidistribution or density; an interval secondary theorem; Euler-product
or ordinary Dirichlet-series structure for X; exact critical-line values;
non-repetition of individual gaps; exclusion of approximate recurrence.
The sparse model is not zeta and is not an RH counterexample.
