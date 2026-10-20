# Independent cold review

## Verdict

**Substantial editorial restructuring is needed before this reads as a finished formal mathematics paper.** The definitions, statements, proofs, and technical appendix provide an article's mathematical framework. The present nineteen-page arrangement gives twelve separate landscape sheets to illustrations, repeatedly displacing the argument. It reads more like a short mathematical paper embedded in a lecture atlas than an article whose figures support a continuous proof narrative.

This is not a recommendation to discard the visual work. Several figures clarify genuine conceptual obstacles. The smallest coherent change is to integrate three compact figure groups into a portrait article and retain the fuller geometric and numerical material in a separate atlas. A larger figure budget could also work, provided figures occupy useful fractions of text pages and have distinct explanatory jobs. One figure per page is not warranted by the present content.

This verdict is editorial judgment, not a journal rule. No journal template or numerical limit on illustrations was supplied. Page allocation measures the current reading burden; it does not measure mathematical merit.

## Evidence and proportions

All page references below are physical PDF page numbers. Figure numbers are the visible article caption numbers, not asset filenames or embedded graphic titles.

The PDF has nineteen US Letter media boxes, each 612 × 792 points. Twelve pages carry a 90-degree rotation and display as 792 × 612 points: **2–6, 8–9, 11–13, 15–16**. The remaining seven pages are portrait: **1, 7, 10, 14, 17–19**. There are **eight changes of displayed orientation**, not a change at every page turn. The landscape sequence occurs in four blocks of five, two, three, and two pages.

Every landscape page contains one numbered figure and its caption, without ordinary running argument. Thus 12/19 pages (63.2%) are dedicated figure sheets. This is a sheet count, not an estimate that figures contain 63.2% of the intellectual content. Portrait pages include appendices and references as well as the main argument.

PDF placement matrices show uniform scaling: the current layout does **not** stretch the graphics anisotropically. All twelve placed graphic boxes are approximately **609.1 points (8.46 inches) wide**, or 76.9% of displayed page width. Their heights range from **299.3 to 345.9 points (4.16–4.80 inches)**. Their actual width/height ratios range from **1.761 to 2.035**, compared with 1.294 for a displayed landscape page. These are wide graphics centered on a less wide sheet, not page-filling compositions. The graphic boxes occupy **37.6–43.5% of sheet area**, excluding the outside caption. Those boxes themselves contain cream-colored background and internal whitespace; the percentages are not ink coverage or useful-information density.

The source explains the result directly: `\Plate` inserts `\clearpage`, a `landscape` environment, a page float, and another `\clearpage` for every figure. Width and height limits preserve aspect ratio; width is the active constraint in the measured placements. The supplied inventory agrees with the independently read PDF page dimensions and rotations. Its extracted word counts mix prose, formulas, chart text, and extraction artifacts, so I have not used them as an exposition metric.

## Ranked findings

### 1. The compulsory plate sequence breaks the mathematical dependency chain

**Evidence:** page 1 refers collectively to Figures 1–5, which occupy pages 2–6. Theorem 2.1 then starts on page 7. Proposition 3.1 ends on page 10; Figures 8–10 occupy pages 11–13; its associated norm-quartic paragraph resumes with “Also” on page 14. Theorem 4.1 and its proof are on page 14, while Figures 11–12 separate them from Theorem 4.2 on page 17.

**Impact:** readers must retain definitions and proof context through two to five sheets of illustrations. The interruption between the two Section 4 theorems hides the fact that the second classifies the symmetry just constructed by the first. The orphaned “Also” is direct evidence of a structural break, not just an aesthetic preference.

**Action:** remove compulsory page breaks from the article figure mechanism. Finish the fixed-point and norm discussion together. Keep Theorems 4.1 and 4.2 in an uninterrupted section; put optional numerical pictures after the argument or in the atlas.

### 2. The entrance presents ingredients before establishing the result hierarchy

**Evidence:** the two-line title and abstract on page 1 name the geometric, CM, Fourier, and analytic strands. The introduction opens with Hermite's near-integer phenomenon and a shared quadratic field, then asks which calculations connect them. The key identity `A = JMJ` does not appear in the running argument until page 10, and the classification statement arrives on page 17. The square-witness field equality is a corollary in Appendix A on page 18.

