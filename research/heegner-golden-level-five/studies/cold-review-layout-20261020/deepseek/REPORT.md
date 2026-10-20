# REPORT.md

## Verdict

**Not yet a formal mathematics paper.** The frozen PDF is a carefully made
working atlas with a short paper embedded inside it. The first page is
professional and the mathematical programme is legible in outline, but the
document as a whole is organised around twelve full-page landscape plates, not
around a reader following an argument. Twelve of nineteen pages are figure-only;
the text is interrupted by four separate plate blocks; the first theorem appears
on page 7 after five plates; and Figures 8-12 are never cited in the prose.

The mathematics may well be serious. I did not certify it, and nothing below is
a claim that a theorem is false. My verdict is about manuscript form, proportion
and reading experience: **in its present form this would not pass a formal
editorial desk review as a paper**, not because it lacks a journal template, but
because the figure policy, the missing claim hierarchy and the thin scholarly
apparatus make the main contribution hard to find and the argument hard to
follow.

The minimal coherent route is a portrait main paper with five body figures (four composites plus one standalone)
and a separate atlas/supplement for the full-size plates, exact data and
reproduction material. The paper does not need twelve full-page plates; it needs
four to six figures that carry specific claims, placed where those claims are
made.

No journal template was supplied. I do not treat the 11pt `article` class, letter
paper, 1in margins, or the absence of a journal logo as defects. The criticisms
below are common editorial judgment about reading order, figure legibility,
cross-referencing and scholarly framing. The hard, checkable defects are the
clipped text-layer figure titles, the uncited local manuscript used for the
surface definition, and the verification scripts that are named but not supplied.

## Evidence and scope

I viewed all nineteen rendered pages (`page-01.png` to `page-19.png`) before
opening the TeX. Page 1 and pages 7, 10, 14, 17, 18, 19 are portrait
(935 x 1210 px renders); pages 2-6, 8-9, 11-13 and 15-16 are landscape
(1210 x 935 px). The PDF is letter size (612 x 792 pt) with `/Rotate 90` on
exactly those twelve landscape pages.

The page sequence is:

`p1 text | p2-p6 five plates | p7 text | p8-p9 two plates | p10 text | p11-p13 three plates | p14 text | p15-p16 two plates | p17-p19 text`

That is **7 portrait text pages and 12 landscape figure pages**. The
`PAGE_INVENTORY.csv` extracted token counts attribute 1,666 tokens to the seven
portrait pages and 1,472 to the twelve plate pages; these are extraction tokens,
not prose word counts, but they confirm that nearly half of the extracted
"words" belong to captions and figure labels.

The artwork panel on each landscape page is a cream rectangle measuring
930 x 457-529 px in the 1210 x 935 px render, i.e. about 8.45 x 4.15-4.81 in at
110 dpi. It occupies 77% of the page width, 49-57% of the page height and
38-44% of the page area (mean about 41%). The remaining area is page margin,
caption and blank page. Within the cream panel, non-background ink ranges from
2.6% to 43.1% depending on the figure. These are layout facts, not measures of
mathematical merit.

Body text is 11pt Latin Modern in a 6.5 x 9 in text block; captions are 10pt.
Figure text, measured from the PDF text layer, is mostly 6-7pt; the recurring
colour key is 5.3pt on most plates (4.7pt on some); the smallest run on p. 8 is
2.7pt. The body text is comfortable. Much of the figure text is not.

Page 7's text ends at 54% of the text block, leaving about 46% of the page blank
below it. Page 10 is 84% full, page 14 89%, page 17 97%. The half-empty page 7 is
not a typesetting accident; it is caused by the forced page break before the
next plate.

## Ranked findings

### 1. The page plan is a plate catalogue, not a paper (high impact, structural)

**Evidence.** The `\Plate` macro in `main.tex` is
`\clearpage\begin{landscape}\begin{figure}[p]...\end{figure}\end{landscape}\clearpage`.
It is called twelve times. Every call forces a new page before the plate and a
new page after it. The result is the `T FFFFF T FF T FFF T FF TTT` sequence
above. Page 7 is half empty; page 14 begins with the orphan word "Also" because
the paragraph after Proposition 3.1 was pushed past Figures 8-10; page 17 begins
with "Theorem 4.2" with no section heading because Figures 11-12 intervened.
The page number on every landscape page is rotated sideways at the left edge.

