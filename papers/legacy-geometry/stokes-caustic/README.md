# Stokes Caustic: observation discriminant and spherical fold image

[Geometry papers](../README.md) · [Repository home](../../../README.md)

## Current paper and companion

Read [*Observation Discriminant and Spherical Fold Image of the
Orthogonal-Circle Ruled Surface*](https://doi.org/10.5281/zenodo.22728902), v5.
Its [Lean coverage map](../../../companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md)
lists all asserted mathematical results covered by companion v0.04 (258 public
named theorems). The [software record](https://zenodo.org/records/23057630) is
separate from the paper DOI. Historical companion v0.03 remains criterion-level;
v0.04 coverage is never retroactively attributed to it. Full-germ classification
and versal unfolding remain open. See the [verification guide](../../../verification/README.md).

## Reconstruction and source provenance


[Geometry papers](../README.md) · [Repository home](../../../README.md)

## Current paper and companion

Read [*Observation Discriminant and Spherical Fold Image of the
Orthogonal-Circle Ruled Surface*](https://doi.org/10.5281/zenodo.22728902), v5.
Its [Lean coverage map](../../../companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md)
lists all asserted mathematical results covered by companion v0.04 (258 public
named theorems). The [software record](https://zenodo.org/records/23057630) is
separate from the paper DOI. Historical companion v0.03 remains criterion-level;
v0.04 coverage is never retroactively attributed to it. Full-germ classification
and versal unfolding remain open. See the [verification guide](../../../verification/README.md).

## Reconstruction and source provenance


Source: `stokes-v5` in the source registry.

The final PDF explicitly separates the full critical locus, the observation discriminant, and the normalized spherical radial image.  That separation is a non-negotiable reconstruction boundary.  In particular, do not reintroduce an identification with a Gauss map or an unqualified spinorial/quantum interpretation.

The first verifier target is the Jacobian factorization and the two-component critical locus.  The original exact Sturm replay remains available; the fixed interval consequences needed by the paper are additionally formalized in Lean through real Bernstein-sign certificates, rather than inferred from a plot.

The same-named historical TeX has now been promoted to a content-aligned recovered source candidate after an isolated 10-page rebuild, a portable word-token match of `0.982321`, and independent exact verification. See `SOURCE_CANDIDATE.md`; this does not make it byte-identical to the lost original source.

The Lean-ready core now lives in `formalization/`. It compiles without `sorry`; it includes the unique physical `pB` root and the `R7`, `B`, and `Q17` sign exclusions. Module-level scope and replay commands are in `formalization/LEAN_STATUS.md`.

The 2026-09-30 working extension is in
`companions/lean/stokes-caustic-v5/`: it constructs actual smooth local
Whitney-fold coordinates on both ordinary branches and proves the physical
locus, discriminant contact, and normalized radial-image results. It now also
proves every asserted mathematical result mapped in `FULL_PAPER_COVERAGE.md`,
including displayed remainders, the exceptional no-fold obstruction and
ordinary four-jet, auxiliary maximum/quintic, fixed Sturm table and rational
numerical bounds. The paper's open full-germ classification and unfolding,
plot samples and physical interpretations are excluded. The exhaustive Lean
audit is replayed by `verify_lean.py`. These results are packaged separately
as v0.04, never retroactively included in criterion-level v0.03.
