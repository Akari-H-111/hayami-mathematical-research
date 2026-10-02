import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic

namespace Bicomplex
noncomputable section

theorem zero_boundary_core_witness : (∫ _x : ℝ in (0:ℝ)..1, (2:ℝ))=2 := by norm_num

theorem transmission_unit_modulus_iff (z : ℂ) : 1-‖z‖^2=0 ↔ ‖z‖=1 := by
  have h := norm_nonneg z
  constructor <;> intro h' <;> nlinarith

theorem real_transgression_coefficient (a : ℝ) :
    (∀ z : ℂ, (z+(a:ℂ)*(star z-z)).im=0) ↔ a=1/2 := by
  constructor
  · intro h
    have hi := h Complex.I
    simp [Complex.mul_im] at hi
    linarith
  · intro h z
    subst a
    simp [Complex.mul_im]
    ring

theorem sign_intertwiner_zero {z : ℂ} (h : -z=z) : z=0 := by
  have h1 := congrArg Complex.re h
  have h2 := congrArg Complex.im h
  have hr : -z.re=z.re := by simpa using h1
  have hi : -z.im=z.im := by simpa using h2
  apply Complex.ext <;> simp only [Complex.zero_re,Complex.zero_im] <;> linarith

theorem cusp_return_square {a b c τ : ℝ} (hc : c ≠ 0) (h : b^2+a*c^2=0) :
    c*τ^2+2*b*τ-a*c=c*(τ+b/c)^2 := by
  field_simp
  nlinarith

theorem half_integer_pairing (n : ℤ) : (n:ℝ)+1/2+((-n-1:ℤ):ℝ)+1/2=0 := by
  push_cast
  ring

end
end Bicomplex
