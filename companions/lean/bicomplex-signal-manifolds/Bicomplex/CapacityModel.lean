import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Analysis.SpecialFunctions.Log.InvLog

namespace Bicomplex
noncomputable section
open MeasureTheory Filter
open scoped Topology

/-- The unsmoothed radial model on the annulus, not a zero-capacity theorem. -/
def logarithmicCutoff (ε ρ : ℝ) : ℝ := Real.log (ε/ρ) / Real.log (1/ε)

theorem logarithmic_cutoff_derivative {ε ρ : ℝ} (hε : 0 < ε) (hρ : 0 < ρ) :
    HasDerivAt (logarithmicCutoff ε) (-1 / (ρ * Real.log (1/ε))) ρ := by
  have h := ((hasDerivAt_const ρ (Real.log ε)).sub
    (Real.hasDerivAt_log hρ.ne')).div_const (Real.log (1/ε))
  have he : logarithmicCutoff ε =ᶠ[𝓝 ρ]
      (fun x => (Real.log ε - Real.log x) / Real.log (1/ε)) := by
    filter_upwards [Ioi_mem_nhds hρ] with x hx
    simp [logarithmicCutoff, Real.log_div hε.ne' hx.ne']
  apply (h.congr_of_eventuallyEq he).congr_deriv
  ring

theorem logarithmic_cutoff_energy {ε : ℝ} (hε : 0 < ε) (hε1 : ε < 1) :
    (∫ ρ in ε^2..ε, (deriv (logarithmicCutoff ε) ρ)^2 * (2*Real.pi*ρ)) =
      2*Real.pi / Real.log (1/ε) := by
  have hlog : Real.log (1/ε) ≠ 0 := ne_of_gt (Real.log_pos (by
    rw [one_lt_div hε]; exact hε1))
  have hε2 : 0 < ε^2 := sq_pos_of_pos hε
  have hle : ε^2 ≤ ε := by nlinarith
  calc
    _ = ∫ ρ in ε^2..ε, (2*Real.pi / Real.log (1/ε)^2) * ρ⁻¹ := by
      apply intervalIntegral.integral_congr
      intro ρ hρ
      rw [Set.uIcc_of_le hle] at hρ
      have hρ' : 0 < ρ := lt_of_lt_of_le hε2 hρ.1
      dsimp only
      rw [(logarithmic_cutoff_derivative hε hρ').deriv]
      field_simp
      <;> ring
    _ = (2*Real.pi / Real.log (1/ε)^2) * Real.log (ε/(ε^2)) := by
      rw [intervalIntegral.integral_const_mul, integral_inv_of_pos hε2 hε]
    _ = 2*Real.pi / Real.log (1/ε) := by
      rw [show ε/(ε^2) = 1/ε by field_simp]
      field_simp

theorem logarithmic_cutoff_energy_tends_to_zero :
    Tendsto (fun ε : ℝ => 2*Real.pi / Real.log (1/ε)) (𝓝[>] 0) (𝓝 0) := by
  have hlog : Tendsto (fun ε : ℝ => Real.log (1/ε)) (𝓝[>] 0) atTop := by
    simp_rw [one_div, Real.log_inv]
    exact tendsto_neg_atBot_atTop.comp Real.tendsto_log_nhdsGT_zero
  simpa [div_eq_mul_inv] using tendsto_const_nhds.mul (tendsto_inv_atTop_zero.comp hlog)

end
end Bicomplex
