# Completed Lean work and future research

Updated: 2026-10-03

## Current baseline

`companions/lean/stokes-caustic-v5/` uses Lean `4.33.1`, Mathlib `v4.33.1`; existing modules compile without `sorry`. Coverage includes:

- Exact polynomial definitions and identities;
- cleared-denominator Jacobian numerator reduction；
- Rational branches and endpoint identities;
- Fixed real-interval certificate for the unique root of `pB`;
- Exact sign barriers for `R7`, `B`, `Q17`;
- Real observation map, denominator positivity and Fréchet differentiability in the positive-`Q` chart;
- Explicit Fréchet derivative and exact Jacobian factorization;
- Rank-one kernels and transversality on ordinary symmetry/rational branches;
- Failure of transversality at the exceptional common point;
- Plane-to-plane Whitney-fold Jacobian criterion and certificates on both ordinary branches;
- Actual `C∞` source / target local charts with two-sided smooth inverses reducing both ordinary branches to `(x,y^2)`;
- Complete physical critical locus / intervals, exceptional source tangents and discriminant cubic-contact error;
- Actual spherical radial-image unit length, mirror symmetry, common endpoint, nonzero initial derivative, strict third-coordinate monotonicity and unique boundary maximum;
- Full manuscript Taylor / Big-O remainders, exceptional no-fold obstruction / ordinary four-jet / rescaling, fixed Sturm variations, auxiliary quintic / maximum and exact rational bounds.

Claimwise manuscript coverage is in `companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md`; `verify_lean.py` replays audit/build/status and proof-hole scans for 258 public theorems. Published v0.02 / v0.03 remain immutable; new findings are packaged separately as v0.04. The manuscript's open germ classification / versal unfolding remain open.

## First priority: Stokes v5 geometry bridge

| Milestone | Status | Next provable proposition | Verification / location |
| --- | --- | --- | --- |
| L0. Observation map and differentiability | `LEAN-PASSED` | Complete | `StokesV5/ObservationMap.lean`; `LEAN_STATUS.md` |
| L1. Explicit derivative | `LEAN-PASSED` | Complete | `StokesV5/ObservationMap.lean` |
| L2. Jacobian factorization | `LEAN-PASSED` | Complete | `StokesV5/ObservationMap.lean` |
| L3. Ordinary-branch hypotheses | `LEAN-PASSED` | Complete | `StokesV5/ObservationMap.lean`; `StokesV5/FoldGeometry.lean` |
| L4. Exceptional common point | `LEAN-PASSED` | `(0,0)` proved not to satisfy the fold criterion | `StokesV5/ObservationMap.lean`; `StokesV5/WhitneyFold.lean` |
| L5. Plane-to-plane fold criterion | `LEAN-PASSED / CRITERION LEVEL` | Complete; stronger coordinate result in L7 | `StokesV5/WhitneyFold.lean` |
| L6. v0.03 release | `PUBLISHED / VERIFIED` | Original criterion-level scope retained; later theorems not retroactively included | Zenodo version DOI `10.5281/zenodo.22735974`; concept DOI `10.5281/zenodo.22726976`; `EXTERNAL_ACTIONS.md`; v0.02 unchanged |
| L7. Actual local normal forms | `LEAN-PASSED / WORKING SOURCE` | `(x,y^2)` source / target charts and two-sided local smooth inverses constructed on both branches | `StokesV5/LocalNormalForm.lean`; `StokesV5/RationalCoordinates.lean`; `StokesV5/RationalNormalForm.lean` |
| L8. Physical locus / discriminant / radial image | `LEAN-PASSED / WORKING SOURCE` | Main geometry in the theorem map complete; subsequent publication separate | `StokesV5/PhysicalLocus.lean`; `StokesV5/Discriminant.lean`; `StokesV5/RadialMonotonicity.lean`; `StokesV5/RadialGeometry.lean`; `COORDINATE_PROOFS.md` |
| L9. Full asserted manuscript coverage | `LEAN-PASSED / WORKING SOURCE` | Claimwise coverage of theorems, expansions, four-jets, auxiliary quintic, Sturm tables and numerical bounds; excludes original open research questions | `FULL_PAPER_COVERAGE.md`; `verify_lean.py` |
| L10. v0.04 release | `PUBLISHED / API+DOWNLOAD VERIFIED` | GitHub / Zenodo public; new software DOI `10.5281/zenodo.23057630`, same concept; three public file SHA-256 values match; only `doi.org` resolution pending read-back | `releases/candidates/stokes-caustic-v5-v0.04-publication.md`; `EXTERNAL_ACTIONS.md` |

L1–L10 proofs / sealing / publication on both platforms are complete. v0.04 software DOI `10.5281/zenodo.23057630`; v0.03 DOI `10.5281/zenodo.22735974` and concept DOI `10.5281/zenodo.22726976` unchanged. Full replay and public API / download read-backs passed. The new Zenodo version is public; only new-DOI `doi.org` resolution awaits read-back, not a login or publication blocker.

## Second priority: next Lean candidates

1. **Corrected finite core of ruled surface v4.** Start after fixing the boundary atlas / `Q>0` scope and additional assumptions for Theorem 5.3. Formalize corrected theorems, not known errors in the original.
2. **Bicomplex: partial coverage of 33 own theorems (two successor papers and software 1.0 public since 2026-10-02).** Fresh in-place `verify_lean.py` PASS on 2026-10-02: build, status, complete axiom audit and proof-hole scan for 33 public theorems (only `propext`, `Classical.choice`, `Quot.sound`; logs in `releases/candidates/bicomplex-successor-v1-acceptance/lean-*.txt`). The 224 Ruled / 258 Stokes dependencies were not rerun then. Proof inputs unchanged since 0.02. Written / external PDE, operator, sheaf and topology proofs are outside Lean; neither paper is called Lean-formalized. The software ZIP includes Lean sources but needs same-repository `ruled-surface-v5` and `stokes-caustic-v5` to build. No mandatory Lean task remains. Extend coverage using “Actual open obligations” in `COVERAGE.md` and the Bicomplex README evidence table. Entry: `companions/lean/bicomplex-signal-manifolds/COVERAGE.md`.
3. **Finite-dimensional marked spectral-floor core of Paper III.** Make marking, state, landing and source maps explicit inputs; formalize stable-core closure and finite spectral avoidance without removing marking from types or hypotheses.
4. **Fixed finite model of Paper I.** Select the smallest replayable exact-rational theorem; formalizing all 63 pages is not a near-term milestone.

## Lean boundary for the filtered-complex / Diophantine bridge

This is an independent research line. The first Lean artifact should define the source class, both metrics and candidate maps precisely, with a finite toy model. Before a written / symbolic bi-Lipschitz theorem, avoid an empty general theorem and do not block Stokes v5 L1–L6.

## Gates for each Lean change

From `companions/lean/stokes-caustic-v5/`, run:

```bash
python3 -B verify_lean.py
```

After completing a milestone, synchronize:

- `companions/lean/stokes-caustic-v5/LEAN_STATUS.md`
- `companions/lean/stokes-caustic-v5/RESEARCH_STATUS.md`
- `companions/lean/stokes-caustic-v5/GEOMETRIC_CLOSURE_BOUNDARY.md`
- `releases/current/stokes-caustic-v5/THEOREM_MAP.md` (v0.02 baseline; copy to a new version before updating for a new release, leaving v0.02 unchanged)
- Root `RESEARCH_BOARD.md`
