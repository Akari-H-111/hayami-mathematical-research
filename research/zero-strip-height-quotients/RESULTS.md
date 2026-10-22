# Accepted scope and next proof target

Date: 2026-10-18. Local research, independent of the ten-paper catalogue.
The requested CLI model was `gpt-5.6-terra`; dispatch and actual session-model
metadata are preserved in local-only logs. The supervising agent added the
eventual-periodicity proof, auxiliary countermodel and supplementary Lean
modules. These contributions are not attributed solely to the CLI worker.

The fresh-session terra cold review gave conditional acceptance. Its four
actionable findings were repaired and checked by the supervisor; see
[review disposition](REVIEW_RESOLUTION.md). The raw report is preserved,
including its incorrect self-description of its model, which the actual
session metadata corrects. No second post-fix cold review was run.

## Research conclusions

1. **PROVED, written with classical external inputs:** the complete
   multiplicity divisor of nontrivial zeta zeros has no positive translation
   period or glide period. Even eventual periodicity is impossible.
   [Main proof](MATHEMATICS.md), [strengthening](SUPERVISOR_NO_GO.md).
2. **PROVED, written countermodel:** symmetry, the main zero-count asymptotic,
   critical-line zero markings and the ambient strip topology do not jointly
   force every zero onto the critical line. Multiplying xi by an explicit
   real even polynomial preserves those inputs and adds an off-line quartet.
   This is an auxiliary entire function, not zeta or a counterexample to RH.
   [Proof and exact-count identity](SUPERVISOR_COUNTERMODEL.md).
3. **LEAN VERIFIED:** three actual zeta zero-support transformations,
   s -> conj(s), s -> 1-s, and s -> 1-conj(s), preserve zeros in the open
   critical strip. This uses the pinned Mathlib zeta theorems, without RH.
   Multiplicity preservation is still a written analytic argument.
   [ZetaCompatibility.lean](Lean/ZetaCompatibility.lean).

## Object comparison

All topology statements below are written proofs using the stated classical
inputs. A LEAN label applies only to the named algebraic model or theorem.

| Object | Group / abelian status | Orientation | Measure compatibility | Formal scope |
|---|---|---|---|---|
| Ambient zero-reflection group | Klein four, abelian; its action on zeros need not be faithful | Character: C,R reverse, F preserves | Preserves zero multiplicities and unsigned area | Map identities/distinctness and matrix determinants compiled; full action isomorphism and determinant character remain written |
| Full ordinary cylinder | Compatible abelian topological group R x AddCircle T | Orientable | Ambient area descends; zeta divisor does not descend under height deck | Group instances, continuity, projection addition and deck identity compiled; quotient homeomorphism written |
| Closed finite cylinder | No compatible topological group | Orientable | Ambient area descends; full-zero pushforward on a covering band is not Radon | Boundary/interior obstruction written |
| Closed / open Mobius band | Neither has a compatible topological group | Nonorientable | Unsigned ambient area descends; zeta divisor fails glide compatibility | Glide square compiled; topology and no-group obstructions written |
| Mobius center circle | Abelian S1 group after choosing origin/period | Orientable circle | Haar/length measure exists; zero compatibility needs separate data | AddCircle model reused; embedding/topology written |
| Connected orientation double cover of Mobius band | Full-width cover is a cylinder group; finite closed cover has boundary and no group | Orientable | Ambient area descends; this does not create a periodic zeta divisor | Abstract cylinder model compiled; cover map written |
| Original zero set / Gamma | Not a subgroup under inherited addition; arbitrary transported group laws are a different question | Not applicable as a discrete marked set | Locally finite multiplicity counting measure; reflection invariant | Actual zeta support symmetries compiled; abstract missing-zero subgroup obstruction compiled |
| Integer span of Gamma | Additive subgroup of R, abelian | Not applicable | No canonical locally finite Haar/counting claim here | General algebraic construction only; marked generators must be retained separately |

## Formalization coverage

- `ZeroStripCore.lean`: 10 named theorems about coordinate maps, displayed
  matrix determinants and a generic subgroup obstruction.
- `SupervisorStructures.lean`: 8 named theorems plus 2 instance checks about
  the cylinder model, glide, reflection and constant-cell/growth contradiction.
- `DivisorCells.lean`: 11 named theorems about half-open cells, disjointness,
  translation, finite cell-mass preservation and the bounded-cell/superlinear
  contradiction.  A `CellDivisor` structure records finite cell supports and
  multiplicity preservation.
- `ZetaCompatibility.lean`: 5 named theorems for the actual zeta zero support.

The compiled declarations use only `propext`, `Classical.choice`, and
`Quot.sound` (some use a subset). No completed declaration uses `sorryAx`
or a custom axiom. These 34 named theorems do not amount to a Lean proof of
Riemann–von Mangoldt, the divisor No-Go or the advanced quotient topology.

## Next bounded target

The half-open cell partition, multiplicity-preserving translation and
bounded-cell/superlinear contradiction now have a Lean model.  The next target
is to connect that model to an actual locally finite divisor constructed from
xi, and then to the analytic zero-count growth.  Both remain named external
inputs.  The independent topology target is a faithful ambient Klein action and
its restricted-action kernel, with the finite reflection quotient retaining
orbit sizes and multiplicities.

RH remains open. Support-only periodicity is not decided by this package.
Portable dependency configuration is provided, but clean-machine fetching
and rebuilding have not been tested.
