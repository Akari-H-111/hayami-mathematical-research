# Zero-strip height quotients: workstream handover

**Date:** 20 October 2026
**Author:** Akari Hayami (Jian-Yu Huang)
**Contact:** akari.h.1.9984@gmail.com
**Status:** Verified public research archive at `origin/main`.  This branch adds
the `DivisorCells` Lean layer and the 34-theorem count, pending merge.

This is an independent research workstream, not one of the ten catalogue
papers. It began on 18 October 2026 with a bounded study of periodic models for
the Riemann zero divisor and developed into a thematic manuscript with three
revisions. This note is the current entry point; it supplements the frozen
completion records and does not rewrite them.

## Reading order

1. `paper/CURRENT.md` — one-page pointer to the current
   paper edition.
2. `paper/revision-v0.3/README.md` — the current 12-page
   guided reader, its TeX source, figures, editorial review and acceptance
   record.
3. `paper/revision-v0.2/README.md` — the 11-page
   illustrated revision, the novelty audit, and the figure/source bundle.
4. `paper/README.md` — the 9-page v0.1 analytic base and
   its claim/source/reproduction records. This is a historical completion
   record for v0.1, not the current edition.
5. `MATHEMATICS.md`, `RESULTS.md`, `CLAIM_LEDGER.md`, `SOURCES.md`,
   `REVIEW.md` and `REVIEW_RESOLUTION.md` — the first research cycle: written
   proofs, claim labels, sources, adversarial review and repairs.
6. `SUPERVISOR_NO_GO.md` and `SUPERVISOR_COUNTERMODEL.md` — the eventual-period
   strengthening and the auxiliary entire-function countermodel.
7. `FORMALIZATION.md` and `Lean/README.md` — the 34 named Lean theorems in four
   modules, the new cell-partition layer, and the tested read-only Mathlib path.
8. `verification/replay.sh` and
   `paper/REPRODUCIBILITY.md` — the replay commands and
   their limitations.

## Paper editions

| Edition | Pages | Role | PDF SHA-256 |
| --- | ---: | --- | --- |
| v0.1 | 9 | Analytic base: period obstruction, quotient audit, first manuscript | `e1c0c18c2e3dddc5932d5cd5989c1238ade57b7a62b2343cf9f82bf87a55f87e` |
| v0.2 | 11 | Illustrated revision, novelty audit, three figures, figure/source bundle | `6dceeb629e65577520182462acc943f69f4e6ee4ff6fb0e6fee853c49f42705d` |
| v0.3 | 12 | Current guided reader; same theorem/proof and figure content as v0.2 | `12dfa51d7e11fc6a6c82bf27cf6bd6eca9c47dc344b9a38bc70c0c4e210411ec` |

The v0.3 TeX source hash is
`6610661f09f38793f1b5df7c310dd6631b0d2f0dd8c0ae5d66c9270b63fa5023`.
All three PDF hashes match their acceptance records.

## Research scope

- **Written No-Go, with classical external inputs:** the complete multiplicity
  divisor of nontrivial zeta zeros has no positive translation period or glide
  period. Even eventual periodicity is impossible. The decisive inputs are the
  Riemann–von Mangoldt formula and local finiteness of the xi zero divisor.
  No novelty is claimed for this classical consequence.
- **Ambient quotient audit:** ordinary and half-twisted height quotients give
  cylinder and Möbius models. Among the listed ambient quotient types, only the
  full ordinary cylinder carries a compatible topological-group structure. The
  zeta divisor itself does not descend as a periodic divisor.
- **Auxiliary countermodel:** symmetry, the leading zero-count asymptotic,
  critical-line markings and the ambient strip topology do not jointly force
  every zero onto the critical line. Multiplying xi by an explicit real even
  polynomial adds an off-line quartet while preserving those inputs. This is
  not zeta and not a counterexample to RH.
