# Established works and citation boundaries

Reader navigation updated: 2026-10-10. See the [ten-paper catalogue](README.md)
for titles and direct reading links, and the [research board](RESEARCH_BOARD.md)
for current work. These inventories record evidence scopes; they are not a new
whole-paper mathematical or live-platform audit.

## Current papers

| Family | Current editions | Citation and evidence boundary |
| --- | --- | --- |
| [Inverse-Leibniz](papers/inverse-leibniz/README.md) | Papers I-III, illustrated v0.09, sealed published preprints | Individual paper DOIs: `10.5281/zenodo.22668484`, `10.5281/zenodo.22668533`, `10.5281/zenodo.22668633`. Shared-material collection DOI: `10.5281/zenodo.22663942`. Fixed contractions, marking and finite-order hypotheses remain essential. |
| [Information Topology](papers/information-topology/README.md) | Foundations, Arithmetic, Minimal Response; current repository research sources | No registered series DOI, sealed release or Lean formalization asserted. The source import and finite replay do not certify limsup, Hausdorff-dimension or universal claims. Marks are supplied data; the general source bridge remains conditional. |
| [Ruled surface](papers/legacy-geometry/orthogonal-circle-ruled-surface/README.md) | Published v5 paper and companion 0.03 | Paper DOI `10.5281/zenodo.23073642`; software version `10.5281/zenodo.23073654`; software concept `10.5281/zenodo.23073653`. 224 own named Lean theorems, 258 separately audited dependencies; see the coverage map. |
| [Stokes caustic](papers/legacy-geometry/stokes-caustic/README.md) | Published v5 paper and companion v0.04 | Paper DOI `10.5281/zenodo.22728902`; v0.04 software `10.5281/zenodo.23057630`; software concept `10.5281/zenodo.22726976`. 258 mapped public Lean theorems; germ classification/unfolding remain open. Earlier v0.03 remains criterion-level. |
| [Bicomplex successors](papers/legacy-geometry/bicomplex-signal-manifolds/README.md) | Two published successor preprints and software 1.0 | Paper DOIs `10.5281/zenodo.23103026` and `10.5281/zenodo.23103056`; software DOI `10.5281/zenodo.23103299`. 33 selected Lean theorems: neither paper is wholly Lean-formalized. Written and external operator/PDE arguments remain distinct. |

Cite the mathematical paper for its results and the version-specific software
record when using its formalization or reproducibility package. Concept and
collection DOIs are not interchangeable with paper DOIs. See
[CITATION.cff](CITATION.cff) for repository citation metadata.

## Historical and independent evidence

The [research index](research/README.md) lists every independent study and
construction. None of the entries below is part of the ten-paper catalogue.

- [Independent transfer v0.05](research/independent_transfer_v0_05/RESEARCH_LOG.md):
  a new degree-two splitting and fixed projection with exact-rational replay;
  arities 4-22 vanish in that completion and frozen arity 23 is nonzero. This is
  not recovery of the missing historical contraction.
- [Feedback matrices v0.06](research/feedback_matrices_v0_06/RESEARCH_LOG.md):
  exact entry, right-hand-side, solution, inverse and determinant checks for a
  new reproducible feedback system; the historical `34 x 560` entries remain missing.
- [Heegner level-five golden fibre](research/heegner-golden-level-five/README.md):
  *Golden Coordinates at Level Five*, v0.2 portrait article (10 pages) and
  14-page supplement; the v0.1 atlas is a frozen checkpoint. A public research
  archive with no DOI, Zenodo record or sealed release, and no recorded external
  reading. Written proofs depend on the classical CM value and Klein's level-five
  equation; exact checks replay, and the thirteen-order component matching is
  numerical at 100 and 200 digits. `LEAN-PASSED` covers the algebraic core only
  (13 named theorems; see the [formalization map](research/heegner-golden-level-five/FORMALIZATION.md)).
  The [literature audit](research/heegner-golden-level-five/studies/novelty-audit-20261019/README.md)
  establishes no substantive novelty for the later continuation. No novelty,
  priority or RH claim; do not cite it as a published paper.
- [Zero-strip height quotients](research/zero-strip-height-quotients/README.md):
  *Height Quotients*, guided reader v0.3 (12 pages); v0.1 and v0.2 are preserved
  checkpoints. A public research archive with no DOI, Zenodo record or sealed
  release. The classical no-go for a periodic zeta zero divisor and the height
  quotient audit rest on named inputs (local finiteness of the xi divisor,
  Riemann–von Mangoldt). `LEAN-PASSED` covers 34 named theorems in four modules
  and constructs neither the xi divisor nor its count (see the
  [formalization map](research/zero-strip-height-quotients/FORMALIZATION.md)).
  The [novelty verdict](research/zero-strip-height-quotients/paper/revision-v0.2/NOVELTY_VERDICT.md)
  classifies it as a worked synthesis. No RH proof or priority claim; specialist
  overlap review is pending, and it should not be cited as a published paper.
- [Legacy reconstruction](verification/legacy-reconstruction/README.md):
  historical final-PDF hashes, authority classification, claim ledgers and finite
  CAS baseline. Ruled v4 and Bicomplex v12 source ancestors are not recovered
  final sources. Stokes v5 has a content-aligned recovered source candidate.
- [Bicomplex version history](papers/legacy-geometry/bicomplex-signal-manifolds/README.md):
  the two successors replace the historical v11/v12 preprint for current reading;
  intermediate working notes and sealed local checkpoints are not extra papers.

## Status vocabulary

`PUBLISHED` records platform publication evidence at its recorded date.
`SEALED` means a particular immutable local package with hashes and acceptance
records. `LEAN-PASSED` and `CAS-PASSED` apply only to the specified modules or
checks. `PDF-LOCKED` records historical source authority, not mathematical truth.
Research sources shared on GitHub do not acquire a DOI or sealed status by being
committed. See each workstream's original receipt for its precise scope and date.
