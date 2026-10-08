# Verification coverage and outstanding recovery input

2026-09-05. PASS refers to the actual calculations in its named script, not every
mathematical statement in a paper.

| Target | Current evidence | Status |
|---|---|---|
| I: four-point example | 256 weak equations, 32 unknowns, rank 28; exact strict ideal; four Jacobian ranks 32 | Reconstructed, PASS |
| I: dual numbers | Strict ideal; d2 rank 5, H2 dimension 3; effective obstruction rank 1; relation rank 3; graded Leibniz/bracket checks | Reconstructed, PASS |
| I: square-zero example | Weak rank 14; ideal (uv,v²); C1 dimension 18, d1 rank 16, H2 dimension 48; two effective obstructions | Reconstructed, PASS |
| I: cubic germ / finite flat family | All weak/strict equations, Groebner ideal, rational section, multiplication matrices | v0.03 rerun, PASS |
| I: presentation quartic no-go | Lambda/Gamma; explicit 243×18 reduced coefficient rank 10, augmented rank 11 | Reconstructed and corrected, PASS |
| I: intrinsic transfer through arity 7 | Sources regenerated from F1–F6; joint d2 ranks 2,5,9,14; exact minors 1/4,1/18,-1/486,11/34992 | Reconstructed, PASS |
| I: mixed reservoir / raw actuator identity | rho d = identity on 81 directions; raw differential equality for E33 and E23 | Reconstructed, PASS |
| I: full harmonic feedback, arities 8–22 | Narrative and metadata, without full matrices, projections or histories | BLOCKED: missing inputs |
| I: evolving quotient-history actuator flag | Raw identity checked, but quotient histories unavailable | BLOCKED: missing inputs |
| I: low rails, residual modules, landing, strata | Actual bundled cochains and portable v0.32/v0.34/v0.36–40 chain | Rerun, PASS; separate from full high rails |
| II: core, source, comparison | v0.47,49,50,51,54 plus replacement v0.48/v0.53 claims and marked-response regressions | Rerun, PASS |
| III: finite models and supplements | v0.57–61 plus same-orbit, Jordan, descent, generated-seed and end-to-end models | Rerun, PASS; not a formal proof checker |
| Three PDFs | 53+8+11 pages; all-page visual inspection; current SHA-bound review; TeX/QPDF/text QA | PASS |

## Inspected recovery sources

- Workspace and filename searches under Documents/Downloads for early inverse-Leibniz helpers/checkpoints.
- v0.41 source ZIP/local duplicate, available v0.54/v0.61 checkpoint ZIPs, and supplied Part II/III folders.
- Both JSON certificates, including all 13 arity-22 metadata fields and 100 stored partial-homotopy basis elements.
- The requested ChatGPT project and its task `Next research directions`, including arity-19–22 and v0.32–41 messages.
  The reader returns narrative and content-reference placeholders, not download paths for those generated checkpoint artifacts. No unseen attachment is claimed recovered.

## Why the gap is real

The v0.32 JSON records a 34×560 matrix shape, rank 34, pivot determinant
-72343355392 and history rank 174, but not the corresponding matrices or history
columns. Checking those integers in JSON does not prove their ranks.

The v0.33 JSON stores actual low-rail cochains and a 100-element partial-homotopy
source basis. Its span cannot itself encode a full history whose differential has
rank 174. Arbitrarily extending it would change the historical contraction/controller
choices: that would be a different calculation, not a recovery.

## Input needed to close this item

Supply the original arity-8–22 Python/helper bundle or a checkpoint containing:

1. Fixed harmonic projection and contraction/splitting conventions.
2. Full selected F_n coefficients or a deterministic rule reproducing them.
3. Complete source-history columns and chosen homotopy values.
4. Feedback/control matrices and right-hand sides, or code generating them.
5. Pivot row/column indices, if the historical minors are to be reproduced exactly.

Acceptance: rebuild from algebra products and bracket recursion; verify compatibility
with preceding choices; recompute exact feedback/augmented ranks, dangerous rows,
sensitivities, selected controls, history ranks and evolving quotient flags; then
rerun the full bundle. Finitely many rescued arities do not prove all-order transfer.

No preprint was uploaded. This missing-input item remains unchecked. Restoring the
checkpoint is the smallest next step; a different full-feedback construction would
be a separate research choice, not silently substituted here.
