# Information Topology / Information Exclusion

[All series](../README.md) · [Repository home](../../README.md) ·
[Research board](../../RESEARCH_BOARD.md)

Three current research manuscripts by Akari Hayami. Read Foundations, then
Arithmetic, then Minimal Response. These sources restructure an earlier
four-manuscript project after retention review, restoration and corrections;
they are not a paragraph-for-paragraph lossless merge. This repository makes
these manuscripts available as sources, without asserting a registered series
DOI, a sealed release or whole-paper Lean formalization.

## Reading order

| Order | Manuscript | Role and boundary |
| --- | --- | --- |
| 1 | [*Foundations of Information Exclusion and Relative Obstruction*](Foundations_of_Information_Exclusion.tex) | Finite-field quotient labels, support filling, finite inclusion filtrations and relative connecting obstructions; a conditional bridge interface and positive-reach retraction appendix |
| 2 | [*Arithmetic Local-System Filling Spectra*](Arithmetic_Local_System_Filling_Spectra.tex) | The explicit marked/normed arithmetic model: reciprocal filling costs, scale maps, signatures, Diophantine spectra, nonextension and positive-reach carriers |
| 3 | [*Minimal Marked Response Modules for Relative Obstruction Data*](Minimal_Marked_Response_Modules.tex) | A finite algebra companion: quotient seeds, supplied endomorphism marks, minimal closure, finite termination and strict functoriality |

## Files and provenance

The three `.tex` manuscripts share `series_preamble.tex`,
`series_references.bib` and the editable TikZ/PGFPlots sources in
[figures/](figures/README.md). Plot tables are embedded in TeX; no external `.dat`
files, raster artwork or shell escape are required. The
[source hashes](SOURCE_SHA256SUMS.txt) bind the 35 manuscript, figure, bibliography
and script files imported on 2026-10-10. All manuscript and figure bytes are
unchanged; one plot-check comparison accepts terminal-newline differences.

The local import previously lived at `Foundations_of_Information_Exclusion/`.
Earlier four-paper snapshots, retention/restoration inventories, Chinese audit
notes and build logs remain local provenance material. They are not current
manuscript inputs and are not included in this public source import. Historical
inventories describe their own snapshots, not the current illustrated sources.
No `main.tex` was supplied in the local import: compile the three explicit
entrypoints below, rather than relying on an undocumented default manuscript.

## Reproduce finite checks

Use Python with NumPy and SymPy installed; never use `-O`. From this directory:

```sh
python3 -B scripts/verify_restructured_series.py
python3 -B scripts/build_series_plot_data.py --check
```

On 2026-10-10 the registered local interpreter (Python 3.14.6, NumPy 2.5.2,
SymPy 1.14.0) passed 6,633 checks with seed `20260916`, samples `32`, before and
after relocation. These combine exact finite algebra, symbolic identities,
rational torsion and cocycle ranks with seeded numerical sampling. Plot-table
regeneration also matches the saved sources. A larger diagnostic run is:

```sh
python3 -B scripts/verify_restructured_series.py --samples 256 --seed 314159
```

Finite checks do not certify infinitely-often membership, Hausdorff dimension,
external theorems or statements quantified over all parameters.

## Compile the manuscripts

With a TeX distribution providing `latexmk`, TikZ, PGFPlots and the packages in
the shared preamble, run from this directory:

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build/foundations Foundations_of_Information_Exclusion.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build/arithmetic Arithmetic_Local_System_Filling_Spectra.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build/response Minimal_Marked_Response_Modules.tex
```

Build outputs are ignored. This reorganization does not regenerate or release
PDFs; no new PDF layout review or TeX compilation is claimed.

## Mathematical boundaries

The arithmetic paper supplies an explicit model, not a general bridge from an
arbitrary filtered complex. Such a bridge still requires a specified metric,
marked character map, bi-Lipschitz estimates, coefficient identifications and
seed compatibility. It remains separate from Inverse-Leibniz Papers I-III.

The complex marked signature, scalar filling profile and Boolean data carry
different information. Scalar profiles need not recover a parameter (for
example, the sign ambiguity remains). Endomorphism marks in Minimal Response
are additional data; arithmetic scale maps do not automatically supply them.
The sub-reach limit of a projection argument is not a proved obstruction death
time. The manuscripts' proofs and cited external theorems supply the analytic
claims, separately from finite diagnostics.