**Impact.** A reader cannot follow the argument linearly. The paper has to be
read as a text, then as a plate book, then as a text again. The forced breaks
separate theorems from their proofs and remarks from their antecedents. The
twelve rotations are a physical cost in print and a repeated view-rotation cost
on screen. This is the single largest reason the document does not read like a
formal paper.

### 2. Figure typography is too small for print, and the full-page treatment does not fix it (high impact)

**Evidence.** The panels are wide (8.45 in) but short (4.15-4.81 in). The
lettering inside them is mostly 6-7pt; the colour key is 5.3pt; page 8 contains a
2.7pt run; page 2 has 4.0pt runs; page 9's fifty-digit subtraction is set at
6pt. Body text is 11pt and captions are 10pt, so the figure labels are roughly
55-64% of body size and the key is 48%. The exact decimal strings on p. 9 are
visually impressive but not readable as a string at that size. The y-axis on
p. 9 is labelled only every thirteen decades (`10^-9`, `10^-22`, `10^-35`, ...),
so intermediate magnitudes cannot be read either.

**Impact.** The plates dominate the page but their labels remain subordinate.
This is the worst of both worlds: the figure occupies a page, yet the reader
cannot comfortably read its axes, legends or annotations. Enlarging the artwork enough to fix the type would overflow the page; the
figures need recomposition with larger type, not another scaling factor.

### 3. Five figures are orphaned; the reference economy is broken (high impact)

**Evidence.** The prose cites Figures 1-5 only as a batch on p. 1
("Figures 1-5 display ...") and Figures 6-7 individually on p. 7. Figures 8, 9,
10, 11 and 12 are never cited anywhere in the text. In `main.tex` there is no
`\ref{exchange}`, `\ref{rrfig}`, `\ref{dft}`, `\ref{thetafig}` or
`\ref{mellin}`. The five orphan plates occupy pages 11, 12, 13, 15 and 16.

**Impact.** The reader is given no reason to look at five of the twelve plates.
Their captions have to carry the whole argument for their existence. A formal
paper expects every figure to be referenced at the point where it does work;
otherwise the figure belongs in a supplement or should be removed.

### 4. The main contribution is not staged (high impact, narrative)

**Evidence.** There is no Introduction or Results section. Section 1 begins with
Hermite's near-integer and the surface calculation, then announces Figures 1-5.
The abstract lists a factorization, an inversion, a reflection, a functional
equation and a classification in one paragraph, without ranking them. The first
theorem is Theorem 2.1 on p. 7, after five plates. Its proof depends on
Appendix A on pp. 17-18. The conclusion on p. 17 is a single retrospective
paragraph. Nowhere is there a compact statement of the form "Theorem 2.1 is the
CM recovery; Proposition 3.1 is the involution identity; Theorems 4.1-4.2 are
the analytic classification; the surface definition is from [5]; the certificate
is finite and separate."

**Impact.** An editor or referee cannot quickly see what is new, what is
classical, what is reorganized and what is computational. A cold reader knows the
ingredients but not the claim hierarchy. The paper's strongest result is buried
between the plates and the appendix.

### 5. Captions do too much and too little (medium impact)

**Evidence.** Figure 5's caption (p. 6) is a compressed proof: it lists the
vertex set, the three dot products and the pair counts. Figure 12's caption
(p. 16) lists the four stages already drawn in the boxes. Figure 1's caption
(p. 2) is a list of the five boxes. Figure 11's caption (p. 15) contains the
parenthetical "(the plot labels its positive scale by \(t\))", which is an
apology for a notation clash. By contrast, Figure 3 (p. 4), Figure 7 (p. 9) and
Figure 10 (p. 13) have short captions that state what to notice.

**Impact.** Long captions duplicate the figure instead of interpreting it; short
captions on complex plates leave the reader to infer the point. Captions should
state the takeaway and define only what the figure does not already label.

### 6. The plates carry slide furniture and a semantically unreliable colour key (medium-high impact)

