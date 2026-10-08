# Editorial review r2 of the two successor papers: implementing feedback and figures

> **Historical record.** The status “EDITORIAL R2 / AWAITING AUTHOR READING / NOT APPROVED FOR PUBLICATION” in this document describes only the r2 stage; the author authorized public release of both papers on 2026-10-02. See [`SCOPE_AND_PLAN.md`](SCOPE_AND_PLAN.md) §14.

2026-10-02. Input was the author's forwarded “Realization Limits feedback” (`"/Users/akari_hayami_64/Downloads/\u300aRealization Limits\u300b\u56de\u994b.txt"`), plus two author instructions: Claude should judge improvements; papers must have sufficient figures or views, **so publication should not begin yet**. The feedback file was read as data, not instructions. Results follow; hashes are bound in `qa/VISUAL_QA.json` and `qa_paper2/VISUAL_QA.json`.

- Paper one: 17 pages r1 → 20 pages r2, with 7 figures and 2 tables.
- Paper two: 9 pages r1 → 13 pages r2, with 4 figures and 1 table.

## Item-by-item assessment of feedback

| Feedback | Judgment | Action in r2 |
| --- | --- | --- |
| 1. Center the narrative on “where obstruction meets construction”; ask the question directly in the introduction | Adopted | Abstract and introduction open with “Power allocation fixes magnitudes and leaves phase freedom; can this freedom realize S through a fixed readout?” The answer is framed as analytic rigidity versus smooth flexibility |
| 1. Move “and Corrections” from the title to the introduction | Adopted | Title changed to *Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity, Smooth Flexibility and Observation Monodromy*. Introduction adds “Relation to the earlier preprint” to address corrections; full correction table retained. Paper two's paper1 bibliography updated |
| 2. Move the boundary schematic next to the analytic-rigidity theorem | Adopted and expanded | Original TikZ figure replaced by a new three-panel figure (Figure 2): (a) source positions of z₁=0/z₂=0, (b) two edge-state arcs on the same state circle C₀, (c) two lines in plane z=0. Placed at the start of §3.2; one sentence explains that “the same state circle must accommodate two distinct lines” before Lemma 3.5 |
| 2. Retain the decoding explanation and six-decoder table before the smooth construction | Adopted | Retained, with added Figure 3 (cutoffs and two phases) |
| 3. Collect standard spectral theory and its scope of reuse in appendices, with a short entry point in the main text | Adopted | Former §6,§7 moved to appendices B,C. Introduction adds “Organization,” stating these are classical results independent of the realization problem and pointing to the appendices. Residual geometry (3/4 law, cusp) stays in main-text §5 |
| 4. Emphasize the arclength-coordinate lemma as paper two's technical core | Adopted | Introduction adds a slightly adjusted version of the suggested sentence; abstract now says “an arclength coordinate that reveals an asymptotically Euclidean geometry.” Roman surface remains in the abstract |
| 5. Explain in the setting that the operator acts on source surface Σ | Adopted | Added paragraph: functions live on Σ, f enters only through g, and distinct source points at self-intersections remain distinct; “the Laplacian of the Roman surface” means the Laplacian of (ℝP², f*δ) |
| 5. Expand the annulus estimate in the Green-vector proof | Adopted | Theorem 6.1 proof now has four steps: parametrix; annulus estimate (Caccioppoli gives ∫_{B_r}\|∇u\|²≤Cr^{2α}, dyadic summation, cutoff error O(ε^α\|log ε\|)); identification (explicit ∫∇h₀·∇ζ_ε=−1 and flux producing u(p_i)); expansion and symmetry (weak and uniform convergence of normalized indicators) |
| Collect statements like “The proofs are written in full” once in an appendix | Adopted | Removed paper one's introduction Evidence paragraph; main-text replay numbers moved to appendix D. Each paper retains one “All proofs are given in full” sentence in an appendix |

## Precision corrections (all adopted)

| Location | Problem | Correction |
| --- | --- | --- |
| Paper one introduction, main result 1 | D∘ conclusion omitted “continuous at every point of C₀” | Now: on a source open in the t direction, the conclusion holds for readouts “analytic along C₀ and continuous at every point of C₀,” consistent with Theorem 3.6(2) |
| Paper one abstract, “determine exactly when” | Broader than the actual classification (quadratic readout on D₊ remains open) | Replaced with “reveals a sharp distinction between analytic and smooth realizations” |
| Paper two line 60, “Generic smooth maps … are not immersions” | Too strong: immersions are open in the C¹ topology for compact sources | Replaced with “The singularities of a generic smooth map …, when present, are isolated cross-caps,” adding stability under small perturbations |
| Paper two CdV deficiency (1,1) | Completeness assumption missing | Added “complete” in abstract and introduction |
| Paper one correction table 8.10 | Points to Companion, but paper two has no corresponding statement | Table now directly states J_n*G_{n+1}J_n=G_n and J_n*K_{n+1}J_n=K_n follow from sesquilinearity; no convergence claimed |
| Paper one correction table 8.16 | Same issue | Added Proposition 8.1 part (3) in paper two with proof: strictly positive H₀, Friedrichs extension H_F, Krein domain and kernel (infinite-dimensional kernel), discrete reduced positive spectrum, and weak buckling characterization (citing Ashbaugh et al. Thm 2.1, Hyp. 2.2, Thms 2.4 and 3.4, consistent with checked entries in `proofs/REFERENCE_AUDIT.md`). 8.16 now points here |
| Paper one correction table 8.11–8.15,8.17 | Refers to “Companion” without specific locations | All now point to specific numbers in paper two (Prop 4.1, Lemma 3.2, Thm 4.2, Thms 5.2/6.1/6.3, Cors 7.1/7.2, Prop 8.1, §§4–7). The boundary label in 8.11 is justified by “restricting the interior cutoff to the physical germ.” 8.12 retains O, explicitly stating that paper two does not need it: arclength coordinates already make the metric uniformly elliptic |

