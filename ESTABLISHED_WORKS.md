# Established papers and research records

Updated: 2026-10-03

This table records existing project results locatable in manuscripts or verification materials. “Established” does not mean “the whole paper is Lean-proved”; each row's scope governs its formal status.

## Inverse-Leibniz series

| Paper | Current status | Established scope | Manuscript and verification | External identifiers |
| --- | --- | --- | --- | --- |
| Paper I — *The Inverse Leibniz Problem: Reconstruction Fibers, Rigidity, Obstructions, and Deformation DGLAs* | `SEALED`, Zenodo preprint public | v0.09 retains v0.08 mathematics and adds 14 checked vector figures; retain fixed-contraction and finite-order certificate assumptions and the boundary “new construction is not historical recovery” | `releases/current/paper-01-illustrated-v0.09/`; `research/independent_transfer_v0_05/`; `research/feedback_matrices_v0_06/` | DOI `10.5281/zenodo.22668484` |
| Paper II — *Resonance-Marked Naturality and Homotopy-Tilt Non-Invariance in the Inverse-Leibniz Cubic Case* | `SEALED`, Zenodo preprint public | Seven-dimensional recurrent envelope, complete tilt orbit, marked response line and strict resonance-faithful naturality; not a bare quasi-isomorphism invariant | `releases/current/paper-02-illustrated-v0.09/`; its `EVIDENCE_MAP.md` and `qa/EVIDENCE_REPLAY.json` | DOI `10.5281/zenodo.22668533` |
| Paper III — *General Spectral Floors from Marked Deformation Presentations* | `SEALED`, Zenodo preprint public | Marked presentation, stable core, landing/future-output quotient and finite spectral-floor construction; input markings and maps are given data, not natural products of a bare filtration | `releases/current/paper-03-illustrated-v0.09/`; its `EVIDENCE_MAP.md` and `qa/EVIDENCE_REPLAY.json` | DOI `10.5281/zenodo.22668633` |

Joint reproducibility materials for the three papers are published under Zenodo collection DOI `10.5281/zenodo.22663942`. `releases/current/submission-v0.09-zenodo/` is the current DOI-bound package; individual preprint DOIs and the collection DOI are distinct.

## Legacy geometry series

| Paper | Current status | Established scope | Authoritative sources and verification | Publication boundary |
| --- | --- | --- | --- | --- |
| *The Orthogonal Circle Ruled Surface*, v4 | `PDF-LOCKED`, partial `CAS-PASSED`, manuscript correction required | Interior-chart parameterization, nondevelopability, observation field and fold algebra partially reproved; the original global boundary chart and Theorem 5.3 cannot be retained directly as correct theorems | `papers/legacy-geometry/source-registry/final_pdfs/The_Orthogonal_Circle_Ruled_Surface_v4.pdf`; `papers/legacy-geometry/orthogonal-circle-ruled-surface/claims/LEDGER.md` | No “whole paper verified” release before corrected theorems and boundary atlas |
| *Observation Discriminant and Spherical Fold Image of the Orthogonal-Circle Ruled Surface* (Stokes caustic v5) | `PUBLISHED`; Lean companion v0.04 public on both platforms, downloads verified | Asserted mathematics listed in `FULL_PAPER_COVERAGE.md` covered by 258 public Lean theorems: actual ordinary `(x,y^2)` charts, physical locus/discriminant/radial image, expansions / Big-O, exceptional no-fold and ordinary four-jet, auxiliary quintic / maximum, fixed Sturm tables and rational bounds; full germ classification / versal unfolding remain the paper's open questions, not closed by four-jets | `papers/legacy-geometry/source-registry/final_pdfs/The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.pdf`; `companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md`; Zenodo record `23057630` | Paper DOI `10.5281/zenodo.22728902`; v0.04 software DOI `10.5281/zenodo.23057630` (`doi.org` resolution pending read-back); historical v0.03 `10.5281/zenodo.22735974` retains criterion-level scope; software concept `10.5281/zenodo.22726976`, not interchangeable |
| *Geometric Realization of Bicomplex Signal Manifolds*, v12 → two successor papers v1 (Bicomplex) | v12 `PDF-LOCKED`; successor papers v1 and software 1.0 `PUBLISHED` (2026-10-02, retested 2026-10-03); v13 / 0.02 / 0.03 are sealed historical local checkpoints | Paper one: analytic rigidity vs smooth flexibility, carriers and exceptional pullback of observation monodromy, residual geometry; corrects all 66 v12 blocks, v11 4.2 and public descriptions. Paper two: general pseudo-Laplacian theorem at Whitney cross-caps (point traces, (k,k) / U(k) extensions, Green coefficients, Markov / reference-length uniqueness). Lean covers 33 theorems partially | `papers/legacy-geometry/bicomplex-signal-manifolds/README.md` (“Start here”); `…/successor/*.tex`; `companions/lean/bicomplex-signal-manifolds/COVERAGE.md`; `releases/candidates/bicomplex-successor-v1-publication.json` | Paper DOIs `10.5281/zenodo.23103026` / `10.5281/zenodo.23103056`; software DOI `10.5281/zenodo.23103299`; RG `415154912` / `415164048`; historical RG `408878000` retained. Written / external / exact / Lean evidence separated; neither whole paper is Lean-formalized. Historical moment-map derivation unrecovered; actual singular Dirac / Pin remains open |

Page counts, SHA-256 values and source-authority classifications for the three final PDFs are in `papers/legacy-geometry/source-registry/SOURCE_REGISTRY.md`. Only v5 has a closely aligned TeX source candidate; v4 and v12 TeX are ancestors, not recovered missing final sources.

Cross-window continuation on 2026-10-03: the Bicomplex successor papers and software 1.0 are public; no mandatory next task remains. Open mathematics and refuted original claims that are not proof targets are in the Bicomplex README “Start here.” Partial Lean or external PDE / operator proofs are not whole-paper formalization.

## Sealed research records

| Record | Confirmed result | Evidence path |
| --- | --- | --- |
| Independent intrinsic-transfer reconstruction v0.05 | New degree-two splitting and fixed projection pass exact-rational replay; arities 4–22 vanish in the selected completion, frozen arity 23 is nonzero. New construction, not recovery of the missing historical contraction | `research/independent_transfer_v0_05/RESEARCH_LOG.md`; `complete_splitting.json`; `FROZEN_PROJECTION_LOG.txt` |
| Feedback matrices v0.06 | Reproducible new feedback system passes exact checks of entries, RHS, solution, inverse and determinant; original entries/projection of historical `34 x 560` system remain unavailable | `research/feedback_matrices_v0_06/RESEARCH_LOG.md`; `U16_COMPATIBLE_PROBE_LOG.txt` |
| Legacy clean-room reconstruction | Three PDFs hash-bound; claim ledgers, source classifications, CAS baseline and visual QA established | `verification/legacy-reconstruction/README.md`; `RECONSTRUCTION_LOG.md`; `VISUAL_QA.md` |

## Status vocabulary

- `PUBLISHED`: public record verified through platform API or public page.
- `SEALED`: local release package, hashes, replay and visual QA sealed.
- `LEAN-PASSED`: designated Lean theorem/module compiles without `sorry`; not automatic whole-paper coverage.
- `CAS-PASSED`: designated exact-computation entry passes; does not automatically cover external theorems or analytic assumptions.
- `PDF-LOCKED`: faithfully records final-PDF claims; does not reprove their mathematical truth.
- `ACTIVE` / `PLANNED` / `BLOCKED` / `ARCHIVED`: in progress, scheduled, obstructed by an explicit condition, or preserved without further changes, respectively.
