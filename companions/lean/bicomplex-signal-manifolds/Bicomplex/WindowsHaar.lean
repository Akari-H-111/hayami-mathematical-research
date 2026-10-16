import Bicomplex.Windows
import Mathlib.MeasureTheory.Integral.IntervalIntegral.IntegrationByParts

namespace Bicomplex
noncomputable section
open MeasureTheory

/-- Paper 1, `prop:windows` (3): the additive phasor averaged with dx/x. -/
theorem additive_phasor_haar_bound {δ T : ℝ} (hδ : δ ≠ 0) (hT : 1 < T) :
    ‖(Real.log T : ℂ)⁻¹ *
      (∫ x in (1 : ℝ)..T, Complex.exp ((-δ : ℂ)*Complex.I*x)/(x : ℂ))‖ ≤
        2/(|δ| * Real.log T) := by
  let c : ℂ := (-δ : ℂ)*Complex.I
  have hc : c ≠ 0 := mul_ne_zero (by exact_mod_cast neg_ne_zero.mpr hδ) Complex.I_ne_zero
  have hcn : ‖c‖ = |δ| := by simp [c, norm_mul]
  have hx (x : ℝ) (hx : x ∈ Set.uIcc 1 T) : 0 < x := by
    rw [Set.uIcc_of_le hT.le] at hx
    linarith [hx.1]
  let U : ℝ → ℂ := fun x => (x : ℂ)⁻¹
  let V : ℝ → ℂ := fun x => Complex.exp (c*x)/c
  let Ud : ℝ → ℂ := fun x => -((x : ℂ)^2)⁻¹
  let Vd : ℝ → ℂ := fun x => Complex.exp (c*x)
  have hu (x : ℝ) (hx' : x ∈ Set.uIcc 1 T) : HasDerivAt U (Ud x) x := by
    have h := (hasDerivAt_id x).ofReal_comp.inv (by exact_mod_cast (hx x hx').ne')
    apply h.congr_deriv
    simp [Ud,div_eq_mul_inv]
  have hv (x : ℝ) : HasDerivAt V (Vd x) x := by
    have h := (((hasDerivAt_id x).ofReal_comp.const_mul c).cexp).div_const c
    apply h.congr_deriv
    simp [Vd,hc]
  have huc : ContinuousOn U (Set.uIcc 1 T) := fun x hx' => (hu x hx').continuousAt.continuousWithinAt
  have hvc : Continuous V := by dsimp [V]; fun_prop
  have hudc : ContinuousOn Ud (Set.uIcc 1 T) := by
    have h := (huc.pow 2).neg
    apply h.congr
    intro x _
    simp [Ud,U]
  have hvdc : Continuous Vd := by dsimp [Vd]; fun_prop
  have hp := intervalIntegral.integral_mul_deriv_eq_deriv_mul
    hu (fun x _ => hv x) hudc.intervalIntegrable (hvdc.intervalIntegrable 1 T)
  have hVnorm (x : ℝ) : ‖V x‖ = |δ|⁻¹ := by
    dsimp [V]
    rw [norm_div, hcn]
    simp [c, Complex.norm_exp, Complex.mul_re, Complex.mul_im]
  have hrealint : (∫ x in (1 : ℝ)..T, (x^2)⁻¹) = 1-T⁻¹ := by
    have hd (x : ℝ) (hx' : x ∈ Set.uIcc 1 T) :
        HasDerivAt (fun x : ℝ => -x⁻¹) ((x^2)⁻¹) x := by
      apply (((hasDerivAt_id x).inv (hx x hx').ne').neg).congr_deriv
      simp [div_eq_mul_inv]
    have hi : IntervalIntegrable (fun x : ℝ => (x^2)⁻¹) volume 1 T := by
      apply ContinuousOn.intervalIntegrable
      intro x hx'
      exact (((hasDerivAt_id x).pow 2).inv (pow_ne_zero 2 (hx x hx').ne')).continuousAt.continuousWithinAt
    simpa [sub_eq_add_neg,add_comm] using intervalIntegral.integral_eq_sub_of_hasDerivAt hd hi
  have hboundint : IntervalIntegrable (fun x : ℝ => |δ|⁻¹*(x^2)⁻¹) volume 1 T := by
    apply ContinuousOn.intervalIntegrable
    intro x hx'
    exact (continuousAt_const.mul
      (((hasDerivAt_id x).pow 2).inv (pow_ne_zero 2 (hx x hx').ne')).continuousAt).continuousWithinAt
  have hbound : ‖∫ x in (1 : ℝ)..T, Ud x * V x‖ ≤ |δ|⁻¹*(1-T⁻¹) := by
    calc
      _ ≤ ∫ x in (1 : ℝ)..T, |δ|⁻¹*(x^2)⁻¹ := by
        apply intervalIntegral.norm_integral_le_of_norm_le hT.le _ hboundint
        exact Filter.Eventually.of_forall fun x hxx => by
          have hxp : 0 < x := by linarith [hxx.1]
          rw [norm_mul,hVnorm]
          simp [Ud,norm_inv,norm_pow,Complex.norm_real,Real.norm_eq_abs,abs_of_pos hxp,mul_comm]
      _ = _ := by rw [intervalIntegral.integral_const_mul,hrealint]
  have hUV (x : ℝ) (hx' : 0 < x) : ‖U x * V x‖ = x⁻¹*|δ|⁻¹ := by
    rw [norm_mul,hVnorm]
    simp [U,norm_inv,Complex.norm_real,Real.norm_eq_abs,abs_of_pos hx']
  have htotal : ‖∫ x in (1 : ℝ)..T, U x * Vd x‖ ≤ 2/|δ| := by
    rw [hp]
    calc
      _ ≤ ‖U T*V T-U 1*V 1‖ + ‖∫ x in (1 : ℝ)..T, Ud x * V x‖ := norm_sub_le _ _
      _ ≤ (‖U T*V T‖+‖U 1*V 1‖) + |δ|⁻¹*(1-T⁻¹) :=
        add_le_add (norm_sub_le _ _) hbound
      _ = 2/|δ| := by rw [hUV T (by linarith),hUV 1 (by norm_num)]; ring
  have hlog : 0 < Real.log T := Real.log_pos hT
  calc
    _ = (Real.log T)⁻¹ * ‖∫ x in (1 : ℝ)..T, U x * Vd x‖ := by
      rw [norm_mul,norm_inv,Complex.norm_real,Real.norm_eq_abs,abs_of_pos hlog]
      congr 2
      apply intervalIntegral.integral_congr
      intro x _
      simp [U,Vd,c,div_eq_mul_inv,mul_comm]
    _ ≤ (Real.log T)⁻¹*(2/|δ|) := mul_le_mul_of_nonneg_left htotal (inv_nonneg.mpr hlog.le)
    _ = _ := by ring

end
end Bicomplex
