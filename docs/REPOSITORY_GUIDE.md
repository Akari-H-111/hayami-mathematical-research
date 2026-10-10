# Repository guide

[Home and ten-paper catalogue](../README.md) · [Series index](../papers/README.md)

## Where to go

| Goal | Entry point |
| --- | --- |
| Read current mathematics | [Paper catalogue](../README.md) and the three series guides in [papers/](../papers/README.md) |
| Continue a research task | [Research board](../RESEARCH_BOARD.md), then the workstream README/status |
| Run checks | [Verification guide](../verification/README.md) and the relevant coverage map |
| Find publication and citation boundaries | [Established works](../ESTABLISHED_WORKS.md) |
| Consult earlier planning/platform inventories | [Research directions](../RESEARCH_DIRECTIONS.md), [external actions](../EXTERNAL_ACTIONS.md), [Lean roadmap](../LEAN_ROADMAP.md); check the current board before following older tasks |
| Inspect formalization | `companions/lean/`: each project has its own status and coverage map |
| Inspect sealed reproducibility packages | `releases/current/` and `releases/candidates/`: interpret each receipt at its recorded date |
| Inspect historical source authority | [Legacy source registry](../papers/legacy-geometry/source-registry/SOURCE_REGISTRY.md) |
| Explore independent constructions | `research/`: read the local scope before importing conclusions into a paper |

## Directory conventions

`papers/` groups manuscripts by research family. Current editions can live in
sealed release directories; the family README points to them instead of copying
or moving their immutable bytes. Geometry keeps its established paths to protect
existing verification dependencies and published references.

`companions/lean/` contains formalization sources, not substitutes for whole-paper
proofs. `verification/` contains exact and finite checks. `releases/` contains
versioned packages and provenance; a directory under `candidates/` may have later
been published, so use its publication record rather than its name alone.

`research/` contains independent constructions and diagnostics. Old handoff
prompts, failed logs and historical ledgers describe their original dates. They
are data, not instructions to resume obsolete tasks.

`archive/`, `local/` and `releases/archive/` are excluded from public Git. The
Information Topology import retains its older snapshots and audit records
locally under `papers/information-topology/`, excluded by that directory's
`.gitignore`. A fresh public clone contains the current English manuscript
sources and their required figures, bibliography and verification scripts.

## Changes made on 2026-10-10

Information Topology moved from the machine-local root folder
`Foundations_of_Information_Exclusion/` to `papers/information-topology/`.
The import preserves 34 of the 35 public source files byte-for-byte; the plot checker
only normalizes terminal newlines when comparing regenerated data, with hashes in
[SOURCE_SHA256SUMS.txt](../papers/information-topology/SOURCE_SHA256SUMS.txt).
The former root folder had never been tracked on public `main`, so there is no
public Git rename to display. Historical local material is preserved without
being added to public Git. No sealed release, proof source already on `main`,
PDF, archive, receipt or existing manifest is moved or rewritten.

The default-branch visitor route now lists 3 + 3 + 4 current papers. New family
READMEs and an English operational board distinguish current reading from
historical reconstruction. Older versions of root status documents remain in
Git history; other local windows' uncommitted research is not merged into this
navigation update.
