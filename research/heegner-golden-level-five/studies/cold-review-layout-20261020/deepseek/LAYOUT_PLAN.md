# LAYOUT_PLAN.md — proposed structure (not implemented)

## 0. Scope, assumptions and non-implementation

This is an implementable layout plan for turning the frozen 19-page draft into a
formal portrait paper with a separate visual atlas/supplement. It assumes the
author wants a paper, not a plate book. It does not change the mathematics and
does not require new theorems. It is **not implemented**: no manuscript, figure,
PDF or input file has been edited.

No journal template was supplied. The plan uses a generic 11pt article style and
1in margins as a neutral baseline. Where a target journal has its own class,
caption style or figure-size rules, those override this plan. The plan
distinguishes common editorial judgment from hard requirements: page
orientation, figure legibility, cross-references and reproducible citations are
the hard checks; the exact page count, cream background and font family are
choices.

## 1. Proposed main-paper structure

The main paper should read as one argument, not as text interrupted by plates.
The section order below preserves the existing mathematical order while adding
the missing Introduction/Results section.

| Section | Content | Figures | Estimate |
|---|---|---|---|
| **1. Introduction and results** (new) | Motivate with Hermite and the surface; define \(c_0,u_0\); state the CM recovery, the involution identity and the Poisson-Mellin classification; add a short "what is proved / what is classical / what is computed" ledger; cite [5] or include the surface definition. | None; optional simplified roadmap after the results. | 1.5-2 pp |
| **2. The surface and the golden coordinate** (current §1) | Eq. (1), endpoints, rank-loss condition, the remaining components, \(P(c)\), \(c_0,u_0\); define "lateral" or remove the term; explain why \(P(c)=0\) selects the distinguished point. | **Fig. 1**, Group A (old Figs. 2-4): surface, rank-loss contour/\(P(c)\), pentagon. | 1.5-2 pp + 0.6 p figure |
| **3. CM recovery at \(\tau_{163}\)** (current §2) | Product (3), Klein relation (4), Theorem 2.1 and proof; point to Appendix A or the supplement for the certificate. | **Fig. 2**, Group B (old Figs. 6-7): CM arguments and near-integer residual. | 2-2.5 pp + 0.5 p figure |
| **4. The common involution** (current §3) | Duke inversion, \(M,J,A=JMJ\), \(V_5,\mathcal F,\mathcal T\), Proposition 3.1, the polynomial-norm remark; move the "Also" paragraph into the proof or immediately after it. | **Fig. 3**, Group C (old Figs. 8-9): reflection diagrams and fixed-point/product curves; **Fig. 4** (old Fig. 10): DFT eigenvector. | 2-2.5 pp + 0.9 p figures |
| **5. Poisson-Mellin bridge and classification** (current §4) | Theorems 4.1 and 4.2 and proofs; the general-vector remark; the Davenport-Heilbronn boundary. | **Fig. 5**, Group D (old Figs. 11-12): theta self-duality and Mellin completion. | 2-2.5 pp + 0.5 p figure |
| **6. Conclusion** (current §5) | Keep the retrospective paragraph and the open \(N\)-dependent surface question; add one sentence on what is not claimed. | None. | 0.5 p |
| **Appendix A. Exact certificate** | Keep the exact polynomial identity and the sign/root statement; either keep the full coefficient/interval transcript here or move it to the supplement and retain a short certificate statement. | None; tables if retained. | 1.5-2 pp (or 0.5 p if moved) |
| **Appendix B. Odd-\(N\) extension** | Keep as is; it is honest about the distinction between the finite-Fourier theorem and the unconstructed surface. | None. | 1 p |

Estimated main paper: **11-13 pages** with both appendices; **9-11 pages** if the
detailed certificate transcript moves to the supplement. These are estimates,
not a quota.

## 2. Figure groups and old-to-new mapping

The twelve old plates become five body figures and two supplement plates (with
optional detail plates). Grouping is by claim, not by visual similarity.