**Evidence.** Every plate has a cream background, a visible panel title, and a
5.3pt footer reading "Golden geometry = gold | Fourier / theta = teal | modular
map = violet | CM / Hermite = blue". The key is not reliable across figures.
Figure 5 (p. 6) uses gold, teal and violet for "30 short chords", "30 long
chords" and "6 antipodal pairs", not for geometry/Fourier/modular. Figure 2
(p. 3) uses coral markers for the lateral pair, and coral is not in the key.
Figure 8 (p. 11) uses red-orange arrows for \(Mv\) and \(A(Jv)\), also not in
the key. Figure 3 (p. 4) uses violet for the rank-loss line, not for a modular
map. The key is therefore a palette legend, not a semantic legend, but it reads
as the latter.

**Impact.** The repeated footer makes every page look like a slide, adds visual
noise, and can mislead a reader who tries to decode colour. It also fails a
grayscale or colour-blind check. The palette itself is coherent and attractive;
the problem is the claim that the colours mean fixed mathematical categories.

### 7. The PDF text layer contains clipped, stale figure titles (medium impact, hidden defect)

**Evidence.** The extracted text on p. 6 contains "Figure 12. Context: the
marked icosahedral chord ratio realizes \(c_0\)" while the visible caption is
"Figure 5". Page 8's text layer says "Figure 10" against caption "Figure 6";
p. 11 says "Figure 05" against caption "Figure 8"; p. 16 says "Figure 09"
against caption "Figure 12". A pixel check at the text-layer coordinates of the word
"Figure" found no ink on all twelve landscape pages. The lines sit above the
visible cream panel and are clipped or otherwise excluded from the rendered page.

**Impact.** This is not a visible numbering clash: the visible captions are
sequential 1-12 and the visible panel titles are unnumbered. It is still a real
defect. A reader who searches the PDF for "Figure 12" may be sent to p. 6, where
the caption says Figure 5. Copy-paste and accessibility tools can expose the
stale lines. More importantly, the lines are strong evidence that the plates were
reordered from a larger atlas without regenerating their titles.

### 8. Mathematical exposition has several avoidable gaps (medium impact; not a certification claim)

**Evidence.**

- On p. 1 the third component of \(S_t\times S_u\) is
  \((1-c)(1-c-2u)\), so rank loss forces \(u=(1-c)/2\) for every \(c\in(0,1)\).
  The remaining components are proportional to \(P(c)\), and the text then says
  "Thus \(c_0=\cdots\)" without explaining that an additional condition
  \(P(c)=0\) is being imposed. The abstract calls \(P\) "the rank-loss
  polynomial", while the Figure 3 caption calls it "the remaining polynomial".
  These are not the same thing as written. The term "lateral" in the Figure 2
  caption is not defined. This needs one clarifying paragraph; I am not claiming
  the formula is wrong.
- On p. 10 the citation `[3, Proposition 2]` is typeset inside the displayed
  inversion formula and runs into the fraction with no space and italic
  "Proposition". It reads like part of the equation. The citation belongs
  outside the display.
- On p. 15, Theorem 4.1 uses \(x>0\), while Figure 11 uses \(t\) and
  \(\Theta_a(t)\); the caption apologises for the mismatch instead of fixing it.
- In Appendix A, \(P_{-640320^3}=A_{163}^2-5B_{163}^2\) is written without an
  argument on the left, the Sturm count does not name the polynomial or
  interval, and the matrix \(A\) of Eq. (5) and the polynomial \(A_{163}\) are
  different objects with the same letter.
- The theorem line "where the last three expressions are evaluated at \(v\)"
  is true but ambiguous: the first expression is also evaluated at \(v\).

**Impact.** These are mostly local fixes, but the first one is conceptual: a
reader cannot tell whether \(P(c)=0\) is the definition of rank loss, a stronger
lateral condition, or a selection of a distinguished point on an already
rank-deficient locus. That ambiguity goes to the paper's title and abstract.

### 9. Citation and reproducibility apparatus is thin (medium-high impact)

