# Lean replay

Tested against the read-only Mathlib checkout supplied by the task:

```sh
cd /Users/akari_hayami_64/Documents/prime-spherical-fold
lake env lean /Users/akari_hayami_64/Documents/hayami-mathematical-research/research/zero-strip-symmetry-20261018/Lean/ZeroStripCore.lean
```

This is the tested local reuse path.  It uses the already-built package cache;
it is not a clean-machine build.  `Lean/lakefile.toml` and
`Lean/lean-toolchain` provide an untested portable pin to Lean 4.33.1 and
Mathlib commit `0df444a360eaa60ab8c11dca51a86af692955474`.  A clean-machine
replay would need to fetch that pin before running `lake env lean`; this cycle
does not do so, in order not to install or update dependencies.

`ZeroStripCore.lean` has no `sorry`, `admit`, or custom axioms.  Its imported
Mathlib axioms are reported by the replay script.

API reconnaissance was performed in the pinned checkout before formalization.
The supplementary model imports `Mathlib.Topology.Instances.AddCircle.Defs`,
`Mathlib.Topology.Algebra.Ring.Real`, and
`Mathlib.Topology.Algebra.Group.Basic`, which supply `AddCircle`, its additive
topological-group instances, and the period/coercion lemmas used there.

`ZetaCompatibility.lean` imports
`Mathlib.NumberTheory.Harmonic.ZetaAsymp`. Its `riemannZeta_conj` and
`riemannZeta_one_sub` inputs prove support invariance for actual zeros in
`0 < re(s) < 1`; the strip hypotheses discharge the functional-equation
exceptions. This is not a multiplicity theorem. Mathlib's
`completedRiemannZeta₀` is not Riemann's xi; this package does not identify
the two functions.

For a new machine, enter this directory and run `lake update`,
`lake exe cache get`, then `lake build`. These are untested setup instructions
for the supplied exact pin, not a claim that dependencies were fetched or a
clean-machine build passed in this cycle. The tested route remains the
read-only local reuse exercised by `verification/replay.sh`.
