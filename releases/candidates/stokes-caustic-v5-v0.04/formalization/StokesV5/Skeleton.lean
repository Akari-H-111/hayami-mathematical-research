import StokesV5.NumericalBounds

namespace StokesV5
noncomputable section
open Polynomial
open scoped Topology

def skeletonEPoly : Polynomial ℝ := X ^ 5 - 3 * X ^ 4 + 5 * X ^ 3 - 6 * X ^ 2 + X + 1

theorem skeletonEPoly_eval (c : ℝ) : skeletonEPoly.eval c = discriminantE c := by
  simp [skeletonEPoly, discriminantE]

theorem discriminantE_hasDerivAt (c : ℝ) :
    HasDerivAt discriminantE (5 * c ^ 4 - 12 * c ^ 3 + 15 * c ^ 2 - 12 * c + 1) c := by
  have h := skeletonEPoly.hasDerivAt c
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun x => (skeletonEPoly_eval x).symm)).congr_deriv
  simp [skeletonEPoly, Polynomial.derivative_pow]; ring

theorem discriminantE_deriv_neg {c : ℝ} (hc : c ∈ Set.Icc (3 / 5 : ℝ) 1) :
    deriv discriminantE c < 0 := by
  let x : ℝ := (5 * c - 3) / 2
  have hx0 : 0 ≤ x := by dsimp [x]; linarith [hc.1]
  have hx1 : x ≤ 1 := by dsimp [x]; linarith [hc.2]
  let K : ℝ := (343 / 125 : ℝ) * (1 - x) ^ 4 + (1504 / 125 : ℝ) * x * (1 - x) ^ 3 +
    (474 / 25 : ℝ) * x ^ 2 * (1 - x) ^ 2 + (64 / 5 : ℝ) * x ^ 3 * (1 - x) + 3 * x ^ 4
  have hK : 0 < K := by
    by_cases hx : x = 1
    · norm_num [K, hx]
    · have hxt : x < 1 := lt_of_le_of_ne hx1 hx
      have hxp : 0 < 1 - x := by linarith
      have hfirst : 0 < (343 / 125 : ℝ) * (1 - x) ^ 4 := by positivity
      have hrest : 0 ≤ (1504 / 125 : ℝ) * x * (1 - x) ^ 3 +
          (474 / 25 : ℝ) * x ^ 2 * (1 - x) ^ 2 + (64 / 5 : ℝ) * x ^ 3 * (1 - x) + 3 * x ^ 4 := by
        positivity
      dsimp [K]; linarith
  have he : -(5 * c ^ 4 - 12 * c ^ 3 + 15 * c ^ 2 - 12 * c + 1) = K := by
    dsimp [K, x]; ring
  rw [(discriminantE_hasDerivAt c).deriv]
  linarith

theorem discriminantE_strictAntiOn_physical : StrictAntiOn discriminantE (Set.Icc physicalBoundary 1) := by
  apply strictAntiOn_of_deriv_neg (convex_Icc _ _)
  · exact skeletonEPoly.continuous.continuousOn.congr (fun c _ => (skeletonEPoly_eval c).symm)
  · intro c hc
    have hc' : physicalBoundary < c ∧ c < 1 := by simpa using hc
    exact discriminantE_deriv_neg ⟨by linarith [physicalBoundary_spec.1], le_of_lt hc'.2⟩

theorem exists_unique_skeleton_intersection :
    ∃! c : ℝ, (673741 : ℝ) / 10 ^ 6 ≤ c ∧ c ≤ (673742 : ℝ) / 10 ^ 6 ∧
      discriminantE c = 0 := by
  have hl : 0 < discriminantE ((673741 : ℝ) / 10 ^ 6) := by norm_num [discriminantE]
  have hh : discriminantE ((673742 : ℝ) / 10 ^ 6) < 0 := by norm_num [discriminantE]
  have hcont : Continuous discriminantE := by unfold discriminantE; fun_prop
  obtain ⟨c, hc, hz⟩ := intermediate_value_Icc' (by norm_num : (673741 : ℝ) / 10 ^ 6 ≤ 673742 / 10 ^ 6)
    hcont.continuousOn
    (show (0 : ℝ) ∈ Set.Icc (discriminantE (673742 / 10 ^ 6)) (discriminantE (673741 / 10 ^ 6))
      by constructor <;> linarith)
  refine ⟨c, ⟨hc.1, hc.2, hz⟩, ?_⟩
  intro d hd
  exact discriminantE_strictAntiOn_physical.injOn
    (by constructor <;> linarith [hd.1, hd.2.1, physicalBoundary_spec.2.1])
    (by constructor <;> linarith [hc.1, hc.2, physicalBoundary_spec.2.1]) (hd.2.2.trans hz.symm)

theorem skeleton_fold_intersection_iff {c : ℝ} (hc : c ∈ Set.Icc physicalBoundary 1) :
    foldM c = 0 ↔ discriminantE c = 0 := by
  have hcp : 0 < c := by linarith [hc.1, physicalBoundary_spec.1]
  have hq := mul_pos hcp (show 0 < 2 - c by linarith [hc.2])
  have hB := ne_of_lt (BR_neg_on_physical (le_trans physicalBoundary_spec.1 hc.1) hc.2)
  rw [foldM_qC_expression hq hB, div_eq_zero_iff, mul_eq_zero]
  simp [hB, ne_of_gt (Real.sqrt_pos.mpr hq), qC]

end
end StokesV5
