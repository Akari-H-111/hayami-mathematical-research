import Bicomplex.Spectral
import Mathlib.Analysis.SpecialFunctions.Log.Deriv

namespace Bicomplex
noncomputable section
open MeasureTheory Filter
open scoped Topology

def windowKernel (δ L : ℝ) : ℂ :=
  (L : ℂ)⁻¹ * ∫ τ in (0 : ℝ)..L, Complex.exp ((-δ : ℂ)*Complex.I*τ)

def logarithmicPhasor (δ x : ℝ) : ℂ := Complex.exp ((-δ : ℂ)*Complex.I*(Real.log x))

theorem window_kernel_zero {L : ℝ} (hL : L ≠ 0) : windowKernel 0 L = 1 := by
  simp [windowKernel, hL]

theorem window_kernel_bound {δ L : ℝ} (hδ : δ ≠ 0) (hL : 0 < L) :
    ‖windowKernel δ L‖ ≤ 2/(|δ| * L) := by
  have h := gram_entry_bound (ω := -δ) (ν := 0) hL (by simpa using hδ)
  simpa [phasorGram, windowKernel, mul_comm] using h

theorem window_kernel_formula {δ L : ℝ} (hδ : δ ≠ 0) :
    windowKernel δ L = (L : ℂ)⁻¹ *
      ((Complex.exp ((-δ : ℂ)*Complex.I*L)-1)/((-δ : ℂ)*Complex.I)) := by
  have h := gram_entry_integral (T := L) (ω := -δ) (ν := 0) (by simpa using hδ)
  simpa [phasorGram, windowKernel] using h