- **Lean coverage:** 34 named theorems in four modules, including the half-open
  cell ladder, multiplicity-preserving cell translation, the bounded-cell
  growth contradiction, and actual zeta zero-support invariance under
  conjugation and functional reflection. The analytic No-Go, the construction
  of the xi divisor, Riemann–von Mangoldt and the quotient homeomorphisms
  remain outside Lean.
- **Paper contribution:** a quantitative central-circle probability limit,
  exclusion of full and eventual support periods, a simple-critical-line
  residue bound, and an infinite sparse off-critical perturbation preserving
  the named probability and smooth secondary limits. The sparse model is not
  an ordinary Dirichlet series; the paper states the arithmetic boundary.

No RH proof or counterexample, no complete Lean formalization, and no priority
claim are made. The v0.2 novelty verdict remains in force.

## Verification replayed on 20 October 2026

- `sh verification/replay.sh` — **PASS**. The 34 named theorems report only
  `propext`, `Classical.choice` and `Quot.sound`; 330 exact polynomial checks
  and the assertion-guard regression pass.
- `sh paper/verification/replay_continuation.sh` —
  **PASS**. 1,827 exact finite complex cases, two scalar Lean inequalities with
  `warningAsError`, and the assertion guard pass.
- The final PDFs are 9, 11 and 12 pages; `pdfinfo`, the acceptance hashes and
  the page counts agree.
- The tested Lean environment is the prepared read-only checkout at
  `/Users/akari_hayami_64/Documents/prime-spherical-fold`, pinned to Lean
  `v4.33.1` and Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`.
  `Lean/lakefile.toml` supplies an untested portable pin for a clean machine.
- The root `verification/replay.sh` defaults to the tested local Lean path and
  accepts `ZERO_STRIP_LEAN_ROOT` on another prepared host with the same pin.
  The paper continuation script uses the same variable.
- A clean-machine dependency installation was not tested. Model-assisted
  review and director inspection are not external human peer review.

## Git and environment state

- The workstream lives at `research/zero-strip-height-quotients/` and is
  released through the public branch `publish/height-quotients-v0.3`. The
  archive started from `origin/main` at `cd41476` and was rebased onto
  `f14a506` for the public release.
- The branch retains the original archive commit and the 20 October 2026
  repository-facing reorganization. The public repository is the authority for
  the current merge state.
- `logs/`, `local-inputs/`, `tmp/`, `.lake/` and `__pycache__/` are excluded by
  the workstream and revision `.gitignore` files. The original user-supplied
  attachments remain outside the archive; their hashes are preserved in
  `SOURCE_INPUTS.json`.
- The v0.1, v0.2 and v0.3 PDFs, sources, figures and acceptance records are
  byte-identical to their completion records. No sealed artifact was edited.
- The paper-development archive moved from `paper-development-20261018/` to
  `paper/`; its internal relative paths and sealed bytes are unchanged.
- Some historical review files retain absolute pre-reorganization paths. They
  are records of the review session, not current navigation; the README map and
  this handover give the current paths.
- The public repository is the release surface. No separate upload, DOI, or
  external publication is implied by this branch.

## Next actions

1. Obtain a specialist overlap review before any submission. The v0.2 audit
   found no independent new theorem or worldwide priority, and identified
   Gauthier–Xarles as the material predecessor.
2. The half-open cell partition, multiplicity-preserving translation and
   bounded-cell/superlinear contradiction now have a Lean model in
   `Lean/DivisorCells.lean`.  The next formalization target is to construct the
   actual locally finite xi divisor and connect its count to
   Riemann–von Mangoldt.  Keep the analytic zero-count growth as a named
   external input until then.
3. Optional: run a second post-fix cold review. The existing cold review was
   completed before the four repairs; the repairs are recorded in
   `REVIEW_RESOLUTION.md`.
4. Optional: test a clean-machine Tectonic/Lean replay. PDF byte identity across
   TeX bundles is not claimed.