| New figure | Old figures/pages | Panels | Target size and placement | Caption strategy |
|---|---|---|---|---|
| **Fig. 1** "The golden coordinate" | Old Figs. 2 (p. 3), 3 (p. 4), 4 (p. 5) | (a) global surface and local patch; (b) rank-loss contour; (c) \(P(c)\) and \(c_0\); (d) pentagon inset | 0.95\textwidth, about 0.55-0.6 page height, Section 2 after Eq. (2). Use a 2x2 grid; make the pentagon the smallest panel. | One caption: what the rank-loss locus is, what the colour scale means, why \(c_0\) is the selected root, and the distinction \(u_0\ne c_0\). No vertex/proof text. |
| **Fig. 2** "CM at \(\tau_{163}\)" | Old Figs. 6 (p. 8), 7 (p. 9) | (a) upper-half-plane arguments \(i\) and \(\tau_{163}\); (b) near-integer residual plot | 0.95\textwidth, about 0.5 page height, Section 3 after Theorem 2.1. Stack or place side by side; the exact decimal string is not in the figure. | Caption states the contrast: \(i\) is the inversion fixed point; \(\tau_{163}\) is the small-nome CM point. Point to Supplement Table S1 for the fifty-digit value. |
| **Fig. 3** "Involution geometry" | Old Figs. 8 (p. 11), 9 (p. 12) | (a) \(M\) reflection; (b) \(A=JMJ\) reflection; (c) fixed point \(R(z)\); (d) product curves \(r(iy),r(i/y)\) | 0.9-0.95\textwidth, about 0.6 page height, Section 4 after Proposition 3.1. 2x2 grid, or 3 panels if the product curves move to the supplement. | Caption states the conjugation \(J\) and the fixed-point/eigenline relation; define the slope conventions; no duplicate legend. |
| **Fig. 4** "Fourier eigenvector" | Old Fig. 10 (p. 13) | (a) input/output bars; (b) residue circles | 0.8\textwidth, about 0.35 page height, Section 4 after the definition of \(V_5,\mathcal F,\mathcal T\). | Caption states that the plotted vectors are the actual normalized DFT input/output and that \(-\ii\mathcal F\) makes the odd subspace real. |
| **Fig. 5** "Theta and Mellin completion" | Old Figs. 11 (p. 15), 12 (p. 16) | (a) compensated theta self-duality; (b) simplified Mellin completion schematic/profile | 0.95\textwidth, about 0.5 page height, Section 5 after Theorem 4.1 (or after Theorem 4.2 if it interrupts the proof flow). | Caption states the functional equation and the numerical check; use \(x\) consistently; if a schematic is kept, label the four stages in words, not in a slide-style box row. |
| **Supplement Fig. S1** "Reader's map" | Old Fig. 1 (p. 2) | The five-box connection map | 0.9\textwidth portrait, supplement opening; optional simplified 0.8\textwidth roadmap in the Introduction. | Caption explains that it is an overview, not a proof; only symbols already defined in the Introduction. |
| **Supplement Fig. S2** "Icosahedral realization" | Old Fig. 5 (p. 6) | 3D icosahedron and chord counts | 0.9\textwidth portrait or full landscape if the 3D detail needs it; supplement only. | Caption keeps the vertex set/dot-product data; body keeps one sentence and the squared-ratio identity. |
| **Supplement Fig. S3** (fallback) | Old Fig. 9 | Product curves | Supplement if Group C is too dense. | Same as Fig. 3(d). |
| **Supplement Fig. S4** (optional) | Old Fig. 12 detail | Four-stage schematic | Supplement if the schematic is retained at full size. | Explain each stage in a paragraph, not only in boxes. |

**Old-to-new map:** old 1 -> S1; old 2-4 -> Fig. 1(a)-(d); old 5 -> S2; old
6-7 -> Fig. 2(a)-(b); old 8-9 -> Fig. 3(a)-(d); old 10 -> Fig. 4; old 11-12 ->
Fig. 5(a)-(b).

## 3. Portrait/landscape policy

**Main paper.**

- All pages portrait; `/Rotate 0` on every page.
- Use `figure[htbp]` or `figure[tbp]`; never `\clearpage` around a figure.
- No `\begin{landscape}` and no `pdflscape` in the main paper.
- No main-body page should contain only a figure and caption. A composite figure
  may occupy most of a page only if it is referenced on that page or the facing
  page and leaves room for at least some text; ideally it shares the page with
  the paragraph that introduces it.
