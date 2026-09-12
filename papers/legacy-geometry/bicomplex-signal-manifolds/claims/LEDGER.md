# Claim ledger: bicomplex signal manifolds v12

| PDF section | module | reconstruction status | verification target |
| --- | --- | --- | --- |
| pp. 4--6, Thms. 4.1--4.2 and Cor. 4.4 | interior dipole, square-root monodromy, and local degree | partially CAS-passed | shared observation-field verifier; topological lifting proof remains prose-level |
| pp. 7--8, Lemma 5.1 and Thms. 5.3, 5.6--5.7 | invariant derivative, sublevel exponent, explicit `A3` germ, and Milnor data | finite core CAS-passed | both local verifiers; holomorphic and compactification hypotheses remain visible |
| pp. 9--12, Props./Thms. 5.8--5.12 | figure-eight quotient, weighted orbit, action no-go, and actual cusp boundary | mixed | weighted algebra CAS-passed; link/cusp arguments remain proof-readable, category-specific claims |
| pp. 12--13, Props. 6.1--6.2 | governing invariant and three cross-cap germs | algebra partially CAS-passed | original `t`-boundary chart is not smooth at `Q=0`; any boundary germ needs an explicit replacement coordinate |
| pp. 14--16, Thm. 7.1 through Cor. 7.8 | formal Mellin adjoint, Gram, positivity, and conditioning | re-derived | `proofs/SPECTRAL_AUDIT.md`; no half-line self-adjointness inference |
| pp. 16--19, Props./Thms. 8.1--8.6 | Plancherel, Hardy, Bohr--Haar, and defect sheaf | external-dependency | definitions and cited hypotheses require specialist audit |
| pp. 20--37 | local metric/operator completions and scope limits | mixed | detailed table below |

## Page-pinned late-section inventory

| final PDF pages | claim | status after reconstruction |
| ---: | --- | --- |
| 20 | Prop. 8.8, polar Whitney fold | local Taylor algebra inherited from the observation verifier; smooth-extension scope remains explicit |
| 20--21 | Props. 8.9--8.10, source topology and exact Galerkin pullback | proof-readable; not a global convergence theorem |
| 21--23 | Props. 8.11--8.12, zero capacity and front/seam coercivity | metric, radial-defect, seam determinant, and Schur-complement formulas CAS-passed; analytic cutoff/coercivity arguments remain external-dependency |
| 23--25 | Prop. 8.13, Green parametrix and `U(2)` boundary space | displayed local algebra partly checked; parametrix, maximal-domain expansion, and deficiency indices require specialist analytic review |
| 25 | Prop. 8.14, Markov/no-running-scale selection | finite symplectic-plane argument proof-readable; Markov uniqueness depends on the capacity theorem |
| 26--27 | Thm. 8.15 and Cor. 8.16, Krein extension and buckling principle | external-dependency; no finite CAS check can certify compactness or operator domains |
| 28--29 | Thm. 8.18, normalization-to-Green obstruction | stalk/support and parity argument proof-readable; category and recollement conventions require sheaf-theoretic review |
| 30--31 | Prop. 8.20 and Thm. 8.21, phase-sign twist and front/seam spin parametrix | cone spectrum is elementary; actual Whitney-parametrix/domain-quotient claim remains external-dependency |
| 32 | Thm. 8.22, deck-phase `Z4` and Pin obstruction | exact kernel observation norm CAS-passed; torsor and Pin conclusions proof-readable but not formalized |
| 33--34 | Thm. 8.23, Green-derived full-spin interface action | boundary-form scalar algebra proof-readable; Dirac trace/domain hypotheses remain external-dependency |
| 35--36 | Props. 8.25, 8.27, 8.30 and Thm. 8.28 | symmetry/no-go statements proof-readable; `A3` genus, ends, Betti number, and monodromy spectrum CAS-passed; mixed-Hodge realization remains external-dependency |
| 36--37 | Props. 9.1, 9.3, 9.5 | scale claim is dimensional; Poisson bracket and eta spectral pairing CAS-passed |

No row marked `external-dependency` is publication-ready merely because its displayed algebra passes.
