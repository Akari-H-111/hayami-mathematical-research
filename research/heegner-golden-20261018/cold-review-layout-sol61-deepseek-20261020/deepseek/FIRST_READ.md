# First read: what the rendered manuscript feels like

## Access actually used

I viewed the rendered page images `../input/pages/page-01.png` through
`page-19.png`, all nineteen, in order. I did this before opening `main.tex`,
`PAPER_TEXT.txt`, `PAGE_INVENTORY.csv`, or any other source. Page 1 is a
935 x 1210 px portrait render; the twelve landscape pages are 1210 x 935 px
renders. The PDF itself uses a 612 x 792 pt letter MediaBox and sets
`/Rotate 90` on pages 2-6, 8-9, 11-13 and 15-16, so those pages open as
landscape in a conforming viewer. I also used `pdfinfo` and `pdfseparate` only
to establish page count, page size and per-page rotation.

Visual limitation: the page images are about 110 dpi. Body text is comfortably
legible; much of the lettering inside the figures is at the edge of legibility
and some legend and axis text cannot be read reliably at this resolution. I am
therefore confident about composition, scale, orientation and gross
legibility, but not about every small glyph in the plates. No OCR was used for
the first read.

## First impression

The first page looks like a real mathematics paper. The title is long but
serious, the author block is clean, the abstract is set as a single justified
paragraph, and Section 1 begins with an attractive historical hook: Hermite's
1859 near-integer, the five-periodic coefficient space, and the quadratic
\(P(c)=c^2-3c+1\). The typography is restrained and the page has an ordinary
article silhouette.

The second page destroys that impression. It is a landscape page containing
Figure 1, a five-box flow diagram. The diagram itself occupies a horizontal
band across the middle of the page, with very large empty areas above and
below it. Page 3 does the same for two small 3D surface panels; page 4 for a
contour plot and a parabola; page 5 for a pentagon; page 6 for an icosahedron.
Five consecutive rotated pages follow a single page of text. The reader has to
turn the document (or the head) five times before reaching Section 2 on page 7.
After one portrait page, pages 8-9 are two more landscape plates. After page
10, pages 11-13 are three more. After page 14, pages 15-16 are two more. The
pattern continues to the end of the scientific body.

The overall object therefore reads as **a short paper embedded in a
twelve-plate visual atlas**, not as a conventional mathematics article. The
plates look as if they were designed as presentation slides or catalogue
entries and then given one page each. The prose reads as the connective tissue
between them. That is a legitimate genre, but it is not the genre promised by
the title page, and the mismatch is the central reading experience.

## Is the main contribution apparent?

Partly, and later than it should be.

- The title announces three things: a golden coordinate at "level five", rank
  loss for a ruled surface, CM values, and Fourier self-duality. The abstract
  adds a certified factorization, Duke's inversion at \(i\), and a
  Poisson-Mellin functional equation. This is a lot of vocabulary before any
  object has been defined.
- The first section does give a concrete, memorable entry point: the
  near-integer \(e^{\pi\sqrt{163}}\), the polynomial \(P(c)=c^2-3c+1\), and the
  surface coordinate \(u_0=\cos(2\pi/5)\). I understand by the bottom of page 1
  that the paper wants to connect a ruled-surface degeneracy to a level-five
  arithmetic and Fourier story.
- By page 7, Theorem 2.1 states a CM recovery with explicit formulas. That is
  the first moment the paper looks like it is proving something rather than
  introducing a diagrammatic programme. But the theorem arrives after six
  pages of plates, and the reader has not been told which of the surrounding
  identities are classical, which are reorganized, and which are new.
- Nowhere in the first nineteen pages did I find a short, prominent statement
  of the form "the main theorem is X, and it is new because Y". The conclusion
  on page 17 is a retrospective paragraph, not a claim ledger. The abstract
  lists achievements but does not rank them.

So the contribution is visible in pieces, but its shape is not. A research
graduate entering cold would know the ingredients and the intended bridge;
they would not know what to check first, what the paper's single strongest
claim is, or where the boundary between proof and certificate lies.

