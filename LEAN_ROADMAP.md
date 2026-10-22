# Lean completion and follow-on research route

Updated: 2026-10-03

## Current baseline

`companions/lean/stokes-caustic-v5/` uses Lean `4.33.1` and Mathlib `v4.33.1`.
The existing modules compile and contain no `sorry`. They cover:

- exact polynomial definitions and identities;
- cleared-denominator Jacobian numerator reduction;
- rational branch and endpoint identities;
- a fixed real interval certificate for the unique root of `pB`;
- exact sign barriers for `R7`, `B`, and `Q17`;
- the real observation map on the positive `Q` chart, denominator positivity,
  and Fréchet differentiability;
- the explicit Fréchet derivative and exact Jacobian factorization;
- rank-one kernels and transversality for the ordinary symmetry/rational
  branches;
- the transversality failure at the exceptional common point;
- the plane-to-plane Whitney-fold Jacobian criterion and certificates for the
  two ordinary branches;
- actual `C∞` source/target local charts and two-sided smooth inverses for the
  two ordinary branches, reducing the map to `(x,y^2)`;
- the full physical critical set/interval, exceptional source tangents, and the
  discriminant cubic contact error;
- unit length of the actual spherical radial image, mirror symmetry, common
  endpoints, nonzero initial derivative, strict monotonicity of the third
  coordinate, and the unique boundary maximum;
- the full-text Taylor/Big-O remainder, exceptional no-fold obstruction,
  ordinary four-jet/rescaling, fixed Sturm variations, the auxiliary-curve
  quintic/maximum, and exact rational numerical bounds.

Item-by-item full-text coverage is in
`companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md`; `verify_lean.py`
replays the audit/build/status and proof-hole scan for 258 public theorems.
Published v0.02/v0.03 remain immutable; new results are packaged separately as
v0.04. The open germ classification/versal unfolding listed in the paper
remains open.

## First priority: complete the Stokes v5 geometric bridge

| Milestone | Status | Next provable proposition | Verification / location |
| --- | --- | --- | --- |
| L0. Observation map and differentiability | `LEAN-PASSED` | Completed | `StokesV5/ObservationMap.lean`; `LEAN_STATUS.md` |
| L1. Explicit derivative | `LEAN-PASSED` | Completed | `StokesV5/ObservationMap.lean` |
| L2. Jacobian factorization | `LEAN-PASSED` | Completed | `StokesV5/ObservationMap.lean` |
| L3. Ordinary-branch hypotheses | `LEAN-PASSED` | Completed | `StokesV5/ObservationMap.lean`; `StokesV5/FoldGeometry.lean` |
| L4. Exceptional common point | `LEAN-PASSED` | Proved that `(0,0)` does not satisfy the fold criterion | `StokesV5/ObservationMap.lean`; `StokesV5/WhitneyFold.lean` |
| L5. Plane-to-plane fold criterion | `LEAN-PASSED / CRITERION LEVEL` | Completed; the stronger coordinate result is L7 | `StokesV5/WhitneyFold.lean` |
| L6. v0.03 release | `PUBLISHED / VERIFIED` | Retains the original criterion-level scope; later theorems are not added retroactively | Zenodo version DOI `10.5281/zenodo.22735974`; concept DOI `10.5281/zenodo.22726976`; `EXTERNAL_ACTIONS.md`; v0.02 was not rewritten |
| L7. Actual local normal forms | `LEAN-PASSED / WORKING SOURCE` | Constructed `(x,y^2)` source/target charts and two-sided local smooth inverses for both branches | `StokesV5/LocalNormalForm.lean`; `StokesV5/RationalCoordinates.lean`; `StokesV5/RationalNormalForm.lean` |
| L8. Physical locus / discriminant / radial image | `LEAN-PASSED / WORKING SOURCE` | Completed the main geometric conclusions listed in the theorem map; later publication is separate work | `StokesV5/PhysicalLocus.lean`; `StokesV5/Discriminant.lean`; `StokesV5/RadialMonotonicity.lean`; `StokesV5/RadialGeometry.lean`; `COORDINATE_PROOFS.md` |
| L9. Full asserted manuscript coverage | `LEAN-PASSED / WORKING SOURCE` | Item-by-item coverage of the theorems, expansions, four-jet, auxiliary quintic, Sturm table, and numerical bounds; excludes the paper's open research questions | `FULL_PAPER_COVERAGE.md`; `verify_lean.py` |
| L10. v0.04 release | `PUBLISHED / API+DOWNLOAD VERIFIED` | Public on GitHub/Zenodo; new software DOI `10.5281/zenodo.23057630`, same concept; the three public file SHA-256 values agree; only `doi.org` resolution still needs readback | `releases/candidates/stokes-caustic-v5-v0.04-publication.md`; `EXTERNAL_ACTIONS.md` |

