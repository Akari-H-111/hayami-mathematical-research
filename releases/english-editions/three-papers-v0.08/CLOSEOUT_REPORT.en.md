# Corrections to main text, reader context, and citations in the three papers: v0.08

Date: 2026-09-07. Corrections completed under the approved main-text review; v0.07 and original data retained.
No new research images or preprint upload in this version. Three main texts total 74 pages (54/9/11).

## Paper I: repair proofs rather than add restrictions to avoid problems

- Theorem 12.12 now uses a joint uv³,v⁴ certificate. The old weak-fiber Γ certificate applies only to
  a nine-dimensional restricted space and cannot quantify directly over all contractions; the new six-coordinate functional equals
  -6 on tangent parameters and cubic corrections of every
  normalized presentation contraction. The two coefficients cannot both be boundaries, preserving the original conclusion of a nonzero quartic transferred operation.
  Exact QQ coefficient/augmented matrix ranks are 57/58.
- Remark 12.13 gives an example eliminating the single uv³ coefficient outside the weak fiber, explicitly explaining the need for
  a joint proof. Old restricted-space calculations remain separate, no longer presented as a general argument.
- Proposition 15.3 supplies temporal-module minimality for x4,x5; exact ranks of the two windows
  are 8,14. Landing quotient module, well-defined maps, companion basis, and
  canonical polynomial lift are then completed. Sequence shift is explicitly distinguished from dynamics of an individual cochain.
- Repeated low-order expansions moved to Appendix B; main text keeps shared criteria and summary table, with all coefficients and
  minors retained. Optional completed-cotangent discussion and citations outside the current proof chain removed;
  fixed-B locus positioned correctly in the presentation scheme, reducing repetition and unused follow-up topics.

## Paper II: make inputs and tangent spaces identifiable to readers

- Added cochain comparison with Paper I, g3/source definitions, and the recurrent module's
  ordered basis; readers no longer need to identify E,α,ξ across models sharing names.
- T explicitly denotes the full two-dimensional Zariski tangent space, not the reduced germ's tangent space.
  Undefined rigid-germ extension statements removed; tilt parameters no longer share original coordinate names.
- Endpoint remains strict/resonance-faithful naturality and ordinary
  quasi-isomorphism no-go, without rewriting it as a marks-independent invariant.

## Paper III: literature positioning and input boundaries

- Direct comparison to pole-shifting in Sontag's second edition §5.1, Theorem 13, printed page 186;
  observability still points to §6.2. This paper independently proves the coprime-block argument for minimal-polynomial gcd,
  rather than misquoting classical pole-shifting as exactly the same result.
- G_mark replaces G_can, which suggested unconditional uniqueness; a finite relation
  complex without use of exactness is no longer called a resolution. Filtration retains only its actual role.
- Cubic S+2 specialization moved earlier, near the floor theorem. Full pipeline still ends
  at a stable spectral floor on finite marked data within the same tilt orbit;
  operators, seed, state, landing, and source maps remain explicit inputs.

## Completed checks

| Check | Evidence |
|---|---|
| New joint quartic, symbolic tangent parameters, temporal ranks, landing identities | `REPLAY_BODY.txt`, `verify_body_corrections.py` |
| Existing 12 top-level verification groups | `REPLAY_LEGACY.txt` |
| v0.05 full contraction, complete source history, held-out arity 23 | `REPLAY_V05.txt` |
| v0.06 five feedback matrices and one complete contraction | `REPLAY_V06.txt` |
| Countercheck against imposing new controller restrictions on old trajectories | `REPLAY_COUNTERCHECK.txt` |
| Three clean TeX manuscripts, all citation keys/labels, PDF structure and boundaries | Compilation `.log` files and `PDF_QA.json` |
| Human/model visual comparison of 74 pages, full-size rechecks of important/changed pages | `VISUAL_REVIEW.json` bound to final PDF hashes |

All mathematical entry points above were rerun during this revision and ended with exit status 0. Citation counts are
13/6/7; no missing citation keys, unused bibliography entries, undefined/duplicate labels, blank pages, text
overflow, or compilation-layout warnings. Temporary preview images excluded from delivery.

Packaging completion is supported by the external `three_papers_v0_08_bundle.receipt.json`, recording
ZIP CRC, extracted payload hashes, rerun checks, and retention of old v0.07's
140 manifest entries and original ZIP hash. Full v0.05/v0.06 replay completed
before packaging; the two long computations were not repeated after extraction, and hash comparison is not called mathematical replay.

## Closeout judgment and follow-up boundaries

Approved main-text, proof-transition, and citation corrections are complete, providing the main-text baseline before figures.
No separate general-theory research is needed first to complete this version. Later figures require rechecking captions'
mathematical meaning, labels, cross-references, and final PDF layout; this version's visual approval cannot simply carry over.

This is not proof-assistant formalization, external peer review, or a comprehensive priority investigation.
`REFERENCE_AUDIT.md` explicitly distinguishes this round's reading from the previous metadata checks;
not all citations are claimed reread. Missing historical helpers were not fabricated; no arity 24 or
all-orders pure-cubic claim. Different arity-23 results for the two contractions remain separate.

The PDF skill's page-render/verify workflow supports layout approval; Ponytail principles led
verification to reuse existing exact models and helpers, without a duplicate framework or new dependencies.
