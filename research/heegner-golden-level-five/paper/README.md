# Golden Coordinates at Level Five — portrait revision 0.2

**Author:** Akari Hayami (Jian-Yu Huang)  
**Contact:** akari.h.1.9984@gmail.com  
**Completed:** 20 October 2026. Local draft; no commit, upload, or publication.

This packet is the portrait revision of the assembled paper. The main article is
a continuous 10-page Letter article with four compact body figures. A separate
14-page landscape supplement carries the complete visual plates S01–S12 with
local captions and a methods page. The earlier 19-page v0.1 draft and its
fourteen-page atlas remain unchanged as separate checkpoints.

The mathematical spine is unchanged: the orthogonal-circle ruled surface selects
`c0 = phi^-2`; the actual CM value `v = r(tau163)^5` recovers `sqrt5` and hence
`c0`; normalized Rogers–Ramanujan inversion is conjugate by coordinate exchange
to the odd period-five sine-Fourier involution; and the two eigenlines
characterize the two signed completed functional equations. Exact arithmetic
certificates are kept separate from the analytic arguments.

## Read

- `output/pdf/golden_coordinates_level_five_v0_2.pdf` — 10-page article, Letter,
  four body figures, six references, Appendices A–B.
- `output/pdf/golden_coordinates_level_five_v0_2_supplement.pdf` — 14-page
  landscape visual companion, plates S01–S12, methods and replay page.
- `main.tex` — editable article source with embedded bibliography.
- `build_companion.py` — supplement assembler.
- `companion/` — body-figure sources, full plate sources, saved data, plotting
  scripts, and independent data checkers.
- `PAPER_CLAIM_MAP.md` — written, exact, numerical, and external evidence for
  each claim.
- `ASSEMBLY_NOTES.md` — assembly decisions, figure recomposition, and QA.
- `DIRECTOR_ADVICE_RESOLUTION.md` — accepted and rejected cold-review advice.
- `verification/` — exact checkers, layout checker, page-render hashes,
  preservation record, authored-file hashes, and rebuild record.
- `output/golden_coordinates_level_five_v0_2_source.zip` — portable source
  bundle with its own manifest.

## Figure mapping

| Article figure | Article role | Supplement plates |
| --- | --- | --- |
| Figure 1 | Connection map: `tau163` versus `i` | S01 |
| Figure 2 | Actual ruled surface and rank-loss diagnostic | S02–S03 |
| Figure 3 | Fixed near-integer gap and correction ladder | S11; roles in S10 |
| Figure 4 | Coordinate exchange `A = JMJ` and residue strip | S05, S07 |

Plates S04, S06, S08–S09, and S12 supply the pentagon, direct inversion product,
theta self-duality, completed-function diagnostic, and icosahedral chord model.
Every article figure is referenced in the running text and interpreted in its
caption. No plate gallery precedes the first theorem.

Body figures use 6.4-inch source canvases and are inserted at `\linewidth`
(6.5 in), so the minimum 8.5 pt artist text appears at no less than 8.63 pt.
Body heights are 1.95, 3.30, 2.65, and 3.25 in. The supplement preserves the
full-size vector plates.

## Rebuild

Run from this directory. The paths below are the tested local runtimes; a clean
machine installation has not been tested, and no packages were installed.

```sh
# 1. Main article: two passes.
mkdir -p output/pdf
pdflatex -interaction=nonstopmode -halt-on-error -file-line-error \
  -jobname=golden_coordinates_level_five_v0_2 -output-directory=output/pdf main.tex
pdflatex -interaction=nonstopmode -halt-on-error -file-line-error \
  -jobname=golden_coordinates_level_five_v0_2 -output-directory=output/pdf main.tex

# 2. Optional: regenerate all plates and body figures from saved data.
env OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 \
  MPLCONFIGDIR="$PWD/companion/.mplconfig" \
  /Users/akari_hayami_64/mamba/envs/arithscope/bin/python -B companion/build_figures.py
env OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 \
  MPLCONFIGDIR="$PWD/companion/.mplconfig" \
  /Users/akari_hayami_64/mamba/envs/arithscope/bin/python -B companion/build_body_figures.py

# 3. Optional: data checkers.
env OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 \
  MPLCONFIGDIR="$PWD/companion/.mplconfig" \
  /Users/akari_hayami_64/mamba/envs/arithscope/bin/python -B companion/verification/check_figure_data.py
env OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 \
  MPLCONFIGDIR="$PWD/companion/.mplconfig" \
  /Users/akari_hayami_64/mamba/envs/arithscope/bin/python -B companion/verification/check_body_data.py

# 4. Supplement: needs ReportLab and pypdf.
/Users/akari_hayami_64/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 \
  -B build_companion.py

# 5. Structural checks and page renders.
mkdir -p logs/render/final-main-4 logs/render/final-supplement
qpdf --check output/pdf/golden_coordinates_level_five_v0_2.pdf
pdfinfo output/pdf/golden_coordinates_level_five_v0_2.pdf
pdftoppm -f 1 -l 10 -r 150 -png output/pdf/golden_coordinates_level_five_v0_2.pdf logs/render/final-main-4/page
pdftoppm -f 1 -l 14 -r 140 -png output/pdf/golden_coordinates_level_five_v0_2_supplement.pdf logs/render/final-supplement/page
LAYOUT_LOG=output/pdf/golden_coordinates_level_five_v0_2.log \
  /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/check_final_pdf.py
```

