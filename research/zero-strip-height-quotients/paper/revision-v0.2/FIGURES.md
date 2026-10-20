# Reproducible figure companion

The three figures are original explanatory assets for the v0.2 working paper.
They contain no empirical or simulated zeta-zero sample. They do not establish
RH, a new zero-distribution theorem or an interval-secondary conjecture.
All arithmetic claims are proved in the paper; figures explain them.

| File stem | Content and classification | Scope |
|---|---|---|
| figure-01-quotient-seams | Schematic fundamental domains for e=+1 and e=-1; top/bottom arrows show the seam orientation and squares show the central retraction | Ambient points, not actual zeta zeros; no descended divisor is asserted |
| figure-02-sparse-divisor | Exact formula-derived positive roots x=+/-1/4, gamma=2^n, n=1..8; added-count graph for 1<=H<=2^9 | The constructed product P, not zeta data; conjugate negative-height roots omitted; M(H)=0 before 2; filled dyadic endpoints are included |
| figure-03-certified-bounds | Exact formula-derived upper bounds 2M(H)/H for test norm 1 and B_N(3)/(1-B_N(3)) | H in [2,2^20], n>N tail, R=3, N=2..12 plotted; N=1 is invalid because B>=1; no measured errors or optimality claim |

Each figure has PDF and SVG vector exports and a 300-dpi PNG. The PDF masters
are copied byte-for-byte into manuscript/images/ for TeX. Color is redundant:
arrow direction, marker shape, filled/open endpoints and separate panels keep
meaning visible in grayscale. Captions in manuscript/main.tex are authoritative.
The exported files, exact rational source rows and runtime versions are bound
by figures/MANIFEST.json.

## Replay

Use an interpreter with Matplotlib 3.11.1 and NumPy 2.5.2. The tested local
interpreter is /Users/akari_hayami_64/tagd-gir-research/.agent-venv/bin/python.
No dependencies were installed or updated. For example, from the package root:

```sh
/Users/akari_hayami_64/tagd-gir-research/.agent-venv/bin/python -B verification/build_figures.py
python3 -B verification/verify_figures.py
python3 -B verification/test_figure_checks.py
cp figures/*.pdf manuscript/images/
```

For a standalone figure bundle, manuscript/images/ may be absent; omit that
last copy step. To regenerate without changing delivered assets:

```sh
/path/to/prepared/python -B verification/build_figures.py --output-dir /absolute/scratch/directory
```

The checker uses only the Python standard library. It independently checks
683 rational source rows, root/count conventions and file hashes. Regression
tests deliberately damage a secondary normalization and a dyadic endpoint,
and confirm assertion-stripped code rejects execution. These finite checks
are not analytic or infinite-product proofs.

The generator and assets were replayed in an isolated temporary output
directory using the same installed environment. A clean-machine dependency
installation and cross-version pixel identity are not claimed. SVG retains
text for editing; exact typography depends on available fonts. PDF embeds its
fonts and is the manuscript master.
