# Height Quotients: guided reader revision v0.3

Author: Akari Hayami (Jian-Yu Huang)  
Email: akari.h.1.9984@gmail.com  
Date: 18 October 2026

This revision addresses teaching readability and a natural, encouraging,
modest voice. It is a guided research note for readers with undergraduate
complex analysis, rather than a self-contained introduction to analytic
number theory.

## Read and inspect

- [Illustrated reader PDF](output/pdf/height-quotients-v0.3.pdf)
- [Editable LaTeX project](manuscript/main.tex), with all three figure PDFs in
  [images](manuscript/images/)
- [Editorial review](EDITORIAL_REVIEW.md)
- [Independent editorial check](COLD_REVIEW.md)
- [Director's resolution](REVIEW_RESOLUTION.md)
- [Acceptance record](ACCEPTANCE.json)

The previous [novelty verdict](../revision-v0.2/NOVELTY_VERDICT.md) still
controls attribution and originality. The result remains a worked synthesis
and an explicit, quantitatively controlled example.

## Rebuild

With Tectonic 0.17.0 available:

    mkdir -p tmp/pdfs/rebuild
    tectonic --outdir tmp/pdfs/rebuild manuscript/main.tex

The three embedded vector figures are byte-identical to v0.2. Their exact
source rows, generation code and checks remain in the immutable
[v0.2 figure package](../revision-v0.2/output/height-quotients-v0.2-figures.zip).
The broader analytic and limited Lean evidence is retained in
[the paper-development parent](../README.md).

v0.1 and v0.2 are preserved. No publication, commit or push is included.
Model review and director visual inspection are not a human learner study.
