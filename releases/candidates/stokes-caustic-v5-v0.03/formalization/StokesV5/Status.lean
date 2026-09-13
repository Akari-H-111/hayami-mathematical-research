import StokesV5

#check StokesV5.observationMap_hasExplicitFDerivAt
#check StokesV5.observationJacobian_factorization
#check StokesV5.symmetry_isPlaneWhitneyFoldCriterionAt
#check StokesV5.rationalBranch_isPlaneWhitneyFoldCriterionAt
#check StokesV5.exceptional_not_isPlaneWhitneyFoldCriterionAt

/-!
# Formalization status

All declarations imported by this module are proved without `sorry`.  Besides
the exact rational polynomial algebra, it formalizes real root barriers using
positive Bernstein expansions: the isolating interval contains exactly one
zero of `pBR`, while `R7`, `B`, and `Q17` have the required fixed signs.
It also formalizes the explicit observation derivative, its Jacobian
factorization, and the plane-to-plane Whitney-fold Jacobian criterion on both
ordinary branches.  It does not formalize a general Sturm theorem or construct
the local coordinate equivalence with `(x, y^2)`.
-/

namespace StokesV5

example (c : ℚ) : pB c = nFold c - B c := pB_eq_nFold_sub_B c

example (c : ℚ) : (2 - c) ^ 2 + c * (2 - c) = 2 * (2 - c) :=
  radial_endpoint_norm_identity c

example : ∃! c : ℝ, (613 : ℝ) / 1000 ≤ c ∧ c ≤ (614 : ℝ) / 1000 ∧ pBR c = 0 :=
  exists_unique_pBR_zero_in_isolating_interval

example {u : ℝ} (hu : 0 < u) :
    IsPlaneWhitneyFoldCriterionAt observationMap (0, u) :=
  symmetry_isPlaneWhitneyFoldCriterionAt hu

end StokesV5
