# Lean formalization: level-five golden core

**Status:** kernel-checked algebraic core, 20 October 2026.  This is a new
formalization layer; it does not rewrite any sealed v0.1 or v0.2 artifact.

## Tested replay

The tested route reuses the prepared read-only Mathlib checkout pinned to Lean
`v4.33.1` and Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`:

```sh
export HMR_ROOT=/path/to/hayami-mathematical-research
cd /Users/akari_hayami_64/Documents/prime-spherical-fold
lake env lean "$HMR_ROOT/research/heegner-golden-level-five/Lean/GoldenCore.lean"
```

Alternatively, from the workstream root, run `sh Lean/replay.sh`; the wrapper
checks the toolchain and Mathlib commit before compiling. It defaults to the
tested checkout and accepts `HEEGNER_LEAN_ROOT` for another prepared checkout
with the same pin.

`lakefile.toml` and `lean-toolchain` record the same portable pin.  A
clean-machine `lake update`/`lake exe cache get`/`lake build` was not tested in
this cycle.  The checked wrapper `Lean/replay.sh` runs the same module and
checks the pin before invoking Lean.

## What is kernel-checked

| Declaration | Statement |
| --- | --- |
| `level5_quotient` | `P_j(t) = t^6 G_j(t - t^{-1})` in every field, for `t ≠ 0` |
| `P163Eval_eq` | `P_163(t) = A(t)^2 - 5 B(t)^2` in every field |
| `sqrt5_eq_neg_A_div_B` | if `P_163(t)=0`, `B(t)≠0`, `A(t)<0<B(t)`, then `sqrt 5 = -A(t)/B(t)` |
| `phi_formula`, `gamma_formula`, `c0_formula` | the three branch formulas in terms of `A(t),B(t)` |
| `phi_sq`, `c0_eq_two_sub_phi`, `c0_eq_phi_inv_sq` | elementary golden-ratio identities |
| `M_sq`, `J_sq`, `A_sq` | `M^2=1`, `J^2=1`, and `(JMJ)^2=1` for the homogeneous inversion model |
| `H_identity` | `4H(s) = a_s(s)^2 - 5 b_s(s)^2` |

The polynomial identities are stated pointwise in an arbitrary field.  This is
the evaluation form of the corresponding polynomial identities and avoids a
dependency on a polynomial-ring build in the pinned read-only checkout.

## Scope boundary

The following remain outside this Lean layer and are not silently upgraded:

- the classical CM value `j(tau_163) = -640320^3`;
- Klein's level-five equation;
- the rational q-product enclosure of the analytic `t` branch;
- Sturm root counts and interval sign certificates;
- the exact coprimality certificate for `A` and `B`;
- the factorization controls over `Q` and `Q(sqrt 5)`;
- the cubic-resolvent discriminant and Galois-group argument;
- the trace-form signature computation;
- the trigonometric identification of the abstract matrix `A=JMJ` with the
  displayed sine matrix.

In particular, the Lean theorem `sqrt5_eq_neg_A_div_B` takes `P_163(t)=0`,
`B(t) ≠ 0` and the certified sign inequalities as hypotheses.  The Python
checker still supplies the rational enclosure, the Sturm count and the
coprimality certificate.  This is an algebraic core, not a complete Lean
formalization of the paper.

The declarations report only the standard kernel/library axioms
`propext`, `Classical.choice` and `Quot.sound`; no declaration uses `sorry`,
`admit`, or a custom axiom.
