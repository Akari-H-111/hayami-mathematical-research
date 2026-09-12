# Hayami Mathematical Research

This directory is the clean-room research archive for the inverse-Leibniz series and the three reconstructed legacy geometry papers.

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

The Stokes v5 Lean companion has its own replay entrypoint in:
`releases/current/stokes-caustic-v5/package/verify.py`.

The sealed v0.01 package remains unchanged in the local historical archive. The current v0.02 source additionally defines the real observation map and proves its Fréchet differentiability on the positive-`Q` chart. Lean certifies that analytic entry layer, finite algebra, and root barriers; CAS certifies the full Jacobian bridge; the general Whitney-fold theorem is not claimed as Lean-formalized.

## Provenance rules

Final PDFs, sealed archives, receipts, and SHA-256 manifests are preserved byte-for-byte. Historical logs retain their original claims and paths; active scripts use the canonical paths above. A matching filename or dimension is never treated as historical proof.
