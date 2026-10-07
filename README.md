# Hayami Mathematical Research

This directory is the clean-room research archive for the inverse-Leibniz series and the three reconstructed legacy geometry papers.
The Bicomplex successor papers (published 2026-10-02) are listed under Public releases; start any Bicomplex window at the [Bicomplex README](papers/legacy-geometry/bicomplex-signal-manifolds/README.md) (“Start here”).

## Start here in every research window

- [`RESEARCH_BOARD.md`](RESEARCH_BOARD.md) — current status, next atomic tasks, blockers, and verification entrypoints.
- [`ESTABLISHED_WORKS.md`](ESTABLISHED_WORKS.md) — confirmed papers, research records, authority, and publication identifiers.
- [`RESEARCH_DIRECTIONS.md`](RESEARCH_DIRECTIONS.md) — confirmed derived and advanced research directions.
- [`EXTERNAL_ACTIONS.md`](EXTERNAL_ACTIONS.md) — completed and pending public-platform work.
- [`LEAN_ROADMAP.md`](LEAN_ROADMAP.md) — Lean completion milestones and later formalization candidates.

All Codex windows follow the short routing rules in [`AGENTS.md`](AGENTS.md). The board is the operational source of truth; the four inventories change only when evidence or an approved direction changes.

## Research checkpoint: 2026-10-07

The [new research record](research/cross-workstream-renewal-20261007/README.md)
and [environment / Git save note](research/cross-workstream-save-20261007/README.md)
record the RH sign criterion, GIR fiber action and AHR joint-phase experiments.
Complete algorithm and RH sources are preserved in the AHR private checkpoint;
written proofs, finite diagnostics and incomplete performance gates remain distinct.

## Public releases

- Bicomplex successor papers and verification companion 1.0 (published 2026-10-02;
  they correct and succeed the 2026 ResearchGate preprint 408878000, which is kept
  unchanged): [*Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity,
  Smooth Flexibility and Observation Monodromy*](https://doi.org/10.5281/zenodo.23103026) ·
  [*Pseudo-Laplacians at Whitney Cross-Caps: Point Interactions on Surfaces Mapped into
  Three-Space*](https://doi.org/10.5281/zenodo.23103056) ·
  [software DOI 10.5281/zenodo.23103299](https://doi.org/10.5281/zenodo.23103299) ·
  [GitHub Release](https://github.com/Akari-H-111/hayami-mathematical-research/releases/tag/bicomplex-successor-v1.0)
  (source-only, no paper PDFs). The Lean project covers 33 selected theorems only;
  neither paper is Lean-formalized. Public pages, downloads and DOIs are verified in the
  [publication record](releases/candidates/bicomplex-successor-v1-publication.json).
  Start at the
  [Bicomplex README](papers/legacy-geometry/bicomplex-signal-manifolds/README.md) (“Start here”).
- Ruled surface v5 verification companion 0.03 (software and source only):
  [GitHub Release](https://github.com/Akari-H-111/hayami-mathematical-research/releases/tag/ruled-surface-v5-companion-v0.03) ·
  [sources and replay](releases/current/ruled-surface-v5-source-v0.03/README.md).
  Claimwise coverage: 224 own public Lean theorems and 258 separately audited
  dependencies. No new PDF is distributed; the article source precedes the
  reader-facing editorial review. New article/software-version/software-concept
  DOIs remain unassigned. The historical Ruled v4 paper DOI is not a new DOI.
- Repository: <https://github.com/Akari-H-111/hayami-mathematical-research>
- New Stokes caustic v5 Lean companion v0.04:
  [GitHub Release](https://github.com/Akari-H-111/hayami-mathematical-research/releases/tag/stokes-v5-companion-v0.04) ·
  [Zenodo software DOI 10.5281/zenodo.23057630](https://zenodo.org/records/23057630).
  Covers all asserted mathematical results mapped in
  [`FULL_PAPER_COVERAGE.md`](companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md).
  Published on both platforms; public API/download hashes match the sealed assets.
  The assigned DOI's `doi.org` resolution is not yet verified; use the Zenodo record link above.
- Historical criterion-level Stokes caustic v5 Lean companion v0.03:
  [GitHub Release](https://github.com/Akari-H-111/hayami-mathematical-research/releases/tag/stokes-v5-companion-v0.03) ·
  [Zenodo software DOI 10.5281/zenodo.22735974](https://doi.org/10.5281/zenodo.22735974)
- Historical Stokes caustic v5 Lean companion v0.02:
  [GitHub Release](https://github.com/Akari-H-111/hayami-mathematical-research/releases/tag/stokes-v5-companion-v0.02) ·
  [Zenodo DOI 10.5281/zenodo.22726977](https://doi.org/10.5281/zenodo.22726977)
- Stokes software concept DOI for its versions: <https://doi.org/10.5281/zenodo.22726976>
- Verified v0.02 ZIP SHA-256:
  `4ab15df0129d14e4b0d1c0e1b26cdfcc7eaaa41b05021ccf9e3f7363376378d4`

Citation boundary: cite the final-v5 mathematical paper as
[*Observation Discriminant and Spherical Fold Image of the Orthogonal-Circle
Ruled Surface*](https://doi.org/10.5281/zenodo.22728902); cite the Lean
companion only when using its formalization or reproducibility package, using
the version-specific software DOI above. The software concept DOI is not a
paper DOI.
For the Bicomplex work cite the two successor papers above; cite the software companion
only when using its verifiers or Lean sources. The 2026 ResearchGate preprint is superseded.

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

The Bicomplex successor papers replay with
`papers/legacy-geometry/bicomplex-signal-manifolds/verification/verify_successor_paper1.py`
and `…/verify_successor_paper2.py` (registered legacy interpreter; never `-O`); the full
command and interpreter table is in the Bicomplex README.

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