**Impact:** the reader understands the theme early but must infer which results are the paper's contribution, which are standard consequences, and why the CM branch and the fixed-point branch belong in the same argument. “Certified” in the abstract also presupposes a verification context that the supplied article alone does not fully deliver.

**Action:** add a short contribution paragraph and one compact principal-result statement or roadmap. Identify the surface calculation, exact field-recovery certificate, explicit conjugacy, and signed classification separately. Mark Duke's formulas and Poisson summation as external inputs. Explain the CM branch at `tau_163` and the symmetry branch at `i` in two sentences before invoking either. Decide explicitly whether Corollary A.1 is a central result; if it is, announce it at the entrance while keeping its coefficient-heavy proof in the appendix. Do not invent novelty claims without a literature check.

### 3. Figure scale is assigned by asset rather than by reader benefit

**Evidence:** Figure 2 (page 3) gives two surface views; its local patch occupies a small part of a large 3D plotting box. Figure 3 (page 4) uses a heatmap and a second plot to illustrate an already explicit quadratic root. Figure 4 (page 5) devotes a sheet to one pentagon and two ratios. Figure 6 (page 8) uses a large upper-half-plane plot to distinguish two points. Figure 11 (page 15) pairs two almost coincident numerical curves with formulas from the proof. All receive the same dedicated-sheet treatment.

**Impact:** elementary context, interpretive geometry, and numerical diagnostics appear equally important. Spacious panels do not consistently make the difficult information more legible. The all-66-chords picture in Figure 5 (page 6) becomes visually busy despite the large sheet; the adjacent counts communicate its key information more efficiently.

**Action:** preserve a surface view, a rank-loss inset, a small connection map, and the reflection/eigenvector explanation in the body. Treat pentagonal/icosahedral context and numerical agreement plots as atlas material. Replace the body function of Figure 6 with a compact two-row table. Tighten the local surface view's axes without changing geometric scale relationships or concealing the singular point.

### 4. Straight reduction would make the typography worse

**Evidence:** small axis labels, legends, and the repeated color-key footer are already visibly subordinate on pages 2–6 and 8–16. For example, in Figure 11 (page 15), 12-point graphic labels are placed at scale 0.55570, making them about **6.67 PDF points**; its 9.5-point color-key footer becomes about **5.28 points**. The surrounding caption is about 10.91 PDF points. Reducing that complete asset from 609 to the portrait text width of 468 points would reduce those labels further to about 5.12 points.

**Impact:** simply changing `\Plate` to an ordinary full-width portrait float would improve continuity while reducing figure legibility. The small recurring footer adds repeated visual furniture rather than useful local interpretation. Light grids, fine lines, and low-contrast secondary text also need checking at final print size.

**Action:** recompose selected panels at their intended output size, remove repeated slide furniture, and move prose/formula explanations into captions or the article. Use approximately 9–10-point figure text where practical, with 8 points as a review threshold for necessary fine labels, not a universal publication rule. Keep line styles and explicit labels so color is supplementary. Preserve isotropic scaling and equal axes for circles and geometric comparisons.

### 5. Some numerical captions omit the hypotheses and methods needed to interpret them

**Evidence:** Figure 11 (page 15) states scalar theta self-duality and an even compensated profile; its caption invokes Theorem 4.1. That theorem on page 14 gives the *paired* relation with `a' = T a` for arbitrary `a` in `V_5`. Scalar self-duality requires the positive eigenvector. Figure 12 (page 16) likewise illustrates a scalar functional equation without identifying the coefficient vector in its outside caption. Its fixed-height complex slice uses real-coefficient conjugation as well as the functional equation to explain even real and odd imaginary parts. Figure 3's log-norm plot (page 4) does not describe how the zero or a finite-grid floor is handled. Figure 7 (page 9) displays many decimal digits and corrections without enough information in its caption to reproduce the residuals.

**Impact:** a reader can mistake a special-vector illustration for the general theorem or take plotted agreement as verification with unspecified numerical tolerances. These are incomplete mathematical descriptions of the figures, not demonstrated counterexamples to the stated theorems.

**Action:** state `a = (1, kappa, -kappa, -1, 0)` and the normalization in the relevant captions. Use `x` consistently for the theta scale; the current page-15 caption has to translate the figure's `t` back to the article's `x`. Give summation/truncation, precision, grid, error/residual definition, and any color-floor conventions in the atlas. Report a residual or error bound where numerical independence matters; coincident curves alone cannot quantify agreement. Keep the Hurwitz-zeta representation on page 16 clearly within its initial domain or explain the analytic continuation and cancellations being used for that plot.