**Evidence.** Reference [5] is a local manuscript, "version 5, local manuscript",
used as the source for the surface definition and the rank-singularity theorem.
The appendix names `verification/baseline_cm.py`,
`CM_REPLAY_RESULTS.json` and `verification/baseline_square_certificate.py`, but
those files are not in the supplied input and there is no code/data-availability
statement or repository/DOI. The bibliography has only five items. The product in Eq. (3), and the "Rogers-Ramanujan inversion" named in Figure 9,
have no citation. The Hermite reference omits the French accents ("theorie",
"equations", "resolution", "cinquieme"). The DLMF reference has no release
version or editors.

**Impact.** A reader cannot obtain the foundational surface definition or replay
the finite certificate from the supplied PDF. The literature positioning is too
thin for a paper that connects Hermite, Klein, Duke, Rogers-Ramanujan and a
Davenport-Heilbronn classification. This is not a demand for a survey; it is a
demand for the few citations that make the claims checkable.

### 10. The title block and metadata still signal a draft (medium-low impact)

**Evidence.** The title block contains "Local assembled draft" directly under
the date, a personal Gmail address, and no affiliation, keywords or MSC codes.
The PDF is untagged (pdfinfo)
and has no accessibility structure or visible alt text. The body uses blue hyperlinks on every
citation, which is acceptable but visually loud against the muted figure palette.

**Impact.** "Local assembled draft" is honest and appropriate for an internal
document, but it tells an editor this is not a submission. The missing metadata
is a common submission expectation, not a universal rule. The accessibility
issues are editorial good practice, not a formal requirement unless the target
journal has one.

## What already works

- **The first page.** The title, author block, abstract and Section 1 are cleanly
  set. The Hermite near-integer hook is genuinely attractive, and the move to
  \(P(c)=c^2-3c+1\), the pentagon and the icosahedron gives the paper a concrete
  visual identity.
- **The mathematical chain.** In outline the sequence surface \(\to c_0,u_0\)
  \(\to\) CM recovery \(\to\) involution \(\to\) Poisson-Mellin classification is
  clear. The theorem/proof style is standard, the equations are well typeset,
  and the main objects are introduced in a sensible order once the plates are
  skipped.
- **Several figures are scientifically useful.** Figure 3 (p. 4) makes the
  rank-loss locus and the root \(c_0\) visible together. Figure 8 (p. 11) is a
  clean reflection diagram. Figure 10 (p. 13) is a direct, readable picture of
  the odd five-periodic eigenvector. These are worth keeping, at a smaller size.
- **The vector artwork.** `pdfimages -list` shows no raster images; the figures
  are vector and will print cleanly. The palette is coherent, the cream panel is
  consistent, and the 3D surfaces are carefully made.
- **Honest boundaries.** The abstract says exact finite certificates are kept
  distinct from analytic proofs. Appendix B explicitly says the odd-\(N\)
  theorem is a finite-Fourier result, "distinct from an unconstructed
  \(N\)-dependent surface". The conclusion states an open question rather than
  overclaiming. This is a real strength and should be preserved.
- **Some captions are good.** Figures 3, 7, 9 and 10 have captions that state the
  point without turning into a proof. The problem is the other captions, not the
  caption style as such.

## Minimal coherent redesign

This is the smallest set of changes that would make the document read as a
paper rather than a plate book. It does not require new mathematics.

1. **Add a one-page Introduction and Results section before the surface
   calculation.** State the surface definition, the golden coordinate, the CM
   recovery, the involution and the Poisson-Mellin classification in that order.
   Add a short claim ledger: Theorem 2.1 (CM recovery), Proposition 3.1
   (involution/eigenline), Theorems 4.1-4.2 (functional equation and
   classification); mark the surface input as [5], the Klein identity as
   classical/attributed, and the certificate as finite/computational. This single
   page solves most of the "main contribution is not apparent" problem.

2. **Replace the one-figure-per-landscape-page policy with five portrait body
   figures (four composites plus one standalone).** Group the twelve plates as in the disposition table
   below. No main-body page should be figure-only. If a plate genuinely needs a
   full page, it belongs in the supplement, not the main paper.

