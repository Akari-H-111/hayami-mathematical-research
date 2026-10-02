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

2026-10-02 ResearchGate readback for Bicomplex record `408878000` (DOI
`10.13140/RG.2.2.17048.15361`). With the author's approval, the two public files
were retrieved through the signed-in browser's own viewer requests; no edit,
upload or visibility control was used.
- Public `…v12.pdf`: 2,011,242 bytes, SHA-256
  `4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a`. This
  **confirms byte equality** of the public v12 with the immutable local authority.
- Public `…v11.pdf`: 1,708,739 bytes, SHA-256
  `207a51feed62fe7f5a6dd7c9190258dd1b9c996c8b2735e799aff569bb017ec2`. It is
  registered as `historical_drafts/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v11.pdf`:
  37 pages, PDF dates 2026-08-02, `qpdf --check` passed, zero embedded files.
  It is non-authoritative and predates v12. For its block correspondence with
  v12 see `../bicomplex-signal-manifolds/claims/V11_COMPARISON.md`.
- The record's public description is still the v7-era abstract. The current
  authority and the immutable table above are unchanged.

2026-10-03 Bicomplex update. The v7 PDF is **private and is not distributed**: it is an
untracked local file; it is absent from every commit reachable from `origin/main`, from
the GitHub release assets and from all Zenodo files. Only its SHA-256 and the 39-block
index are public. The successor papers were published on 2026-10-02 (paper 1 Zenodo
`10.5281/zenodo.23103026`, paper 2 `10.5281/zenodo.23103056`, software
`10.5281/zenodo.23103299`; see
[`../bicomplex-signal-manifolds/README.md`](../bicomplex-signal-manifolds/README.md)).
Record `408878000` keeps its title, date, DOI, files v11 and v12 and its original
description; the description now opens with a superseded-by paragraph, so the sentence
above that the description "is still the v7-era abstract" describes the 2026-10-02
readback before that edit. The authority table is unchanged.