- If a figure is too wide for portrait, stack panels vertically or use a 2x2
  grid. Do not rotate the page to preserve a wide source aspect ratio; the source
  can be recomposed.
- Page numbers and running heads (if any) stay upright and in the same position
  on every main page.

**Supplement/atlas.**

- Landscape is allowed for genuinely wide 3D or multi-panel plates, but only in
  the supplement. Use `sidewaysfigure` from the `rotating` package, which keeps
  the page number and header upright; do not use `pdflscape` for every plate.
- At most two or three landscape plates in the supplement, grouped together
  rather than interleaved with text.
- Full-page plates are appropriate in the supplement; each plate gets a short
  caption and a cross-reference from the main paper.

## 4. Figure typography, captions and colour

**Type sizes at final print size.**

- Axis labels, tick labels and legends: at least 7pt; aim for 8pt.
- Annotations and direct labels: at least 8pt.
- Panel titles: 9-10pt, no larger than the body text unless the panel title is
  the figure title.
- No text below 6pt anywhere in a main-body figure. The current 5.3pt key and
  2.7-4.0pt annotations are out of bounds.
- Use one sans-serif family for figures, or Latin Modern Sans to match the body.
  Do not mix DejaVu Sans titles with Latin Modern body text unless the contrast
  is deliberate and consistent.

**Figure furniture.**

- Remove the clipped "Figure NN." plate titles from the figure PDFs or crop them
  out. The LaTeX `\caption` is the only figure number the reader should see.
- Remove panel titles that merely repeat the caption (e.g. "Actual ruled patch",
  "Two distinct upper-half-plane arguments") unless they identify a panel that
  the caption refers to as (a), (b), etc.
- Remove the recurring footer key from individual plates. Put one colour key in
  the supplement and use direct labels in each figure. If a colour is not
  semantically stable across figures, do not put it in a global key.
- Prefer white or very light gray plot backgrounds for the main paper. If the
  cream panel is kept as a house style, use it consistently and explain it once
  in the supplement; it should not make each page look like a slide.

**Captions.**

- One to three lines at 9-10pt.
- Start with the takeaway, not a list of contents: "The rank-loss locus is
  \(u=(1-c)/2\); the distinguished point is the root \(c_0\) of \(P\)." Then
  define only the symbols the figure does not label.
- Do not repeat a proof, a vertex list or a table of counts in a caption. Put
  those in the body or the supplement.
- Do not apologise for a notation mismatch in a caption; fix the notation.
- Every caption ends with a cross-reference to the theorem/equation it supports
  when that is not obvious.

**Colour and accessibility.**

- Do not encode a distinction by colour alone. Use line style, marker shape or
  direct labels as well.
- Check a grayscale print: the rank-loss line, the surface patch, the two
  CM points and the two product curves must remain distinguishable.
- Use a colour-blind-safe palette; the current gold/teal/violet/blue palette is
  close, but the red-orange arrows and coral markers need direct labels.
- Add alt text or a textual description for each figure if the target journal
  requires accessibility; an untagged PDF is acceptable only if the venue does
  not require tagging.

## 5. Main-text and cross-reference plan

1. **Add the Introduction/Results section.** End it with a claim ledger:
   - Theorem 2.1: CM recovery from \(v=r(\tau_{163})^5\); the exact certificate
     is finite and separate.
   - Proposition 3.1: the involution fixed point and eigenline.
   - Theorems 4.1-4.2: the functional equation and the signed classification.
   - The surface definition is from [5] (or reproduced); the Klein relation is
     classical/attributed to Duke; the odd-\(N\) result is a finite-Fourier
     theorem, not a surface construction.
2. **Reference every figure.** In `main.tex`, add `\ref{fig:...}` at the point of
   use. Target: every figure is referenced within one page of its placement.
   No figure should be cited only in a batch at the start.
3. **Place figures by claim.** Group A in Section 2 after Eq. (2); Group B after
   Theorem 2.1; Group C after Proposition 3.1; Fig. 4 after the \(V_5\) definition;
   Group D after Theorem 4.1 or after Theorem 4.2 if the proof flow is better.
