# Claim map — portrait revision 0.2

This map separates written proofs, exact certificates, finite numerical
diagnostics, and external inputs. It is an evidence index, not a novelty claim.

| Statement | Written basis | Exact or numerical evidence | External input |
| --- | --- | --- | --- |
| Interior rank loss forces `u=(1-c)/2` and `P(c)=0` | Section 2: cross-product components and nonzero prefactor | Elementary identities; body-data checker verifies the necessary/full distinction | Interior part of the published five-singularity classification (HMR v5, Theorem 2.2) |
| Unique admissible root `c0=(3-sqrt5)/2=phi^-2` | Section 2: `P` has one root in `(0,1)` | `DIRECTOR_LEMMA_RESULTS.json` checks discriminant, norm, and trigonometric identities | Elementary quadratic/cyclotomic algebra |
| `gamma=1-c0=phi^-1`, `u0=gamma/2=cos72°` | Section 2 and equation (2) | Figure data checker | Elementary geometry |
| Pentagon squared side/diagonal ratio and icosahedral chord ratio equal `c0` | Section 2; Figure 2 context; S04 and S12 | `check_figure_data.py` verifies coordinates, counts, and chord data | Elementary geometry |
| CM recovery: `sqrt5` and `c0` are rational functions of `v=r(tau163)^5` | Theorem 3.1: `P_j=A^2-5B^2`, coprimality, rational interval, branch sign | `baseline_cm.py`, `CM_REPLAY_RESULTS.json`: exact factorization, gcd, interval signs, Sturm count | Duke's CM value and Klein's level-five relation |
| `Q(v)=Q(U)(delta)`, `U=v-v^-1`, `delta=2sqrt163 sin(pi/5)` | Corollary A.1: both containments via explicit `w(U)` | `baseline_square_certificate.py`, `DIRECTOR_CERTIFICATE.json`: zero remainder and rational signs | No class-field identification theorem is needed for this algebraic equality |
| Conductor-815 cyclic quartic field | Appendix A records the selected generator polynomial | Exact elimination `delta^4-815 delta^2+132845=0` | Spearman–Williams (1997) prior family; no novelty claim for the field |
| Near-integer gap and correction ladder | Section 3: classical `j`-expansion; Figure 3 | 180-digit stored strings; exact coefficients from `E4^3/Delta`; `check_figure_data.py` | Classical `j`-expansion (Duke) |
| `M^2=I`, `A=JMJ`, and `A^2=I` | Section 4: direct multiplication and pentagon identities | `DIRECTOR_LEMMA_RESULTS.json`: exact eigenline/trigonometric checks | Duke's inversion law |
| `kappa=r(i)` is the positive eigenline; half-angle and trigonometric forms | Proposition 4.1 | `check_dh_constant.py`, `DH_CONSTANT_CHECK.json`: 90-digit product versus closed form and eigenline | Duke inversion law; classical Rogers–Ramanujan product |
| Theta transformation `Theta_a(x)=x^-3/2 Theta_{Ta}(1/x)` | Theorem 5.1: residue-class Poisson summation and cancellation | S08–S09 finite evaluations; `check_figure_data.py` verifies saved theta samples | DLMF §1.8(iv) Poisson summation |
| Completed `Lambda_a(s)` is entire and satisfies `Lambda_a(s)=Lambda_{Ta}(1-s)` | Theorem 5.1: endpoint envelopes, local-uniform differentiation, gamma integration | S09 finite nonreal-slice diagnostic only | DLMF Poisson summation; standard gamma integral |
| Per-eigenline classification of scalar functional equations | Theorem 5.2: exact eigenlines plus Dirichlet-series injectivity tail bound | `DIRECTOR_LEMMA_RESULTS.json` checks both signs at two sample points | None beyond the written argument |
| Mixed vectors satisfy neither scalar sign | Section 5 example `(x,y)=(1,0)` | `check_dh_constant.py` confirms the nearer sign fails by `0.5257...` | Elementary matrix algebra |
| Normalized positive sequence is Davenport–Heilbronn and nonmultiplicative | Section 5: `a=(1,kappa,-kappa,-1,0)`, `a6=1`, `a2a3=-kappa^2` | `check_dh_constant.py`: exact product relation and 90-digit parameter identity | Identification with the classical DH sequence; off-line zeros attributed externally |
| Off-critical-line zeros of the DH function | Not reproved; explicitly attributed | None | Balanzario–Sanchez-Ortiz (2007) |
| Odd-`N` finite Fourier theorem | Appendix B: replace 5 by odd `N` in the Poisson proof | Finite involution checks `N=3,...,21` only | DLMF Poisson summation |
| No `N`-dependent ruled-surface family is constructed | Stated as an open question in the Conclusion | None | None |

## Explicit non-claims

- No proof or computation of the Riemann hypothesis, no zero-location theorem,
  and no RH-workspace claim.
- No claim that every nonzero vector in `V5` satisfies one of the two scalar
  functional equations. A mixed vector satisfies neither; the equivalence is
  per fixed sign.
- No claim that the conductor-815 field, the CM recovery mechanism, or the
  Fourier/Poisson bridge is new in the literature. Classical inputs retain their
  citations; the novelty audit records the prior-art boundary.
- No Lean formalization claim. The exact checkers are Python/SymPy/mpmath
  computations with assertions enabled.
- No claim that finite numerical diagnostics establish an analytic theorem.
  They illustrate and cross-check the written arguments.

## Evidence locations

- `verification/CM_REPLAY_RESULTS.json`, `verification/replay_cm.py`
- `verification/DIRECTOR_CERTIFICATE.json`, `verification/baseline_square_certificate.py`
- `verification/DIRECTOR_LEMMA_RESULTS.json`, `verification/director_check_lemmas.py`
- `verification/DH_CONSTANT_CHECK.json`, `verification/check_dh_constant.py`
  (90-digit product, closed form, eigenline, nonmultiplicativity, mixed vector)
- `companion/data/figure_values.json`, `companion/data/figure_arrays.npz`
- `companion/verification/check_figure_data.py`, `companion/verification/check_body_data.py`
- `verification/LAYOUT_CHECK.json`, `verification/VISUAL_QA.json`