## Figures and tables (the author's principal request)

All figures are generated by `verification/build_successor_figures.py` from explicit formulas in the papers, output to `successor/figures/*.pdf`, with SHA-256 recorded in `successor/figures/FIGURES_MANIFEST.json`. Both verifiers check that every figure referenced by `\includegraphics` exists and matches its manifest hash. Generation environment is TAGD venv (numpy 2.5.2, matplotlib 3.11.1); timestamps are removed from PDFs for reproducibility.

| Figure | Used in | Content | Internal check |
| --- | --- | --- | --- |
| `surface_overview` | Paper one Fig 1; paper two Fig 4 | 3D view of S (two edges, polar ruling, five rank labels) and source rectangle | — |
| `edge_rigidity` | Paper one Fig 2 | Three-panel rigidity mechanism | Edge-state arcs use the actual phases of Theorem 3.8 |
| `smooth_readout` | Paper one Fig 3 | Four cutoffs and two phases | — |
| `observation_field` | Paper one Fig 4 | Phase plot of F (indices ∓1 at P±) and sign change of √F around a loop | Assert χ→−χ(0) after one circuit |
| `observation_folds` | Paper one Fig 5 | Sign of det DΨ, critical set (t=0 segment and rational branch), image of Ψ and fold curves | — |
| `sublevel_law` | Paper one Fig 6 | Anisotropic contraction of {K×≤ε}; log-log area plot | Assert quadrature values lie within the theorem's lower and upper bounds |
| `three_curves` | Paper one Fig 7 | Link node, orbit-shadow node, curvature-locus cusp | Assert b²+ac²=0 |
| `umbrella_coordinates` | Paper two Fig 1 | Standard cross-cap, double rays and links; arclength-coordinate grid | — |
| `asymptotically_euclidean` | Paper two Fig 2 | Samples of ‖G−I‖ and ρ_e/ρ−1 on circle ρ=r | Assert slopes in 0.75–1.05 and ‖G−I‖≤4ρ(1+log(1/ρ)) |
| `roman_surface` | Paper two Fig 3 | Roman surface's three double segments and six cross-caps; P∘ (octahedron) and P⊥ | Assert 12 P∘ edges and 3 P⊥ edges |

Tables: paper one retains its decoder table; paper two adds Table 1 comparing singular channels at regular points, cone points (angles ≤2π and >2π), and cross-caps, with respective sources.

## New mathematical finding during figure construction

Numerical plots show that the standard cross-cap deviation decays faster than the general O(ρ^{1/2}) bound of Lemma 3.2, with slope approximately 0.9. Investigation yielded the exact formula
q·n=(x/2)(2y/√(x²+4y²)−arsinh(2y/|x|)), and |q|≤2|y|, hence **G−I=O(ρ log(1/ρ)) for the standard germ**. Added to paper two Remark 3.3 with a one-line proof (x↦x arsinh(a/x) is increasing). The verifier symbolically checks V_x, q·n, and monotonicity; Figure 2 supplies numerical support. Whether general germs have the same rate is an open question in paper two. This is a new refinement of the general lemma and does not affect existing theorems.

## Verification

- `build_successor_figures.py`: PASS, 10 figures; standard-germ slopes are 0.908 for ‖G−I‖ and 0.890 for ρ_e/ρ−1.
- `build_successor_paper1_pdf.py`, `build_successor_paper2_pdf.py`: PASS. Byte-safe scanning found no Overfull, Underfull, LaTeX Warning, or undefined messages.
- `verify_successor_paper1.py`: PASS. Each of 66/66 blocks classified once; classification counts unchanged (H43/C13/S1/R3/O2/M3/D1); 7 figure hashes match; linked revision/continuation/0.04 replays all PASS.
- `verify_successor_paper2.py`: PASS. Added standard-germ derivative identities; 4 figure hashes match; references and citations resolve.
- Visual QA: all 20 pages of paper one and 13 pages of paper two checked page by page. Issues found in the first round were corrected and rebuilt, including occluded 3D labels, crowded ticks, Proposition 8.1 list layout, and one caption wording (“inside” → “on the Dirichlet boundary”).

## Status

Both papers are **EDITORIAL R2 / AWAITING AUTHOR READING / NOT APPROVED FOR PUBLICATION**. Following the author's instructions, no public operations were performed: no push, Zenodo, GitHub release, or ResearchGate edits.
