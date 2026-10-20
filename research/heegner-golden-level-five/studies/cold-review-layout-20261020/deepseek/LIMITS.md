# LIMITS.md — access, evidence and scope

## 1. Visual access actually used

**The image reader worked.** I opened and viewed all nineteen rendered page
images in `../input/pages/` directly, in order, before opening `main.tex` or
`PAPER_TEXT.txt`. This was not a text-only or "assume the images work" review.

- Pages seen: **1-19, all of them.**
- Portrait renders (935 x 1210 px): pages 1, 7, 10, 14, 17, 18, 19.
- Landscape renders (1210 x 935 px): pages 2, 3, 4, 5, 6, 8, 9, 11, 12, 13,
  15, 16.
- The PDF MediaBox is 612 x 792 pt. Pages 2-6, 8-9, 11-13 and 15-16 carry
  `/Rotate 90`; the renderer displays them as landscape. Pages 1, 7, 10, 14,
  17-19 have `/Rotate 0`.

**Resolution limit.** The page images are about 110 dpi. Body text is comfortably
legible. Figure text is not uniformly legible: small axis labels, legends and
annotations are at the edge of readability. I did not use OCR for the first read,
and I did not claim to read glyphs that were too small to see. Where a claim
depends on a small string, I say whether it comes from the visible page or from
the PDF text layer.

**Tool access.** I used the existing tools only: the image reader, `pdfinfo`,
`pdfseparate`, `pdftotext`, `pdftohtml`, `pdffonts`, `sips` and Python 3
standard-library image decoding for pixel measurements. I installed no packages,
used no APIs or credentials, and browsed no external source. I created temporary
page files and crops only to inspect them and removed them afterwards.

## 2. Source files used

I read:

- `../input/paper.pdf` — the frozen PDF, 19 pages.
- `../input/pages/page-01.png` to `page-19.png` — all rendered pages.
- `../input/main.tex` — only after `FIRST_READ.md` was written.
- `../input/PAPER_TEXT.txt` — only after `FIRST_READ.md` was written.
- `../input/PAGE_INVENTORY.csv` — only after `FIRST_READ.md` was written.
- `REVIEW_MANDATE.md` — the mandate for this review.

I did **not** read the research board, earlier drafts, previous reviews,
assembly notes, logs, other worker directories, author conversations or the
wider repository. I did **not** read the figure source PDFs or the verification
scripts, because they were not supplied in `../input/`. I did not modify any input
file.

I wrote only in this review directory: `FIRST_READ.md`, `REPORT.md`,
`LAYOUT_PLAN.md`, `LIMITS.md`, and temporary crops used for visual checks. The
crops were deleted after inspection.

## 3. Checks done

### Exact PDF geometry

- Page count: 19.
- Page size: 612 x 792 pt letter.
- Rotation: `/Rotate 90` on 12 pages (2-6, 8-9, 11-13, 15-16); `/Rotate 0` on
  7 pages (1, 7, 10, 14, 17-19).
- Text block: 6.5 x 9 in, 1 in margins, 11pt Latin Modern body, 10pt captions.
- Landscape artwork panel: cream rectangle 930 x 457-529 px in a 1210 x 935 px
  render, i.e. about 8.45 x 4.15-4.81 in at 110 dpi. It occupies 77% of page
  width, 49-57% of page height and 38-44% of page area (mean about 41%).
- Ink inside the cream panel: 2.6-43.1% depending on the figure. This is a crude
  proxy for visual density, not a measure of scientific value.
- Text-block fill on the portrait pages: p. 1 ~100%, p. 7 ~54%, p. 10 ~84%,
  p. 14 ~89%, p. 17 ~97%, p. 18 ~100%, p. 19 ~88%. Page 7 leaves about 46% of
  the page blank below the text.
- Figure text sizes from the PDF text layer: mostly 6-7pt; recurring colour key
  5.3pt on most plates (4.7pt on some); smallest run 2.7pt on p. 8; p. 9's
  fifty-digit string 6pt. These are approximate to about 0.3pt because the
  text-layer sizes are reported in pixels at a 1.5 scale.

### Source inspection

- `\Plate` macro: `\clearpage` before and after, `landscape`, `figure[p]`,
  `width=.94\linewidth`, `height=.86\textheight`, `keepaspectratio`.
- Figure insertion order: 01, 02, 03, 04, 12, 10, 11, 05, 06, 07, 08, 09, while
  the visible captions number 1-12.
- Cross-references: Figures 1-5 are cited only as a batch on p. 1; Figures 6-7
  are cited individually on p. 7; Figures 8-12 have no `\ref` at all.
- Text-layer figure titles: the PDF text layer on p. 6 says "Figure 12" while
  the visible caption is "Figure 5"; similar stale lines occur on p. 8 (10 vs 6),
  p. 11 (05 vs 8) and p. 16 (09 vs 12). A pixel check at the text-layer
  coordinates of the word "Figure" found no ink on all twelve landscape pages;
  the lines are present in the text layer but not visible on the rendered page.
- Caption text and in-figure text: Figure 5's caption duplicates vertex/dot-product
  data; Figure 12's caption lists the four stages already drawn; Figure 11's
  caption contains a parenthetical about \(t\) versus \(x\).