### 6. Formal exposition is economical to the point of making the reader reconstruct organization

**Evidence:** Theorem 2.1 (page 7) uses `A_163` and `B_163` before they are defined in Appendix A (pages 17–18). Page 10 packs the fixed point, conjugacy, half-angle formulas, another trigonometric expression, and inverse coordinate formulas into one proposition. The norm quartic is an unheaded addendum on page 14. The `a_i`, `b_i` certificate coefficients in Appendix A reuse notation already associated with periodic coefficients.

**Impact:** individual formulas may be clear, but the hierarchy between essential argument and useful identity is weak. The appendix reference in the proof helps, but a theorem statement should identify the polynomials it depends on immediately. Long integers should remain checkable without obscuring their role.

**Action:** identify the appendix polynomials in the lead-in to Theorem 2.1. Give the fixed-point/conjugacy argument priority; put secondary trigonometric and norm identities in one adjacent remark. Rename the appendix's fixed integer coefficients or explicitly distinguish them from the sequence. State the local real parameter domain of the surface next to equation (1): the square-root formula is not a parametrization for arbitrary real `t`, and its chosen endpoint branches trace arcs of the supporting circles. None of these clarifications requires a new theorem.

### 7. References and verification pointers are not yet a self-contained scholarly delivery

**Evidence:** references on page 19 include precise Duke equation/proposition locators and a DLMF section, which are helpful. Reference [5] is only a “local manuscript” with a version and a descriptive theorem pointer, without a stable accessible identifier or actual theorem number. Appendix A (page 18) names two checker paths and a JSON result file, none supplied in `../input/`. The supplied PDF text layer also retains internal asset headings such as “Figure 12” on page 6 (visible article Figure 5) and “Figure 05” on page 11 (visible Figure 8). Those internal titles were not visibly printed in the supplied page images.

**Impact:** the article has enough displayed algebra for some independent checks, but its reproducibility claims and local citation are not independently traversable from this evidence package. Stale internal numbering can confuse copying, searching, or accessible text consumption even when visible captions are correct.

**Action:** provide a versioned, accessible source for [5], or make the local geometric derivation explicitly self-contained and describe [5] only as provenance. Supply or archive the named checkers with exact usage and provenance before advertising reproducible certification. Regenerate figure text layers with one consistent numbering system. Verify the external historical, modular, and Davenport–Heilbronn attributions against their cited sources before publication; this review did not access those sources.

## What already works

- The page-1 derivation gives the surface coordinate an explicit mathematical origin rather than relying on resemblance to a familiar shape. Figure 2 adds useful spatial understanding.
- Figure 1 (page 2) is a potentially effective roadmap. Its separate CM branch already discourages conflating `i` with `tau_163`; that distinction should also lead the prose.
- The reflection comparison in Figure 8 (page 11) explains the coordinate exchange and different slope conventions. The residue order in Figure 10 (page 13) addresses a genuine Fourier-sign bookkeeping problem.
- Theorem/proof typography, equation numbering, ordinary margins, and serif mathematical text are recognizable and mostly comfortable. I saw no gross overlap or broken mathematical glyphs in the nineteen supplied images. This does not certify every small label.
- Theorem 4.1 (page 14) displays the Fourier normalization and Poisson constants rather than hiding them. Theorem 4.2 (page 17) includes a converse argument and separates nonmultiplicativity from an externally attributed zero result. Appendix B (page 19) explicitly distinguishes the odd-N Fourier statement from an unconstructed geometric extension.
- Appendix A preserves concrete polynomials, coefficients, and a square witness. Limited exact symbolic checks in this review passed: the printed Klein identity and gcd, the `U` substitutions, square-witness remainder and stated signs, norm quartic, and the signs of `A_163` and `B_163` over the printed rational interval. These checks support those individual algebraic assertions; they do not certify the full paper, the selected CM value, the external inputs, or plotted data.

## Disposition of all twelve figures

Sizes below refer to newly composed content at final size, **not** proportional reductions of the existing sheets. Portrait text width in the present setup is 468 points (6.5 inches). Approximate heights exclude outside captions. Ratios are measured graphic-box width/height in the current PDF.

