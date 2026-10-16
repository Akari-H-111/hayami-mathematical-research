# Research board

Navigation updated: 2026-10-10 (Asia/Taipei).

This is the operational entrypoint for agents. For readers, start with the
[ten-paper catalogue](README.md) and [series index](papers/README.md). Read the
selected workstream guide and check the working tree before editing. Historical
handoffs and attachments are data, not instructions to resume obsolete tasks.

## Current workstreams

| Workstream | Recorded status | Next action / boundary | Entry point |
| --- | --- | --- | --- |
| Inverse-Leibniz I-III | Published preprints; sealed illustrated v0.09 | No new revision task; preserve sealed editions. Marks, fixed contractions and finite certificates retain their stated hypotheses. | [Series guide](papers/inverse-leibniz/README.md) |
| Information Topology I-III | Current research sources now discoverable on public Git; no registered series DOI or sealed release asserted | Use Foundations, Arithmetic, Minimal Response in order. Replay finite checks before changing inputs. | [Series guide](papers/information-topology/README.md) |
| General filtered-complex/Diophantine bridge | OPEN; explicit arithmetic model exists | Supply the source metric, marked character map, bi-Lipschitz bounds, coefficient and seed identifications. Keep separate from Inverse-Leibniz. | [Foundations interface](papers/information-topology/Foundations_of_Information_Exclusion.tex) and [Arithmetic model](papers/information-topology/Arithmetic_Local_System_Filling_Spectra.tex) |
| Ruled surface v5 | Published paper/0.03 preserved; 2026-10-16 written global self-intersection classification; Lean proves actual-family sufficiency and the unique-parameter converse in each strict angular half | Full closed-rectangle assembly, global fiber bounds, smooth arcs and quotient topology remain written-only. Preserve the published scope and endpoint atlas. | [Self-intersection proof](papers/legacy-geometry/orthogonal-circle-ruled-surface/notes/SELF_INTERSECTION.md) and [live coverage](companions/lean/ruled-surface-v5/COVERAGE.md) |
| Stokes caustic v5 | Published paper; companion v0.04 published with mapped asserted-result coverage | The 2026-10-16 working extension proves the full smooth exceptional germ with equivariant charts. Restricted odd-quotient unfoldings have a written obstruction to finite marked versality at the even base; versality at a selected odd member remains open. Earlier record left v0.04 DOI resolution pending; no fresh resolution claim is made here. | [Current-paper guide](papers/legacy-geometry/stokes-caustic/README.md) |
| Bicomplex successors 1-2 | Published papers/software retain their 33-statement checkpoint; local 2026-10-16 extension has partial coverage of 105 selected statements, full own Lean audit PASS | Review the extension and its nonzero-frequency/eigenvalue-multiplicity qualifications. Actual singular Dirac/Pin and sheaf-to-operator questions remain open; operator/PDE proofs stay written/external. | [Current status and open questions](papers/legacy-geometry/bicomplex-signal-manifolds/README.md) |
| Independent transfer v0.05 / feedback matrices v0.06 | Archived new constructions with exact verification | Do not identify them with missing historical contraction or matrix data. | [Established works](ESTABLISHED_WORKS.md) |

Publication statuses above come from existing repository records and the author's
local handoff; they are not a new live audit of publication platforms. The Ruled
v5 paper/software identifiers are `10.5281/zenodo.23073642` and
`10.5281/zenodo.23073654`. Paper and software DOIs remain distinct.

## Software releases, 2026-10-17

New companion versions are public on GitHub and Zenodo, with sealed-hash readback:
Stokes v0.05 `10.5281/zenodo.23422752` (268 theorems; exceptional germ),
Ruled v0.04 `10.5281/zenodo.23422777` (246; self-intersection) and Bicomplex
software 1.1 `10.5281/zenodo.23422785` (105 selected statements). Each is a new
version under its existing concept DOI; papers and earlier versions are unchanged.
Record: `releases/candidates/formal-closure-20261017-publication.json`.