4. **Remove orphan starts.** Move the "Also" paragraph before Group C or into the
   proof of Proposition 3.1. Ensure Theorem 4.2 follows Theorem 4.1's proof
   without two plate pages in between; if Group D must go there, place it after
   Theorem 4.2.
5. **Fix local notation and citations.**
   - p. 10: move `\cite[Proposition 2]{Duke}` outside the displayed equation.
   - p. 15: use \(x\) in Figure 11, or define \(t\) as the positive scale in the
     caption and in the axis label; no parenthetical apology.
   - Appendix A: write \(P_{-640320^3}(X)=A_{163}(X)^2-5B_{163}(X)^2\); name the
     polynomial and interval for the Sturm count; distinguish the matrix \(A\)
     from the polynomial \(A_{163}\) (e.g. use \(\mathcal A\) for the matrix).
   - Define "lateral" and reconcile "rank-loss polynomial" with "remaining
     polynomial \(P(c)\)"; explain the additional condition \(P(c)=0\).
6. **Repair the scholarly apparatus.** Add a standard Rogers-Ramanujan citation
   for Eq. (3)/Figure 9. Replace [5] with an accessible reference or reproduce
   the surface definition and rank-singularity statement. Add a code/data
   availability statement and a supplement with the certificate transcript.
   Fix the Hermite accents; add the DLMF release/editors. Add affiliation,
   keywords and MSC codes if the target expects them; remove "Local assembled
   draft" from the title block.

## 6. Supplement/atlas structure

The supplement should retain the scientific detail that is currently compressed
into tiny figure text.

**S1. Full-size plates.**
- Old Fig. 1 (connection map) and old Fig. 5 (icosahedron), with corrected
  numbering and captions.
- Optional old Fig. 9 or 12 details if they are too dense for the main paper.
- Each plate gets a short caption and a "referenced from" line.

**S2. Exact data.**
- Table S1: the fifty-digit \(N-R\) value, the \(j\)-series terms, and the
  residual after each correction. Use grouped digits and a readable font size.
- Table S2: the integer coefficients \(a_i,b_i\), the reconstruction
  polynomials, the interval bounds and the sign/Sturm results.
- Table S3: icosahedron vertex/dot-product counts, if old Fig. 5 is retained.
- The colour key and a one-paragraph explanation of the palette.

**S3. Reproduction notes.**
- Repository/DOI or supplementary archive for the verification scripts.
- Environment, commands and expected output for `baseline_cm.py` and
  `baseline_square_certificate.py`.
- A statement of what is a finite certificate and what is an analytic proof.
- No local absolute paths in the main text; file names may appear in the
  supplement.

**S4. Figure index.**
- Old-to-new figure map, caption text, and a note on any figure that was
  recomposed rather than merely moved.

The supplement may use landscape pages for the 3D plates; page numbers should
remain upright. Full-page plates are appropriate here, not in the main paper.

## 7. Implementation notes (LaTeX, not implemented)

- Delete the `\Plate` macro and its `\clearpage`/`landscape` calls. Replace each
  call with a `figure[htbp]` environment or a `figure*` only if a two-column
  target requires it.
- For composite figures, use `subcaption` (`\begin{subfigure}`) or `minipage`
  with `\subref`; one `\caption` per composite, not one per panel.
- Use `\captionsetup{font=small,labelfont=bf}` or the target journal's caption
  package. Keep captions at 9-10pt.
- Use `\usepackage{rotating}` and `sidewaysfigure` only in the supplement. Do not
  use `pdflscape` for the main paper.
- Use `\clearpage` only at appendix/supplement boundaries, never around a figure.
- Set `\graphicspath` to the figure directory; do not use absolute paths. The
  implementer will need the original figure sources, which are not in the
  supplied input.
- Compile with `pdflatex` (or the target class) and check the log for overfull
  boxes; run the acceptance checks below on the resulting PDF.

## 8. Acceptance checks

These are pass/fail checks for the implementer. They are written to be run on the
final PDF, not on the source alone.

