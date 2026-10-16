import Mathlib.Analysis.Calculus.FDeriv.Mul
import Mathlib.Analysis.Calculus.FDeriv.Prod
import Mathlib.Data.Real.Sqrt
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.Tactic

namespace Bicomplex
noncomputable section

def romanSurface (p : ℝ × ℝ × ℝ) : ℝ × ℝ × ℝ :=
  (p.2.1*p.2.2, p.2.2*p.1, p.1*p.2.1)

def romanDifferential (p : ℝ × ℝ × ℝ) : (ℝ × ℝ × ℝ) →L[ℝ] (ℝ × ℝ × ℝ) :=
  let X := ContinuousLinearMap.fst ℝ ℝ (ℝ × ℝ)
  let Y := (ContinuousLinearMap.fst ℝ ℝ ℝ).comp (ContinuousLinearMap.snd ℝ ℝ (ℝ × ℝ))
  let Z := (ContinuousLinearMap.snd ℝ ℝ ℝ).comp (ContinuousLinearMap.snd ℝ ℝ (ℝ × ℝ))
  (p.2.2 • Y + p.2.1 • Z).prod ((p.2.2 • X + p.1 • Z).prod (p.2.1 • X + p.1 • Y))

theorem roman_surface_derivative (p : ℝ × ℝ × ℝ) :
    HasFDerivAt romanSurface (romanDifferential p) p := by
  let X := ContinuousLinearMap.fst ℝ ℝ (ℝ × ℝ)
  let Y := (ContinuousLinearMap.fst ℝ ℝ ℝ).comp (ContinuousLinearMap.snd ℝ ℝ (ℝ × ℝ))
  let Z := (ContinuousLinearMap.snd ℝ ℝ ℝ).comp (ContinuousLinearMap.snd ℝ ℝ (ℝ × ℝ))
  have h := ((Y.hasFDerivAt (x := p)).mul (Z.hasFDerivAt (x := p))).prodMk
    (((Z.hasFDerivAt (x := p)).mul (X.hasFDerivAt (x := p))).prodMk
      ((X.hasFDerivAt (x := p)).mul (Y.hasFDerivAt (x := p))))
  apply h.congr_fderiv
  ext v <;> simp [romanDifferential, X, Y, Z] <;> ring

theorem roman_differential_apply (p v : ℝ × ℝ × ℝ) :
    fderiv ℝ romanSurface p v =
      (p.2.2*v.2.1+p.2.1*v.2.2, p.2.2*v.1+p.1*v.2.2, p.2.1*v.1+p.1*v.2.1) := by
  rw [(roman_surface_derivative p).fderiv]
  rfl

def romanSingularPoints : Set (ℝ × ℝ × ℝ) := {p |
  (p.1 = 0 ∧ p.2.1^2 = 1/2 ∧ p.2.2^2 = 1/2) ∨
  (p.2.1 = 0 ∧ p.1^2 = 1/2 ∧ p.2.2^2 = 1/2) ∨
  (p.2.2 = 0 ∧ p.1^2 = 1/2 ∧ p.2.1^2 = 1/2)}

theorem roman_coordinate_values {x : ℝ} :
    x^2 = 1/2 ↔ x = 1/Real.sqrt 2 ∨ x = -(1/Real.sqrt 2) := by
  have hs : (1/Real.sqrt 2)^2 = (1 : ℝ)/2 := by
    rw [div_pow, one_pow, Real.sq_sqrt (by norm_num)]
  constructor
  · intro h
    exact sq_eq_sq_iff_eq_or_eq_neg.mp (h.trans hs.symm)
  · rintro (rfl | rfl) <;> simpa using hs