3. **Recompose the figure typography, do not merely scale it.** Remove the
   clipped "Figure NN." plate titles and the duplicated panel titles where they
   repeat the caption. Remove the recurring colour-key footer from individual
   plates; put one key in the supplement, and use direct labels in the figures.
   Set axis labels at 7pt or larger, annotations at 8pt or larger, panel titles
   at 9-10pt. No text below 6pt. Keep the cream background only if it is a
   deliberate house style; otherwise use white or a light plot background.

4. **Rewire the references and the page flow.** Cite every figure within one page
   of its first mention; place each composite figure after that mention. Remove
   `\clearpage` around figures. No section should resume with "Also" after a
   plate block. Fix the p. 10 citation placement, the p. 15 \(t/x\) mismatch,
   and the Appendix A notation. If the paper uses landscape at all, use
   `sidewaysfigure` in the supplement so page numbers and headers stay upright;
   do not use `pdflscape` for every plate.

5. **Make the scholarly apparatus checkable.** Replace [5] with an accessible
   reference or include the surface definition and rank-singularity statement in
   an appendix. Add a standard Rogers-Ramanujan citation for Eq. (3)/Figure 9.
   Add a code/data-availability statement and a supplement containing the
   certificate inputs/outputs and the exact decimal data. Fix the Hermite
   accents. Remove "Local assembled draft" from the title block for submission;
   add affiliation, keywords and MSC codes if the target journal expects them.

## Figure disposition table (all twelve figures)

The "measured" column uses the cream-panel bounding box and the non-background
ink fraction inside it. Ink fraction is a crude proxy for how much of the panel
is used, not a measure of scientific value.

| Fig. (page) | Content | Measured | Disposition | Suggested target |
|---|---|---|---|---|
| **1** (p. 2) | Connection map: surface coordinate, reflection, exchange, eigenline, functional equation | Panel 8.45 x 4.8 in; 43% of page; ink 4.5%; labels 6-7pt, key 5.3pt | **Move to supplement / optional simplified roadmap.** It uses symbols not yet defined and is more useful after the results are stated. | Supplement Fig. S1, 0.9\textwidth; or a simplified 0.8\textwidth portrait roadmap after the Introduction, with only \(c_0,u_0,\kappa\) and the three result labels. |
| **2** (p. 3) | Global ruled surface and local lateral patch | Panel 8.45 x 4.8 in; 43% of page; ink 37.7%; labels 6.7pt | **Combine** with Figs. 3-4 into Group A, "The golden coordinate". | Body Fig. 1(a), 0.95\textwidth composite, Section 2 after Eq. (2). |
| **3** (p. 4) | Rank-loss contour, locus \(u=(1-c)/2\), \(P(c)\) and \(c_0\) | Panel 8.45 x 4.7 in; 42% of page; ink 43.1%; labels 6.7pt | **Combine** as the lead panels of Group A. This is the most informative plate. | Body Fig. 1(b)-(c), 0.95\textwidth, Section 2. |
| **4** (p. 5) | Unit pentagon: side/diagonal ratios, \(u_0=\cos72^\circ\) | Panel 8.45 x 4.7 in; 42% of page; ink 2.6%; labels 7.3-8.7pt | **Shrink/combine** as a small inset or fourth panel; it does not earn a full page. | Body Fig. 1(d), 0.4-0.45\textwidth panel, or 0.55\textwidth standalone near Eq. (2). |
| **5** (p. 6) | Marked icosahedron, chord counts, squared ratio | Panel 8.45 x 4.8 in; 44% of page; ink 21.7%; labels 6.7-10pt | **Move to supplement/atlas.** It is a side realization, not referenced, and its caption duplicates a proof. | Supplement Fig. S2, 0.9\textwidth portrait or full landscape if the 3D detail needs it; keep one sentence and the dot-product count in the body. |
| **6** (p. 8) | Two CM arguments: \(i\) versus \(\tau_{163}\) | Panel 8.45 x 4.3 in; 39% of page; ink 26.3%; labels 5.3-8.7pt; 2.7pt run | **Combine** with Fig. 7 into Group B, "CM at \(\tau_{163}\)". | Body Fig. 2(a), 0.95\textwidth composite, Section 3 after Theorem 2.1. |
| **7** (p. 9) | Hermite near-integer: exact gap and \(j\)-series residual | Panel 8.45 x 4.2 in; 38% of page; ink 4.5%; labels 6pt, key 4.7pt | **Combine** as Group B(b); move the fifty-digit string to a table. | Body Fig. 2(b), 0.95\textwidth panel; exact data in Supplement Table S1. |
| **8** (p. 11) | \(M\) reflection and \(A=JMJ\) reflection diagrams | Panel 8.45 x 4.4 in; 40% of page; ink 5.6%; labels 6-7pt, key 4.7pt | **Combine** with Fig. 9 into Group C, "Involution geometry". | Body Fig. 3(a)-(b), 0.9\textwidth, Section 4 after Proposition 3.1. |
| **9** (p. 12) | Fixed point \(R(z)\) and direct inversion-paired product curves | Panel 8.45 x 4.6 in; 41% of page; ink 4.4%; labels 6.7pt | **Combine** with Fig. 8 as Group C(c)-(d). If the 2x2 grid becomes too dense, move this panel to the supplement. | Body Fig. 3(c)-(d), 0.9\textwidth; fallback Supplement Fig. S3. |
| **10** (p. 13) | Odd five-periodic DFT eigenvector: bars and residue circles | Panel 8.45 x 4.5 in; 41% of page; ink 9.2%; labels 6.7-10pt | **Retain, shrink.** It directly illustrates \(V_5\) and \(\mathcal T\), and it is referenced in the text. | Body Fig. 4, 0.8\textwidth, about 0.35 page height, Section 4 after the definition of \(V_5\). |
| **11** (p. 15) | Numerical theta self-duality | Panel 8.45 x 4.6 in; 42% of page; ink 3.5%; labels 6.7-7.3pt, key 4.7pt | **Combine** with Fig. 12 into Group D, "Theta and Mellin completion". | Body Fig. 5(a), 0.95\textwidth, Section 5 after Theorem 4.1. |
| **12** (p. 16) | Four-stage Mellin completion schematic plus paired profile | Panel 8.45 x 4.5 in; 41% of page; ink 4.2%; labels 6.7-8pt | **Combine/simplify** as Group D(b); the four boxes duplicate the theorem and read as a slide. | Body Fig. 5(b), 0.95\textwidth; detailed schematic in Supplement Fig. S4 if it is retained at all. |

