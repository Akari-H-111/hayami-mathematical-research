import StokesV5.RadialExpansions

namespace StokesV5
noncomputable section
open Filter Asymptotics
open scoped Topology

theorem AR_t_expansion :
    (fun t : ℝ => AR (Real.cos t) - t ^ 2) =O[nhds 0] (fun t => t ^ 4) := by
  have hc : ContinuousAt (fun t : ℝ => -3 + deltaT t ^ 2) 0 := by
    unfold deltaT; fun_prop
  have h6 : (fun t : ℝ => deltaT t ^ 3 * (-3 + deltaT t ^ 2))
      =O[nhds 0] (fun t => t ^ 6) := by
    simpa [← pow_mul] using (delta_bigO_sq.pow 3).mul hc.isBigO
  apply ((cos_taylor_quartic.const_mul_left 2).add
    (h6.trans (pow_bigO_zero (by norm_num : 4 ≤ 6)))).congr'
  · exact Eventually.of_forall fun t => by
      have h := (AB_delta_identities (deltaT t)).1
      simp only [deltaT, sub_sub_cancel] at h
      dsimp [deltaT]; rw [h]; ring
  · exact Eventually.of_forall fun _ => rfl

theorem AR_t_bigO_sq :
    (fun t : ℝ => AR (Real.cos t)) =O[nhds 0] (fun t => t ^ 2) := by
  apply ((AR_t_expansion.trans (pow_bigO_zero (by norm_num : 2 ≤ 4))).add
    (isBigO_refl (fun t : ℝ => t ^ 2) (nhds 0))).congr'
  · exact Eventually.of_forall fun t => by ring
  · exact Eventually.of_forall fun _ => rfl

theorem BR_t_expansion :
    (fun t : ℝ => BR (Real.cos t) + 1) =O[nhds 0] (fun t => t ^ 4) := by
  have hc : ContinuousAt (fun t : ℝ => 3 - deltaT t) 0 := by
    unfold deltaT; fun_prop
  apply ((delta_bigO_sq.pow 2).mul hc.isBigO).congr'
  · exact Eventually.of_forall fun t => by
      have h := (AB_delta_identities (deltaT t)).2
      simp only [deltaT, sub_sub_cancel] at h
      dsimp [deltaT]; rw [h]; ring
  · exact Eventually.of_forall fun t => by simp [← pow_mul]

def inverseQCube (t : ℝ) : ℝ := (qChart t ^ 3)⁻¹

theorem inverseQCube_continuousAt_zero : ContinuousAt inverseQCube 0 := by
  unfold inverseQCube qChart qSq
  fun_prop (disch := norm_num)

theorem inverseQCube_expansion :
    (fun t : ℝ => inverseQCube t - 1) =O[nhds 0] (fun t => t ^ 4) := by
  have hc : ContinuousAt (fun t : ℝ =>
      (qChart t ^ 2 + qChart t + 1) * inverseQCube t) 0 := by
    have hq : ContinuousAt qChart 0 := by unfold qChart qSq; fun_prop
    exact ((hq.pow 2).add hq |>.add continuousAt_const).mul inverseQCube_continuousAt_zero
  have hn : ∀ᶠ t : ℝ in nhds 0, qChart t ≠ 0 := by
    have hq : ContinuousAt qChart 0 := by unfold qChart qSq; fun_prop
    exact hq.eventually_ne (by norm_num [qChart, qSq])
  apply (qChart_t_expansion.neg_left.mul hc.isBigO).congr'
  · filter_upwards [hn] with t ht
    dsimp [inverseQCube]
    field_simp [ht]
    ring
  · exact Eventually.of_forall fun t => by simp

def jacobianConstant (t : ℝ) : ℝ := -2 * Real.sin t * AR (Real.cos t) * inverseQCube t
def jacobianSlope (t : ℝ) : ℝ := -2 * Real.sin t * BR (Real.cos t) * inverseQCube t

