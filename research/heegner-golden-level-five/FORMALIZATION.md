# Formalization status: Heegner level-five golden core

**Date:** 20 October 2026.  **Scope:** new Lean layer; sealed paper bytes are
unchanged.

The algebraic spine of the level-five reconstruction now has a Lean 4 module at
[`Lean/GoldenCore.lean`](Lean/GoldenCore.lean).  It is a bounded formalization,
not a formalization of the whole paper.

## Claim map

| Claim | Written status | Lean status | Boundary |
| --- | --- | --- | --- |
| `P_j(t) = t^6 G_j(t-t^{-1})` | Proposition 2.1 | **LEAN VERIFIED** (`level5_quotient`) | arbitrary field, `t ≠ 0` |
| `P_163 = A^2 - 5 B^2` | Section 3 exact identity | **LEAN VERIFIED** (`P163Eval_eq`) | pointwise identity in any field |
| `sqrt 5 = -A(t)/B(t)` on the selected branch | Section 4 | **LEAN VERIFIED conditional** (`sqrt5_eq_neg_A_div_B`) | assumes `B(t)≠0` and `A(t)<0<B(t)` |
| The three branch formulas for `phi`, `gamma`, `c0` | Section 4 | **LEAN VERIFIED conditional** | same hypotheses |
| `phi^2 = phi + 1`, `c0 = 2-phi = phi^{-2}` | elementary | **LEAN VERIFIED** | none |
| `M^2=1` and `(JMJ)^2=1` | Section 4 | **LEAN VERIFIED conditional** (`M_sq`, `J_sq`, `A_sq`) | assumes `gamma^2=c0` and `1+c0>0` |
| `4H = a_s^2 - 5 b_s^2` | equation (11) | **LEAN VERIFIED** | real polynomial identity |
| CM value, Klein equation, q-product enclosure, Sturm counts, coprimality, factorizations, resolvent | Sections 1, 4-6 and director note | **NOT FORMALIZED** | supplied by the existing Python/exact certificates and named external inputs |

The Lean hypotheses `B(t)≠0` and `A(t)<0<B(t)` are exactly the non-formalized
certificate boundary.  The Python checker supplies the rational enclosure, the
Sturm count, and the coprimality certificate that discharge them in the written
argument.

## Replay

See [`Lean/README.md`](Lean/README.md).  The tested route is the read-only
Mathlib checkout pinned to Lean `v4.33.1` and Mathlib
`0df444a360eaa60ab8c11dca51a86af692955474`.

No RH result, complete Lean formalization, novelty claim, or priority claim is
made.  The v0.2 PDFs, TeX sources, ZIP and hash-bound records remain byte
identical to their completion records.
