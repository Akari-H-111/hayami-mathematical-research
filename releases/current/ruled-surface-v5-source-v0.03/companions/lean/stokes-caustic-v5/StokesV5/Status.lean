import StokesV5

#check StokesV5.observationMap_hasExplicitFDerivAt
#check StokesV5.observationJacobian_factorization
#check StokesV5.symmetry_isPlaneWhitneyFoldCriterionAt
#check StokesV5.rationalBranch_isPlaneWhitneyFoldCriterionAt
#check StokesV5.exceptional_not_isPlaneWhitneyFoldCriterionAt
#check StokesV5.symmetry_hasWhitneyNormalFormAt
#check StokesV5.rationalBranch_hasWhitneyNormalFormAt
#check StokesV5.physical_critical_point_normalForm
#check StokesV5.discriminant_contact_cubic_error
#check StokesV5.radialImage_third_boundary_max
#check StokesV5.radialCurve_hasDerivAt_zero
#check StokesV5.exceptional_not_hasWhitneyNormalFormAt
#check StokesV5.full_physical_discriminant
#check StokesV5.exceptional_ordinary_four_jet
#check StokesV5.exceptional_four_jet_rescaling
#check StokesV5.sturm_variations_q17
#check StokesV5.chiralityPolynomial_irreducible_rational
#check StokesV5.auxiliaryThird_boundary_max
#check StokesV5.exists_unique_skeleton_intersection

/-!
# Formalization status

All declarations imported by this module are proved without `sorry`.  Besides
the exact rational polynomial algebra, it formalizes real root barriers using
positive Bernstein expansions: the isolating interval contains exactly one
zero of `pBR`, while `R7`, `B`, and `Q17` have the required fixed signs.
It also formalizes the explicit observation derivative, its Jacobian
factorization, and the plane-to-plane Whitney-fold Jacobian criterion on both
ordinary branches.  The working extension constructs smooth two-sided local
source and target charts conjugating both branches to `(x, y^2)`, classifies
physical critical points away from the exceptional intersection, and proves
the discriminant's cubic contact error and the actual radial image's endpoints,
regular initial derivative, and strict third-coordinate monotonicity.
It also formalizes the displayed Taylor/Big-O remainders, exceptional ordinary
four-jet and rescaling, auxiliary-curve maximum and irreducible quintic,
fixed Sturm variation data, and exact rational numerical enclosures.
It does not formalize the open full exceptional-germ classification,
a general Sturm theorem, or physical interpretations.
The published criterion-level v0.03 archive is unchanged.
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

example {u : ℝ} (hu : 0 < u) :
    HasWhitneyNormalFormAt observationMap (0, u) :=
  symmetry_hasWhitneyNormalFormAt hu

example {t u : ℝ} (ht : t ∈ Set.Ioo (-(Real.pi / 2)) (Real.pi / 2))
    (hu0 : 0 ≤ u) (hu1 : u ≤ 1) (hJ : mapJacobian observationMap (t, u) = 0) :
    (t, u) = (0, 0) ∨ HasWhitneyNormalFormAt observationMap (t, u) :=
  physical_critical_point_normalForm ht hu0 hu1 hJ

end StokesV5
