# Formalization and publication decision

## Ranking

1. **Stokes caustic v5 — best first Lean/public release target.** Its located TeX is content-aligned with the final PDF, the manuscript is only ten pages, its main claims reduce to exact polynomial identities, rational interval bounds, Sturm root counts, and standard fold criteria, and the paper already states strong negative-scope boundaries.
2. **Ruled surface v4 — formalize only after issuing a corrected manuscript.** The interior algebra and Whitney-fold criterion are recoverable, but the written global chart reaches `Q=0`, where its displayed derivatives divide by `Q`, and Theorem 5.3 is false under its stated hypotheses. Lean should target a repaired theorem set, not fossilize v4 as written.
3. **Bicomplex signal manifolds v12 — formalize by modules, not as the first whole-paper project.** Its finite algebraic, A3, sublevel, Gram, Poisson, and eta components are suitable. The Green/Dirac/Pin/sheaf claims in Section 8 need domain-level specialist review before formalization, and the final TeX was not recovered.

## Lean-ready v5 theorem order

1. Define the polynomial data `A`, `B`, `p_b`, `R7`, and `Q17` over `ℚ` and the algebraic relations for `s²` and `Q²`.
2. Prove the Jacobian and derivative factorizations by `ring`/`field_simp` under explicit nonzero denominators.
3. Encode the rational isolating interval `613/1000 < c_b < 614/1000` and prove endpoint signs.
4. Formalize the fixed root-count consequences required by v5, either by porting Sturm chains or by a fully checked equivalent exact certificate; do not trust numeric approximations.
5. State the fold results with all chart, rank, and transversality hypotheses exposed. Import the standard smooth fold recognition theorem only after locating or proving the exact Mathlib prerequisite.
6. Publish Lean, TeX, final hash-bound PDF, Python replay, and a status table that distinguishes Lean-passed results from prose-only geometric consequences.

## Implemented first Lean layer

`companions/lean/stokes-caustic-v5/` now pins Lean `4.33.1` and Mathlib `v4.33.1`. It proves, without `sorry`, the exact polynomial identity behind the physical-boundary certificate, the cleared-denominator Jacobian reduction, the rational fold-branch root identity, radial endpoint algebra, and the two rational `pB` endpoint signs. It also proves over `ℝ` that the isolating interval contains exactly one `pB` zero and establishes the sign exclusions for `R7`, `B`, and `Q17` by explicit positive Bernstein expansions. A reusable general Sturm theorem is a separate library-development task, not a blocker for the v5 release theorem set.

## Closure boundary for this reconstruction

The local recovery is complete when all three source layers rebuild, final PDFs remain hash-identical, claim ledgers are page-pinned, exact verifiers pass, and the source classification is explicit. It does **not** mean that the missing v4/v12 final TeX has been recovered or that every infinite-dimensional analytic statement in v12 has been proved.