**Body result:** five figures (four composite groups A-D, plus old Fig. 10 as
new Fig. 4 standing alone), with two supplement plates (old Figs. 1 and 5, Supplement Figs. S1-S2) and
supporting tables. If Group C is too dense, move Fig. 9 to the supplement; the
main paper then has four body figures and three supplement plates. Both are
coherent; the five-figure version is preferable for reader benefit.

## Page targets (estimates, not quotas)

The current 19 pages contain about 6.1 pages of actual text ink (summing the
portrait-page text-block fills), 12 plate pages, and a half-empty page 7. A
portrait main paper with the five body figures above, a one-page
Introduction/Results, and both appendices should land at roughly **11-13 pages**.
If the detailed certificate material is moved to the supplement and only a short
certificate statement remains in Appendix A, the main paper should be **9-11
pages**. The supplement/atlas should be **6-9 pages**: two full-size plates,
the exact-data tables, the full certificate transcript, the colour key and
reproduction notes.

These are estimates, not a quota. The point is not to hit a page count; it is to
replace twelve figure events with five, remove the forced breaks, and let the
argument determine the length. A paper that is 12 pages with five well-placed
figures is more readable than a 19-page paper with twelve plates, even if the
mathematics is identical.

## Closing

This is a local AI cold review, not external human peer review. I did not certify
the theorems, the CM/Klein identities, the Poisson-Mellin proof or the exact
certificate. I did verify the page geometry, the figure order and citations, the
hidden text-layer titles, and several elementary algebraic identities; the
limits file records exactly what was and was not checked. The manuscript is worth
revising, not dismissing: the mathematical programme is visible, the figures are
carefully made, and the honesty about certificates versus analytic proofs is a
good foundation. What it needs now is an editor's hand on structure, not a new
research programme.