## Where attention and reading flow break

1. **The first orientation change, page 2.** Page 1 ends by advertising
   Figures 1-5. The reader turns the page and is given a full landscape flow
   chart whose labels are much smaller than body text. The figure is not
   answering a question just raised in the prose; it is a map of the whole
   paper. Placing the map before the journey is defensible, but at this scale
   and orientation it functions as an interruption.

2. **Five plates in a row, pages 2-6.** Figures 1-5 are all full-page
   landscape plates. Their subjects range from a flow chart to a 3D surface to
   a contour plot to a pentagon to an icosahedron. There is no continuous prose
   between them. A reader trying to follow the argument must remember page 1
   across five page turns, or skip to page 7. Most will skip.

3. **The half-empty page 7.** Section 2 begins near the top of page 7, states
   the eta-like product and the Klein relation, gives Theorem 2.1 and its short
   proof, then stops about halfway down the page. The lower half is blank. The
   page break is evidently there to put Figures 6-7 on their own landscape
   pages. This is the clearest visible cost of the one-figure-per-plate policy.

4. **Page 14 begins with "Also".** After three landscape figures (pages 11-13),
   the prose resumes at the top of page 14 in the middle of an algebraic
   argument: "Also \(X^4+2X^3-\cdots\)". The antecedent is not on the
   preceding page. Even a careful reader has to hunt backwards through rotated
   plates to find what "Also" refers to. This is not a local wording problem;
   it is a structural break caused by float placement.

5. **Twelve orientation changes.** Pages 2-6, 8-9, 11-13 and 15-16 are rotated.
   The page number is printed sideways at the left edge, which makes even
   pagination awkward. On screen the reader must rotate the view; in print the
   reader must rotate the physical sheet. Doing this twelve times in nineteen
   pages is a high cost for figures that are often only 50-60% of the plate's
   width and much less of its area.

6. **Figure text is subordinate to page size, not reader size.** The plates
   leave wide margins and large top/bottom fields while the actual plot or
   diagram is modest. On pages 2, 5, 8, 9, 11, 12, 13, 15 and 16 the graphic
   occupies a small fraction of the available landscape area. The result is
   the worst of both worlds: the page is dominated by a figure operationally,
   but the figure's labels are still small. Figure 1's box labels and Figure 8's
   legend are notably smaller than the body text.

7. **Captions often repeat the figure instead of advancing the argument.**
   Figure 5's caption repeats the vertex set and the dot-product count already
   printed inside the figure. Figure 10's caption explains the DFT normalization
   after the figure has already labelled the residues. Figure 12's caption is a
   list of the four stages drawn in the boxes. Captions are doing atlas labels,
   not paper captions.

8. **The abstract is a wall of claims.** It is one paragraph, roughly a dozen
   lines, with no sentence that says "we prove" versus "we compute" versus "we
   recall". The phrase "exact finite certificates are kept distinct from the
   analytic proofs" is a good editorial instinct, but it arrives as the last
   sentence, after the reader has already lost the thread.

## What the pages seem intended for

The title block says "Local assembled draft". The page sequence bears that
out: this looks like an internal assembly of verified components, intended to
show collaborators or the author that the pieces fit together. The figures are
not afterthoughts; they are the most carefully produced objects in the
document. They appear designed to be inspected one at a time, at a desk or on
a screen, with the prose serving as a key. The exact numerical displays on
pages 9 and 18, the fine-grained panel labels, and the colour legend that
recurs on every plate all point to a working atlas.

That is a coherent purpose. It is not the purpose of a submitted journal
article, where the argument should be readable in one pass and figures should
support specific claims at the point where the claims are made.

## Page-by-page first-read notes

- **p. 1, portrait.** Title, author, date, "Local assembled draft", abstract,
  Section 1. Strong opening hook. Equations (1)-(2) are clear. The sentence
  "Figures 1-5 display ..." at the foot is a forward pointer to a five-page
  block, not a local reference.
- **p. 2, landscape.** Figure 1, connection map. Five boxes and arrows. Large
  empty top and bottom. Labels smaller than body text. Caption at the bottom of
  the rotated content.
