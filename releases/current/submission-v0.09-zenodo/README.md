# The Inverse Leibniz Problem — Papers I–III, illustrated v0.09

Author: Akari Hayami (Jian-Yu Huang)
Collection DOI: https://doi.org/10.5281/zenodo.22663942

## Read and reproduce

The `pdf/` directory contains the three current manuscripts. Each `paper_*_v0_09_arxiv_source.zip` contains one main TeX file and only the vector figures used by that manuscript; references are inline. Extract the ZIP and run Tectonic from its root:

    tectonic --keep-logs paper_I_fixed_cubic_v0_09.tex
    tectonic --keep-logs paper_II_marked_naturality_v0_09.tex
    tectonic --keep-logs paper_III_spectral_floor_v0_09.tex

Run each command in the corresponding extracted source directory. Tectonic may fetch missing TeX packages. The manuscript PDFs are also distributed individually with this collection for direct reading.

## Computational materials and provenance

`materials/three_papers_v0_08_bundle.zip` is the preserved broader computational companion cited in the papers. It contains the exact evidence and its own reproduction instructions. The three `materials/paper_*_illustrated_v0_09_source.zip` archives preserve the illustrated source releases, native figure masters, baseline manuscripts, and their verification records. Follow the README and EVIDENCE_MAP inside each archive for the scope of its verification commands.

The preserved archives are historical inputs: their PDFs predate the collection DOI and may cite an earlier companion edition. For the current manuscripts, use top-level `pdf/` and the minimal source ZIPs. The exact editorial differences are recorded in `qa/`. Original figures, mathematical theorem statements, proofs and computational inputs are unchanged. The present release updates companion edition labels and supplies the collection DOI in the materials description.

Verification distinguishes manuscript proofs, exact finite models, newly constructed feedback matrices, and unavailable historical matrix entries. Matching historical dimensions or rank is not historical reconstruction. This release rechecks packaging, source preservation, compilation and rendered layouts; it does not claim a new execution of the entire high-arity evidence pipeline.

## Integrity and validation

`SHA256SUMS.txt` binds every payload file in this collection. From the extracted directory:

    shasum -a 256 -c SHA256SUMS.txt

`qa/validation.json` binds the new PDFs to their hashes and records fresh-directory source ZIP compilation, QPDF, figure destinations and page-image comparison. Changed pages were rendered separately for visual review. PDF metadata can change on recompilation; compare rendered pages before treating a new PDF as visually approved.

`prepare_doi.py` is a workspace preparation script requiring the preserved adjacent submission_v0_09 directory; it is not needed to compile any individual manuscript. `validate.py` likewise uses the original illustrated PDFs as layout baselines. Readers can compile the minimal ZIPs independently with the commands above. The original source archives contain their own standalone reproduction commands.

The collection identifier is separate from any future article-specific arXiv, ai.viXra or ResearchGate identifiers. No such article identifier is implied by this DOI. The DOI was reserved in advance of depositing these files; its public registration occurs when the Zenodo record is published.
