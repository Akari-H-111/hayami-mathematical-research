# Reconstruction target: Stokes Caustic v5

Source: `stokes-v5` in the source registry.

The final PDF explicitly separates the full critical locus, the observation discriminant, and the normalized spherical radial image.  That separation is a non-negotiable reconstruction boundary.  In particular, do not reintroduce an identification with a Gauss map or an unqualified spinorial/quantum interpretation.

The first verifier target is the Jacobian factorization and the two-component critical locus.  The original exact Sturm replay remains available; the fixed interval consequences needed by the paper are additionally formalized in Lean through real Bernstein-sign certificates, rather than inferred from a plot.

The same-named historical TeX has now been promoted to a content-aligned recovered source candidate after an isolated 10-page rebuild, a portable word-token match of `0.982321`, and independent exact verification. See `SOURCE_CANDIDATE.md`; this does not make it byte-identical to the lost original source.

The Lean-ready core now lives in `formalization/`. It compiles without `sorry`; it includes the unique physical `pB` root and the `R7`, `B`, and `Q17` sign exclusions. Module-level scope and replay commands are in `formalization/LEAN_STATUS.md`.
