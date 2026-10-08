# Three-paper v0.09 submission closeout package

Status: local submission preparation and layout checks complete; no upload, DOI reservation or submission yet.
Author: Akari Hayami (Jian-Yu Huang)

## Files to use

- `pdf/`: this submission's candidate PDFs, Paper I 63 pages, II 14 pages, III 22 pages.
- `paper_I_v0_09_arxiv_source.zip`, `paper_II_v0_09_arxiv_source.zip`, `paper_III_v0_09_arxiv_source.zip`: separate minimal TeX submission packages. Main TeX is at the ZIP root, with only vector PDF figures used in the text; bibliography is embedded. Do not upload the entire delivery package as one arXiv manuscript.
- `metadata/`: per-paper titles, author, abstracts, page/figure counts and platform-data drafts. Custom C macros in abstracts are expanded to standard mathbb. Category math.RA is suggested from algebra/deformation-theory content, without platform selection; assess cross-listing in the actual submission interface.
- `materials/`: the three original complete v0.09 source archives and receipts, plus the shared v0.08 computational-evidence package cited in the papers. Archives remain unchanged. PDFs in the original archives are the current approved editions of the respective papers; for this submission's candidates use top-level `pdf/`, with exact changes in `qa/*_editorial.diff`.
- `qa/validation.json`: new PDF SHA-256 values, local extracted rebuilds, page counts, figure destinations and page-by-page image comparisons.

## Changes and verification scope

Update only four companion-paper bibliographic version entries in Papers II and III from manuscript closeout v0.08 to illustrated edition v0.09. All mathematical text, old computational-evidence citations and 31 vector figure files remain unchanged; Paper I TeX is entirely unchanged. “Unpublished companion manuscript” and absence of public identifiers remain accurate until actual publication.

All three minimal ZIPs are extracted in separate fresh temporary directories, compiled with Tectonic and checked by QPDF. Page counts remain 63/14/22, author and all 31 figure destinations are correct, with no overfull boxes, undefined references or missing-character warnings. Comparing all 99 pages at 90 dpi changes only Paper II page 14 and Paper III page 22, each additionally passing visual inspection at 120 dpi; the other 97 pages match archived approved-edition images.

This verifies editing and packaging. The full high-arity mathematical computations were not rerun; original verification records retain their scope, with separate archive-integrity checks. Local system TeX lacks enumitem, so this round uses the verified Tectonic toolchain; the arXiv platform's actual compiled PDF still needs checking.

## Publication order and missing information

1. Create a Zenodo research-materials draft and reserve a DOI. This entry point returned 504 on 2026-09-08 without creating a draft. Continue after signing into your own account; do not give passwords to the assistant.
2. Decide licenses for papers and research materials. Metadata license is blank; no legal licensing choice made for the author. Unprovided identity fields such as ORCID/institution are not invented.
3. Add the genuinely reserved materials DOI to all three evidence statements; update companion bibliography if identifiers are also obtained. Recompile, inspect affected pages and reseal materials. Do not insert provisional or nonexistent DOIs into papers.
4. Publish reproducibility materials on Zenodo; separately upload minimal source packages to arXiv, checking titles, author, abstracts, classifications, licenses, account eligibility and platform-generated PDFs before final submission.
5. After publication, check public records, files and DOI links; do not mark submitted/published before a genuine announcement record exists.

Sources:
- https://info.arxiv.org/help/submit_tex.html
- https://arxiv.org/category_taxonomy
- https://info.arxiv.org/help/license/index.html
- https://help.zenodo.org/docs/deposit/describe-records/reserve-doi/

## Rerun local closeout

Use Python 3 (validate.py requires pypdf), Tectonic, Poppler and QPDF:

    python3 prepare.py
    python3 validate.py

prepare.py generates minimal packages from existing archived sources in `releases/current/paper-01-illustrated-v0.09/`, `paper-02-illustrated-v0.09/` and `paper-03-illustrated-v0.09/`; it is this workspace's publication-preparation program. External downloaders rebuilding one paper need only extract its arXiv source.zip and run from the root:

    tectonic --keep-logs paper_I_fixed_cubic_v0_09.tex

II and III respectively use paper_II_marked_naturality_v0_09.tex and paper_III_spectral_floor_v0_09.tex. After modification/rebuild, renew visual-check and SHA256SUMS bindings; existing PASS does not automatically apply to new files.
