# Heegner-Golden Figure Packet

This is a self-contained twelve-plate mathematical figure packet. It is a figure companion, not a paper, release, RH result, or new-theorem claim. The canonical mathematical inputs are [input/MANUSCRIPT_ENDING.md](input/MANUSCRIPT_ENDING.md) and, for Figure 12 only, [input/GEOMETRY_CONTEXT.md](input/GEOMETRY_CONTEXT.md).

## Replay

Run from this directory. No packages are installed by these commands.

```sh
OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MPLCONFIGDIR="$PWD/.mplconfig" \
  /Users/akari_hayami_64/mamba/envs/arithscope/bin/python -B build_figures.py
OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 \
  /Users/akari_hayami_64/mamba/envs/arithscope/bin/python -B verification/check_figure_data.py
/Users/akari_hayami_64/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 -B build_atlas.py
qpdf --check output/pdf/heegner_golden_figure_atlas.pdf
```

The first command produces `output/pdf|svg|png/figure_01` through `figure_12`; PDFs have embedded TrueType fonts, SVGs use path outlines, and PNGs are 300 DPI. It also recreates `data/figure_values.json` and `data/figure_arrays.npz`. The second command checks saved plotted inputs independently. The third creates the 14-page native-vector atlas by merging the standalone figure PDFs with ReportLab text.

## Figure index

01 connection map; 02 ruled surface; 03 rank loss; 04 pentagon; 05 reflection coordinate exchange; 06 Rogers-Ramanujan inversion; 07 finite DFT eigenvector; 08 theta; 09 Mellin completion; 10 two CM arguments; 11 Hermite near-integer; 12 icosahedral chord context. See [FIGURE_GUIDE.md](FIGURE_GUIDE.md) for captions and placement.

## Scope and limits

Saved decimal diagnostics are high-precision numerical evidence, while the finite formulas checked by the script are exact identities at their stated level. The checker does not certify external CM, Poisson summation, modular, or zero-theorem claims. Figure 12 is a marked Euclidean icosahedral context plate; it does not place CM values at icosahedron vertices.

## Completed integration — 20 October 2026

Codex CLI gpt-5.6-terra/high completed the figure suite after an earlier usage-limit
interruption. The director corrected product evaluation, DFT residue order,
pentagon orientation, reflection inputs/eigenlines, actual surface bounds,
near-integer correction powers and annotation placement. No illustrative mesh or
curve substitutes for the declared mathematical input.

All fourteen final atlas pages were rendered and visually inspected. See
`verification/VISUAL_QA.json`. The independent 180-digit reference and comparison
are in `verification/DIRECTOR_REFERENCE.json` and `DIRECTOR_DATA_CHECK.json`.
The latter confirms the constants, fixed gap, j coefficients, correction terms
and residual ladder. The saved-array checker also passes.

The companion [assembled paper](../paper-v0.1-20261019/README.md) integrates all
twelve plates with manuscript-specific numbering and proofs. Client model
selection evidence is retained in that packet's `provenance/CLI_SELECTIONS.json`.
PDFs and the atlas have been structurally checked with qpdf. Matplotlib figure
fonts are embedded; the ReportLab atlas also lists a standard Helvetica resource.
The original ninety-nine hash-bound authored checkpoint files are preserved.
