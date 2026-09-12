# Publication readiness

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

## Blocking decisions before public upload

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
- A local Git repository now exists, with no commit or remote yet.
- No GitHub remote has been created and nothing has been pushed.
- No Zenodo draft or deposit has been created by this workflow.
