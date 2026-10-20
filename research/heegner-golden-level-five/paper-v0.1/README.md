# Golden Coordinates at Level Five — initial assembled draft

**Author:** Akari Hayami (Jian-Yu Huang)  
**Contact:** akari.h.1.9984@gmail.com  
**Completed:** 20 October 2026. Local initial draft; no publication or upload.

The paper follows one explicit chain: the orthogonal-circle surface produces
c0=phi^-2; the actual CM value r(tau163)^5 recovers the golden field; normalized
Rogers–Ramanujan inversion and the odd period-five Fourier action are related by
A=JMJ; its eigenlines characterize the two signed completed functional equations.
The appendices give the exact CM certificate, the square witness and both field
containments, and the odd-N Fourier/Poisson/Mellin extension.

## Read and edit

- `output/pdf/golden_coordinates_level_five_v0_1.pdf`: 19-page manuscript with twelve landscape plates.
- `main.tex`: editable main document, with embedded bibliography.
- `PAPER_CLAIM_MAP.md`: written proofs, exact certificates, classical inputs and diagnostics.
- `DIRECTOR_ADVICE_RESOLUTION.md`: accepted suggestions and corrections to the independent helper review.
- `ASSEMBLY_NOTES.md`: integration decisions and evidence.
- `../figures-terra56-20261019/`: twelve original vector plates, SVG/PNG exports, data, plotting source and the 14-page atlas.

Manuscript Figures 1–12 use original plate files in order
01,02,03,04,12,10,11,05,06,07,08,09. `prepare_figures.py` removes the upper 34-point
standalone title band from each vector PDF. The manuscript supplies sequential
captions; the atlas preserves its own original numbering. The diagrams remain
vector artwork. Figure 11 calls the positive theta scale t; the body calls it x
to distinguish it from the surface angle.

## Rebuild with the recorded existing runtimes

From this directory:

```sh
/Users/akari_hayami_64/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 -B prepare_figures.py
mkdir -p output/pdf
pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -jobname=golden_coordinates_level_five_v0_1 -output-directory=output/pdf main.tex
pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -jobname=golden_coordinates_level_five_v0_1 -output-directory=output/pdf main.tex
qpdf --check output/pdf/golden_coordinates_level_five_v0_1.pdf
```

The supplied cropped figures suffice to compile without running the import step.
The import step expects the sibling figure directory. Standard TeX packages used
are geometry, lmodern, amsmath, amssymb, amsthm, graphicx, pdflscape and hyperref.
The successful compiler was pdfTeX/TeX Live 2026. No packages were installed.

## Replay the mathematical evidence

```sh
OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/replay_cm.py
OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/baseline_square_certificate.py
OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/director_check_lemmas.py
```

These use SymPy and mpmath with assertions enabled. Never use Python -O.
The CM wrapper intentionally replays the exact core and separate 100/200-digit
D=163 diagnostics; it does not rerun the older discriminant-control survey.
The general analytic statements rely on the written arguments and the cited
classical CM/Klein, modular-inversion and Poisson inputs. No Lean claim is made.
For other machines use equivalent interpreters with these dependencies; a clean
machine installation has not been tested. PDF creation dates and generated
container metadata need not be byte-identical across rebuilds.

## Verification and provenance

`verification/VISUAL_QA.json` binds all nineteen inspected page renders to the
final PDF and source. `verification/PRESERVATION_CHECK.json` records the unchanged
99 older authored checkpoint files and seven frozen paper inputs.
`provenance/CLI_SELECTIONS.json` records Codex CLI gpt-5.6-terra/high for figure
completion and paper revision, and OpenCode deepseek-v4.1-flash-free/max for the
independent review (session export succeeded; recorded cost 0). These are client
selection records. The director checked and amended both workers' output.

`deepseek-review/` contains unaccepted raw proposals. Consult the director
resolution before using them: generic vectors need not satisfy either scalar
sign, and the explicit square witness proves the displayed field equality
without an additional class-field identification theorem.

Next editorial target: obtain a fresh external mathematical reading of the
assembled manuscript, especially the CM branch enclosure and analytic proof flow.
