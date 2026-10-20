# Editorial review: guided reader revision v0.3

## Implemented revision

`manuscript/main.tex` now opens with the reader's question: what survives
when zero heights are folded modulo a fixed length? It gives a short
prerequisite statement and a practical reading route before the technical
setup. The existing author line and visible email remain exactly
`Akari Hayami (Jian-Yu Huang)` and `akari.h.1.9984@gmail.com`.

The prose now introduces, where each distinction becomes useful:

- divisor versus support, including the role of multiplicity;
- folding heights around a circle as an ambient geometric operation, not a
  claim that the zero divisor is periodic;
- raw pushforward versus normalized finite-height probability;
- Haar probability as uniform arc length on the folded circle;
- weak convergence as convergence of averages of fixed continuous tests;
- sparse invisibility as stability only for the specified normalized and
  fixed-test observations.

The section transitions now make the logical route explicit: exact support
nonperiodicity; finite-height circle limits; the weaker critical-line-only
consequences; stability of coarse observations; the explicit dyadic added
divisor; and the ordinary-Dirichlet-series condition that distinguishes the
constructed function from zeta. The conclusion recasts this route as three
steps and ends with a feasible next investigation about cutoff-dependent
tests.

The controlled-example and originality language remains restrained. The
manuscript continues to present a worked synthesis and explicit example, not
a confirmed independent number-theoretic theorem or a priority claim. The
Gauthier--Zeron abstract/metadata-only footnote, the precise
Gauthier--Xarles attribution, all citation keys, and the bibliography were
left unchanged.

## Representative changes

| Before | After |
| --- | --- |
| The opening began directly with the definition of `\xi`. | It begins by asking what fixed-height folding can retain, then states prerequisites and a suggested route through the paper before introducing notation. |
| The quotient discussion said that raw pushforwards and normalized measures behave differently. | It now says what each construction does, identifies the latter as the distribution of a zero chosen with multiplicity from a finite sample, and defines the limiting Haar probability in plain language. |
| The sparse product was introduced as a standard prescribed-divisor construction. | The transition now tells the reader why it follows: it tests which fixed, coarse observations an infinite but logarithmically sparse added divisor can leave unchanged. |
| The conclusion listed limitations and questions. | It now summarizes the exact-to-averaged-to-arithmetic narrative and frames cutoff-dependent detection of a sparse quartet as the next investigation. |

## Reading comfort and tone

The revised prose is more hospitable to an advanced undergraduate or early
graduate reader who knows complex analysis but may not use probability and
measure terminology every day. Definitions arrive just before their first
real use, and the all-zero/critical-line-only and smooth-test/interval
boundaries are stated positively rather than buried in defensive language.
The tone is warm, careful, and confident about what is proved while remaining
humble about what the observations do not determine.

## Remaining limits

The manuscript is still a rigorous working paper, not an introductory text.
It necessarily relies on the cited zeta-zero inputs, uses measure notation
soon after the opening, and retains proof density in the quotient and product
sections. The mathematical limitations remain explicit: critical-line-only
equidistribution is not obtained; the secondary theorem is for fixed smooth
tests rather than interval indicators; the dyadic roots are an added divisor,
not observed zeta zeros; and the sparse construction is excluded from the
ordinary Dirichlet-series class.

No human-reader testing, PDF compilation, or PDF visual review was performed
in this editorial pass.

## Visual checks for the director

- Confirm that the added opening and reading-route paragraphs do not create
  an awkward page break before the first display.
- Check that the explanatory prose immediately before Figure 1 leaves the
  figure and its caption visually associated.
- Check the longer probability-measure introduction around the empirical
  measure display for overfull lines or a stranded display.
- Check the new transition before Figure 2 and the added Dirichlet-series
  paragraph for page-break balance.
- Inspect the conclusion page for a balanced final paragraph and unchanged
  bibliography spacing.
