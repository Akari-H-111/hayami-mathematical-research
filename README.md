# Hayami Mathematical Research

Ten current manuscripts in three research families, with sources, computation,
formalization and historical evidence kept distinct. By Akari Hayami (Jian-Yu Huang).

**Read the papers:** [Inverse-Leibniz (3)](papers/inverse-leibniz/README.md) ·
[Information Topology / Information Exclusion (3)](papers/information-topology/README.md) ·
[Geometry (4)](papers/legacy-geometry/README.md)

## Paper catalogue

The seven published items below are preprints. The three Information Topology
manuscripts are available here as research sources; no series DOI, sealed release
or Lean formalization is asserted. Historical versions and software companions
are not additional papers in this count.

| Series | Current paper | Read | Sources and evidence |
| --- | --- | --- | --- |
| Inverse-Leibniz I | *The Inverse Leibniz Problem: Reconstruction Fibers, Rigidity, Obstructions, and Deformation DGLAs* | [Paper](https://doi.org/10.5281/zenodo.22668484) | [v0.09](releases/current/paper-01-illustrated-v0.09/README.md) |
| Inverse-Leibniz II | *Resonance-Marked Naturality and Homotopy-Tilt Non-Invariance in the Inverse-Leibniz Cubic Case* | [Paper](https://doi.org/10.5281/zenodo.22668533) | [v0.09](releases/current/paper-02-illustrated-v0.09/README.md) |
| Inverse-Leibniz III | *General Spectral Floors from Marked Deformation Presentations* | [Paper](https://doi.org/10.5281/zenodo.22668633) | [v0.09](releases/current/paper-03-illustrated-v0.09/README.md) |
| Information Topology I | *Foundations of Information Exclusion and Relative Obstruction* | [Manuscript](papers/information-topology/Foundations_of_Information_Exclusion.tex) | [Reading guide and replay](papers/information-topology/README.md) |
| Information Topology II | *Arithmetic Local-System Filling Spectra* | [Manuscript](papers/information-topology/Arithmetic_Local_System_Filling_Spectra.tex) | [Reading guide and replay](papers/information-topology/README.md) |
| Information Topology III | *Minimal Marked Response Modules for Relative Obstruction Data* | [Manuscript](papers/information-topology/Minimal_Marked_Response_Modules.tex) | [Reading guide and replay](papers/information-topology/README.md) |
| Geometry: Ruled surface | *The Orthogonal-Circle Ruled Surface: A Boundary Atlas, Five Rank Singularities, and Conditional Fold-Signal Recurrence* | [v5 paper](https://zenodo.org/records/23073642) | [Guide](papers/legacy-geometry/orthogonal-circle-ruled-surface/README.md) |
| Geometry: Stokes caustic | *Observation Discriminant and Spherical Fold Image of the Orthogonal-Circle Ruled Surface* | [v5 paper](https://doi.org/10.5281/zenodo.22728902) | [Guide](papers/legacy-geometry/stokes-caustic/README.md) |
| Geometry: Bicomplex 1 | *Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity, Smooth Flexibility and Observation Monodromy* | [Paper](https://doi.org/10.5281/zenodo.23103026) | [Guide](papers/legacy-geometry/bicomplex-signal-manifolds/README.md) |
| Geometry: Bicomplex 2 | *Pseudo-Laplacians at Whitney Cross-Caps: Point Interactions on Surfaces Mapped into Three-Space* | [Paper](https://doi.org/10.5281/zenodo.23103056) | [Guide](papers/legacy-geometry/bicomplex-signal-manifolds/README.md) |

## Choose your route

- **Readers:** select a paper above, or browse the [series index](papers/README.md).
- **Researchers and agents:** read [AGENTS.md](AGENTS.md), then the
  [research board](RESEARCH_BOARD.md) and the selected series guide before editing.
- **Reproducers:** use the [verification guide](verification/README.md).
  Computation, written proofs and Lean coverage have different scopes.
- **Citing this work:** use each paper's own DOI. See
  [established works and citation boundaries](ESTABLISHED_WORKS.md) and
  [CITATION.cff](CITATION.cff). Software and collection DOIs are separate records.
- **Exploring the archive:** start with the [repository map](docs/REPOSITORY_GUIDE.md).
  Historical drafts and working notes are not current paper editions.

## Repository layout

```text
papers/
  inverse-leibniz/       Papers I-III: guide and development sources
  information-topology/ Three current manuscripts, shared figures and finite replay
  legacy-geometry/      Four current papers across three historical workstreams
companions/lean/        Formalization sources and explicit coverage maps
verification/           Shared checks and replay instructions
releases/               Versioned packages, receipts and publication evidence
research/               Independent constructions and exploratory work
```

Sealed releases stay at their existing paths. Final PDFs, archives, receipts and
hash manifests are immutable. The Information Topology sources formerly imported
locally under `Foundations_of_Information_Exclusion/` now have a series-level home
at `papers/information-topology/`; relative TeX inputs are preserved.
