import StokesV5.Expansions

namespace StokesV5
noncomputable section
open Filter Asymptotics
open scoped Topology ContDiff

theorem cos_tendsto_one : Tendsto Real.cos (nhds (0 : ℝ)) (nhds 1) := by
  simpa using Real.continuous_cos.continuousAt.tendsto (x := (0 : ℝ))

theorem uFold_t_expansion :
    (fun t : ℝ => uFoldR (Real.cos t) - t ^ 2) =O[nhds 0] (fun t => t ^ 4) := by
  have h := (uFold_delta_expansion.comp_tendsto cos_tendsto_one).trans (delta_bigO_sq.pow 3)
  have h6 : (fun t : ℝ => uFoldR (Real.cos t) - 2 * deltaT t) =O[nhds 0] (fun t => t ^ 6) := by
    apply h.congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun t => by ring
  have h4 := h6.trans (pow_bigO_zero (by norm_num : 4 ≤ 6))
  apply (h4.add (cos_taylor_quartic.const_mul_left 2)).congr'
  · exact Eventually.of_forall fun t => by ring
  · exact Eventually.of_forall fun _ => rfl

theorem uFold_t_bigO_sq :
    (fun t : ℝ => uFoldR (Real.cos t)) =O[nhds 0] (fun t => t ^ 2) := by
  have he := uFold_t_expansion.trans (pow_bigO_zero (by norm_num : 2 ≤ 4))
  apply (he.add (isBigO_refl (fun t : ℝ => t ^ 2) (nhds 0))).congr'
  · exact Eventually.of_forall fun t => by ring
  · exact Eventually.of_forall fun _ => rfl

theorem qC_exact_second {c : ℝ} (hq : 0 < c * (2 - c)) :
    qC c - 1 = -(1 - c) ^ 2 / (qC c + 1) := by
  have hnn : 0 ≤ qC c := Real.sqrt_nonneg _
  have hsq : qC c ^ 2 = c * (2 - c) := Real.sq_sqrt (le_of_lt hq)
  apply (eq_div_iff (ne_of_gt (by linarith : 0 < qC c + 1))).2
  nlinarith [hsq]

theorem qC_delta_expansion :
    (fun c : ℝ => qC c - 1) =O[nhds 1] (fun c => (1 - c) ^ 2) := by
  have hi : ContinuousAt (fun c : ℝ => -(qC c + 1)⁻¹) 1 := by
    have hq : Continuous qC := by unfold qC; fun_prop
    fun_prop (disch := norm_num [qC])
  have h := (isBigO_refl (fun c : ℝ => (1 - c) ^ 2) (nhds 1)).mul hi.isBigO
  apply h.congr'
  · filter_upwards [near_one_chart] with c hc
    rw [qC_exact_second hc.1]
    ring
  · exact Eventually.of_forall fun c => by simp

theorem qChart_t_expansion :
    (fun t : ℝ => qChart t - 1) =O[nhds 0] (fun t => t ^ 4) := by
  have h := (qC_delta_expansion.comp_tendsto cos_tendsto_one).trans (delta_bigO_sq.pow 2)
  apply h.congr'
  · exact Eventually.of_forall fun _ => rfl
  · exact Eventually.of_forall fun t => by ring

def radiusDeltaCoeff (c : ℝ) : ℝ :=
  c * (c - 2) * (c ^ 2 - 2 * c - 1) *
    (2 * c ^ 6 - 14 * c ^ 5 + 33 * c ^ 4 - 32 * c ^ 3 + 9 * c ^ 2 + 2 * c + 2) / BR c ^ 2

theorem radialRadiusSquared_exact_delta {c : ℝ}
    (hq : 0 < c * (2 - c)) (hB : BR c ≠ 0) :
    radialRadiusSquared c - 1 = (1 - c) ^ 2 * radiusDeltaCoeff c := by
  rw [radialRadiusSquared_eq hq hB]
  unfold radiusDeltaCoeff
  field_simp [hB]
  simp [radialRPoly, BR]
  ring