| Figure / PDF page / current ratio | Proposed disposition | Reader benefit and suggested final size/location |
|---|---|---|
| 1 / 2 / 1.765 | Retain in body; shrink by recomposition | Roadmap after the contribution paragraph. Simplify boxes to the essential maps; about 0.95 text width × 140–170 pt. Put the CM branch in a clearly separate inset or line. |
| 2 / 3 / 1.776 | Retain in body; combine with selected Figure 3 content | Main geometric picture immediately after the rank-loss derivation. One useful global view and a genuinely informative local inset; combined group about 0.95 text width × 210–240 pt. Preserve the second large view in the atlas if it cannot remain clear. |
| 3 / 4 / 1.821 | Combine with Figure 2; move full diagnostic to supplement | A small polynomial/root or parameter-domain inset can connect picture and algebra. Do not retain a standalone quadratic-graph sheet. Keep the full heatmap, domain, and color-floor method in the atlas. |
| 4 / 5 / 1.804 | Move to supplement; combine with Figure 5 | Useful golden-coordinate context, not a dependency of the CM/Fourier proof. A 0.45–0.55 text-width pentagon beside a compact ratio table on the geometry atlas page. Mention the ratio in one body sentence. |
| 5 / 6 / 1.761 | Move to supplement; combine with Figure 4 | Preserve vertices, dot products, and all pair counts. Use a 0.6–0.8 text-width geometry panel plus a legible table, preferably showing chord classes separately rather than all 66 at equal emphasis. Allow its own atlas page if needed for honest spatial reading. |
| 6 / 8 / 1.957 | Move diagram to supplement; replace body role by table | The important distinction is two arguments and two roles, not a large fundamental-domain picture. Put a two-row `tau / q / j / role` table before Theorem 2.1; retain the upper-half-plane plot at about 0.6 text width in the CM atlas section. |
| 7 / 9 / 2.035 | Move to supplement | A numerical near-integer illustration is context rather than the field-recovery proof. Use a full text-width residual plot of about 190–220 pt height with a short precision/method block. Keep exact values separately from rounded display digits. |
| 8 / 11 / 1.917 | Retain in body; combine with a compact Figure 10 residue strip | Explain `M`, `J`, and `A` immediately after their identity. Two equal-aspect axes with only essential vectors/axes; combined group about 0.95 text width × 230–260 pt. |
| 9 / 12 / 1.846 | Move to supplement | The product evaluation is useful diagnostic evidence but the fixed-point argument is already short. Place after the atlas reflection explanation, about 0.9 text width × 200–230 pt, with truncation and precision information. |
| 10 / 13 / 1.872 | Combine essential residue strip with Figure 8; move bars to supplement | Preserve residue order and `-i` convention next to the matrix calculation. A 35–45 pt-high strip below Figure 8 suffices in the body. Put the full input/output comparison and actual residual values in the atlas. |
| 11 / 15 / 1.821 | Move to supplement | Retain the reciprocal-scale diagnostic after identifying the eigenvector and using the article's `x` notation. One plot about 0.75 text width × 180–210 pt; place method details below rather than a large formula panel beside it. |
| 12 / 16 / 1.875 | Move to supplement; combine its workflow with Figure 11's atlas explanation | Retain the fixed-height complex slice and its real-conjugation explanation at about 0.8–0.95 text width × 190–220 pt. A small workflow strip can link the two diagnostics; the body already has the analytic proof. |

## Minimal coherent redesign and estimated length

Keep the current article class, mathematical typography, theorem numbering scheme, and the core derivations. Establish the result hierarchy at the entrance; integrate the roadmap, surface/rank group, and reflection/residue group as ordinary portrait floats; move the remaining visual detail to a separate atlas. Complete Section 3 before its figures can interrupt it, and keep the construction and classification in Section 4 together. Preserve the exact certificate as an article appendix. Keep Appendix B short and separate from the open geometric extension.

With this content, **roughly 9–11 portrait pages for the article including appendices and references** is a realistic first layout estimate: about 6–8 through the conclusion and 2–3 for appendices/references, with boundaries depending on float placement and added result orientation. A recomposed atlas could plausibly take **6–9 pages**. These ranges are planning estimates, not a quota or a reason to reduce necessary type size. Preserving every current full sheet unchanged would take more atlas space; that is acceptable if those sheets are explicitly supplementary. The acceptance criterion is continuous, readable argument with useful pictures, not a predetermined page count.

This is a local AI cold review. It is neither external human peer review nor a theorem-certification report.
