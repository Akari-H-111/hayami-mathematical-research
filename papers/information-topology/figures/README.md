# Information Topology figures

[Series guide](../README.md)

The current manuscripts use 26 numbered multi-panel figures: 8 in Foundations,
12 in Arithmetic and 6 in Minimal Response. Figures are editable TikZ/PGFPlots
sources sharing `series_visual_style.tex`. The numeric plot tables are embedded
in `arithmetic_plot_tables.tex`; a normal TeX build has no Python or external
`.dat` dependency.

From the series directory, check the saved deterministic tables with:

```sh
python3 -B scripts/build_series_plot_data.py --check
```

To intentionally regenerate them, run the same command without `--check`, then
review the change and renew the affected source hashes. Regeneration is not
part of ordinary reading or verification.

Finite recurrence plots illustrate their stated parameters; they do not decide
infinitely-often membership or estimate Hausdorff dimension. Dimension plots
exclude the critical endpoint. Carrier drawings are circle-block cross-sections
of a product in real dimension `2d`, not a standard three-dimensional torus.
Dashed response-bridge arrows indicate additional constructions still needed.
