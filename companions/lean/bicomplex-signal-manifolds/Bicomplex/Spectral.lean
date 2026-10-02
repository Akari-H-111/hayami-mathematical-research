import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Analysis.Calculus.Deriv.Star
import Mathlib.LinearAlgebra.Matrix.Gershgorin

namespace Bicomplex
noncomputable section
open MeasureTheory ComplexConjugate
open scoped Interval

def mellin (σ : ℝ) (f df : ℝ → ℂ) (x : ℝ) : ℂ :=
  -Complex.I*((x:ℂ)*df x+(σ:ℂ)*f x)

-- Actual integration by parts, including its endpoint term.
theorem mellin_interval_green (σ a b : ℝ) (f g df dg : ℝ → ℂ)
    (hf : ∀ x, HasDerivAt f (df x) x) (hg : ∀ x, HasDerivAt g (dg x) x)
    (hdf : Continuous df) (hdg : Continuous dg) :
    (∫ x in a..b, conj (mellin σ f df x)*g x-conj (f x)*mellin (1-σ) g dg x)=
      Complex.I*((b:ℂ)*conj (f b)*g b-(a:ℂ)*conj (f a)*g a) := by
  have hfc : Continuous f := continuous_iff_continuousAt.mpr fun x => (hf x).continuousAt
  have hgc : Continuous g := continuous_iff_continuousAt.mpr fun x => (hg x).continuousAt
  let P := fun x : ℝ => Complex.I*((x:ℂ)*conj (f x)*g x)
  have hder (x : ℝ) : HasDerivAt P
      (conj (mellin σ f df x)*g x-conj (f x)*mellin (1-σ) g dg x) x := by
    have h := (((hasDerivAt_id x).ofReal_comp.mul (hf x).star).mul (hg x)).const_mul Complex.I
    convert h using 1 <;> first | rfl | (simp [mellin];ring)
  have hc : Continuous (fun x => conj (mellin σ f df x)*g x-conj (f x)*mellin (1-σ) g dg x) := by
    unfold mellin;fun_prop
  have hh := intervalIntegral.integral_eq_sub_of_hasDerivAt (fun x _ => hder x)
    (hc.intervalIntegrable a b)
  simpa only [P,mul_sub] using hh

theorem mellin_zero_boundary_pairing (σ a b : ℝ) (f g df dg : ℝ → ℂ)
    (hf : ∀ x, HasDerivAt f (df x) x) (hg : ∀ x, HasDerivAt g (dg x) x)
    (hdf : Continuous df) (hdg : Continuous dg) (ha : f a=0) (hb : f b=0) :
    (∫ x in a..b, conj (mellin σ f df x)*g x-conj (f x)*mellin (1-σ) g dg x)=0 := by
  rw [mellin_interval_green σ a b f g df dg hf hg hdf hdg,ha,hb]
  simp

theorem formal_coefficient_symmetry (σ : ℝ) : σ=1-σ ↔ σ=1/2 := by constructor <;> intro h <;> linarith

def phasorGram (T ω ν : ℝ) : ℂ :=
  (T:ℂ)⁻¹ * ∫ t in (0:ℝ)..T, Complex.exp (((ω-ν:ℝ):ℂ)*Complex.I*t)

theorem gram_diagonal {T : ℝ} (hT : T ≠ 0) (ω : ℝ) : phasorGram T ω ω=1 := by
  simp [phasorGram,hT]

theorem gram_entry_integral {T ω ν : ℝ} (hw : ω ≠ ν) :
    phasorGram T ω ν=(T:ℂ)⁻¹ *
      ((Complex.exp (((ω-ν:ℝ):ℂ)*Complex.I*T)-1)/(((ω-ν:ℝ):ℂ)*Complex.I)) := by
  unfold phasorGram
  rw [integral_exp_mul_complex (mul_ne_zero (by exact_mod_cast sub_ne_zero.mpr hw) Complex.I_ne_zero)]
  simp

theorem gram_entry_bound {T ω ν : ℝ} (hT : 0 < T) (hw : ω ≠ ν) :
    ‖phasorGram T ω ν‖ ≤ 2/(T*|ω-ν|) := by
  rw [gram_entry_integral hw,norm_mul,norm_inv,norm_div]
  have hn : ‖Complex.exp (((ω-ν:ℝ):ℂ)*Complex.I*T)-1‖ ≤ 2 := by
    calc
      _ ≤ ‖Complex.exp (((ω-ν:ℝ):ℂ)*Complex.I*T)‖+‖(1:ℂ)‖ := norm_sub_le _ _
      _ = 2 := by simp [Complex.norm_exp,Complex.mul_re,Complex.mul_im];norm_num
  have hd : 0 < |ω-ν| := abs_pos.mpr (sub_ne_zero.mpr hw)
  have hh := div_le_div_of_nonneg_right hn hd.le
  have hh' := mul_le_mul_of_nonneg_left hh (inv_nonneg.mpr hT.le)
  simpa only [norm_mul,Complex.norm_real,Real.norm_eq_abs,Complex.norm_I,
    mul_one,abs_of_pos hT,norm_inv,div_eq_mul_inv,mul_inv_rev,← Complex.ofReal_sub,
    mul_assoc,mul_comm,mul_left_comm] using hh'

-- Gershgorin is applied to the actual integral matrix.
theorem gram_eigenvalue_enclosure {ι : Type*} [Fintype ι] [DecidableEq ι]
    (ω : ι → ℝ) {T δ : ℝ} (hT : 0 < T) (hδ : 0 < δ)
    (hsep : ∀ i j, i ≠ j → δ ≤ |ω i-ω j|) {μ : ℂ}
    (hμ : Module.End.HasEigenvalue (Matrix.toLin' (fun i j => phasorGram T (ω i) (ω j))) μ) :
    ‖μ-1‖ ≤ (Fintype.card ι-1:ℕ)* (2/(T*δ)) := by
  obtain ⟨i,hi⟩ := eigenvalue_mem_ball hμ
  rw [gram_diagonal hT.ne'] at hi
  have hi' : ‖μ-1‖ ≤ ∑ j ∈ Finset.univ.erase i, ‖phasorGram T (ω i) (ω j)‖ := by
    simpa [Metric.mem_closedBall,dist_eq_norm] using hi
  calc
    _ ≤ ∑ j ∈ Finset.univ.erase i, ‖phasorGram T (ω i) (ω j)‖ := hi'
    _ ≤ ∑ j ∈ Finset.univ.erase i, 2/(T*δ) := by
      apply Finset.sum_le_sum
      intro j hj
      have hij : i ≠ j := (Finset.mem_erase.mp hj).1.symm
      have hw : ω i ≠ ω j := by intro he; have := hsep i j hij;rw [he,sub_self,abs_zero] at this;linarith
      exact (gram_entry_bound hT hw).trans (div_le_div_of_nonneg_left (by norm_num)
        (mul_pos hT hδ) (mul_le_mul_of_nonneg_left (hsep i j hij) hT.le))
    _ = _ := by simp

end
end Bicomplex