L1–L10 proof, sealing, and two-platform public release are complete; the v0.04
software DOI is `10.5281/zenodo.23057630`, while the v0.03 DOI
`10.5281/zenodo.22735974` and concept DOI `10.5281/zenodo.22726976` are
unchanged. Complete replay and public API/download readback passed; the new
Zenodo version is public, and only `doi.org` resolution of the new DOI still
needs readback. That is not a login or publication blocker.

## Second priority: next Lean candidates

1. **Corrected finite core of Ruled surface v4.** Start only after the boundary
   atlas/`Q>0` scope and the new hypotheses of Theorem 5.3 are fixed; the Lean
   target is the corrected theorem, not the known erroneous original text.
2. **Bicomplex: partial coverage of the 33 own theorems (both successor papers
   and software 1.0 were published on 2026-10-02).** A fresh in-place
   `verify_lean.py` PASS on 2026-10-02 covered the build, status, full axiom
   audit, and proof-hole scan of 33 public theorems (only `propext`,
   `Classical.choice`, `Quot.sound` are allowed; logs are in
   `releases/candidates/bicomplex-successor-v1-acceptance/lean-*.txt`). The 224
   Ruled / 258 Stokes dependencies were not rerun in this cycle. Proof inputs
   are unchanged since 0.02. Written/external PDE, operator, sheaf, and
   topology proofs are outside Lean; neither paper claims Lean formalization.
   The software zip includes the Lean sources but cannot build standalone
   (it needs the same-repository `ruled-surface-v5` and `stokes-caustic-v5`).
   There is no mandatory Lean task; to expand formalization, use "Actual open
   obligations" in `COVERAGE.md` and the evidence table in the Bicomplex
   README. Entry: `companions/lean/bicomplex-signal-manifolds/COVERAGE.md`.
3. **Paper III finite-dimensional marked spectral-floor core.** First make the
   marking, state, landing, and source maps explicit inputs; then formalize
   stable-core closure and finite spectral avoidance. Do not erase the marking
   from the types or hypotheses.
4. **Paper I fixed finite model.** Choose only the smallest replayable
   exact-rational theorem; formalizing the 63-page paper is not a near-term
   milestone.

## Lean boundary of the filtered-complex/Diophantine bridge

This is an independent research line. The first Lean artifact should be precise
definitions of the source category, the two metrics, and the candidate map,
plus a finite toy model. Before the bi-Lipschitz main theorem is proved at the
paper/symbolic level, do not create a vacuous general theorem and do not let it
block Stokes v5 L1–L6.

## Pass condition for each Lean change

From `companions/lean/stokes-caustic-v5/`, run:

```bash
python3 -B verify_lean.py
```

After completing a milestone, update:

- `companions/lean/stokes-caustic-v5/LEAN_STATUS.md`
- `companions/lean/stokes-caustic-v5/RESEARCH_STATUS.md`
- `companions/lean/stokes-caustic-v5/GEOMETRIC_CLOSURE_BOUNDARY.md`
- `releases/current/stokes-caustic-v5/THEOREM_MAP.md` (as the v0.02 baseline;
  copy it to the new version before updating, and do not rewrite v0.02)
- the root `RESEARCH_BOARD.md`
