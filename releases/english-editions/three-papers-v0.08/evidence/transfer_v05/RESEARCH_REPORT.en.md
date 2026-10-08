# Paper I independent reconstruction and consolidation of three papers v0.05

2026-09-06. Independent reconstruction completed under user authorization; originals, historical material, and v0.04 retained.
No preprint uploaded and no research illustrations generated this round.

## Established research stopping point

This round no longer presupposes missing historical harmonic projection. Starting from the actual surviving algebra,
100 homotopy assignments, and complete constrained boundary space, it constructs
**a new fully replayable contraction**:

1. kappa_2=0, kappa_3=v^3[zeta]; all H1-input operations of arity 4–22 vanish.
2. Arity 23 was computed only after fixing complete h2,p2, yielding 18 nonzero harmonic monomial
   coefficients with v-degree 6–23. The 9th H2 coordinate of [u v^22] is exactly 4/9.
3. Thus **22 is the last consecutively vanishing order after cubic for this selected contraction**.
   This is not a theorem that no contraction can eliminate arity 23, nor an impossibility proof for all-order
   pure-cubic intrinsic transfer. The formal germ remains C[[u,v]]/(v^3).

The new theorem, complete decomposition, and held-out nonzero proposition are added to Paper I; Paper II,III need not
change general theorems for this selected model and retain their reinforced v0.04 this round.

## From data to proof

| Level | Exact result this round | Traceable data |
|---|---|---|
| Old partial h | All 100 assignments retained; corrected history rank 99 | transfer_through_22.json |
| Arity 7–17 | All actual sources replayable without new h assignments | sources,F,stages |
| Arity 18–22 | New corrected directions 13,14,15,16,17 respectively; cumulative rank 174 | history_columns |
| Compatibility | Closed residuals of all dependent sources vanish modulo complete B2 | complete_and_verify.py |
| Whole space | C1=90,B2=88; C2=2025,rank d2=1895,Z2=130,H2=42 | complete_splitting.json |
| Complete projection | All 2025 h2,p2 columns, 42 harmonic representatives, 1895 complement vectors | Same file |
| Retained old values | 75 low-rail cochains for arity <=22 agree; arity 23's (18,5) OOS value retained | Two replays and heldout certificates |
| Frozen test | Complete projection hashed before R23 computation; projection hashes unchanged afterward; explicit nonzero witness 4/9 | heldout_arity23.json |

Complete d2 is a 30375×2025 sparse integer matrix generated from the matrix-unit Hochschild formula,
with 29430 nonzero entries. The second verification path recomputes d2, QQ kernel/ranks, every
source and shared h,p, rather than copying rank flags from a certificate.
The 304×304 pivot-minor inverse is checked by exact multiplication; remaining coordinate-unit vectors
complete W2, so projection is not defined merely on previously occurring sources.

Complete H2 dimension 42 is neither the two historical harmonic-detector coordinates nor
the formal germ's one-dimensional effective relation space; it must also remain distinct from Paper II's other
42-dimensional tilt space. The new cochain controller's scope may exceed old U16.

## Boundaries retained

- The new folder still lacks the historical 34×560 feedback matrix, complete original projection,
  distinguished sensitivities, and evolving quotient flags. Its two materialized
  sources are bitwise identical to existing files, not a newly recovered checkpoint.
- The new recovery manifest's five non-manifest files pass hash checks; it records its own hash
  as the empty-file hash, so self-check fails. Original data was not altered to hide this.
- New history rank 174 matching the old record does not make the two contractions identical.
  Paper I's later historical numbers for fixed detectors remain explicitly archival, not presented as new replayed theorems.
- This round completed research and delivery by “switching to independent reconstruction,” not recovery of every historical checkpoint.
  The new result removes this direction's dependence on missing data, without replacing unobtained historical evidence.
- Exact finite computation supports the stated scope; no full-paper proof-assistant formalization,
  all-order vanishing, or completed exhaustive literature-novelty review is claimed.

## Verification and layout

All 12 top-level existing regression runs for the three papers succeeded; the Part I runner
covers seven late-chain verifiers; actual output in BASELINE_VERIFICATION_LOG.txt.
The new aggregate replay recomputed complete splitting and held-out
data in its own temporary directory; both are byte-exact with delivered certificates. FINAL_REPLAY_LOG.txt preserves actual output,
with final exit status 0. Complete splitting replay took 451.4 seconds; the subsequent frozen test
also succeeded, including explicit assertions for 18 nonzero monomials, v-degree range, and 4/9.
Failed FROZEN_REPLAY_LOG.txt is retained and not counted as a pass.

Paper I has 56 pages and 14 citations, with zero TeX warnings, missing citations, missing cross-references, off-page characters,
or embedded images; QPDF passes. Full-page visual review completed: initial 55-page compilation inspected, then
final raster hashes compared, with all 22 changed/new pages rechecked; unchanged pages pixel-identical.
Final PDF hash bound in VISUAL_REVIEW.json. Temporary previews later disappeared, but the final PDF
is unchanged, with pagewise raster hashes and review scope retained. Previews are excluded from delivery.

Paper II retains 8 pages and 6 citations, Paper III 11 pages and 7 citations; latest trio
totals 75 pages. Hashes confirm unchanged original three TeX files, v0.04 PDFs, and original ZIP.
The PDF skill's all-page QA preserves separate layout-review and mathematical-verification evidence; Ponytail led this round to
reuse existing algebra, SymPy, and PDF checker, without a new framework or runtime dependencies.

## Delivery and continuation

Latest-trio entry: parent DELIVERY_INDEX_v0_05.md. The new integrated bundle also retains v0.04's
complete replayable suite, with its older Paper I explicitly historical comparison only.
The next stage may choose pre-submission decisions and external review, or separate follow-up research on contraction
selection and eliminating arity 23; these do not enter this round's completed finite-order theorem.
No preprint upload this round.
