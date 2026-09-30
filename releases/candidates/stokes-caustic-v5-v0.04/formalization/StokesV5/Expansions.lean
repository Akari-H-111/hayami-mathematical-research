import StokesV5.RadialGeometry
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Bounds
import Mathlib.Analysis.Asymptotics.Lemmas

namespace StokesV5
noncomputable section
open Filter Asymptotics
open scoped Topology ContDiff

def deltaT (t : ℝ) : ℝ := 1 - Real.cos t

theorem pow_bigO_zero {m n : ℕ} (h : n ≤ m) :
    (fun t : ℝ => t ^ m) =O[nhds 0] (fun t => t ^ n) := by
  obtain h | h := h.eq_or_lt
  · subst m
    exact isBigO_refl _ _
  · exact (isLittleO_pow_pow h).isBigO

theorem sin_bigO_id : Real.sin =O[nhds (0 : ℝ)] (fun t => t) := by
  apply isBigO_iff.mpr
  exact ⟨1, Eventually.of_forall fun t => by simpa using Real.abs_sin_le_abs (x := t)⟩

theorem sin_taylor_cubic :
    (fun t : ℝ => Real.sin t - t) =O[nhds 0] (fun t => t ^ 3) := by
  apply isBigO_iff.mpr
  refine ⟨1 / 6, Eventually.of_forall fun t => ?_⟩
  simpa [Real.norm_eq_abs, abs_sub_comm, abs_pow, div_eq_mul_inv, mul_comm]
    using Real.abs_sub_sin_le t

theorem delta_half_angle (t : ℝ) : deltaT t = 2 * Real.sin (t / 2) ^ 2 := by
  have h := Real.cos_two_mul (t / 2)
  rw [show 2 * (t / 2) = t by ring] at h
  have hs := Real.sin_sq_add_cos_sq (t / 2)
  unfold deltaT
  nlinarith

theorem cos_taylor_quartic :
    (fun t : ℝ => deltaT t - t ^ 2 / 2) =O[nhds 0] (fun t => t ^ 4) := by
  have ht : Tendsto (fun t : ℝ => t / 2) (nhds 0) (nhds 0) := by
    have h : ContinuousAt (fun t : ℝ => t / 2) 0 := by fun_prop
    simpa using h.tendsto
  have hh : (fun t : ℝ => t / 2) =O[nhds 0] (fun t => t) := by
    simpa [div_eq_mul_inv, mul_comm] using (isBigO_refl (fun t : ℝ => t) (nhds 0)).const_mul_left (2 : ℝ)⁻¹
  have he := (sin_taylor_cubic.comp_tendsto ht).trans (hh.pow 3)
  have hs := (sin_bigO_id.comp_tendsto ht).trans hh
  have h := (he.mul (hs.add hh)).const_mul_left 2
  apply h.congr'
  · exact Eventually.of_forall fun t => by
      change 2 * ((Real.sin (t / 2) - t / 2) * (Real.sin (t / 2) + t / 2)) = deltaT t - t ^ 2 / 2
      rw [delta_half_angle]
      ring
  · exact Eventually.of_forall fun t => by ring

theorem delta_bigO_sq : deltaT =O[nhds (0 : ℝ)] (fun t => t ^ 2) := by
  have he := cos_taylor_quartic.trans (pow_bigO_zero (m := 4) (n := 2) (by norm_num))
  have hp := (isBigO_refl (fun t : ℝ => t ^ 2) (nhds 0)).const_mul_left (1 / 2 : ℝ)
  apply (he.add hp).congr'
  · exact Eventually.of_forall fun t => by ring
  · exact Eventually.of_forall fun _ => rfl

theorem AB_delta_identities (d : ℝ) :
    AR (1 - d) = 2 * d - 3 * d ^ 3 + d ^ 5 ∧
    BR (1 - d) = -1 + 3 * d ^ 2 - d ^ 3 := by
  unfold AR BR
  constructor <;> ring

def uDeltaCoeff (c : ℝ) : ℝ := -(c ^ 2 + 2) / BR c
def nDeltaCoeff (c : ℝ) : ℝ := 2 * (c ^ 2 + 2) / BR c

theorem uFold_exact_delta {c : ℝ} (hB : BR c ≠ 0) :
    uFoldR c - 2 * (1 - c) = (1 - c) ^ 3 * uDeltaCoeff c := by
  unfold uFoldR uDeltaCoeff
  field_simp [hB]
  unfold AR BR
  ring

theorem foldN_exact_delta {c : ℝ} (hB : BR c ≠ 0) :
    foldN c + 3 * (1 - c) ^ 2 = (1 - c) ^ 4 * nDeltaCoeff c := by
  unfold foldN uFoldR nDeltaCoeff
  field_simp [hB]
  unfold AR BR
  ring

