Conditional pass: the novelty framing and all three captions are substantively correct, with one source-provenance correction needed before release.

- Blocking — source scope at [main.tex:80](/Users/akari_hayami_64/Documents/hayami-mathematical-research/research/zero-strip-symmetry-20261018/paper-development-20261018/revision-v0.2/manuscript/main.tex:80) and [main.tex:116](/Users/akari_hayami_64/Documents/hayami-mathematical-research/research/zero-strip-symmetry-20261018/paper-development-20261018/revision-v0.2/manuscript/main.tex:116) conflates Gauthier–Zeron with the precisely checked Gauthier–Xarles result. The accessible GZ publisher page establishes 2004 issue metadata and only its abstract-level perturbation claim; it does not support saying GZ itself was read for prescribed-zero insertion, retained poles, or the functional equation. The exact claims belong to GX Proposition 1/Theorem 2. [GZ publisher record](https://link.springer.com/article/10.1007/BF03321061), [GX](https://arxiv.org/pdf/0911.5135)

  Exact repair: replace the first sentence with, e.g., “Gauthier–Zeron [GZ] gives earlier close perturbations of zeta (publisher abstract/metadata checked). More precisely, Gauthier–Xarles [GX, Proposition 1 and Theorem 2] constructs symmetric prescribed-zero perturbations …” Make the table’s “Already established” cell explicitly GX-scoped, with GZ listed as earlier perturbation context.

- Nonblocking — Figure 3’s filled marker at \(H=2^{20}\) is formula-correct, but is generated ad hoc at [build_figures.py:117](/Users/akari_hayami_64/Documents/hayami-mathematical-research/research/zero-strip-symmetry-20261018/paper-development-20261018/revision-v0.2/verification/build_figures.py:117), while the exact `secondary_bound_K1` source rows end with the left limit there. For stronger reproducibility, add the closed-endpoint row \(M=40\), \(2M/H=5/65536\), or encode all displayed markers as checked source rows.

Novelty assessment: passes after that provenance fix. The abstract and introduction clearly concede prior symmetric insertion, call quotient/packing/transfer steps elementary corollaries, disclaim first-theorem and exhaustive-priority status, and limit the contribution to a worked explicit synthesis. GX does give symmetric prescribed insertion and retention statements, but not the manuscript’s dyadic order-zero/tail/growth package; the manuscript correctly says it does not infer those controls from GX. FZ correctly attributes the unconditional discrepancy statement to Fujii reference [3], Part III; Part IV is not misidentified. [FZ](https://arxiv.org/pdf/math/0405459)

Figure review:

- Figure 1 correctly depicts \((x,L)\sim(ex,0)\), equal/reversed seam arrows, central retraction, and explicitly disclaims zeta measurements/divisor descent.
- Figure 2 correctly shows 16 positive-height roots for \(n=1,\ldots,8\), omits negative conjugates, and distinguishes closed dyadic endpoints from left limits.
- Figure 3 correctly labels \(2M(H)/H\) for \(\lVert h\rVert_\infty=1\), plots the tail bound only for \(B_N(3)<1\), marks logarithmic vertical axes, and disclaims empirical/RH evidentiary force.

Checks actually run:

- Read all 726 lines of `manuscript/main.tex`, the controlling verdict, audit, search log, supervisor leads, figure generator/checker/tests, and inspected all three PNG figures.
- `python3 -B verification/verify_figures.py`: PASS, 682 exact rows; asset hashes and formula checks passed.
- `python3 -B verification/test_figure_checks.py`: assertion-stripping test passed; the two mutation tests errored before execution because the read-only sandbox has no writable temporary directory. This is an environment limitation, not a reported figure-formula failure.

No files were modified.