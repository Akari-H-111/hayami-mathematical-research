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
| Ruled surface v5 | Paper and companion 0.03 published 2026-10-01, per local publication receipt | The old v4 repair task is superseded. Preserve v4 as historical evidence and v5's explicit coverage boundaries. | [Current-paper guide](papers/legacy-geometry/orthogonal-circle-ruled-surface/README.md) |
| Stokes caustic v5 | Published paper; companion v0.04 published with mapped asserted-result coverage | Full-germ classification and versal unfolding remain open. Earlier record left v0.04 DOI resolution pending; no fresh resolution claim is made here. | [Current-paper guide](papers/legacy-geometry/stokes-caustic/README.md) |
| Bicomplex successors 1-2 | Papers and software 1.0 published 2026-10-02; recorded readback 2026-10-03; partial Lean coverage | No required next task. Actual singular Dirac/Pin and sheaf-to-operator questions remain open; disproved historical claims are not pending proof goals. | [Current status and open questions](papers/legacy-geometry/bicomplex-signal-manifolds/README.md) |
| Independent transfer v0.05 / feedback matrices v0.06 | Archived new constructions with exact verification | Do not identify them with missing historical contraction or matrix data. | [Established works](ESTABLISHED_WORKS.md) |

Publication statuses above come from existing repository records and the author's
local handoff; they are not a new live audit of publication platforms. The Ruled
v5 paper/software identifiers are `10.5281/zenodo.23073642` and
`10.5281/zenodo.23073654`. Paper and software DOIs remain distinct.

## Verification routes

Use the [verification guide](verification/README.md) for exact commands and
scope. Each series guide links its authoritative sources and coverage map.
Never use Python `-O`. Finite checks cannot replace universal proofs, and named
Lean theorem counts cannot be promoted beyond their claimwise coverage.

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
