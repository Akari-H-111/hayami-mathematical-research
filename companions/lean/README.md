# Lean companions

[Repository home](../../README.md) · [Verification guide](../../verification/README.md)

These projects formalize named results or bounded construction slices. They do
not add papers to the repository catalogue, and a successful build does not
upgrade an entire manuscript to Lean-verified status.

| Companion | Relation to the research | Start here | Boundary |
| --- | --- | --- | --- |
| Bicomplex signal manifolds | Selected results for the two Bicomplex successor papers | [Status](bicomplex-signal-manifolds/RESEARCH_STATUS.md) · [coverage](bicomplex-signal-manifolds/COVERAGE.md) | 33 selected theorems; the papers also use written and external operator/PDE arguments |
| Stokes caustic v5 | Claim-mapped companion for the published Stokes paper | [Status](stokes-caustic-v5/RESEARCH_STATUS.md) · [coverage](stokes-caustic-v5/FULL_PAPER_COVERAGE.md) | Named theorem coverage does not settle the open full-germ classification or physical interpretation |
| Ruled surface v5 | Sealed companion source for the published Ruled paper | [Coverage in the current source package](../../releases/current/ruled-surface-v5-source-v0.03/companions/lean/ruled-surface-v5/COVERAGE.md) | Kept in the sealed release package rather than duplicated here |

Use the exact commands in the [verification guide](../../verification/README.md).
Each project pins its own Lean and Mathlib versions. Build caches under `.lake/`
are machine-local and excluded from Git.
