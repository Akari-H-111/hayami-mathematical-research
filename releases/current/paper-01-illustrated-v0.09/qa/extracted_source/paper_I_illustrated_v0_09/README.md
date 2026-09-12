# Paper I — illustrated edition v0.09

The current manuscript is `paper_I_fixed_cubic_v0_09.pdf`: 63 letter-size pages, 14 vector figures, native LaTeX captions and live cross-references.

Figure numbers follow manuscript appearance order. The old production corner IDs and duplicate titles/footers are omitted from embedded artwork. Production IDs 07/08 become manuscript Figures 5/6; IDs 05/06 become Figures 7/8. All other numbers agree.

The original mathematical body, theorem statements, proofs, equations, bibliography and native tables are preserved exactly. Changes are limited to illustration callouts, figures/captions, float configuration, an appendix page break and the edition date. The v0.08 release and the SVG/PNG production package are preserved separately.

## Compile

From this directory, using the original project's documented toolchain:

    tectonic --keep-logs paper_I_fixed_cubic_v0_09.tex

The TeX source and 14 PDFs in `figures/` suffice to compile; the bibliography is inline. No shell escape, SVG converter or Python is needed to compile.

## Verify

    python verify_integrated.py

Requires pypdf, pdfplumber, qpdf and the build log. This checks exact body preservation against `provenance/paper_I_fixed_cubic_v0_08.tex`, all 14 destinations/captions, labels, glyph bounds, vectors and PDF syntax. The existing local Python is `/Users/akari_hayami_64/TAGD_Master_Paper/.agent-venv/bin/python`.

`qa/verification.json` records the final PDF hash. `qa/VISUAL_REVIEW.md` records all 63 page thumbnails and all 14 figure pages inspected at 120 dpi. The original v0.08 companion remains the mathematical evidence archive; this source ZIP does not duplicate it or claim a new full mathematical replay.

Local `integrate.py` uses the sibling original manuscript and the previously delivered figure generator. It is a workspace maintenance tool. The portable archive compiles directly from its final TeX and vector assets.