theorem radialRadiusSquared_delta_expansion :
    (fun c : ℝ => radialRadiusSquared c - 1) =O[nhds 1] (fun c => (1 - c) ^ 2) := by
  have hc : ContinuousAt radiusDeltaCoeff 1 := by
    unfold radiusDeltaCoeff BR
    fun_prop (disch := norm_num)
  have h := (isBigO_refl (fun c : ℝ => (1 - c) ^ 2) (nhds 1)).mul hc.isBigO
  apply h.congr'
  · filter_upwards [near_one_chart] with c hc
    exact (radialRadiusSquared_exact_delta hc.1 hc.2).symm
  · exact Eventually.of_forall fun c => by simp

theorem radialRadiusSquared_continuousAt_one : ContinuousAt radialRadiusSquared 1 := by
  have hq : Continuous qC := by unfold qC; fun_prop
  unfold radialRadiusSquared radialX radialZ uFoldR AR BR
  fun_prop (disch := norm_num)

theorem radialRadius_delta_expansion :
    (fun c : ℝ => radialRadius c - 1) =O[nhds 1] (fun c => (1 - c) ^ 2) := by
  have hc : ContinuousAt radialRadius 1 := radialRadiusSquared_continuousAt_one.sqrt
  have hr1 : radialRadius 1 = 1 := by
    norm_num [radialRadius, radialRadiusSquared, radialX, radialZ, uFoldR_at_one]
  have hi : ContinuousAt (fun c => (radialRadius c + 1)⁻¹) 1 :=
    (hc.add continuousAt_const).inv₀ (by change radialRadius 1 + 1 ≠ 0; rw [hr1]; norm_num)
  have hp : ∀ᶠ c in nhds (1 : ℝ), 0 < radialRadiusSquared c :=
    radialRadiusSquared_continuousAt_one.eventually
      (Ioi_mem_nhds (by norm_num [radialRadiusSquared, radialX, radialZ, uFoldR_at_one]))
  have h := radialRadiusSquared_delta_expansion.mul hi.isBigO
  apply h.congr'
  · filter_upwards [hp] with c hp
    have hsq : radialRadius c ^ 2 = radialRadiusSquared c := Real.sq_sqrt (le_of_lt hp)
    have hnn : 0 ≤ radialRadius c := Real.sqrt_nonneg _
    field_simp [show radialRadius c + 1 ≠ 0 by linarith]
    nlinarith [hsq]
  · exact Eventually.of_forall fun c => by simp

theorem curveRadius_t_expansion :
    (fun t : ℝ => curveRadius t - 1) =O[nhds 0] (fun t => t ^ 4) := by
  have h := (radialRadius_delta_expansion.comp_tendsto cos_tendsto_one).trans (delta_bigO_sq.pow 2)
  apply h.congr'
  · exact Eventually.of_forall fun t => by simpa using congrArg (fun x : ℝ => x - 1) (curveRadius_eq_radialRadius t).symm
  · exact Eventually.of_forall fun t => by ring

theorem curveRadius_continuousAt_zero : ContinuousAt curveRadius 0 := by
  have h := surfaceFold_hasDerivAt_zero.continuousAt
  exact ((h.fst.pow 2).add (h.snd.fst.pow 2) |>.add (h.snd.snd.pow 2)).sqrt

theorem curveRadius_at_zero : curveRadius 0 = 1 := by
  norm_num [curveRadius, surfaceFold_at_zero]

theorem inverse_curveRadius_t_expansion :
    (fun t : ℝ => (curveRadius t)⁻¹ - 1) =O[nhds 0] (fun t => t ^ 4) := by
  have hi := curveRadius_continuousAt_zero.inv₀ (by rw [curveRadius_at_zero]; norm_num)
  have hn : ∀ᶠ t : ℝ in nhds 0, curveRadius t ≠ 0 :=
    curveRadius_continuousAt_zero.eventually_ne (by rw [curveRadius_at_zero]; norm_num)
  have h := curveRadius_t_expansion.neg_left.mul hi.isBigO
  apply h.congr'
  · filter_upwards [hn] with t ht
    change -(curveRadius t - 1) * (curveRadius t)⁻¹ = (curveRadius t)⁻¹ - 1
    field_simp [ht]
    ring
  · exact Eventually.of_forall fun t => by simp

