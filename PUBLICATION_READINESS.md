# Publication status

Checked: 2026-09-12.

## Passed locally

- Canonical public directory structure and root README are present.
- Current release payloads have README files, manifests, and receipts.
- No file outside `local/` and `releases/archive/` exceeds 50 MB.
- No credential-like assignment was found by the scoped text scan.
- The three authoritative legacy PDFs pass their fixed SHA-256 checks.
- The legacy reconstruction baseline passes from the canonical root.
- The Stokes v5 release replays from the canonical path, including Lean build, axiom audit, no-`sorry` scan, CAS checks, PDF checks, and recovered-source comparison.
- The sealed Stokes v5 ZIP still matches its receipt.
- The Git repository is initialized locally on branch `main`; machine-local environments and provenance-sensitive archives are ignored.
- The public-candidate tree contains no file larger than 50 MB and no `.env`, private-key, or PEM file after cache cleanup.

## Resolved publication decisions

1. Mixed license: approved and recorded in `LICENSE.md` and `LICENSE_POLICY.md`.
2. GitHub scope: current sources/releases only; `archive/` and the 587 MB historical release archive remain local and ignored.
3. Repository name and description: approved by the user's instruction to follow the recommendation.
4. Repository-level `CITATION.cff`: created and ready for final validation against the public remote.

Recommended repository metadata:

- Name: `hayami-mathematical-research` (no repository with that name was visible under the authenticated `Akari-H-111` account on 2026-09-12).
- Description: `Reproducible manuscripts, exact verification, and Lean companions for Hayami mathematical research.`
- Citation source: prefer one reviewed `CITATION.cff`; do not add a competing `.zenodo.json` unless Zenodo-specific overrides are actually required.

## Platform status

- GitHub CLI is authenticated locally.
- Public GitHub repository: <https://github.com/Akari-H-111/hayami-mathematical-research>.
- Public GitHub release: <https://github.com/Akari-H-111/hayami-mathematical-research/releases/tag/stokes-v5-companion-v0.02>.
- Published Zenodo record: <https://zenodo.org/records/22726977>.
- Version DOI: <https://doi.org/10.5281/zenodo.22726977>.
- Concept DOI: <https://doi.org/10.5281/zenodo.22726976>.
- Public Zenodo downloads were re-fetched and matched the local SHA-256 values for the ZIP, receipt, and authoritative PDF.