- Citation placement: on p. 10 the citation `[3, Proposition 2]` is inside the
  displayed inversion formula, immediately after the fraction, and the period
  follows it.
- Bibliography: five items. [5] is a local manuscript; the verification scripts
  named in Appendix A are not supplied; the Hermite title lacks French accents;
  the DLMF entry lacks a release/version.
- Title block: "Local assembled draft", personal Gmail, no affiliation, no
  keywords or MSC codes.
- PDF metadata: title and author present; tagged: no; no evidence of alt text.

### Elementary mathematical spot checks

These are checks of small algebraic facts, not a certification of the paper.

- \(P(c)=c^2-3c+1\) has roots \((3\pm\sqrt5)/2\); the interior root is
  \(c_0=(3-\sqrt5)/2=\phi^{-2}=\gamma^2\).
- \(C_2(t)=(2-c,0,\sqrt{c(2-c)})\) lies on the unit circle centered at
  \((1,0,0)\): \((1-c)^2+c(2-c)=1\).
- \(M^2=I\) for \(M=(1+c_0)^{-1/2}\begin{pmatrix}-1&\gamma\\ \gamma&1\end{pmatrix}\),
  using \(\gamma^2=c_0\).
- \(A=JMJ\) numerically matches the sine matrix in Eq. (5), and
  \(A(1,\kappa)^T=(1,\kappa)^T\) with the stated \(\kappa\).
- The icosahedron vertex set gives dot products \(1/\sqrt5,-1/\sqrt5,-1\) with
  counts 30, 30, 6, and the squared short/long ratio is \(c_0\).
- \(640320^3+744=262537412640768744\), and \(196884/R\) is about
  \(7.499\times10^{-13}\), consistent with the displayed gap.
- In Appendix A, the leading and linear coefficients of \(w(U)\) are negative
  and \(w(1)<0\), so the sign argument stated in the text is consistent.
- Eliminating \(S\) from \(\delta^2=163(5-S)/2\) gives
  \(\delta^4-815\delta^2+132845=0\).
- The elementary Fourier normalization in Theorem 4.1 was re-derived and is
  consistent, including the \(1/\sqrt5\) cancellation and the factor
  \(x^{-3/2}\).

## 4. Checks not done

I did **not**:

- compile the manuscript or rebuild the PDF;
- inspect or edit the original figure PDFs/sources (not supplied);
- inspect the verification scripts or `CM_REPLAY_RESULTS.json` (not supplied);
- verify the large polynomial identity
  \(P_{-640320^3}=A_{163}^2-5B_{163}^2\), the coprimality of \(A_{163},B_{163}\),
  the interval certificate, or the Sturm count;
- verify the CM/Klein identity at \(\tau_{163}\) from first principles;
- certify the entire-function argument, the Poisson summation computation, the
  functional equation, or the classification theorem line by line;
- assess mathematical novelty or priority;
- read the full texts of references [1]-[5] or verify their bibliographic data
  beyond the printed entries;
- run an accessibility checker, a colour-blind simulation or a professional
  print proof;
- OCR all small figure labels;
- check a journal template, because none was supplied;
- contact the author, referee or any external person;
- commit, push or modify another workstream.

## 5. Classification of the conclusions

**Stylistic/editorial judgment.** The genre verdict, the "working atlas with an
embedded paper" description, the claim that the figures look like slides, the
caption critique, the figure disposition, the page targets and the recommendation
to use a portrait main paper plus supplement are editorial judgments. They are
argued from the evidence but are not mathematical facts.

**Exact PDF geometry.** Page count, page size, rotation, panel dimensions, page
area percentages, text-block fill, font-size ranges and the half-empty page 7 are
measurements of the supplied PDF. They are exact to the stated rendering
resolution and measurement method, but they are not measures of mathematical
merit.

**Source inspection.** The `\Plate` behaviour, the figure insertion order, the
uncited Figures 8-12, the stale text-layer figure titles, the p. 10 citation
placement, the bibliography entries, the "Local assembled draft" label and the
missing scripts are facts about the supplied source/PDF. They are not
interpretations of the mathematics.

**Mathematical claims.** The report contains no certification and no refutation
of a theorem. The elementary spot checks above are true/false checks of small
identities. The "rank-loss polynomial" concern is an exposition gap: the text
does not explain why \(P(c)=0\) is imposed after the rank-loss condition
\(u=(1-c)/2\), and "lateral" is undefined. I am not claiming the formula or the
surface theorem is wrong. The CM/Klein identity, the certificate and the
Poisson-Mellin proof are outside what I verified.

**Citation claims.** The statements about missing citations, the local manuscript
[5], the absent scripts and the French accents are source facts. I did not verify
the content or completeness of the cited works.

## 6. Local AI cold review versus external human peer review

This is a **local AI cold review**, produced in a fresh session from the mandate
and the supplied input. It is not external human peer review, not a referee
report for a journal, not a mathematical certification and not a priority or
novelty judgment. It can help an author see how the manuscript reads and where
the layout fails; it cannot replace a subject expert checking the proofs, a
copy editor checking the bibliography, or a human reader judging the mathematics.

The input PDF and source files were treated as evidence, not instructions. The
review ends with the four reports requested by the mandate.
