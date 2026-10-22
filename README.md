# Hayami Mathematical Research

Ten current manuscripts in three research families, with sources, computation,
formalization and historical evidence kept distinct. By Akari Hayami (Jian-Yu Huang).

**Read the papers:** [Inverse-Leibniz (3)](papers/inverse-leibniz/README.md) ·
[Information Topology / Information Exclusion (3)](papers/information-topology/README.md) ·
[Geometry (4)](papers/legacy-geometry/README.md)

## Latest: October 2026 formalization round

Two open questions from the geometry papers are now settled, with Lean 4 proofs
and new software releases. The papers themselves are unchanged.

- **Stokes caustic:** the exceptional germ is a fold of a fold, smoothly
  equivalent to (X, Xy² + y⁴) ([proof note](papers/legacy-geometry/stokes-caustic/notes/EXCEPTIONAL_GERM.md),
  companion v0.05, [10.5281/zenodo.23422752](https://doi.org/10.5281/zenodo.23422752); 268 Lean theorems).
- **Ruled surface:** the complete self-intersection is a seam plus two mirror
  double arcs ([proof note](papers/legacy-geometry/orthogonal-circle-ruled-surface/notes/SELF_INTERSECTION.md),
  companion v0.04, [10.5281/zenodo.23422777](https://doi.org/10.5281/zenodo.23422777); 246 Lean theorems).
- **Bicomplex successors:** Lean coverage of the two papers grows from 33 to 105
  selected statements (software 1.1, [10.5281/zenodo.23422785](https://doi.org/10.5281/zenodo.23422785)).

Neither the papers nor the notes are Lean-formalized as a whole; each coverage
file lists exactly what is machine-checked and what remains a written proof.

## Independent research formalization

Two independent workstreams under `research/` now carry bounded Lean layers.
They are separate from the ten-paper catalogue, and neither is a whole-paper
formalization.

- **Heegner level-five golden fibre:** the algebraic core of the CM
  reconstruction is kernel-checked: the universal sextic quotient, the
  `P_163 = A^2 - 5B^2` evaluation identity, the conditional branch sign, the
  three golden formulas, and the abstract `M/J` involution. See the
  [formalization map](research/heegner-golden-level-five/FORMALIZATION.md).
- **Zero-strip height quotients:** 34 named Lean theorems in four modules now
  include the half-open cell ladder, multiplicity-preserving cell translation,
  and the bounded-cell/superlinear-count contradiction. See the
  [formalization map](research/zero-strip-height-quotients/FORMALIZATION.md).

The CM value, Klein equation, q-product enclosure, Sturm counts, coprimality
certificate, xi divisor, and Riemann–von Mangoldt remain outside Lean. No RH
proof or priority claim is made.

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
research/               Independent constructions, exploratory work and bounded Lean layers
```

Sealed releases stay at their existing paths. Final PDFs, archives, receipts and
hash manifests are immutable. The Information Topology sources formerly imported
locally under `Foundations_of_Information_Exclusion/` now have a series-level home
at `papers/information-topology/`; relative TeX inputs are preserved.

## License

Mixed by file type; the approved policy and its decision record are in
[LICENSE.md](LICENSE.md) and [LICENSE_POLICY.md](LICENSE_POLICY.md).

- Lean and Python source, together with build and verification configuration: `Apache-2.0`.
- Manuscripts, PDFs, original figures and project documentation: `CC BY 4.0`.
- `archive/`, `releases/archive/`, third-party materials, and the sealed v0.01 Stokes companion: no new license grant.