theorem near_one_chart : ∀ᶠ c : ℝ in nhds 1, 0 < c * (2 - c) ∧ BR c ≠ 0 := by
  have hq : ContinuousAt (fun c : ℝ => c * (2 - c)) 1 := by fun_prop
  have hb : ContinuousAt BR 1 := by unfold BR; fun_prop
  filter_upwards [hq.eventually (Ioi_mem_nhds (by norm_num : (0 : ℝ) < 1 * (2 - 1))),
    hb.eventually_ne (by norm_num [BR] : BR 1 ≠ 0)] with c hq hb
  exact ⟨hq, hb⟩

theorem uFold_delta_expansion :
    (fun c : ℝ => uFoldR c - 2 * (1 - c)) =O[nhds 1] (fun c => (1 - c) ^ 3) := by
  have hc : ContinuousAt uDeltaCoeff 1 := by unfold uDeltaCoeff BR; fun_prop (disch := norm_num)
  have h := (isBigO_refl (fun c : ℝ => (1 - c) ^ 3) (nhds 1)).mul hc.isBigO
  apply h.congr'
  · filter_upwards [near_one_chart] with c hc
    exact (uFold_exact_delta hc.2).symm
  · exact Eventually.of_forall fun c => by simp

theorem foldN_delta_expansion :
    (fun c : ℝ => foldN c + 3 * (1 - c) ^ 2) =O[nhds 1] (fun c => (1 - c) ^ 4) := by
  have hc : ContinuousAt nDeltaCoeff 1 := by unfold nDeltaCoeff BR; fun_prop (disch := norm_num)
  have h := (isBigO_refl (fun c : ℝ => (1 - c) ^ 4) (nhds 1)).mul hc.isBigO
  apply h.congr'
  · filter_upwards [near_one_chart] with c hc
    exact (foldN_exact_delta hc.2).symm
  · exact Eventually.of_forall fun c => by simp

def mDeltaCoeff (c : ℝ) : ℝ :=
  (((1 - c) ^ 4 - 2 * (1 - c) ^ 3 + 4 * (1 - c) ^ 2 - 12 * (1 - c) + 11) / 2 -
    (1 - c) * discriminantE c / (2 * (qC c + 1) ^ 2)) / BR c

theorem qC_exact_fourth {c : ℝ} (hq : 0 < c * (2 - c)) :
    qC c = 1 - (1 - c) ^ 2 / 2 - (1 - c) ^ 4 / (2 * (qC c + 1) ^ 2) := by
  have hqc : 0 ≤ qC c := Real.sqrt_nonneg _
  have hs : qC c + 1 ≠ 0 := ne_of_gt (by linarith)
  have hsq : qC c ^ 2 = c * (2 - c) := Real.sq_sqrt (le_of_lt hq)
  field_simp [hs]
  linear_combination (2 * qC c + 2 + (1 - c) ^ 2) * hsq

theorem foldM_exact_delta {c : ℝ} (hq : 0 < c * (2 - c)) (hB : BR c ≠ 0) :
    foldM c - (1 - 3 * (1 - c) + (3 / 2 : ℝ) * (1 - c) ^ 2) =
      (1 - c) ^ 3 * mDeltaCoeff c := by
  have hqc : 0 ≤ qC c := Real.sqrt_nonneg _
  have hs : qC c + 1 ≠ 0 := ne_of_gt (by linarith)
  rw [foldM_qC_expression hq hB]
  calc
    _ = (1 - (1 - c) ^ 2 / 2 - (1 - c) ^ 4 / (2 * (qC c + 1) ^ 2)) *
        discriminantE c / BR c - (1 - 3 * (1 - c) + (3 / 2 : ℝ) * (1 - c) ^ 2) :=
      congrArg (fun z : ℝ => z * discriminantE c / BR c -
        (1 - 3 * (1 - c) + (3 / 2 : ℝ) * (1 - c) ^ 2)) (qC_exact_fourth hq)
    _ = _ := by
      unfold mDeltaCoeff discriminantE
      field_simp [hs, hB]
      unfold BR
      ring

theorem foldM_delta_expansion :
    (fun c : ℝ => foldM c - (1 - 3 * (1 - c) + (3 / 2 : ℝ) * (1 - c) ^ 2))
      =O[nhds 1] (fun c => (1 - c) ^ 3) := by
  have hc : ContinuousAt mDeltaCoeff 1 := by
    have hq : Continuous qC := by unfold qC; fun_prop
    unfold mDeltaCoeff discriminantE BR
    fun_prop (disch := norm_num [qC])
  have h := (isBigO_refl (fun c : ℝ => (1 - c) ^ 3) (nhds 1)).mul hc.isBigO
  apply h.congr'
  · filter_upwards [near_one_chart] with c hc
    exact (foldM_exact_delta hc.1 hc.2).symm
  · exact Eventually.of_forall fun c => by simp

end
end StokesV5
