# Figure revision for a portrait mathematical article

Work only in this companion directory. Do not read or edit earlier checkpoints,
other workstreams, the main manuscript, board, or the atlas builder (owned by the
director). Do not delegate, install, commit, push or use network credentials.
All output English. The author is Akari Hayami (Jian-Yu Huang).

The director has already run the PDF operation marker. Do not run it again.
Use the already installed plotting interpreter:
/Users/akari_hayami_64/mamba/envs/arithscope/bin/python -B
Set OMP_NUM_THREADS=1, OPENBLAS_NUM_THREADS=1, MPLCONFIGDIR=$PWD/.mplconfig.

Read build_figures.py, saved data/, input/BASELINE_FIGURE_VALUES.json and
verification/check_figure_data.py. These encode the already checked mathematics.
Preserve the scientific arrays, formulas and calculation conventions. You may
change only presentation and generate new body compositions from the same data.

1. Revise the copied build_figures.py to regenerate all twelve full companion
plates (output/pdf/figure_01.pdf ... figure_12.pdf, plus SVG/PNG) with these fixes:
- Remove the global color-key footer entirely. It is not a valid semantic legend
  for every figure. Retain direct plot labels, colors and distinguishable styles.
- Remove numeric figure titles from the artwork's actual text content. The
  director's atlas overlay will supply S01–S12; no hidden old numbers may remain.
  Retain useful local panel titles. Do not achieve this by PDF clipping.
- Use x consistently as the positive theta scale in Figures 1, 8 and other theta
  labels; keep t for the surface angle. State the normalized eigenvector
  a=(1,kappa,-kappa,-1,0) in the theta/completion plots where helpful.
- Figure 9 must not imply that the general paired theta theorem is scalar for
  every vector. Its even/odd complex-slice statement also uses real coefficients
  and complex conjugation. Keep its long formula/process labels readable.
- Figure 3: u=(1-c)/2 is only the necessary locus; rank loss also needs P(c)=0.
  Mark the actual point and label the necessary locus accurately.
- Metadata author exact as above; date 2026-10-20. Keep 180-digit computations,
  independently evaluated products/theta, DFT order, actual surface bounds, equal
  geometric axis units, fixed gap and correctly indexed j-series ladder.

2. Add build_body_figures.py: FOUR compact native-vector figures at the actual
portrait article width, nominal 6.4 inches. Do not import a module which mutates
an earlier folder. Read the saved data and use the given mathematical formulas.
Export body/pdf/body_01.pdf ... body_04.pdf and matching body/svg/, body/png/.
Use a white background, minimal furniture, direct panel labels, ordinary
axis/legend text around 9–10 pt; necessary ticks at least 8.5 pt. Mathematical
subscripts are naturally smaller. Do not just scale the large plates. Use an
exact 6.4-inch figure canvas (save with bbox_inches=None, not a tight crop that
changes physical scale); place labels inside that canvas with good padding.
No in-art figure numbers; LaTeX captions supply all numbering.

Body 1: compact roadmap, about 1.8–2.1 inches high. A few short boxes/arrows must
show the actual branches: v=r(tau163)^5 recovers sqrt5 and hence c0; c0 determines
M, A=JMJ, the positive eigenline with kappa=r(i), and the completed FE. Keep the
CM point tau163 distinct from i. Use short labels; full formulas can be in the
paper/caption. Avoid a speculative direct identification between CM values.

Body 2: geometry/rank group, about 3.0–3.5 inches high. One useful view of the
actual S(t,u) surface with its reflected rank-loss pair, alongside a compact
parameter/norm diagnostic. Distinguish the necessary line u=(1-c)/2 and the
actual point (c0,u0); P(c0)=0 is required. Use the actual cross product, sensible
bounds and geometric scale; label any log color floor. No decorative substitute
mesh. Keep the original full detail in the companion, not crammed into this.

Body 3: CM/Hermite diagnostic, about 2.4–2.9 inches high. A legible fixed-gap
correction/residual chart from the stored 180-digit values. Show N-R about
7.499274028e-13 with only useful display precision; long strings remain in data.
Use explicit correction count and magnitude, clear major log ticks and a
readable legend. Explain it is one fixed number with successive j corrections.
The director's main text will provide a separate two-row i/tau163 role table,
so no tall, anisotropically scaled CM plane plot is needed in the body.

Body 4: reflection/residue group, about 3.0–3.5 inches high. Recompose the paired
M and A=JMJ reflections with the actual off-axis inputs z and Jz and their images,
plus a small residue strip 1,2,3,4,5=0 with entries 1,kappa,-kappa,-1,0. Both axes
must be equal aspect, with the correct +/- eigenlines and clear coordinate
exchange. Use a bold vector z rather than confusing it with the scalar CM v.
Avoid an entire bars-plus-circles slide. Preserve the full DFT diagnostic as S07.

3. Add a small verification/check_body_data.py with meaningful assertions of
body data/formula mapping, CM correction indexing, necessary vs full rank-loss
conditions and reflection/residue conventions. Record body dimensions/nominal
font choices and any new plotted data in data/body_metadata.json (and arrays
only if they add actual new sampled data). Run the existing saved-data checker
and the new checker, and render/inspect your four PNGs. Fix visible collisions,
wrong vector actions, false scientific labels or illegible text.

4. Write FIGURE_REVISION_NOTES.md giving the old-to-new mapping, exact scripts
and commands used, checks actually passed, and any limits. Do not overstate
external theorem verification or say the main paper has been checked. Finish
once all sixteen figures and their source/checks are complete.