theorem surfaceFold_first_expansion :
    (fun t : ℝ => (surfaceFold t).1 - (1 - t ^ 2 / 2)) =O[nhds 0] (fun t => t ^ 4) := by
  have hprod := (uFold_t_bigO_sq.mul delta_bigO_sq).const_mul_left 2
  have hp : (fun t : ℝ => 2 * (uFoldR (Real.cos t) * deltaT t)) =O[nhds 0] (fun t => t ^ 4) := by
    apply hprod.congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun t => by ring
  apply (cos_taylor_quartic.neg_left.add hp).congr'
  · exact Eventually.of_forall fun t => by dsimp [surfaceFold, deltaT]; ring
  · exact Eventually.of_forall fun _ => rfl

theorem surfaceFold_second_expansion :
    (fun t : ℝ => (surfaceFold t).2.1 - t) =O[nhds 0] (fun t => t ^ 3) := by
  have hprod := uFold_t_bigO_sq.mul sin_bigO_id
  have hp : (fun t : ℝ => uFoldR (Real.cos t) * Real.sin t) =O[nhds 0] (fun t => t ^ 3) := by
    apply hprod.congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun t => by ring
  apply (sin_taylor_cubic.sub hp).congr'
  · exact Eventually.of_forall fun t => by dsimp [surfaceFold]; ring
  · exact Eventually.of_forall fun _ => rfl

theorem surfaceFold_third_expansion :
    (fun t : ℝ => (surfaceFold t).2.2 - t ^ 2) =O[nhds 0] (fun t => t ^ 4) := by
  have hq : ContinuousAt qChart 0 := by
    unfold qChart qSq
    fun_prop
  have h1 := uFold_t_expansion.mul hq.isBigO
  have h14 : (fun t : ℝ => (uFoldR (Real.cos t) - t ^ 2) * qChart t)
      =O[nhds 0] (fun t => t ^ 4) := by simpa using h1
  have h2 := (isBigO_refl (fun t : ℝ => t ^ 2) (nhds 0)).mul qChart_t_expansion
  have h26 : (fun t : ℝ => t ^ 2 * (qChart t - 1)) =O[nhds 0] (fun t => t ^ 6) := by
    apply h2.congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun t => by ring
  apply (h14.add (h26.trans (pow_bigO_zero (by norm_num : 4 ≤ 6)))).congr'
  · exact Eventually.of_forall fun t => by dsimp [surfaceFold]; ring
  · exact Eventually.of_forall fun _ => rfl

theorem radial_normalization_expansion {f p : ℝ → ℝ} {k : ℕ} (hk : k ≤ 4)
    (hf : (fun t => f t - p t) =O[nhds 0] (fun t => t ^ k)) (hp : ContinuousAt p 0) :
    (fun t => f t / curveRadius t - p t) =O[nhds 0] (fun t => t ^ k) := by
  have hi := curveRadius_continuousAt_zero.inv₀ (by rw [curveRadius_at_zero]; norm_num)
  have h1 : (fun t => (f t - p t) * (curveRadius t)⁻¹) =O[nhds 0] (fun t => t ^ k) :=
    by simpa using hf.mul hi.isBigO
  have herr := inverse_curveRadius_t_expansion.trans (pow_bigO_zero hk)
  have h2 : (fun t => p t * ((curveRadius t)⁻¹ - 1)) =O[nhds 0] (fun t => t ^ k) :=
    by simpa using hp.isBigO.mul herr
  apply (h1.add h2).congr'
  · exact Eventually.of_forall fun t => by simp only [div_eq_mul_inv]; ring
  · exact Eventually.of_forall fun _ => rfl

theorem radialCurve_first_expansion :
    (fun t : ℝ => (radialCurve t).1 - (1 - t ^ 2 / 2)) =O[nhds 0] (fun t => t ^ 4) :=
  radial_normalization_expansion (by norm_num) surfaceFold_first_expansion (by fun_prop)

theorem radialCurve_second_expansion :
    (fun t : ℝ => (radialCurve t).2.1 - t) =O[nhds 0] (fun t => t ^ 3) :=
  radial_normalization_expansion (by norm_num) surfaceFold_second_expansion continuousAt_id

theorem radialCurve_third_expansion :
    (fun t : ℝ => (radialCurve t).2.2 - t ^ 2) =O[nhds 0] (fun t => t ^ 4) :=
  radial_normalization_expansion (by norm_num) surfaceFold_third_expansion (by fun_prop)

end
end StokesV5
