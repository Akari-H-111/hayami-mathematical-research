# Source registry

The checked-in copies below are the immutable source manuscripts for this reconstruction round. They contain no embedded source attachments, so no TeX was recovered from the PDFs themselves.

| ID | canonical source | pages | SHA-256 |
| --- | --- | ---: | --- |
| `ruled-v4` | `final_pdfs/The_Orthogonal_Circle_Ruled_Surface_v4.pdf` | 13 | `c90a8066be4d5e087592de1590eb04930574c7668a4f8e8d0560cfff17b15722` |
| `stokes-v5` | `final_pdfs/The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.pdf` | 10 | `4e48c805c1550dbaee9171a56264bf4ff5275ef5ff5b64f9cd116803283c11c0` |
| `bicomplex-v12` | `final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf` | 43 | `4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a` |

Validation performed at intake:

- `qpdf --check` passed for all three PDFs.
- `pdfdetach -list` found zero embedded files in all three PDFs.
- Representative first, middle, and final pages were rendered and visually inspected.

`verify_artifact_hashes.py` re-checks all three hashes. The original intake paths were the identically hashed files in `/Users/akari_hayami_64/Downloads/`.

2026-10-02 historical-draft intake: the author-supplied Bicomplex draft v7 is
registered as `historical_drafts/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v7.pdf`
(26 pages, SHA-256 `6cefa5258257f3a23e35b5dd5cbe123b7af0ed3319c3a614b1c8d54c94bd654f`;
`qpdf --check` passed, zero embedded files, PDF dates 2026-07-11). It is a byte
copy of the identically hashed file in `~/Downloads/`. It is **not** an authority:
final v12 above remains the Bicomplex claim authority. It is not shown to be
generated from the ancestor TeX, and equal numbering does not imply equal
content. Its 39-block index and the blocks decided by continuation 0.04 are in
`../bicomplex-signal-manifolds/claims/V7_DRAFT_INDEX.md`. The authority table is
unchanged.