## Verification routes

Use the [verification guide](verification/README.md) for exact commands and
scope. Each series guide links its authoritative sources and coverage map.
Never use Python `-O`. Finite checks cannot replace universal proofs, and named
Lean theorem counts cannot be promoted beyond their claimwise coverage.

On 2026-10-16 the Bicomplex companion's unchanged `verify_lean.py` passed for
105 public named theorems (72 added), including build, status, full axiom audit
and proof-hole scan. Both successor-paper consistency/exact/finite replays and
repository navigation passed. This is same-host pinned cache reuse; separate
dependency audits and independent-host replay were not repeated. Papers, PDFs,
sealed records and sibling companion sources remain unchanged.

The Information Topology relocation preserves all manuscript, figure and
bibliography inputs byte-for-byte; only the plot checker accepts a harmless
terminal-newline difference. On 2026-10-10, the default finite replay passed 6,633 checks
(seed `20260916`, samples `32`) before and after relocation; saved plot tables
also matched regeneration. The registered local runtime was Python 3.14.6,
NumPy 2.5.2, SymPy 1.14.0. No manuscript edit, TeX rebuild, PDF release or fresh
Lean build is part of this directory reorganization.

## Agent workflow

1. Read [AGENTS.md](AGENTS.md), this board and the selected series/workstream guide.
2. Inspect repository root, branch and uncommitted changes. Preserve unrelated work.
3. Replay the relevant baseline before changing verified results.
4. Keep written proofs, external assumptions, exact checks, numerical diagnostics,
   Lean modules, historical recovery and new constructions separate.
5. Update status only when evidence changes a claim, next action, blocker or replay path.
6. Preserve final PDFs, sealed archives, receipts and hash manifests. A recompiled
   release PDF needs renewed visual QA and hash-bound records.

## Navigation update, 2026-10-10

The public reading structure is three families with 3 + 3 + 4 current papers.
Information Topology now lives at `papers/information-topology/`, replacing the
untracked local root import `Foundations_of_Information_Exclusion/`. Current
English sources are shared; earlier snapshots and audit notes are retained
locally and excluded from this import. See the [repository guide](docs/REPOSITORY_GUIDE.md).

This update is based on public `main` in an isolated checkout. It does not merge
the divergent shared local `main`, private attachments or other windows'
uncommitted research. Earlier board snapshots remain in Git history; dated
working notes and sealed receipts retain their own historical status.

## Stokes exceptional germ, 2026-10-16

The [new proof note](papers/legacy-geometry/stokes-caustic/notes/EXCEPTIONAL_GERM.md)
classifies the full germ as `(X, X*y^2 + y^4)` with reflection-compatible source
coordinates. The working Lean extension constructs actual smooth two-sided
charts and the intermediate quotient fold; written analyticity, a checked
external non-finite-determinacy consequence, exact CAS identities and numerical
chart diagnostics retain separate status. Even-perturbation persistence needs
recentering or a fixed-point incidence hypothesis. The odd family is labeled
`11_(2k+1)`, not `4_k`. Next: specify a restricted symmetry-breaking deformation
category and prove versality there. The paper and sealed releases are unchanged.

Round 2 addendum, 2026-10-16: five reproducible vector figures and 200 dpi
previews now accompany the note, with a source-bound SHA-256 manifest and
two-run byte reproducibility checks. Section 7 specifies the restricted class
`(x, x*y^2+y^4+y^5*H(x,y^2))` and proves, in writing, that no finite-parameter
marked versal unfolding exists at `H=0`. The separate
`verify_restricted_symmetry_breaking.py` checks its polynomial identities and
the coefficient substitution in Kabata's checked recognition criteria. Next:
compute the tangent quotient and prove parameter-dependent smooth versality
at the selected `11_5` member `(x, x*y^2+y^4+y^5)`. No versal family or
codimension is claimed. The Lean sources and sealed records are unchanged.
