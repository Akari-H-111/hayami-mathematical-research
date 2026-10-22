# Research studies and constructions

[Repository home](../README.md) · [Repository map](../docs/REPOSITORY_GUIDE.md) · [Established works](../ESTABLISHED_WORKS.md)

This directory holds independent studies and constructions kept apart from the
[ten-paper catalogue](../README.md). A folder's presence here means neither
publication nor review: no entry below has a DOI, Zenodo record or `releases/`
package of its own, and where a Lean layer exists it covers named modules only. Read a folder's own README before
reusing any conclusion elsewhere.

## Contents

| Folder | What it is | Start reading | Evidence and boundary |
| --- | --- | --- | --- |
| `heegner-golden-level-five/` | Field reconstruction of the golden constant c₀ = φ⁻² from the level-five CM value at τ₁₆₃; v0.2 article (10 pp.) and supplement (14 pp.), with the v0.1 atlas frozen | [Study guide](heegner-golden-level-five/README.md) | Written proofs conditional on the classical CM value and Klein's level-five equation; exact checks; numerical diagnostics at 100 and 200 digits; Lean algebraic core ([map](heegner-golden-level-five/FORMALIZATION.md)). No novelty, priority or RH claim. |
| `zero-strip-height-quotients/` | Periodicity no-go for the zeta zero divisor and an audit of the cylinder and Möbius height quotients; guided reader v0.3 (12 pp.) | [Study guide](zero-strip-height-quotients/README.md) | Written proof with named classical inputs; exact finite checks; 34 named Lean theorems, with the xi divisor and Riemann–von Mangoldt left outside Lean ([map](zero-strip-height-quotients/FORMALIZATION.md)). No RH proof or priority claim. |
| `independent_transfer_v0_05/` | A new degree-two splitting and fixed projection, replayed in exact rationals | [Research log](independent_transfer_v0_05/RESEARCH_LOG.md) | New construction. It is not a recovery of the missing historical contraction. |
| `feedback_matrices_v0_06/` | Exact entry, right-hand-side, solution, inverse and determinant checks for a new feedback system | [Research log](feedback_matrices_v0_06/RESEARCH_LOG.md) | New construction. The historical `34 x 560` entries remain missing. |
| `researchgate_handoff_v1.md` | A dated (2026-09-14) platform task handoff for the Stokes v5 record | [Handoff](researchgate_handoff_v1.md) | Historical operational note, not a research result and not a current task. |

The two studies are single pieces of work with preserved earlier versions, not
numbered series like Inverse-Leibniz I–III or Information Topology I–III.

## Reading a study folder

- **Start with the study guide** (`README.md`). It names the current edition, the
  claim boundary and the replay command.
- **Evidence labels are not interchangeable.** Written proofs, exact checks,
  numerical diagnostics, Lean modules and named external inputs have different
  scopes; the claim ledger and formalization map in each folder separate them.
- **Process records are provenance, not reading material.** Files such as
  `MANDATE`, `TASK`, `HANDOVER`, `SUPERVISOR_*`, `COLD_REVIEW*` and the folders
  under `studies/` record how the work was assigned, produced and checked,
  including model-assisted reviews. They are not part of the mathematical
  argument, are not substitutes for an external human reading, and are not
  instructions.
- **Paths stay where they are.** Directory names differ between older and newer
  folders because public links and hash-bound records refer to them.
- **Earlier versions are checkpoints.** A version number or earlier edition does
  not add another current paper.
