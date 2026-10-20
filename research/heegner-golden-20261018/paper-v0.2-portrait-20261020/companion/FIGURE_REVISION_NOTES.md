# Figure revision notes

Author: Akari Hayami (Jian-Yu Huang)  
Date: 2026-10-20

## Scope and mapping

All twelve full companion plates were regenerated from the existing saved data.
The artwork now has no numeric figure title and no global colour-key footer; the
director's atlas overlay supplies `S01` through `S12`.

| Previous plate | Revised artwork |
| --- | --- |
| 01 connection map | Retains the roadmap; theta notation now uses positive `x`. |
| 02 ruled surface | Retains the actual patch, lateral pair, bounds, and equal geometric axes. |
| 03 rank loss | Names `u=(1-c)/2` as necessary only and marks the actual point, with `P(c)=0` stated as the further condition. |
| 04 pentagon | Retains the geometric coordinate construction. |
| 05 reflections | Retains the `M`, `J`, and `A=JMJ` action and eigenlines. |
| 06 inversion product | Retains separately evaluated product curves. |
| 07 DFT | Retains the actual order `1,2,3,4,5` and normalized finite calculation. |
| 08 theta | Uses positive theta scale `x` and gives `a=(1,kappa,-kappa,-1,0)`. |
| 09 completion | States the specific real coefficient vector and its conjugate paired-slice qualification. |
| 10 CM roles | Retains the separate roles of `i` and `tau_163`. |
| 11 Hermite ladder | Retains the fixed high-precision correction construction. |
| 12 icosahedron | Retains all marked chord classes and their ratio context. |

The new compact native-vector body figures are:

1. Roadmap from the Hermite input to the completed functional equation, keeping
   `tau_163` distinct from `i`.
2. The actual ruled surface plus a necessary-versus-full rank-loss diagnostic.
3. The stored 180-digit fixed-gap correction/residual ladder.
4. Paired reflections of the off-axis vector `z`, with the residue strip.

## Sources, rendering, and checks

`build_figures.py` reads and regenerates the same saved numerical values and
arrays as before. `build_body_figures.py` is standalone: it reads
`data/figure_values.json` and `data/figure_arrays.npz` directly and does not
import a module that writes another workstream. `data/body_metadata.json`
records the exact 6.4-inch width, individual heights, nominal fonts, paths, and
the source of each plot.

Commands used from this companion directory:

```sh
mkdir -p .mplconfig
env OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MPLCONFIGDIR="$PWD/.mplconfig" \
  /Users/akari_hayami_64/mamba/envs/arithscope/bin/python -B build_figures.py
env OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MPLCONFIGDIR="$PWD/.mplconfig" \
  /Users/akari_hayami_64/mamba/envs/arithscope/bin/python -B build_body_figures.py
env OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MPLCONFIGDIR="$PWD/.mplconfig" \
  /Users/akari_hayami_64/mamba/envs/arithscope/bin/python -B verification/check_figure_data.py
env OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MPLCONFIGDIR="$PWD/.mplconfig" \
  /Users/akari_hayami_64/mamba/envs/arithscope/bin/python -B verification/check_body_data.py
```

Passed checks:

- `verification/check_figure_data.py`: saved formulas, DFT order/output,
  surface and pentagon coordinates, direct reciprocal/product and theta
  samples, chord data, and high-precision correction ladder.
- `verification/check_body_data.py`: body dimensions/fonts, necessary versus
  full rank-loss conditions, correction indexing, and
  `A=JMJ` reflection/residue conventions.
- Visual inspection of `body/png/body_01.png` through `body_04.png` after the
  final render; repaired newline, clipping, and panel-note collisions.

## Limits

These checks validate plotting inputs and the stated finite/numerical mappings.
They do not verify external theorems, certify a general functional-equation
claim beyond the labelled real-coefficient/conjugate slice, or check the main
paper. No atlas-builder operation or PDF-operation marker was run here.
