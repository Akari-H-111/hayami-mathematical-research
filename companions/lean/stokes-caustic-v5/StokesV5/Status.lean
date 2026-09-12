import StokesV5

#check StokesV5.observationMap_hasFDerivAt

/-!
# Formalization status

All declarations imported by this module are proved without `sorry`.  Besides
the exact rational polynomial algebra, it formalizes real root barriers using
positive Bernstein expansions: the isolating interval contains exactly one
zero of `pBR`, while `R7`, `B`, and `Q17` have the required fixed signs.
It does not formalize a general Sturm theorem, differentiability of the `Q`
chart, or the external Whitney fold recognition theorem.
-/

namespace StokesV5

example (c : ℚ) : pB c = nFold c - B c := pB_eq_nFold_sub_B c

example (c : ℚ) : (2 - c) ^ 2 + c * (2 - c) = 2 * (2 - c) :=
  radial_endpoint_norm_identity c

example : ∃! c : ℝ, (613 : ℝ) / 1000 ≤ c ∧ c ≤ (614 : ℝ) / 1000 ∧ pBR c = 0 :=
  exists_unique_pBR_zero_in_isolating_interval

end StokesV5
