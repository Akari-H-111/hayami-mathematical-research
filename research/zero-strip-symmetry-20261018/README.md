# Centered zero strip: periodicity obstruction and quotient audit

**Status:** first bounded research cycle, 2026-10-18.  This directory is an
independent local workstream.  It proves a classical no-go theorem for a
periodic *multiplicity divisor* of all nontrivial zeta zeros, audits the two
height quotients, and formalizes the elementary algebraic/topological-group
models that do not require an analytic zeta development in Mathlib.

No novelty is claimed for the classical consequence: no fixed positive vertical period can
preserve the full zero divisor.  The proof is in
[MATHEMATICS.md](MATHEMATICS.md), with endpoint conventions stated explicitly.
Its decisive inputs are the classical Riemann--von Mangoldt formula and local
finiteness of the zero divisor of the entire xi function.  Thus a cylinder or
Mobius height quotient may still be formed as a quotient of the *ambient
strip*, but it is not a periodic quotient of the marked zero divisor.

## Contents and replay

| File | Purpose |
|---|---|
| [RESULTS.md](RESULTS.md) | Accepted conclusions, object comparison, formal coverage and next target |
| [MATHEMATICS.md](MATHEMATICS.md) | Definitions, proofs, quotient and measure audit |
| [CLAIM_LEDGER.md](CLAIM_LEDGER.md) | Every requested question and its evidence label |
| [SOURCES.md](SOURCES.md) | Source URLs, locations, hypotheses, and retrieval limits |
| [REVIEW.md](REVIEW.md) | Adversarial review and resolutions |
| [COLD_REVIEW.md](COLD_REVIEW.md) | Verbatim fresh-session terra cold review; read with its disposition |
| [REVIEW_RESOLUTION.md](REVIEW_RESOLUTION.md) | Four repaired findings and correction of the review's model self-description |
| [SUPERVISOR_NO_GO.md](SUPERVISOR_NO_GO.md) | Bounded strengthening to eventual divisor periodicity |
| [SUPERVISOR_COUNTERMODEL.md](SUPERVISOR_COUNTERMODEL.md) | Why these symmetries/counts/topologies cannot imply RH |
| [Lean/ZeroStripCore.lean](Lean/ZeroStripCore.lean) | Kernel-checked ambient symmetries, determinants, subgroup obstruction |
| [Lean/SupervisorStructures.lean](Lean/SupervisorStructures.lean) | Separate supplementary AddCircle/deck and generic-growth lemmas; preserved as supplied |
| [Lean/ZetaCompatibility.lean](Lean/ZetaCompatibility.lean) | Actual zeta zero-support symmetries in the open strip, without RH |
| [verification/check_exact.py](verification/check_exact.py) | Exact rational finite-model diagnostic |
| [verification/supervisor_countermodel.py](verification/supervisor_countermodel.py) | Exact finite polynomial diagnostic for the auxiliary countermodel |
| [verification/test_assertion_guard.py](verification/test_assertion_guard.py) | Regression test that both verifiers refuse assertion-stripped execution |
| [verification/replay.sh](verification/replay.sh) | Commands for the tested checks |

Run from this directory:

```sh
python3 -B verification/check_exact.py
sh verification/replay.sh
```

The Lean replay uses the read-only project named in [Lean/README.md](Lean/README.md).
It neither changes that project nor installs dependencies.  See the claim
ledger before relying on any statement: Lean has **not** formalized xi,
Riemann--von Mangoldt, a quotient homeomorphism, or the advanced manifold
classification arguments.

The supervisor's additional actual-zeta module proves conjugation and
functional-reflection support compatibility, while leaving multiplicity and
analytic counting unformalized. Raw CLI logs, baseline inventories and original
attachments are local-only and excluded by this directory's `.gitignore`.

## Compact conclusion

The ambient reflection group is the faithful Klein four group on the plane,
but its action on the zero divisor can be nonfaithful (under RH, the horizontal
reflection fixes every zero).  Ordinary and half-twisted ambient height
quotients are respectively cylinder and Mobius models.  A finite-width quotient
covering all zeros receives infinite pushforward counting mass and is not a
Radon counting measure.  The only compatible topological group among the four
listed ambient quotient types is the full ordinary cylinder, modeled by
`R × AddCircle T`; the stated negative results are topological, not a claim
that a particular smooth multiplication happened to fail.