| # | Check | Method | Pass condition |
|---|---|---|---|
| 1 | Main pages portrait | `pdfinfo`/`pdfseparate` or `qpdf --show-pages` | Every main-paper page has `/Rotate 0`; supplement may have `/Rotate 90` only for designated plates. |
| 2 | No figure-only main pages | Extract text/visual check | No main-paper page contains only a figure and caption; supplement plates excepted. |
| 3 | Every figure referenced | `grep` `\ref{fig:...}` and labels; manual check | Every figure label is referenced at least once, within one page of placement; no orphan figures. |
| 4 | Figure numbering clean | `pdftotext` search for `Figure 0`, `Figure 1`, etc.; visual check | Visible captions are sequential; no stale "Figure NN." text in the figure layer; no in-figure number conflicts. |
| 5 | Figure type legible | `pdftohtml -xml`/`pdffonts` and 100% print | Axis labels/ticks ≥7pt, annotations ≥8pt, no text <6pt; all labels readable at 100% on letter/A4. |
| 6 | Page fill | Text/ink bbox per page | No main text page with more than ~25% blank at the bottom caused by a float; page 7's 46% blank is a fail. |
| 7 | Section flow | Visual/text check | No page starts with "Also" or an uncontextualized theorem after a plate block; no figure-only page in the main paper (supplement plates excepted). |
| 8 | Captions | Manual | 1-3 lines; states the takeaway; no duplicated proof/table; no in-figure footer key; symbols defined. |
| 9 | Colour/grayscale | Grayscale print and colour-blind simulation | Every distinction survives grayscale; no colour-only encoding; direct labels present. |
| 10 | Cross-references | LaTeX log / `\ref` check | All `\ref`, `\eqref`, `\cite` resolve; theorem/proof dependencies stated; Appendix A polynomial/interval named. |
| 11 | Citations/reproducibility | Bibliography and supplement check | [5] accessible or replaced; Rogers-Ramanujan cited; code/data statement present; no local paths in main text; Hermite accents fixed. |
| 12 | Metadata/accessibility | `pdfinfo`, title block, tag check | No "Local assembled draft" in a submission version; affiliation/keywords/MSC if required; tagged PDF/alt text if the venue requires. |
| 13 | Print proof | Print at 100% | Page numbers upright; figures legible; no clipped text; margins and captions balanced. |
| 14 | Build stability | Two clean builds | Same page count and orientation; no new overfull boxes above the chosen threshold. |

## 9. Page estimates, risks and decision points

**Estimates.** Main paper 11-13 pages with both appendices, or 9-11 if the
certificate transcript moves to the supplement. Supplement 6-9 pages. These are
estimates, not quotas; the argument determines the length.

**Risks.**

- The original figure sources are not in the supplied input. Recomposition
  requires access to them; cropping the existing PDFs is not enough because the
  labels are already too small.
- Group C (old Figs. 8-9) may be too dense as a 2x2 figure. Fallback: keep the
  two reflection panels in the body and move the product curves to the
  supplement.
- Moving the certificate to the supplement shortens the main paper but weakens
  the self-contained proof of Theorem 2.1. Keep a short certificate statement in
  Appendix A and put the full transcript in the supplement; do not remove the
  existence of the certificate from the main paper.
- If the author's real goal is an atlas rather than a paper, this plan is the
  wrong genre. A coherent atlas would use facing-page plates with short
  explanatory text, not a theorem/proof paper with plates inserted. The choice
  should be made before implementing the layout.

**Decision points for the author.**

1. Paper or atlas? This plan assumes paper.
2. Keep the icosahedron in the body or the supplement? Default: supplement.
3. Keep the full certificate in Appendix A or the supplement? Default: short
   statement in the appendix, full transcript in the supplement.
4. Keep the cream background? Default: remove from main figures; keep only if it
   is a deliberate house style.
5. Keep the connection map? Default: supplement, or a simplified roadmap after
   the Introduction.

## 10. Non-implementation statement

No manuscript, figure, PDF or input file has been modified. This plan is a
proposal for a future implementation; it should be applied only after the author
chooses the paper-versus-atlas genre and obtains the original figure sources.
