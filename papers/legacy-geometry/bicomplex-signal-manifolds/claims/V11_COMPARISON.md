# Public v11 versus v12

2026-10-02. v11 is the earlier of the two public files on ResearchGate record
`408878000` (SHA-256
`207a51feed62fe7f5a6dd7c9190258dd1b9c996c8b2735e799aff569bb017ec2`, 37 pages,
registered in `../../source-registry/historical_drafts/`). v12 (43 pages)
remains the claim authority. The public v12 file is byte-identical to the local
authority.

Comparison method: named-block extraction from both PDFs' text, plus a
character-level similarity check of each block's first 1,500 characters. This
is a structural comparison, not a full line-by-line audit of v11.

| Result | Blocks |
| --- | --- |
| Same number and title, text similarity ≥ 0.95 | 3.1–3.3, 4.1, 4.3, 4.4, 5.1–7.8, 8.2–8.19, 9.1–9.6 |
| Same title, text differs substantively | **4.2**. v11 identifies the square-root sign flip with switching sheets of the Whitney double cover along the fold locus; v12 replaced this with the phase square-root deck transformation and stated that it must not be identified with normalization-sheet exchange. Continuation 0.04 `prop:carrier`(3) proves the two involutions differ: one fixes a curve, the other is free. **8.1**: figure and footer placement only. **8.20**: v12 adds chiral-spinor qualifiers ("on either chiral spinor line", "chiral tangential spectrum") to the exact-cone statement, a model-level refinement |
| v11 Remark 8.21 ("The remaining comparison theorem") | v11 states that the spinorial front/seam parametrix is still needed. v12 promotes this to Theorems 8.21–8.23 and Remark 8.24; the claim map records 8.21 as an **unproved** actual parametrix and 8.22–8.24 as conditional. v11 was the more cautious version here |
| Renumbering | v11 8.22–8.27 = v12 8.25–8.30 (SU(2) scope, representation remark, Deligne/Weil no-go, MHS, reconstruction boundary, Weil scope) |

Neither v11 nor v12 contains the v7-era condensed, Weil-étale, `i*Ψ^!Z≅Z[−1]`
or Akari–Hilbert claims as results. Those statements survive publicly **only in
the record's description field**, which the successor's correction appendix
quotes and corrects.
