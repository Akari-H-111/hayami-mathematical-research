# Hayami Mathematical Research

This directory is the clean-room research archive for the inverse-Leibniz series and the three reconstructed legacy geometry papers.

## Start here in every research window

- [`RESEARCH_BOARD.md`](RESEARCH_BOARD.md) — current status, next atomic tasks, blockers, and verification entrypoints.
- [`ESTABLISHED_WORKS.md`](ESTABLISHED_WORKS.md) — confirmed papers, research records, authority, and publication identifiers.
- [`RESEARCH_DIRECTIONS.md`](RESEARCH_DIRECTIONS.md) — confirmed derived and advanced research directions.
- [`EXTERNAL_ACTIONS.md`](EXTERNAL_ACTIONS.md) — completed and pending public-platform work.
- [`LEAN_ROADMAP.md`](LEAN_ROADMAP.md) — Lean completion milestones and later formalization candidates.

All Codex windows follow the short routing rules in [`AGENTS.md`](AGENTS.md). The board is the operational source of truth; the four inventories change only when evidence or an approved direction changes.

## Public releases

- Repository: <https://github.com/Akari-H-111/hayami-mathematical-research>
- New Stokes caustic v5 Lean companion v0.04:
  [GitHub Release](https://github.com/Akari-H-111/hayami-mathematical-research/releases/tag/stokes-v5-companion-v0.04).
  Covers all asserted mathematical results mapped in
  [`FULL_PAPER_COVERAGE.md`](companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md).
  The new software version DOI is pending Zenodo publication; do not reuse v0.03's DOI.
- Historical criterion-level Stokes caustic v5 Lean companion v0.03:
  [GitHub Release](https://github.com/Akari-H-111/hayami-mathematical-research/releases/tag/stokes-v5-companion-v0.03) ·
  [Zenodo software DOI 10.5281/zenodo.22735974](https://doi.org/10.5281/zenodo.22735974)
- Historical Stokes caustic v5 Lean companion v0.02:
  [GitHub Release](https://github.com/Akari-H-111/hayami-mathematical-research/releases/tag/stokes-v5-companion-v0.02) ·
  [Zenodo DOI 10.5281/zenodo.22726977](https://doi.org/10.5281/zenodo.22726977)
- Concept DOI for all versions: <https://doi.org/10.5281/zenodo.22726976>
- Verified v0.02 ZIP SHA-256:
  `4ab15df0129d14e4b0d1c0e1b26cdfcc7eaaa41b05021ccf9e3f7363376378d4`

Citation boundary: cite the final-v5 mathematical paper as
[*Observation Discriminant and Spherical Fold Image of the Orthogonal-Circle
Ruled Surface*](https://doi.org/10.5281/zenodo.22728902); cite the Lean
companion only when using its formalization or reproducibility package, using
the version-specific software DOI above. The software concept DOI is not a
paper DOI.

## Public topology

- `papers/inverse-leibniz/` — current manuscripts and development notes.
- `papers/legacy-geometry/` — the three PDF-authoritative legacy reconstructions.
- `companions/lean/` — source Lean companions; current public release packages are under `releases/current/`.
- `verification/` — shared and project-wide replay entrypoints.
- `research/` — separately scoped new constructions and exploratory work.
- `releases/current/` — current sealed publication materials.
- `releases/archive/` — preserved earlier releases and historical outputs.
- `archive/` — local-only recovered sources, supplied drafts, incomplete recovery, and reconstruction records; excluded from the public Git repository pending provenance review.
- `local/` — machine-local build caches and previews; not part of a public release.

## Verification entrypoints

From the repository root:

```bash
python3 -m venv local/cache/python/legacy-reconstruction-venv
local/cache/python/legacy-reconstruction-venv/bin/python -m pip install -r verification/legacy-reconstruction/requirements.txt
local/cache/python/legacy-reconstruction-venv/bin/python -B verification/legacy-reconstruction/verify_all.py
```

The new Stokes v5 v0.04 companion's complete replay entrypoint is
`releases/candidates/stokes-caustic-v5-v0.04/verify.py`.
Its Lean-only exhaustive replay is
`companions/lean/stokes-caustic-v5/verify_lean.py`.
The historical v0.02 replay remains
`releases/current/stokes-caustic-v5/verify.py`.

Sealed v0.01/v0.02/v0.03 remain unchanged. The new v0.04 adds actual smooth
ordinary Whitney-fold charts, full physical locus/discriminant/radial results,
displayed remainders, the exceptional no-fold obstruction and ordinary
four-jet, auxiliary quintic/maximum, fixed Sturm data and rational bounds.
All 258 public named theorems are axiom-audited. The paper's open full-germ
classification/unfolding, plot samples and physical interpretations are
excluded; no general Whitney/Morse or Sturm theorem is assumed.

## Provenance rules

Final PDFs, sealed archives, receipts, and SHA-256 manifests are preserved byte-for-byte. Historical logs retain their original claims and paths; active scripts use the canonical paths above. A matching filename or dimension is never treated as historical proof.