private theorem log_exp_integral {c : ℂ} (hc : c ≠ 0) {T : ℝ} (hT : 1 < T) :
    (∫ x in (1 : ℝ)..T, Complex.exp (c*(Real.log x)) / (x : ℂ)) =
      (Complex.exp (c*(Real.log T))-1)/c := by
  have hx (x : ℝ) (hx : x ∈ Set.uIcc 1 T) : 0 < x := by
    rw [Set.uIcc_of_le hT.le] at hx
    linarith [hx.1]
  have hd (x : ℝ) (hx' : x ∈ Set.uIcc 1 T) :
      HasDerivAt (fun x : ℝ => Complex.exp (c*(Real.log x))/c)
        (Complex.exp (c*(Real.log x))/(x : ℂ)) x := by
    have h := (((Real.hasDerivAt_log (hx x hx').ne').ofReal_comp.const_mul c).cexp).div_const c
    apply h.congr_deriv
    push_cast
    field_simp [hc]
    <;> ring
  have hint : IntervalIntegrable
      (fun x : ℝ => Complex.exp (c*(Real.log x))/(x : ℂ)) volume 1 T := by
    apply ContinuousOn.intervalIntegrable
    intro x hx'
    exact (((Real.hasDerivAt_log (hx x hx').ne').ofReal_comp.const_mul c).cexp.continuousAt.div
      (Complex.continuous_ofReal.continuousAt) (by exact_mod_cast (hx x hx').ne')).continuousWithinAt
  simpa [sub_div] using intervalIntegral.integral_eq_sub_of_hasDerivAt hd hint

theorem logarithmic_window_identity {δ T : ℝ} (hδ : δ ≠ 0) (hT : 1 < T) :
    (Real.log T : ℂ)⁻¹ * (∫ x in (1 : ℝ)..T, logarithmicPhasor δ x / (x : ℂ)) =
      windowKernel δ (Real.log T) := by
  rw [window_kernel_formula hδ]
  congr 1
  exact log_exp_integral (mul_ne_zero (by exact_mod_cast neg_ne_zero.mpr hδ) Complex.I_ne_zero) hT

theorem logarithmic_window_zero {T : ℝ} (hT : 1 < T) :
    (Real.log T : ℂ)⁻¹ * (∫ x in (1 : ℝ)..T, logarithmicPhasor 0 x / (x : ℂ)) =
      windowKernel 0 (Real.log T) := by
  have hlog : Real.log T ≠ 0 := ne_of_gt (Real.log_pos hT)
  rw [window_kernel_zero hlog]
  simp only [logarithmicPhasor, neg_zero, Complex.ofReal_zero, zero_mul, Complex.exp_zero,
    one_div]
  simp_rw [← Complex.ofReal_inv]
  rw [intervalIntegral.integral_ofReal, integral_inv_of_pos (by norm_num) (by linarith), div_one]
  simp [hlog]

theorem lebesgue_logarithmic_window {δ T : ℝ} (hT : 1 < T) :
    (∫ x in (1 : ℝ)..T, logarithmicPhasor δ x) / (T-1 : ℂ) =
      (Complex.exp ((1-(δ : ℂ)*Complex.I)*(Real.log T))-1) /
        ((1-(δ : ℂ)*Complex.I)*(T-1)) := by
  let c : ℂ := 1-(δ : ℂ)*Complex.I
  have hc : c ≠ 0 := by
    intro h
    have := congrArg Complex.re h
    norm_num [c, Complex.mul_re] at this
  have hx (x : ℝ) (hx : x ∈ Set.uIcc 1 T) : 0 < x := by
    rw [Set.uIcc_of_le hT.le] at hx
    linarith [hx.1]
  have he (x : ℝ) (hx : 0 < x) :
      Complex.exp (c*(Real.log x)) = (x : ℂ)*logarithmicPhasor δ x := by
    rw [show c*(Real.log x : ℂ) = (Real.log x : ℂ) + (-δ : ℂ)*Complex.I*(Real.log x) by
      dsimp [c]; ring, Complex.exp_add]
    simp [logarithmicPhasor, ← Complex.ofReal_exp, Real.exp_log hx]
  have hd (x : ℝ) (hx' : x ∈ Set.uIcc 1 T) :
      HasDerivAt (fun x : ℝ => Complex.exp (c*(Real.log x))/c) (logarithmicPhasor δ x) x := by
    have h := (((Real.hasDerivAt_log (hx x hx').ne').ofReal_comp.const_mul c).cexp).div_const c
    apply h.congr_deriv
    rw [he x (hx x hx')]
    push_cast
    field_simp [hc, (show (x : ℂ) ≠ 0 by exact_mod_cast (hx x hx').ne')]
    <;> ring
  have hint : IntervalIntegrable (logarithmicPhasor δ) volume 1 T := by
    apply ContinuousOn.intervalIntegrable
    intro x hx'
    exact (((Real.hasDerivAt_log (hx x hx').ne').ofReal_comp.const_mul
      ((-δ : ℂ)*Complex.I)).cexp.continuousAt).continuousWithinAt
  have h := intervalIntegral.integral_eq_sub_of_hasDerivAt hd hint
  rw [h]
  simp only [Real.log_one, Complex.ofReal_zero, mul_zero, Complex.exp_zero]
  dsimp [c]
  rw [← sub_div, div_div]

/-- The missing zero-frequency hypothesis in the printed decay bound is essential. -/
theorem window_zero_frequency_counterexample :
    ¬ ‖windowKernel 0 1‖ ≤ 2/(|(0 : ℝ)| * 1) := by
  norm_num [window_kernel_zero (by norm_num : (1 : ℝ) ≠ 0)]

theorem lebesgue_window_modulus_limit (δ : ℝ) :
    Tendsto (fun T : ℝ => ‖(∫ x in (1 : ℝ)..T, logarithmicPhasor δ x) / (T-1 : ℂ)‖)
      atTop (𝓝 ((Real.sqrt (1+δ^2))⁻¹)) := by
  let A : ℝ → ℂ := fun T => Complex.exp ((1-(δ : ℂ)*Complex.I)*(Real.log T))
  have hnorm (T : ℝ) (hT : 1 < T) : ‖A T‖ = T := by
    simp [A, Complex.norm_exp, Complex.mul_re, Complex.mul_im, Real.exp_log (by linarith : 0 < T)]
  have hbounds (T : ℝ) (hT : 1 < T) :
      1 ≤ ‖(A T-1)/(T-1 : ℂ)‖ ∧ ‖(A T-1)/(T-1 : ℂ)‖ ≤ 1+2/(T-1) := by
    have hlo := norm_sub_norm_le (A T) (1 : ℂ)
    have hhi := norm_sub_le (A T) (1 : ℂ)
    rw [hnorm T hT] at hlo hhi
    norm_num only [norm_one] at hlo hhi
    have hnT : ‖(T-1 : ℂ)‖ = T-1 := by
      calc
        _ = ‖((T-1 : ℝ) : ℂ)‖ := by congr 1; push_cast; rfl
        _ = T-1 := by rw [Complex.norm_real, Real.norm_eq_abs, abs_of_pos (sub_pos.mpr hT)]
    simp only [norm_div, hnT]
    constructor
    · exact (le_div_iff₀ (sub_pos.mpr hT)).mpr (by linarith)
    · apply (div_le_iff₀ (sub_pos.mpr hT)).mpr
      have he : (1+2/(T-1))*(T-1) = T+1 := by
        field_simp [show T-1 ≠ 0 by linarith]
        <;> ring
      nlinarith
  have hinv : Tendsto (fun T : ℝ => (T-1)⁻¹) atTop (𝓝 0) := by
    apply tendsto_inv_atTop_zero.comp
    exact tendsto_atTop_add_const_right atTop (-1) tendsto_id
  have hquot : Tendsto (fun T : ℝ => ‖(A T-1)/(T-1 : ℂ)‖) atTop (𝓝 1) := by
    apply tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds
      (show Tendsto (fun T : ℝ => 1+2/(T-1)) atTop (𝓝 1) by
        simpa [div_eq_mul_inv] using tendsto_const_nhds.add (tendsto_const_nhds.mul hinv))
    · filter_upwards [eventually_gt_atTop (1 : ℝ)] with T hT
      exact (hbounds T hT).1
    · filter_upwards [eventually_gt_atTop (1 : ℝ)] with T hT
      exact (hbounds T hT).2
  have hc : ‖(1-(δ : ℂ)*Complex.I)‖ = Real.sqrt (1+δ^2) := by
    rw [Complex.norm_def]
    congr 1
    simp [Complex.normSq_apply, Complex.mul_re, Complex.mul_im]
    ring
  have hlim := hquot.mul_const (‖(1-(δ : ℂ)*Complex.I)‖⁻¹)
  rw [hc, one_mul] at hlim
  apply hlim.congr'
  filter_upwards [eventually_gt_atTop (1 : ℝ)] with T hT
  rw [lebesgue_logarithmic_window hT]
  rw [← hc]
  change ‖(A T-1)/(T-1 : ℂ)‖ * ‖(1-(δ : ℂ)*Complex.I)‖⁻¹ =
    ‖(A T-1)/((1-(δ : ℂ)*Complex.I)*(T-1))‖
  simp [norm_div, norm_mul, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc]

end
end Bicomplex
