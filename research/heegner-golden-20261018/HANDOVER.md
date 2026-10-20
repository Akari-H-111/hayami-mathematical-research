# Heegner-golden workstream handover

**Date:** 20 October 2026
**Author:** Akari Hayami (Jian-Yu Huang)
**Contact:** akari.h.1.9984@gmail.com
**Status:** Verified local draft; local git archive only, not pushed.

This note is the entry point for the Heegner level-5 fibre workstream. It
supplements, and does not modify, the frozen completion records inside the
version packets.

## Current reading order

1. `paper-v0.2-portrait-20261020/README.md` — the current 10-page portrait
   article, its 14-page landscape supplement, the source bundle, and the
   per-page verification records.
2. `paper-v0.1-20261019/README.md` — the frozen 19-page article, twelve-plate
   suite, and fourteen-page atlas. This checkpoint is not revised.
3. `figures-terra56-20261019/README.md` — shared native-vector plates, exported
   SVG/PNG files, saved data, replay scripts, and the atlas.
4. `novelty-audit-20261019/README.md`, `hermite-geometry-20261019/README.md`,
   and `paper-closure-20261019/README.md` — the literature audit, the
   icosahedral-geometry continuation, and the HMR/RH paper-closure study.
5. `cold-review-sol61-20261019/README.md` and
   `cold-review-layout-sol61-deepseek-20261020/README.md` — the independent
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

- The workstream is recorded on the local branch
  `publish/heegner-golden-v0.2`, based on public `origin/main` at `cd41476`.
- The branch contains a local archive commit with this workstream, the merged
  Heegner entries in `RESEARCH_BOARD.md`, and this handover. It has **not** been
  pushed, uploaded, or published.
- `logs/` directories and third-party source scans are deliberately excluded
  from the commit. The ignored logs include the large Cox and Hermite scans;
  the commit keeps only the authored and generated research record.
- The v0.2 packet's line `Local draft; no commit, upload, or publication`
  describes its state at completion and remains true for the sealed bytes. This
  handover records the later local archive without rebinding the v0.2 hashes.
- To publish later, review the branch diff first, then push the branch and open
  a pull request. Do not push the shared, divergent `main` checkout directly.

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
