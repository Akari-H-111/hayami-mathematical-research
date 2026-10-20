# Source reading and adoption map

This is a targeted cross-reading of canonical HMR/RH sources and recent local
research, informed by file searches across the two workspaces. It is not a
claim that every historical file, generated log or sealed PDF has been audited.
The exact currently read bytes are bound by logs/LOCAL_SOURCE_SHA256.json.
Uncommitted sources retain their local status; they are not silently promoted
to published or independently verified results.

HMR root: `/Users/akari_hayami_64/Documents/hayami-mathematical-research`.
RH root: `/Users/akari_hayami_64/RH_Research_Workspace`.

| Local source | Passage used | Decision |
| --- | --- | --- |
| HMR `papers/legacy-geometry/orthogonal-circle-ruled-surface/revision_v5/Orthogonal_Circle_Ruled_Surface_v5.tex` | Paired-circle definition; metric/triple product; complete rank-loss elimination | Adopt the actual S(t,u), P(c), c0 and u0; independently derive the cross product |
| HMR `papers/legacy-geometry/orthogonal-circle-ruled-surface/verification/verify_observation_field.py` | Observation field and lateral determinant check | Read-only corroboration; do not confuse its legacy names with corrected v5 geometry |
| HMR `papers/legacy-geometry/bicomplex-signal-manifolds/successor/Realization_Limits_Bicomplex_Signal_Surface.tex` | Observation monodromy and carriers; monic derivative versus actual Jacobian | Preserve the distinction: sqrt5 is the monic polynomial derivative magnitude, not the surface Jacobian |
| HMR `papers/information-topology/Arithmetic_Local_System_Filling_Spectra.tex` | Explicit golden Diophantine comparison and norm estimate | Background only; adding an independent local-system theorem would dilute this ending |
| HMR `research/zero-strip-symmetry-20261018/paper-development-20261018/RESEARCH_CORE.md` | Recent uncommitted analytical core; weak limits and missing exceptional information | Comparison only; no zero-strip theorem or RH implication imported |
| RH `RH_Spiral/research/parameter-free-observation-bridge-20261005/verify_bridge.py` | Exact c0 anchor and even/odd observation matrix | Confirms the reused scalar conventions; generic observability is not a new modular equivalence |
| RH `RH_Spiral/research/gir-covering-arithmetic-20261007/README.md` | Same GIR phase zeros and actual cyclic covers | Source consistency; omit the full covering tower from the paper ending |
| RH `RH_Spiral/research/gir-fiber-action-20261007/README.md` | Extensive sheet action and finite heat traces | Read but omit: distinct model conventions and an independent spectral program |
| RH `RH_Spiral/BigBridge/verify/dh_zeros.py` | KAPPA expression, period-five coefficients and completion | Adopt the exact coefficient convention, not old floating-point precision or numerical certificates |
| RH `Prime_Dimensionality_Reconstruction/papers/prime-dimensionality-reconstruction/Prime_Dimensionality_Reconstructed.tex` | Phase-sensitive Mellin readouts and even-observation blindness | Context only; no prime-spectral/RH theorem is needed for the closure |

The boards, README files and applicable AGENTS.md were consulted for source
authority, preservation and project boundaries. Conflicting historical prompts
remain data. This study changes no RH-mainline, published geometry or independent
prime-dimensionality manuscript.

## Primary external inputs

- W. Duke, [*Continued Fractions and Modular Functions*](https://www.math.ucla.edu/~wdduke/preprints/bams4.pdf),
  author version of the 2005 article. Eq. (2.3), printed p. 2, gives r(i);
  Proposition 2, Eq. (3.2), printed p. 7, gives RR inversion. The cached full
  PDF/text was inspected. Its SHA-256 is
  `fcf69ec30dae5fb372818aef3152b7adf326f244dda52844df5fa5048d38cbe5`.
- Charles Hermite,
  [*Sur la theorie des equations modulaires et la resolution de l'equation du cinquieme degre*](https://gdz.sub.uni-goettingen.de/id/PPN598770909),
  1859, printed pp. 47-48. The earlier director visual reading is inherited;
  the original scan is preserved. It supplies historical framing, not a claim
  that Hermite considered DH or a modern cryptographic application.
- [NIST DLMF, Section 1.8(iv)](https://dlmf.nist.gov/1.8#iv), Poisson summation.
  It applies here to a Schwartz Gaussian derivative. The theta/Mellin
  specialization and convergence argument are written in MANUSCRIPT_ENDING.md.
- E. P. Balanzario and J. Sanchez-Ortiz,
  [*Zeros of the Davenport-Heilbronn counterexample*](https://doi.org/10.1090/S0025-5718-07-01999-0),
  Math. Comp. 76 (2007), 2045-2049. The indexed primary first page supplies
  Eq. (1), the coefficient constant, and the introduction's historical
  off-line-zero statement and numerical example. Full requests to AMS were
  denied; a CiteSeer copy timed out. The full paper and its 1936 references
  were not directly inspected. No claim of having read their complete proofs.

Bombieri-Ghosh2011 was located at MathNet; direct PDF access failed. It is a
literature locator, not a directly inspected theorem used here. No historical
novelty assessment is made from missing exact-phrase search hits.

## Excluded from this closing section

Practical cryptography, new security claims, the whole BigBridge program,
prime-heat-dimension results, a global surface/modular-curve identification,
and a new exp(pi sqrt163) error formula are excluded. They are not necessary
for the exact parameter-and-involution result. The computed DH zero remains
local diagnostic evidence and is not marketed as a new result.