private lemma roman_zero_coordinate_kernel {y z a b c : ℝ}
    (hs : y^2+z^2 = 1) (ht : y*b+z*c = 0) (hm : z*b+y*c = 0)
    (hza : z*a = 0) (hya : y*a = 0) (hv : a ≠ 0 ∨ b ≠ 0 ∨ c ≠ 0) :
    y^2 = 1/2 ∧ z^2 = 1/2 := by
  have ha : a = 0 := by
    by_cases hy : y = 0
    · have hz : z ≠ 0 := by intro hz; simp [hy,hz] at hs
      exact (mul_eq_zero.mp hza).resolve_left hz
    · exact (mul_eq_zero.mp hya).resolve_left hy
  have hb : (y^2-z^2)*b = 0 := by linear_combination y*ht-z*hm
  have hc : (y^2-z^2)*c = 0 := by linear_combination y*hm-z*ht
  have he : y^2-z^2 = 0 := by
    by_contra h
    have hb' := (mul_eq_zero.mp hb).resolve_left h
    have hc' := (mul_eq_zero.mp hc).resolve_left h
    simp_all
  constructor <;> linarith

/-- Rank loss of the actual differential restricted to the sphere tangent plane. -/
theorem roman_tangent_singular_iff (p : ℝ × ℝ × ℝ)
    (hs : p.1^2+p.2.1^2+p.2.2^2 = 1) :
    (∃ v : ℝ × ℝ × ℝ, v ≠ 0 ∧ p.1*v.1+p.2.1*v.2.1+p.2.2*v.2.2 = 0 ∧
      fderiv ℝ romanSurface p v = 0) ↔ p ∈ romanSingularPoints := by
  rcases p with ⟨x,y,z⟩
  dsimp at hs ⊢
  constructor
  · rintro ⟨⟨a,b,c⟩,hv,ht,hm⟩
    rw [roman_differential_apply] at hm
    have h1 := congrArg Prod.fst hm
    have h2 := congrArg (fun v : ℝ × ℝ × ℝ => v.2.1) hm
    have h3 := congrArg (fun v : ℝ × ℝ × ℝ => v.2.2) hm
    dsimp at h1 h2 h3 ht
    have hv' : a ≠ 0 ∨ b ≠ 0 ∨ c ≠ 0 := by
      by_contra h
      push Not at h
      apply hv
      simp [h.1,h.2.1,h.2.2]
    by_cases hx : x = 0
    · left
      subst x
      simp only [zero_mul, add_zero, zero_add] at hs ht h2 h3
      exact ⟨rfl,roman_zero_coordinate_kernel (by simpa using hs) ht h1 h2 h3 hv'⟩
    by_cases hy : y = 0
    · right; left
      subst y
      simp only [zero_mul, add_zero, zero_add] at hs ht h1 h3
      have h := roman_zero_coordinate_kernel (y := z) (z := x) (a := b) (b := c) (c := a)
        (by linarith) (by linarith) (by linarith) (by nlinarith [h3]) (by nlinarith [h1])
        (by tauto)
      exact ⟨rfl,h.2,h.1⟩
    by_cases hz : z = 0
    · right; right
      subst z
      simp only [zero_mul, add_zero, zero_add] at hs ht h1 h2
      have h := roman_zero_coordinate_kernel (y := x) (z := y) (a := c) (b := a) (c := b)
        (by simpa using hs) ht h3 (by nlinarith [h1]) (by nlinarith [h2]) (by tauto)
      exact ⟨rfl,h⟩
    exfalso
    have hc : (2*x*y)*c = 0 := by linear_combination x*h1+y*h2-z*h3
    have hc' : c = 0 := (mul_eq_zero.mp hc).resolve_left (mul_ne_zero (mul_ne_zero (by norm_num) hx) hy)
    rw [hc'] at h1 h2
    simp only [mul_zero, add_zero] at h1 h2
    have ha : a = 0 := (mul_eq_zero.mp h2).resolve_left hz
    have hb : b = 0 := (mul_eq_zero.mp h1).resolve_left hz
    simp_all
  · rintro (⟨hx,hy,hz⟩ | ⟨hy,hx,hz⟩ | ⟨hz,hx,hy⟩)
    · dsimp only at hx hy hz
      refine ⟨(0,z,-y),?_,?_,?_⟩
      · intro h
        have := congrArg (fun v : ℝ × ℝ × ℝ => v.2.2) h
        dsimp at this
        nlinarith
      · dsimp; ring
      · rw [roman_differential_apply]
        ext <;> simp [hx] <;> nlinarith
    · dsimp only at hx hy hz
      refine ⟨(-z,0,x),?_,?_,?_⟩
      · intro h
        have := congrArg (fun v : ℝ × ℝ × ℝ => v.2.2) h
        dsimp at this
        nlinarith
      · dsimp; ring
      · rw [roman_differential_apply]
        ext <;> simp [hy] <;> nlinarith
    · dsimp only at hx hy hz
      refine ⟨(y,-x,0),?_,?_,?_⟩
      · intro h
        have := congrArg (fun v : ℝ × ℝ × ℝ => v.2.1) h
        dsimp at this
        nlinarith
      · dsimp; ring
      · rw [roman_differential_apply]
        ext <;> simp [hz] <;> nlinarith

def romanNormalCovector (p : ℝ × ℝ × ℝ) : (ℝ × ℝ × ℝ) →ₗ[ℝ] ℝ where
  toFun v := p.1*v.1+p.2.1*v.2.1+p.2.2*v.2.2
  map_add' v w := by dsimp; ring
  map_smul' c v := by simp [smul_eq_mul]; ring

def romanTangentPlane (p : ℝ × ℝ × ℝ) : Submodule ℝ (ℝ × ℝ × ℝ) :=
  LinearMap.ker (romanNormalCovector p)

def romanTangentDifferential (p : ℝ × ℝ × ℝ) : romanTangentPlane p →ₗ[ℝ] (ℝ × ℝ × ℝ) :=
  (romanDifferential p).toLinearMap.comp (romanTangentPlane p).subtype

theorem roman_tangent_plane_dimension (p : ℝ × ℝ × ℝ)
    (hs : p.1^2+p.2.1^2+p.2.2^2 = 1) : Module.finrank ℝ (romanTangentPlane p) = 2 := by
  have hsurj : Function.Surjective (romanNormalCovector p) := by
    intro c
    refine ⟨c • p, ?_⟩
    dsimp [romanNormalCovector]
    linear_combination c*hs
  have h := (romanNormalCovector p).finrank_range_add_finrank_ker
  rw [LinearMap.range_eq_top.mpr hsurj] at h
  simp [Module.finrank_prod] at h
  change 1 + Module.finrank ℝ (romanTangentPlane p) = 3 at h
  omega

/-- Literal rank below two, for the restriction of the actual derivative to T_p S². -/
theorem roman_tangent_rank_iff (p : ℝ × ℝ × ℝ) (hs : p.1^2+p.2.1^2+p.2.2^2 = 1) :
    Module.finrank ℝ (LinearMap.range (romanTangentDifferential p)) < 2 ↔
      p ∈ romanSingularPoints := by
  have hr := (romanTangentDifferential p).finrank_range_add_finrank_ker
  rw [roman_tangent_plane_dimension p hs] at hr
  constructor
  · intro h
    have hk : LinearMap.ker (romanTangentDifferential p) ≠ ⊥ := by
      intro he
      rw [he] at hr
      simp at hr
      omega
    obtain ⟨v,hv,hvn⟩ := (LinearMap.ker (romanTangentDifferential p)).ne_bot_iff.mp hk
    apply (roman_tangent_singular_iff p hs).mp
    refine ⟨v,?_,v.property,?_⟩
    · intro he
      exact hvn (Subtype.ext he)
    · rw [(roman_surface_derivative p).fderiv]
      exact hv
  · intro hp
    obtain ⟨v,hvn,hvt,hvd⟩ := (roman_tangent_singular_iff p hs).mpr hp
    have hk : LinearMap.ker (romanTangentDifferential p) ≠ ⊥ := by
      apply (LinearMap.ker (romanTangentDifferential p)).ne_bot_iff.mpr
      refine ⟨⟨v,hvt⟩,?_,?_⟩
      · change romanDifferential p v = 0
        rwa [← (roman_surface_derivative p).fderiv]
      · intro he
        exact hvn (congrArg Subtype.val he)
    have hdim : Module.finrank ℝ (LinearMap.ker (romanTangentDifferential p)) ≠ 0 := by
      intro he
      exact hk (Submodule.finrank_eq_zero.mp he)
    omega

end
end Bicomplex
