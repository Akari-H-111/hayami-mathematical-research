import StokesV5.ExceptionalJet

namespace StokesV5
noncomputable section
open Filter Asymptotics
open scoped Topology

def ordinaryRadius (z : ℝ × ℝ) : ℝ := |z.1| + |z.2|

theorem ordinary_coordinates_bigO :
    (Prod.fst : ℝ × ℝ → ℝ) =O[nhds 0] ordinaryRadius ∧
      (Prod.snd : ℝ × ℝ → ℝ) =O[nhds 0] ordinaryRadius := by
  constructor <;> apply isBigO_iff.mpr <;>
    refine ⟨1, Eventually.of_forall fun z => ?_⟩ <;>
    simp only [Real.norm_eq_abs, one_mul, ordinaryRadius]
  · rw [abs_of_nonneg (add_nonneg (abs_nonneg z.1) (abs_nonneg z.2))]
    linarith [abs_nonneg z.2]
  · rw [abs_of_nonneg (add_nonneg (abs_nonneg z.1) (abs_nonneg z.2))]
    linarith [abs_nonneg z.1]

def exceptionalJetError (z : ℝ × ℝ) : ℝ := observationN (exceptionalSourceInverse z) +
  z.1 * z.2 ^ 2 - (3 / 4 : ℝ) * z.2 ^ 4
def exceptionalJetSlope (t : ℝ) : ℝ := t ^ 2 - 2 * deltaT t / phaseCoeff (Real.cos t)

theorem exceptionalJetError_affine_x (z : ℝ × ℝ) :
    exceptionalJetError z = exceptionalJetError (0, z.2) + z.1 * exceptionalJetSlope z.2 := by
  dsimp [exceptionalJetError, exceptionalSourceInverse, exceptionalInverseU,
    exceptionalJetSlope, observationN, deltaT]
  ring

theorem exceptionalJetSlope_bigO : exceptionalJetSlope =O[nhds 0] (fun t => t ^ 4) := by
  have hp : ContinuousAt (fun t : ℝ => (phaseCoeff (Real.cos t))⁻¹) 0 := by
    have h := phaseCoeff_contDiffAt_one.continuousAt.comp_of_eq Real.continuous_cos.continuousAt
      Real.cos_zero
    exact h.inv₀ (by norm_num [phaseCoeff, qC])
  have hn : ∀ᶠ t : ℝ in nhds 0, phaseCoeff (Real.cos t) ≠ 0 := by
    have hc := phaseCoeff_contDiffAt_one.continuousAt.eventually_ne
      (show phaseCoeff 1 ≠ (0 : ℝ) by norm_num [phaseCoeff, qC])
    exact hc.filter_mono cos_tendsto_one
  have h1 := cos_taylor_quartic.const_mul_left (-2)
  have h2 : (fun t : ℝ => 2 * deltaT t * (phaseCoeff (Real.cos t) - 1) *
      (phaseCoeff (Real.cos t))⁻¹) =O[nhds 0] (fun t => t ^ 4) := by
    apply (((delta_bigO_sq.const_mul_left 2).mul phaseCoeff_t_expansion).mul hp.isBigO).congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun t => by ring
  apply (h1.add h2).congr'
  · filter_upwards [hn] with t ht
    dsimp [exceptionalJetSlope]
    field_simp [ht]
    ring
  · exact Eventually.of_forall fun _ => rfl

/-- Ordinary total-degree four-jet: the error has total order at least five. -/
theorem exceptional_ordinary_four_jet :
    exceptionalJetError =O[nhds (0 : ℝ × ℝ)] (fun z => ordinaryRadius z ^ 5) := by
  have ht : Tendsto (fun t : ℝ => ((0 : ℝ), t)) (nhds 0) (nhds 0) :=
    (continuousAt_const.prodMk continuousAt_id).tendsto
  have h0 : (fun t : ℝ => exceptionalJetError (0, t)) =O[nhds 0] (fun t => t ^ 6) := by
    have h := exceptional_coordinate_jet.comp_tendsto ht
    apply h.congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun t => by
        simp only [Function.comp_def, coordinateWeight, weightedRadius, abs_zero, Real.sqrt_zero, add_zero]
        rw [← abs_pow, abs_of_nonneg (by positivity)]
  have hy : Tendsto (Prod.snd : ℝ × ℝ → ℝ) (nhds 0) (nhds 0) := continuousAt_snd
  have hr : Tendsto ordinaryRadius (nhds (0 : ℝ × ℝ)) (nhds 0) := by
    have h : ContinuousAt ordinaryRadius 0 := by unfold ordinaryRadius; fun_prop
    simpa [ordinaryRadius] using h.tendsto
  have h6 := (h0.comp_tendsto hy).trans (ordinary_coordinates_bigO.2.pow 6)
  have h5 := h6.trans ((pow_bigO_zero (by norm_num : 5 ≤ 6)).comp_tendsto hr)
  have hprod := ordinary_coordinates_bigO.1.mul
    ((exceptionalJetSlope_bigO.comp_tendsto hy).trans (ordinary_coordinates_bigO.2.pow 4))
  have h1 : (fun z : ℝ × ℝ => z.1 * exceptionalJetSlope z.2) =O[nhds 0]
      (fun z => ordinaryRadius z ^ 5) := by
    apply hprod.congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun z => by ring
  apply (h5.add h1).congr'
  · exact Eventually.of_forall fun z => (exceptionalJetError_affine_x z).symm
  · exact Eventually.of_forall fun _ => rfl

end
end StokesV5
