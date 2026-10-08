# Three papers v0.04: closeout results

2026-09-05. Original manuscripts, v0.02, and v0.03 retained; no preprint uploaded.
With user permission, existing PDFs were temporarily converted to preview images for inspection; no new research illustrations were added.

## Completed this round

- Reconstructed four-point, dual-number, and square-zero examples from algebra multiplication and fixed B.
- Reconstructed Lambda/Gamma certificates for the presentation quartic no-go.
- Recomputed arity 4–7 sources from F1–F6, checking joint differential ranks and four exact minors.
- Verified the 81-dimensional mixed-reservoir left inverse and raw block-actuator differential identity.
- Corrected Paper I's reduced quartic system: the 243×18 matrix has rank 10, and augmented rank 11.
  Rank-three ambiguity, Gamma=-16, and the no-go theorem were not withdrawn.
- Reran existing Paper I late-chain, Paper II/III finite models, and v0.02/v0.03 reinforcement checks.
- Completed visual inspection of all pages, plus TeX, QPDF, citations, cross-references, and page-text boundary checks.
- Paper II removed its unnecessary contents for a short paper and condensed repetitive verification discussion; six citations are collected on the final page.
  Sections, proofs, and body-text size retained; page count reduced from 9 to 8.

Final page counts: Paper I 53, Paper II 8, Paper III 11, totaling 72 pages.
VISUAL_REVIEW.json preserves final PDF SHA256 and inspection scope.
After the last recompilation, pagewise raster-hash comparison showed only pages 4,50,51 changed in Paper I;
all 8 Paper II pages rechecked; Paper III is pixel-identical to the inspected version.

The PDF skill's pagewise inspection found Paper II's isolated citation end-page issue; Ponytail principles led this round to
reuse existing cochains and SymPy, without a new algebra framework or runtime dependencies.

## Items not yet complete

Full harmonic feedback, harmonic projection, and selected
source history for Paper I arity 8–22 still lack original data. The original conversation is readable, but the tool provided no download path for the generated checkpoint.
Existing JSON's rank 34, history rank 174, etc. are metadata, not original matrices.

This round did not declare all historical computations independently rerun. The introduction, appendices, legacy-verifier output,
and VERIFICATION_COVERAGE.md explicitly distinguish this. The gap does not refute the cubic main theorem,
quartic no-go, or all-orders low-rail proof, nor is it automatically filled by their PASS results.

Continuation is possible after supplying the original arity 8–22 helper/checkpoint ZIP, without repeating completed work.
The full trio is not yet labeled an unconditionally publication-ready final preprint.

## Reproduction entry

    python verify_all.py
    python record_checks.py

VERIFICATION_LOG.txt preserves actual stdout; QA_RESULTS.json preserves structural and text QA.
RESEARCH_LOG.md retains failures and corrections; VERIFICATION_COVERAGE.md lists coverage and missing pieces.
The v0.03 report is retained as RESEARCH_REPORT_v0_03.md, rather than treating old status as this round's result.
