import RuledV5.Signal
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic

namespace RuledV5
noncomputable section
open intervalIntegral

-- Real Fourier coefficients of the actual chosen-chart phase, with x=ωτ.
def chartPhase (κ x : ℝ) : ℝ := Real.arctan (κ*(Real.cos x)^2)
def leadingPhase (κ x : ℝ) : ℝ := κ/2*(1+Real.cos (2*x))
def cosineCoeff (f : ℝ → ℝ) (n : ℕ) : ℝ :=
  (∫ x in -Real.pi..Real.pi, f x*Real.cos ((n:ℝ)*x))/Real.pi
def sineCoeff (f : ℝ → ℝ) (n : ℕ) : ℝ :=
  (∫ x in -Real.pi..Real.pi, f x*Real.sin ((n:ℝ)*x))/Real.pi

theorem chart_phase_actual {ξ : ℝ} (hξ : ξ ≠ 0) (a ω τ : ℝ) :
    phaseResponse ξ a ω τ=chartPhase (a^2/ξ) (ω*τ) := by
  unfold phaseResponse chartPhase
  congr 1
  ring

theorem chart_phase_error (κ x : ℝ) :
    |chartPhase κ x-leadingPhase κ x| ≤ |κ|^3/3 := by
  have hh := Real.abs_cos_le_one x
  have hp : |Real.cos x|^2 ≤ 1 := by nlinarith [abs_nonneg (Real.cos x)]
  have hx : |κ*(Real.cos x)^2| ≤ |κ| := by
    rw [abs_mul,abs_pow]; nlinarith [abs_nonneg κ]
  have he : κ*(Real.cos x)^2=leadingPhase κ x := by
    unfold leadingPhase; rw [Real.cos_two_mul]; ring
  unfold chartPhase
  rw [← he]
  exact (arctan_remainder_bound _).trans (by
    have hh := pow_le_pow_left₀ (abs_nonneg _) hx 3
    linarith)

theorem cosine_coefficient_uniform_bound (f : ℝ → ℝ) (C : ℝ)
    (hf : ∀ x, |f x| ≤ C) (n : ℕ) : |cosineCoeff f n| ≤ 2*C := by
  have hh : ∀ x ∈ Set.uIoc (-Real.pi) Real.pi,
      ‖f x*Real.cos ((n:ℝ)*x)‖ ≤ C := by
    intro x _
    rw [Real.norm_eq_abs,abs_mul]
    exact (mul_le_mul_of_nonneg_left (Real.abs_cos_le_one _) (abs_nonneg _)).trans
      (by simpa using hf x)
  have hi := norm_integral_le_of_norm_le_const hh
  rw [Real.norm_eq_abs,show |Real.pi- -Real.pi|=2*Real.pi by
    rw [abs_of_pos (by linarith [Real.pi_pos])]; ring] at hi
  unfold cosineCoeff
  rw [abs_div,abs_of_pos Real.pi_pos]
  exact (div_le_iff₀ Real.pi_pos).mpr (by nlinarith [hi])

theorem cosine_coefficient_error (κ : ℝ) (n : ℕ) :
    |cosineCoeff (chartPhase κ) n-cosineCoeff (leadingPhase κ) n| ≤ 2*|κ|^3/3 := by
  have hc : Continuous (chartPhase κ) := by unfold chartPhase; fun_prop
  have hl : Continuous (leadingPhase κ) := by unfold leadingPhase; fun_prop
  have hi : cosineCoeff (fun x => chartPhase κ x-leadingPhase κ x) n =
      cosineCoeff (chartPhase κ) n-cosineCoeff (leadingPhase κ) n := by
    unfold cosineCoeff
    simp_rw [sub_mul]
    rw [integral_sub
      (f := fun x => chartPhase κ x*Real.cos ((n:ℝ)*x))
      (g := fun x => leadingPhase κ x*Real.cos ((n:ℝ)*x))
      (by apply Continuous.intervalIntegrable; exact hc.mul (by fun_prop))
      (by apply Continuous.intervalIntegrable; exact hl.mul (by fun_prop)),sub_div]
  rw [← hi]
  convert cosine_coefficient_uniform_bound _ _ (chart_phase_error κ) n using 1 <;> ring