`check_final_pdf.py` reads `LAYOUT_LOG` when it is set and otherwise the recorded
final log `logs/pdflatex-pass11.txt`. For a fresh extraction, point `LAYOUT_LOG`
at the newly compiled `output/pdf/golden_coordinates_level_five_v0_2.log`.

The supplied body and plate PDFs suffice to compile without rerunning the
plotting scripts. Standard TeX packages used are geometry, lmodern, amsmath,
amssymb, amsthm, graphicx, float, flafter, and hyperref. The tested compiler was
pdfTeX/TeX Live 2026.

## Replay the mathematical evidence

```sh
OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 \
  /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/replay_cm.py
OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 \
  /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/baseline_square_certificate.py
OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 \
  /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/director_check_lemmas.py
OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 \
  /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/check_dh_constant.py
```

These use SymPy and mpmath with assertions enabled. Never use Python `-O`. The
CM wrapper replays the exact core and the separate 100/200-digit `D=163`
diagnostics; it does not rerun the older discriminant-control survey. The
Davenport–Heilbronn checker evaluates the Rogers–Ramanujan product at `i` at 90
digits and verifies the closed form `(sqrt(10-2sqrt5)-2)/(sqrt5-1)` together
with the finite eigenline and nonmultiplicativity identities.

The general analytic statements rely on the written arguments and the cited
classical CM/Klein, modular-inversion, and Poisson inputs. Finite diagnostics do
not replace those arguments. No Lean formalization and no RH result are claimed.

## Hashes and verification records

At completion:

- Main PDF SHA-256: `b3200ffa4130b5046c8462a2a0f22d1ea30273120442953faf93a01b5f937718`
- Main source SHA-256: `46d473aa9e32528617b3ddc8396987d0240e9717832e537481f43b5eba688fc7`
- Supplement PDF SHA-256: `e4bc0fbe12deeeed7a998be333f534fcf1de8218583170e622b75846d38fe32b`
- Supplement builder SHA-256: `bb6af014a39040f0f91fbc09334abdfc42baa03114b99c860a4635a2765411bc`
- Source zip: its byte size and SHA-256 are recorded in
  `verification/REBUILD_CHECK.json` (the zip carries its own
  `BUNDLE_SHA256.json`).

See `verification/LAYOUT_CHECK.json` (text layer and figure references),
`verification/VISUAL_QA.json` (all 24 page renders bound to the final PDFs),
`verification/PRESERVATION_CHECK.json` (233 earlier authored files unchanged),
`verification/AUTHORED_SHA256.json` (all v0.2 authored files),
`verification/REBUILD_CHECK.json` (fresh extraction, two compiles, page and text
checks), and `verification/DH_CONSTANT_CHECK.json` (90-digit Davenport–Heilbronn
identity). `output/golden_coordinates_level_five_v0_2_source.zip` carries a
top-level `BUNDLE_SHA256.json`.

## Scope and prior art

The paper cites Duke for the CM value and Rogers–Ramanujan inversion law, the
DLMF for residue-class Poisson summation, Balanzario–Sanchez-Ortiz for the
off-critical-line zeros of the Davenport–Heilbronn function, and the published
five-singularity surface classification. The conductor-815 cyclic quartic field
is explicitly attributed to the Spearman–Williams family; the polynomial in the
paper records the selected generator used here. The novelty audit found no
substantive new theorem established as novel. The contribution is an explicit,
replayable worked chain and its assembly, not a priority claim.

The HMR/RH bridge is secondary. No zero-location result, no RH result, and no
claim that every vector satisfies a scalar functional equation are made. A mixed
vector satisfies neither signed equation; the classification is per eigenline.