theorem jacobianConstant_expansion :
    (fun t : ℝ => jacobianConstant t + 2 * t ^ 3) =O[nhds 0] (fun t => t ^ 5) := by
  have hi : inverseQCube =O[nhds 0] (fun _ => (1 : ℝ)) := inverseQCube_continuousAt_zero.isBigO
  have h1 : (fun t : ℝ => (Real.sin t - t) * AR (Real.cos t) * inverseQCube t)
      =O[nhds 0] (fun t => t ^ 5) := by
    apply ((sin_taylor_cubic.mul AR_t_bigO_sq).mul hi).congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun t => by ring
  have h2 : (fun t : ℝ => t * (AR (Real.cos t) - t ^ 2) * inverseQCube t)
      =O[nhds 0] (fun t => t ^ 5) := by
    apply (((isBigO_refl (fun t : ℝ => t) (nhds 0)).mul AR_t_expansion).mul hi).congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun t => by ring
  have h3 : (fun t : ℝ => t ^ 3 * (inverseQCube t - 1))
      =O[nhds 0] (fun t => t ^ 7) := by
    apply ((isBigO_refl (fun t : ℝ => t ^ 3) (nhds 0)).mul inverseQCube_expansion).congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun t => by ring
  apply (((h1.add h2).add (h3.trans (pow_bigO_zero (by norm_num : 5 ≤ 7)))).const_mul_left (-2)).congr'
  · exact Eventually.of_forall fun t => by dsimp [jacobianConstant]; ring
  · exact Eventually.of_forall fun _ => rfl

theorem jacobianSlope_expansion :
    (fun t : ℝ => jacobianSlope t - 2 * t) =O[nhds 0] (fun t => t ^ 3) := by
  have hi : inverseQCube =O[nhds 0] (fun _ => (1 : ℝ)) := inverseQCube_continuousAt_zero.isBigO
  have hb : ContinuousAt (fun t : ℝ => BR (Real.cos t)) 0 := by unfold BR; fun_prop
  have h1 : (fun t : ℝ => (Real.sin t - t) * BR (Real.cos t) * inverseQCube t)
      =O[nhds 0] (fun t => t ^ 3) := by
    simpa using (sin_taylor_cubic.mul hb.isBigO).mul hi
  have h2 : (fun t : ℝ => t * (BR (Real.cos t) + 1) * inverseQCube t)
      =O[nhds 0] (fun t => t ^ 5) := by
    apply (((isBigO_refl (fun t : ℝ => t) (nhds 0)).mul BR_t_expansion).mul hi).congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun t => by ring
  have h3 : (fun t : ℝ => t * (inverseQCube t - 1))
      =O[nhds 0] (fun t => t ^ 5) := by
    apply ((isBigO_refl (fun t : ℝ => t) (nhds 0)).mul inverseQCube_expansion).congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun t => by ring
  apply (((h1.add (h2.trans (pow_bigO_zero (by norm_num : 3 ≤ 5)))).sub
    (h3.trans (pow_bigO_zero (by norm_num : 3 ≤ 5)))).const_mul_left (-2)).congr'
  · exact Eventually.of_forall fun t => by dsimp [jacobianSlope]; ring
  · exact Eventually.of_forall fun _ => rfl

/-- The manuscript's two-variable error bound, not only a restriction to paths. -/
theorem exceptional_jacobian_expansion :
    (fun p : ℝ × ℝ => observationJacobian p - 2 * p.1 * (p.2 - p.1 ^ 2))
      =O[nhds 0] (fun p => |p.1| ^ 5 + |p.2| * |p.1| ^ 3) := by
  have ht : Tendsto (Prod.fst : ℝ × ℝ → ℝ) (nhds 0) (nhds 0) := continuousAt_fst
  have h0 := jacobianConstant_expansion.comp_tendsto ht
  have h1 := (isBigO_refl (Prod.snd : ℝ × ℝ → ℝ) (nhds 0)).mul
    (jacobianSlope_expansion.comp_tendsto ht)
  have hp : ∀ᶠ p : ℝ × ℝ in nhds 0, p ∈ observationDomain := by
    exact (near_one_chart.filter_mono (cos_tendsto_one.comp ht)).mono fun _ h => h.1
  apply (h0.add_add h1).congr'
  · filter_upwards [hp] with p hp
    rw [observationJacobian_factorization hp]
    dsimp [jacobianConstant, jacobianSlope, inverseQCube]
    simp only [div_eq_mul_inv]
    ring
  · exact Eventually.of_forall fun p => by simp [Real.norm_eq_abs, abs_mul, abs_pow]

end
end StokesV5
