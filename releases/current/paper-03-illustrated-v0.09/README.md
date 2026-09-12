# Paper III — illustrated edition v0.09

**Author: Akari Hayami (Jian-Yu Huang).** Local illustrated closeout, 2026-09-08.

The manuscript is `paper_III_spectral_floor_v0_09.pdf`: 22 letter-size pages,
ten vector figures, live captions and cross-references, and seven bibliography
entries. The author line, running headers, PDF metadata and three self-authored
bibliography entries use the requested full name.

The original v0.08 mathematical body is preserved exactly after removing
explicitly delimited illustration/editorial additions and reversing the author
and edition-label updates. Theorems, proofs, original equations and citation
targets are unchanged. The cited companion editions remain v0.08.

## Corrected figures

The ten round6 figures were re-typeset as native LaTeX/TikZ diagrams to correct
clipping, formula/line collisions, the malformed A-tau label and the field glyph.
Main labels are approximately 9.23 pt at the actual manuscript width. The master
pipeline explicitly includes landing descent before forming the dynamical
quotient W/ker Lambda. The stable-core figure keeps the original full tilt orbit.
The future-output diagram separates global, local and failed local descent.
The exact realization includes its complete matrix and quotient map. The scope
figure retains the distinction between supplied markings and bare filtered data.

Figures now follow manuscript order: original round6 1–7 remain 1–7, original
9 and 10 become 8 and 9, and original 8 becomes 10. `EVIDENCE_MAP.md` records the
mapping and the finite checks. Native captions carry the numbering; it is not
baked into the exported diagrams. Float barriers keep the figures with their
corresponding explanations instead of splitting later theorems.

The supplied SVG/PNG files, contact sheet and accompanying note are preserved
byte-for-byte in `provenance/original_figures/`. The original v0.08 TeX/PDF are
preserved in `provenance/`. Native TeX masters and corrected PDF/SVG/200 dpi PNG
exports are in `figures/`. No raster image generator was used.

## Compile and reproduce

Compile the paper from its final TeX and ten vector PDFs:

    tectonic --keep-logs paper_III_spectral_floor_v0_09.tex

Regenerate the TeX from the preserved baseline:

    python -B integrate.py

Rebuild native figures, exports, manuscript and page previews:

    python -B build.py --figures --paper --render

The build uses Python's standard library, Tectonic, QPDF and Poppler
(`pdftocairo`, `pdftoppm`). Figure masters use standard LaTeX/TikZ and standalone;
the manuscript uses graphicx and placeins. Tectonic can fetch missing TeX
packages or fonts on first use. The standalone `/dev/null` and disabled
shell-escape notices are known tool messages; no figure requires shell escape.
Fresh-directory rebuilds test portability with this toolchain.

Run the finite mathematical checks and integration checks with assertions enabled:

    python -B verify_evidence.py
    python -B verify_integrated.py

The tested Python environment contains SymPy 1.14.0, pypdf, pdfplumber and Pillow.
Never use Python `-O`. Six finite-evidence entry points are replayed, including
the v0.03 recovery suite and its v0.02 regressions. This delivery does not repeat
Paper I's high-arity v0.05/v0.06 completion replays.

`qa/EVIDENCE_REPLAY.json` binds the six scripts and logs to their hashes.
`qa/verification.json` records source preservation, metadata, references, PDF
bounds, vector exports and original-file checks. `qa/VISUAL_REVIEW.json` binds
all 22 inspected pages and the ten corrected figures to exact hashes. Recompile
only with the understanding that changed PDF metadata can invalidate this
approval; compare the rendered pages or inspect them again before resealing.

## Integrity and distribution

The source ZIP contains the manuscript, native figure masters, all three export
formats, preserved originals, unchanged finite evidence, build scripts and QA
records. Disposable page previews and portability scratch builds are excluded.
After extraction:

    shasum -a 256 -c SHA256SUMS.txt

`package.py` requires a current visual approval. It seals the ZIP and then tests
extracted payload hashes, source regeneration, finite-evidence replay, standalone
manuscript compilation, rendered-page equality and native figure rebuilds.
The adjacent receipt reports the actual outcome and archive hash.

The general theorems remain manuscript proofs; the exact computations support
the stated finite models. Local completion is not a platform submission or
external peer review.
