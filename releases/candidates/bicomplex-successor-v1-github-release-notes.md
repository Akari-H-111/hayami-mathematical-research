# Bicomplex successor papers, software companion 1.0

Source-only release (**no paper PDFs**) accompanying two preprints by Akari Hayami (Jian-Yu Huang):

- *Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity, Smooth Flexibility and Observation Monodromy*, doi:10.5281/zenodo.23103026
- *Pseudo-Laplacians at Whitney Cross-Caps: Point Interactions on Surfaces Mapped into Three-Space*, doi:10.5281/zenodo.23103056

Software DOI of this package: 10.5281/zenodo.23103299. The papers correct and succeed the earlier preprint *Geometric Realization of Bicomplex Signal Manifolds* (ResearchGate 408878000), which is kept unchanged.

The zip contains the article TeX and figures, the exact and finite verifiers, the figure generator with its hash manifest, the 66-block claim map and the Lean project (33 named theorems, partial coverage of selected statements, not a formalization of either paper). Replay: `python -B verify.py` after `pip install -r requirements.txt`; see `README.md` inside. The scripts do not certify the analytic proofs. The private v7 draft discussed in the papers is not distributed; its SHA-256 is in `claims/V7_DRAFT_INDEX.md`.

Code and build: Apache-2.0. Original TeX, figures and documentation: CC-BY-4.0.
