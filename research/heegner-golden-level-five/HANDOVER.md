# Heegner-golden workstream handover

**Date:** 20 October 2026
**Author:** Akari Hayami (Jian-Yu Huang)
**Contact:** akari.h.1.9984@gmail.com
**Status:** Verified public research archive; public release branch.

This note is the entry point for the Heegner level-5 fibre workstream. It
supplements, and does not modify, the frozen completion records inside the
version packets.

## Current reading order

1. `paper/README.md` — the current 10-page portrait
   article, its 14-page landscape supplement, the source bundle, and the
   per-page verification records.
2. `paper-v0.1/README.md` — the frozen 19-page article, twelve-plate
   suite, and fourteen-page atlas. This checkpoint is not revised.
3. `figures/README.md` — shared native-vector plates, exported
   SVG/PNG files, saved data, replay scripts, and the atlas.
4. `studies/novelty-audit-20261019/README.md`, `studies/hermite-geometry-20261019/README.md`,
   and `studies/paper-closure-20261019/README.md` — the literature audit, the
   icosahedral-geometry continuation, and the HMR/RH paper-closure study.
5. `studies/cold-review-sol61-20261019/README.md` and
   `studies/cold-review-layout-20261020/README.md` — the independent
   editorial reviews and director syntheses. These are process records, not
   accepted manuscript text.

## Version status

| Version | Role | State |
| --- | --- | --- |
| v0.1 | 19-page article, twelve plates, fourteen-page atlas | Frozen checkpoint; bytes unchanged |
| v0.2 | 10-page portrait article, 14-page supplement, source zip | Verified completion record; bytes unchanged |

The v0.2 completion hashes are:

- article PDF `b3200ffa4130b5046c8462a2a0f22d1ea30273120442953faf93a01b5f937718`;
- article source `46d473aa9e32528617b3ddc8396987d0240e9717832e537481f43b5eba688fc7`;
- supplement PDF `e4bc0fbe12deeeed7a998be333f534fcf1de8218583170e622b75846d38fe32b`;
- source zip `4f752a6423f9174f61e2872218cf309f0bf8a08329d3a2b3b619697e28e83fbc`.

## Git state

- The workstream lives at `research/heegner-golden-level-five/` and is released
  through the public branch `publish/heegner-golden-v0.2`, based on
  `origin/main` at `cd41476`.
- The branch retains the original archive commit and the 20 October 2026
  repository-facing reorganization. The public repository is the authority for
  the current merge state.
- `logs/` directories and third-party source scans are deliberately excluded
  from the commit. The ignored logs include the large Cox and Hermite scans;
  the commit keeps only the authored and generated research record.
- The v0.2 packet's line `Local draft; no commit, upload, or publication`
  describes its state at completion and remains true for the sealed bytes. This
  handover records the later public archive without rebinding the v0.2 hashes.
- The reorganization moved the current packet to `paper/`, the v0.1 checkpoint
  to `paper-v0.1/`, the shared plates to `figures/`, and process records to
  `studies/`. It did not rewrite any PDF, TeX source, ZIP, or verification JSON.
- `paper/verification/PRESERVATION_CHECK.json` records absolute pre-rename
  paths from the completion run. It remains a historical byte-hash record;
  current relative paths are the ones in this handover and the README map.
- Do not push the shared, divergent `main` checkout directly. Public changes
  travel through the isolated `publish/` branch and a pull request.

## Verification

The v0.2 completion record passes exact CM and square certificates, the
lemma/trigonometric/eigenline checks, the 90-digit Davenport–Heilbronn identity,
both figure-data checkers, the layout/text-layer checker, and qpdf. All 24
article and supplement pages were visually inspected. The source zip was
extracted, its 107-entry manifest verified, the article compiled twice, and the
supplement rebuilt: 10 and 14 pages, identical text layers, and 10/10 article
page renders identical. The rebuilt article differs only in pdfTeX creation
metadata. The 233 earlier authored files match their preservation baseline.

No RH result, Lean formalization, or novelty-priority claim is made. The
HMR/RH bridge remains secondary, and the conductor-815 quartic field retains its
Spearman–Williams attribution.

## Next action

Obtain a fresh external human mathematical reading focused on the CM branch
enclosure and the analytic proof flow. Optional cosmetic polish of the
supplement cover notation is separate from the verified build. No v0.1 or v0.2
artifact needs to be rebuilt for this handover.