- **p. 3, landscape.** Figure 2, two 3D surface panels. Modest panels, much
  white space. Axis labels are small but the shape is visible.
- **p. 4, landscape.** Figure 3, rank-loss contour plus \(P(c)\). This is the
  most informative plate on first read: it makes the rank-loss locus and the
  root \(c_0\) visible together. The contour labels and colorbar are small.
- **p. 5, landscape.** Figure 4, unit pentagon. A simple diagram given a whole
  landscape page. The \(72^\circ\) arc and the diagonal label are crowded at
  the centre; the right-hand text is far from the geometry it explains.
- **p. 6, landscape.** Figure 5, marked icosahedron. The chord classification
  is clear in the side text, but the 3D drawing is dense and the caption
  duplicates the counts.
- **p. 7, portrait.** Section 2 begins. Product formula (3), Klein relation (4),
  Theorem 2.1 and proof. Roughly the lower 45% of the page is blank. The first
  genuine theorem of the paper is stranded on a half-page.
- **p. 8, landscape.** Figure 6, two CM arguments in the upper half-plane. The
  left panel is legible; the right-hand annotations are tiny and oddly centred.
  Much empty space.
- **p. 9, landscape.** Figure 7, Hermite near-integer profile with exact
  decimal strings. Visually striking, but the exact number strings are set
  small and the log plot labels are very small. A full page for one log plot.
- **p. 10, portrait.** Section 3, Duke inversion, the matrices \(M,J,A\),
  Proposition 3.1 and proof. Dense but readable. A citation marker sits
  immediately after the displayed inversion formula, visually colliding with
  the equation number area.
- **p. 11, landscape.** Figure 8, two reflection diagrams. Clean geometry, but
  panel titles and legends are small; the bottom third of the plate is empty.
- **p. 12, landscape.** Figure 9, Rogers-Ramanujan inversion and paired
  products. Two panels; labels small; generous empty margins.
- **p. 13, landscape.** Figure 10, DFT input/output bar chart and residue
  circles. The bar chart is legible; the right-hand explanatory text is much
  smaller than body text. Large empty lower area.
- **p. 14, portrait.** Resumes with "Also" and an algebraic identity, then
  Section 4, Theorem 4.1 and proof. Starts mid-argument after three plates.
- **p. 15, landscape.** Figure 11, compensated theta self-duality. One small
  plot plus a text panel. The formula in the text panel is very small; the
  caption has to explain a labelling convention in the plot.
- **p. 16, landscape.** Figure 12, Mellin completion. This reads as a slide:
  four process boxes, a formula, then a two-curve plot. It is the least
  paper-like plate. The plot legend is small and the whole composition is
  floating in a large white field.
- **p. 17, portrait.** Theorem 4.2 and proof, Section 5 conclusion, start of
  Appendix A. Dense and readable. The conclusion is one paragraph.
- **p. 18, portrait.** Appendix A certificate, large integer coefficients,
  interval estimates, Corollary A.1. Very dense; monospace file paths break
  awkwardly across lines. This page feels like a different document: a
  verification log rather than expository prose.
- **p. 19, portrait.** Appendix B odd-\(N\) extension and References. Only five
  references. The ending is abrupt: the paper's last substantive page is an
  appendix, with no discussion of limitations or open problems beyond one
  sentence on page 17.

## First-read verdict

This does **not yet read like a formal mathematics paper**, despite a
professional first page. It reads like a mathematically serious working atlas
with an embedded short paper. The figures are often well made and
scientifically useful, but their one-per-landscape-page treatment dominates the
document, fragments the argument, wastes space, and makes the main theorem
harder to find. A reader who is willing to treat the PDF as a portfolio of
plates will find much to look at. A reader expecting a linear proof will keep
losing the thread.

The strongest first impression is the opening Hermite/pentagon material. The
weakest is the sequence of five plates before Section 2 and the resumption at
"Also" on page 14. The main contribution is present but not staged; the paper
needs a clear claim hierarchy and a figure policy that serves reading order
rather than catalogue order.
