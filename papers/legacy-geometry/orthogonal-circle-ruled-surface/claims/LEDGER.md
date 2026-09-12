# Claim ledger: ruled surface v4

| PDF location | item | reconstruction status | verification target |
| --- | --- | --- | --- |
| p. 2, Defs. 1.1 and 1.3 | paired circles, `Q^2=c(2-c)`, and ruled parametrization | PDF-locked | included as the input data of the shared-core verifier |
| p. 3, Thm. 2.1 | `det(S_t,S_u,S_tu)=-(c^2-3c+1)s/Q` | CAS-passed on `Q!=0` | `shared/orthogonal_circle_surface/verify_shared_surface_core.py` |
| p. 4, Prop. 2.2 | the three first-fundamental-form coefficients and `1 <= G <= 5` | CAS-passed on `Q!=0` | same verifier |
| pp. 4--5 | global regularity classification in the displayed `t` chart | blocked | all displayed `t`-derivative formulas divide by `Q`, which vanishes at `t=+-pi/2`; reconstruct a boundary atlas or restrict the theorem to the interior |
| p. 5, Thm. 2.3 interior branch | the two lateral roots `c0=(3-sqrt(5))/2`, `u0=(sqrt(5)-1)/4` | CAS-passed on `Q!=0` | same verifier |
| p. 6, Rem. 3.1 | governing polynomial `P(c)=c^2-3c+1` | CAS-passed for the first two advertised occurrences | same verifier; observation-field occurrence remains pending |
| p. 7, Prop. 4.1 | rational phase skeleton | CAS-passed on `Q!=0` | `verification/verify_observation_field.py` |
| pp. 7--8, Thm. 4.2 | lateral dipole determinant and opposite indices | CAS-passed for the positive lateral point; parity remains a short reconstruction proof | same verifier |
| pp. 7--8, zero-set wording | two nondegenerate lateral zeros | clarified | `F` also vanishes at the polar singularity `(c,u)=(1,1)`, where its Jacobian is zero; it is a third degenerate zero |
| pp. 8--9, Thm. 4.3 | Jacobian factorization and triple-angle fold formula | CAS-passed on `Q!=0` | same verifier |
| p. 10, Thm. 4.4 | skeleton--fold intersection quintic | CAS-passed as an algebraic equivalence away from cancelled factors; exactly one root in `(0,1)` | same verifier |
| pp. 10--11, Lemma 5.1 | local Whitney-fold normal form | CAS-passed on the interior fold away from the stated asymptote | the missing kernel-transversality factor is a root-free seventh-degree polynomial on `(0,1)`; `verification/verify_observation_field.py` |
| pp. 11--12, Prop. 5.2 | local even-harmonic response under a fixed transverse cosine input | PDF-locked | an elementary asymptotic expansion; scope must retain fixed `xi != 0` and small-amplitude hypotheses |
| p. 12, Thm. 5.3 | arbitrary transverse crossing forces pseudo-recurrence and exact projected-signal equality | counterexample | `verification/verify_signal_claim_counterexample.py`; a transverse crossing does not force equal `xi`, and an external rotation also needs phase locking |

The page-pinned inventory is complete for the numbered results in this 13-page paper. Do not mark an item `re-derived` merely because it appears in legacy TeX.
