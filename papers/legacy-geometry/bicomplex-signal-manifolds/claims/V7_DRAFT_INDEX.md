# Registered v7 draft: named-block index

2026-10-02. This index covers the author-supplied 26-page draft
`Geometric_Realization_of_Bicomplex_Signal_Manifolds_v7.pdf`. It is registered
at `../../source-registry/historical_drafts/` (SHA-256
`6cefa5258257f3a23e35b5dd5cbe123b7af0ed3319c3a614b1c8d54c94bd654f`; PDF dates
2026-07-11; title page "July 2026", footer "June 2026"). The original intake
path was the identically hashed file in `~/Downloads/`.

The draft is **not** the 43-page final v12, which remains the claim authority
(see `CLAIM_MAP.md`). It is also not shown to be generated from the 1,908-line
ancestor TeX. Equal numbers in v7 and v12 do not imply equal statements. Pages
are physical PDF pages and equal the printed folios.

The inventory below was extracted from the hash-checked PDF text: 39 named
blocks. By section: §3 has 3, §4 has 4, §5 has 4, §6 has 1, §7 has 8, §8 has
16, §9 has 2 and §10 has 1. The unnumbered §9.3, the abstract, Figures 1–11,
the §8.7 table, Table 2 and the conclusion contain further assertions.

The column "0.04 determination" lists only results proved in
`../revision/Moment_Readouts_Exceptional_Pullbacks_v0_04_working.tex`. A dash
means the block was **not re-audited in this window**. Use the v12 claim map,
the ancestor and the earlier continuations for any v12 counterpart; their
statuses are not transferred here automatically.

| Block | Page | Title (abridged) | 0.04 determination |
| --- | ---: | --- | --- |
| Definition 3.1 | 2 | Geometric Projection R⁴→R³ | Under \|z₁\|²=cos t: no readout real-analytic along {z₁=0} (no affine/polynomial/bicomplex-polynomial projection) on D or D∘; phase-invariant and mixed-state readouts fail outright; explicit C^∞ realization exists; half source D₊ admits analytic but not affine readouts (`thm:rigidity`, `prop:gauge`, `thm:smooth`, `prop:half`) |
| Definition 3.2 | 3 | Mellin–Hilbert spectral operator | — |
| Definition 3.3 | 3 | Information geometric capacity | — |
| Theorem 4.1 | 3 | Topological dipole | — (indices ∓1 reused as finite replay input only) |
| Theorem 4.2 | 3 | Monodromy and 4π restoration | — (square-root cover used as carrier in `prop:carrier`) |
| Remark 4.3 | 3 | Spin-½ analogy | — |
| Corollary 4.4 | 4 | Local degree via Jacobian sign | — |
| Lemma 5.1 | 5 | √5 compression rate | — |
| Remark 5.2 | 5 | Jacobian/Stokes constant | — |
| Conjecture 5.3 | 5 | Capacity scaling law | — |
| Remark 5.4 | 5 | Bekenstein consistency | — |
| Proposition 6.1 | 6 | Governing invariant c²−3c+1 | — |
| Theorem 7.1 | 6 | Formal self-adjointness | — |
| Remark 7.2 | 7 | Deficiency indices (1,0) | — |
| Corollary 7.3 | 7 | Real phase frequencies | — |
| Theorem 7.4 | 8 | Gram matrix bound | — |
| Remark 7.5 | 8 | Asymptotic orthogonality | — |
| Proposition 7.6 | 8 | Independence threshold | — |
| Remark 7.7 | 8 | Pontryagin interpretation | — |
| Corollary 7.8 | 9 | Condition number | — |
| Proposition 8.1 | 9 | Plancherel condition | — |
| Remark 8.2 | 10 | Finite Pontryagin pairing | — |
| Proposition 8.3 | 10 | Smoothness failure at the fold | **False as stated.** For every continuous Ψ on a convex domain, Ψ^!Z ≅ j_!Z on the interior; i\*Ψ^!Z ≅ Z[−1] holds at no point; i^! gives [−1] on every embedded arc; the fold is detected by the comparison map, cokernel i\*Z_L (`thm:shriek`, `cor:shift`, `prop:detect`) |
| Remark 8.4 | 11 | Dipole and Verdier duality | Zero count is elementary degree theory; Ψ is defined only on D∘ because M=P/Q is singular at t=±π/2 |
| Proposition 8.5 | 12 | Polar fold | — |
| Remark 8.6 | 13 | Total is not χ(D) | — |
| Proposition 8.7 | 13 | Compactological space | — |
| Remark 8.8 | 13 | Non-manifold points | — |
| Definition 8.9 | 14 | Monodromy endomorphism | End(Z_X)=Z for connected X, so τ=±id on the constant sheaf (`prop:carrier`) |
| Proposition 8.10 | 14 | Spectral decomposition | No nonzero ± splitting of Z_X; the correct carrier π\*Z of the square-root cover is indecomposable over Z and splits only over Z[½] |
| Corollary 8.11 | 15 | Charpoly t²−1, observable sector | Charpoly on Z_X is t∓1; fold involution (fixed curve) ≠ deck involution (free); no Mellin-to-carrier map supplied |
| Remark 8.12 | 15 | Akari–Hilbert operator | Inherits the 8.10 correction; no further determination |
| Proposition 8.13 | 15 | Log-scale Gram bound | The bound is correct; it equals the linear kernel at window length log T (`prop:windows`) |
| Remark 8.14 | 15 | Arithmetic–geometric gap | Gap = window-mass ratio T/log T for every real frequency; same characters with Lebesgue measure on [1,T] do not decorrelate (ordering reversed); N is not a subgroup |
| Proposition 8.15 | 17 | σ-to-Deligne weight | — |
| Remark 8.16 | 18 | Six-functor critical line | Relative dimension is 0 at every interior point, fold or not; the "d=−1 at the fold" premise is false |
| Remark 9.1 | 21 | Mass hierarchy ansatz | — |
| Conjecture 9.2 | 21 | Effective commutator | — |
| Remark 10.1 | 21 | Mathlib gaps | — |

Exact and finite checks: `../verification/verify_continuation_0_04.py`, which
also re-hashes the registered v7 PDF. None of the 0.04 results is
Lean-formalized.
