# Paper II — illustrated edition v0.09

**Author: Akari Hayami (Jian-Yu Huang).** Completed locally on 2026-09-08.

The manuscript is `paper_II_marked_naturality_v0_09.pdf`: 14 letter-size pages. It contains seven vector figures with native LaTeX captions, live references and an inline six-entry bibliography. Author metadata and the three self-authored bibliography entries use the requested full name.

The original v0.08 mathematical body is preserved exactly after removing explicitly delimited illustration/editorial additions and reversing the authorized author and edition-label updates. The theorem statements, proofs, original equations and citation targets are unchanged.

## Figure corrections

- Figure 1: compact roadmap, readable at manuscript width, with the normalized/marked scope stated explicitly.
- Figure 2: selected envelope and source image; correct inclusion directions and space for every label.
- Figure 3: a **chosen** complement W, its identification with the quotient, and the full block matrix with six arbitrary off-diagonal entries and 36 quotient entries. W need not be invariant.
- Figure 4: all-order E-rail; the boundary outputs do not imply that A acts on C2.
- Figure 5: full two-dimensional Zariski tangent space, exact one-dimensional response domain, and the requirement that extending a transverse direction kills the marked line.
- Figure 6: unobscured commuting squares, differential inverse and covector law.
- Figure 7: explicitly independent four-generator counterexample, with its own dE=beta convention and smooth formal germ.

The seven supplied PDF/SVG/PNG figures are preserved byte-for-byte in `provenance/original_figures/`. Corrected native TeX masters, PDF/SVG exports and 200 dpi PNG previews are in `figures/`. No raster image-generation tool was used: these are deterministic mathematical vector diagrams.

## Compile and reproduce

For the manuscript alone, the final TeX and supplied vector PDFs suffice:

    tectonic --keep-logs paper_II_marked_naturality_v0_09.tex

To regenerate the manuscript source from its preserved baseline:

    python -B integrate.py

To rebuild figures and their exports, then compile and render the manuscript:

    python -B build.py --figures --paper --render

This uses Python's standard library, Tectonic and Poppler (`pdftocairo`, `pdftoppm`), plus QPDF. Figure masters use standard LaTeX/TikZ and the standalone class. Tectonic may fetch missing packages on first use. Standalone reports that shell escape is disabled; no figure requires shell escape or system-specific input data.

For finite mathematical evidence and structural validation:

    python -B verify_evidence.py
    python -B verify_integrated.py

The verified environment uses SymPy 1.14.0, pypdf, pdfplumber and QPDF. Never disable assertions with `-O`. `EVIDENCE_MAP.md` records the exact claim-to-file mapping. The retained v0.08 three-paper archive remains the broader evidence companion; this edition does not claim another full replay of Paper I high-arity completions.

`qa/EVIDENCE_REPLAY.json` and its six logs record the fresh finite-evidence replay. `qa/verification.json` records PDF and source checks. `qa/VISUAL_REVIEW.json` binds the inspected pages and seven figure PDFs to their hashes. Recompiling can change PDF metadata and therefore invalidate that visual record: compare rendered pages to the approved pages or inspect the new PDF before recording another approval.

## Integrity

The source ZIP contains the manuscript, vector and PNG/SVG assets, native figure masters, preserved sources, unchanged finite-evidence inputs, build/verification scripts and QA records. Disposable rendered manuscript pages and portability scratch builds are excluded.

After extracting, run:

    shasum -a 256 -c SHA256SUMS.txt

The external receipt binds the final ZIP hash and the extraction, compile, finite-evidence replay and rendered-page comparison checks. The local original v0.08 release and supplied figures remain unchanged.