theorem integral_cos_integer {n : ℤ} (hn : n ≠ 0) :
    (∫ x in -Real.pi..Real.pi, Real.cos ((n:ℝ)*x))=0 := by
  rw [integral_comp_mul_left Real.cos (Int.cast_ne_zero.mpr hn),integral_cos]
  simp [mul_neg,Real.sin_neg,Real.sin_int_mul_pi]

theorem cosine_leading_coefficient (κ : ℝ) {n : ℕ} (hn : 0 < n) :
    cosineCoeff (leadingPhase κ) n=if n=2 then κ/2 else 0 := by
  have hnz : (n:ℤ) ≠ 0 := by exact_mod_cast (ne_of_gt hn)
  have hi : (∫ x in -Real.pi..Real.pi, Real.cos ((n:ℝ)*x))=0 := by
    exact_mod_cast integral_cos_integer hnz
  have he (x : ℝ) : Real.cos (2*x)*Real.cos ((n:ℝ)*x)=
      (Real.cos (((2:ℤ)+n:ℤ)*x)+Real.cos (((2:ℤ)-n:ℤ)*x))/2 := by
    push_cast
    rw [add_mul,sub_mul,Real.cos_add,Real.cos_sub]
    ring
  have hm : (2+(n:ℤ)) ≠ 0 := by omega
  have hp := integral_cos_integer hm
  by_cases hn2 : n=2
  · subst n
    norm_num only [Nat.cast_ofNat,Int.cast_ofNat] at he hi hp ⊢
    simp only [ite_true]
    have hc : (∫ x in -Real.pi..Real.pi, Real.cos (2*x)*Real.cos (2*x))=Real.pi := by
      simp_rw [he]
      rw [integral_div,integral_add (by apply Continuous.intervalIntegrable; fun_prop) (by apply Continuous.intervalIntegrable; fun_prop)]
      norm_num at hp ⊢
      rw [hp]
      ring
    unfold cosineCoeff leadingPhase
    simp only [Nat.cast_ofNat]
    have he' (x : ℝ) : κ/2*(1+Real.cos (2*x))*Real.cos (2*x)=
        κ/2*Real.cos (2*x)+κ/2*(Real.cos (2*x)*Real.cos (2*x)) := by ring
    simp_rw [he']
    rw [integral_add (by apply Continuous.intervalIntegrable; fun_prop) (by apply Continuous.intervalIntegrable; fun_prop),integral_const_mul,
      integral_const_mul,hi,hc]
    field_simp
    ring
  · have hm' : (2-(n:ℤ)) ≠ 0 := by omega
    have hc : (∫ x in -Real.pi..Real.pi, Real.cos (2*x)*Real.cos ((n:ℝ)*x))=0 := by
      simp_rw [he]
      rw [integral_div,integral_add (by apply Continuous.intervalIntegrable; fun_prop) (by apply Continuous.intervalIntegrable; fun_prop),
        integral_cos_integer hm,integral_cos_integer hm']
      norm_num
    rw [if_neg hn2]
    unfold cosineCoeff leadingPhase
    have he' (x : ℝ) : κ/2*(1+Real.cos (2*x))*Real.cos ((n:ℝ)*x)=
        κ/2*Real.cos ((n:ℝ)*x)+κ/2*(Real.cos (2*x)*Real.cos ((n:ℝ)*x)) := by ring
    simp_rw [he']
    rw [integral_add (by apply Continuous.intervalIntegrable; fun_prop) (by apply Continuous.intervalIntegrable; fun_prop),integral_const_mul,
      integral_const_mul,hi,hc]
    norm_num

theorem chart_phase_sine_coeff_zero (κ : ℝ) (n : ℕ) :
    sineCoeff (chartPhase κ) n=0 := by
  let f : ℝ → ℝ := fun x => chartPhase κ x*Real.sin ((n:ℝ)*x)
  have hf (x : ℝ) : f (-x)= -f x := by
    simp [f,chartPhase,mul_neg,Real.cos_neg,Real.sin_neg]
  have hi := integral_comp_neg (a := -Real.pi) (b := Real.pi) f
  simp only [neg_neg] at hi
  simp_rw [hf,integral_neg] at hi
  have hz : (∫ x in -Real.pi..Real.pi, f x)=0 := by linarith [hi]
  unfold sineCoeff
  rw [show (fun x => chartPhase κ x*Real.sin ((n:ℝ)*x))=f by rfl,hz]
  simp

theorem chart_phase_pi_periodic (κ : ℝ) : Function.Periodic (chartPhase κ) Real.pi := by
  intro x
  simp [chartPhase,Real.cos_add_pi]

theorem chart_phase_odd_cosine_coeff_zero (κ : ℝ) {n : ℕ} (hn : Odd n) :
    cosineCoeff (chartPhase κ) n=0 := by
  let f : ℝ → ℝ := fun x => chartPhase κ x*Real.cos ((n:ℝ)*x)
  have ha (x : ℝ) : f (x+Real.pi)= -f x := by
    simp only [f,chart_phase_pi_periodic κ x,mul_add]
    rw [Real.cos_add_nat_mul_pi,hn.neg_one_pow]
    ring
  have hi := integral_comp_add_right (a := -Real.pi) (b := 0) f Real.pi
  simp only [neg_add_cancel,zero_add] at hi
  simp_rw [ha,integral_neg] at hi
  have hf : Continuous f := by unfold f chartPhase;fun_prop
  have hs : (∫ x in -Real.pi..Real.pi, f x)=
      (∫ x in -Real.pi..0, f x)+(∫ x in 0..Real.pi, f x) :=
    (integral_add_adjacent_intervals (hf.intervalIntegrable (-Real.pi) 0)
      (hf.intervalIntegrable 0 Real.pi)).symm
  have hz : (∫ x in -Real.pi..Real.pi, f x)=0 := by rw [hs];linarith [hi]
  unfold cosineCoeff
  rw [show (fun x => chartPhase κ x*Real.cos ((n:ℝ)*x))=f by rfl,hz]
  simp

theorem chart_phase_doubled_harmonic_dominates {κ : ℝ}
    (hk0 : 0 < |κ|) (hk : |κ| ≤ 1/2) {n : ℕ} (hn : 0 < n) (hn2 : n ≠ 2) :
    |cosineCoeff (chartPhase κ) n| < |cosineCoeff (chartPhase κ) 2| := by
  have h2 := cosine_coefficient_error κ 2
  have h := cosine_coefficient_error κ n
  rw [cosine_leading_coefficient κ (by norm_num),if_pos rfl] at h2
  rw [cosine_leading_coefficient κ hn,if_neg hn2,sub_zero] at h
  have hm := abs_sub_comm (cosineCoeff (chartPhase κ) 2) (κ/2)
  have hl := abs_add_le (κ/2-cosineCoeff (chartPhase κ) 2)
    (cosineCoeff (chartPhase κ) 2)
  rw [sub_add_cancel,← hm,abs_div] at hl
  norm_num at hl
  have hb : |κ|^2 ≤ 1/4 := by nlinarith [sq_nonneg (|κ|-1/2),abs_nonneg κ]
  have hc : |κ|^3 ≤ |κ|/4 := by nlinarith
  nlinarith


theorem uniform_remainder_sine_coefficient_zero (κ : ℝ) (n : ℕ) :
    sineCoeff (fun x => chartPhase κ x-leadingPhase κ x) n=0 := by
  let f : ℝ → ℝ := fun x => (chartPhase κ x-leadingPhase κ x)*Real.sin ((n:ℝ)*x)
  have hf (x : ℝ) : f (-x)= -f x := by
    simp [f,chartPhase,leadingPhase,mul_neg,Real.cos_neg,Real.sin_neg]
  have hi := integral_comp_neg (a := -Real.pi) (b := Real.pi) f
  simp only [neg_neg] at hi
  simp_rw [hf,integral_neg] at hi
  have hz : (∫ x in -Real.pi..Real.pi, f x)=0 := by linarith [hi]
  unfold sineCoeff
  rw [show (fun x => (chartPhase κ x-leadingPhase κ x)*Real.sin ((n:ℝ)*x))=f by rfl,hz]
  simp

end
end RuledV5
