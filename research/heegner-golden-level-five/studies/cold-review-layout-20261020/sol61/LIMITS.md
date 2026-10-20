# Review limits and evidence record

## Independence and scope

This was a local AI cold review of manuscript form, proportions, and reading experience, with a bounded reading of the displayed mathematics. It is **not external human peer review**, a novelty search, a referee's acceptance decision, or certification of the manuscript's theorems.

No research board, earlier draft, previous review, assembly note, project log, author conversation, other worker directory, or repository history was opened. No delegation, browsing, package installation, network/API/credential use, compilation, commit, push, or external contact occurred. No manuscript, diagram, PDF, or supplied input was edited. Writes were confined to the four requested Markdown reports in the current review directory. The directory listing showed the existing mandate and supplied input names; it was not used to explore the repository.

Operational PDF and active Ponytail skill instructions were read from their installed locations because the session required those workflows. They supplied no manuscript history or review conclusions. No memory files were consulted.

## Actual visual and PDF access

The available local `view_image` reader worked. Every supplied rendered image was displayed individually and inspected in ascending order:

**1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19.**

Paths were `../input/pages/page-01.png` through `page-19.png`. No page was substituted by text extraction or omitted from the visual pass. Inspection used the image reader's displayed resolution; it was not a high-magnification audit of every label or a physical print test. The supplied page renders were not regenerated or independently pixel-matched to a fresh render of the PDF.

`../input/paper.pdf` was opened directly with installed `pypdf`. Page count, media boxes, rotations, page content streams, embedded Form bounding boxes, scale matrices, and selected text/font information were inspected. This was programmatic PDF access plus actual visual inspection of the supplied PNGs, not an interactive PDF-viewer session. Nineteen pages and the listed portrait/landscape orientations were independently confirmed.

## Source files and ordering

1. The PDF and all nineteen PNGs were examined first.
2. `FIRST_READ.md` was written before opening any of the following three files.
3. `../input/main.tex` was then read, including its figure macro, all statements/proofs, appendices, and bibliography.
4. `../input/PAPER_TEXT.txt` was read for the nineteen-page text sequence, figure text, and page associations; relevant PDF text was also extracted directly. Extraction loses spacing and can include text not visibly printed, so it was not substituted for visual evidence.
5. `../input/PAGE_INVENTORY.csv` was read and its nineteen page dimensions/rotations compared with the PDF. Its word-count values were not independently validated or treated as mathematical-quality measurements.

No external citation, separately authored figure source, checker, JSON result file, or data-generation script was inspected. References to those objects in the manuscript were treated as claims and pointers, not as instructions or proof of successful replay.

## Checks actually performed

- Confirmed 19 PDF pages, 12 landscape figure sheets, 7 portrait pages, and 8 changes of displayed orientation.
- Measured each landscape page's embedded graphic bounding box after uniform placement scaling: widths approximately 609.1 pt, heights 299.3–345.9 pt, aspect ratios 1.761–2.035, and box area 37.6–43.5% of the sheet. These measurements include internal background and exclude outside captions. They do not measure drawn ink, plot-only aspect ratio, useful information, or mathematical merit.
- Inspected the page-15 figure's label/footer font sizes and placement scale to substantiate the small-type concern. No complete font census, contrast computation, or accessibility certification was performed.
- Used already-installed SymPy in an inline, assert-based exact check of the printed `P = A^2 - 5 B^2` identity and `gcd(A,B) = 1`; printed `U = v - v^-1` substitutions; square-witness remainder modulo `alpha + sqrt(5) beta`; leading/linear coefficient and `w(1)` signs; norm quartic; and rational interval-Horner signs `A < 0 < B` over `(-5*10^-18, -10^-18)`. All those assertions passed. The calculations transcribed the supplied formulas and did not execute manuscript-named checkers. No separate verification artifact was created.
- Read the displayed Poisson–Mellin and classification arguments and checked their narrative relationship to the figures. Identified missing eigenvector qualification in numerical captions and notation/domain clarifications. This was a bounded mathematical reading, not a full proof audit.
- Supplied a disposition for all twelve visible numbered figures and a proposed structure without implementing it.

## Not checked

External modular/historical results, DOI/URL resolution, bibliographic accuracy against originals, novelty or priority, the manuscript's Sturm count, rigorous derivation of all exponential/product bounds, actual CM-value selection from external results, numerical plot data, summation/truncation errors, claimed independent evaluations, precision of the long decimal gap, all analytic interchange/convergence details, and general odd-N cases were not independently certified. The limited polynomial checks do not establish those claims.

The complete source build was not replayed. Reproducibility and portability of the named checkers remain unknown from this input package. No proposed article or atlas was compiled, rendered, or tested. Page targets and proposed sizes therefore remain estimates requiring layout trials.

## Status of conclusions

| Conclusion type | Evidence and status |
|---|---|
| Stylistic/editorial judgment | Formal appearance, excessive plate interruption, contribution hierarchy, useful whitespace, panel selection, proposed grouping, and page estimates are independent judgments informed by the full visual reading. They are not mandatory journal rules. |
| Exact PDF geometry | Page boxes, rotation sequence, placed graphic dimensions, isotropic scaling, and the sampled effective font sizes come from the supplied PDF's objects and transforms; displayed numerical summaries are rounded. |
| Source inspection | The compulsory plate macro, order of results, polynomial definitions, caption wording, notation, checker pointers, and reference completeness come from the supplied source and text. |
| Limited exact mathematical checks | Only the explicitly listed algebraic identities, gcd, remainder, and signs were computed exactly. No whole-paper correctness conclusion follows. |
| Numerical/analytic/external claims | Read and discussed as manuscript claims; the unperformed checks above remain unperformed. No plot was treated as proof. |

The principal risk in acting on the plan is shrinking complete existing sheets instead of recomposing them: that would improve page count at the expense of legibility. The principal scholarly limit is that better layout cannot substitute for verification of the external inputs and computational evidence.
