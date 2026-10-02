# Acceptance logs, Bicomplex successor Version 1 (2026-10-02)

- `in-place-replay.txt`: both successor verifiers in the repository (which replay the earlier exact verifiers).
- `extracted-replay.txt`: `verify.py` in a fresh extraction of `bicomplex-successor-v1.0-software-source.zip`; the SHA256SUMS inside the zip all matched first.
- `lean-inplace.txt`, `lean-axioms.txt`, `lean-status.txt`: fresh in-place `verify_lean.py` (Lean 4.33.1): 33 own named theorems, build, status, full axiom audit and proof-hole scan PASS. Only `propext`, `Classical.choice`, `Quot.sound` are allowed. This is partial coverage of selected statements, not a formalization of either paper. The Lean project needs the sibling `ruled-surface-v5`/`stokes-caustic-v5` projects, so it was not rebuilt from the zip alone.
- Rebuild in the extraction: both PDFs recompiled with `pdflatex` (three passes, no Overfull/Underfull/Warning); `pdftotext -layout` of each equals that of the released PDF byte for byte (PDF bytes differ only by creation metadata), and the figure generator reproduced all ten figures matching `FIGURES_MANIFEST.json`.
- Not independent-host evidence: same machine and interpreter. Page renders: all 33 pages (20 + 13) re-rendered and inspected; hashes in `successor/qa/VISUAL_QA.json` and `successor/qa_paper2/VISUAL_QA.json`.
