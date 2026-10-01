import StokesV5.PaperGeometry
import Mathlib.LinearAlgebra.CrossProduct

namespace RuledV5
noncomputable section
open StokesV5
open scoped Topology ContDiff

def surfaceDerivative (p : ℝ × ℝ) : (ℝ × ℝ) →L[ℝ] (ℝ × ℝ × ℝ) :=
  (rowCLM ((2*p.2-1)*Real.sin p.1) (2*(1-Real.cos p.1))).prod
    ((rowCLM ((1-p.2)*Real.cos p.1) (-Real.sin p.1)).prod
      (rowCLM (p.2*dQdt p) (qChart p.1)))

theorem surface_hasFDerivAt {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    HasFDerivAt ruledSurface (surfaceDerivative p) p := by
  have hc := (Real.hasDerivAt_cos p.1).comp_hasFDerivAt p
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))
  have hs := (Real.hasDerivAt_sin p.1).comp_hasFDerivAt p
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))
  have hu := hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p)
  have hx := hc.add ((hu.const_mul 2).mul ((hasFDerivAt_const (1 : ℝ) p).sub hc))
  have hy := ((hasFDerivAt_const (1 : ℝ) p).sub hu).mul hs
  have hz := hu.mul (qChart_comp_hasFDerivAt hp)
  apply ((hx.prodMk (hy.prodMk hz)).congr_of_eventuallyEq
    (Filter.Eventually.of_forall fun _ => rfl)).congr_fderiv
  ext v <;> simp [surfaceDerivative, rowCLM, ruledSurface] <;> ring

theorem surface_contDiffAt {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    ContDiffAt ℝ ∞ ruledSurface p := by
  have hq : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => qChart x.1) p := by
    unfold qChart
    apply ContDiffAt.sqrt (f := fun x : ℝ × ℝ => qSq x.1) _ (ne_of_gt hp)
    unfold qSq; fun_prop
  have hx : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => Real.cos x.1+2*x.2*(1-Real.cos x.1)) p := by fun_prop
  have hy : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => (1-x.2)*Real.sin x.1) p := by fun_prop
  have hu : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => x.2) p := by fun_prop
  unfold ruledSurface
  exact hx.prodMk (hy.prodMk (hu.mul hq))

def tangentT (p : ℝ × ℝ) : ℝ × ℝ × ℝ :=
  ((2*p.2-1)*Real.sin p.1, (1-p.2)*Real.cos p.1, p.2*dQdt p)

def tangentU (p : ℝ × ℝ) : ℝ × ℝ × ℝ :=
  (2*(1-Real.cos p.1), -Real.sin p.1, qChart p.1)

theorem surface_fderiv_basis {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    fderiv ℝ ruledSurface p (1,0) = tangentT p ∧
    fderiv ℝ ruledSurface p (0,1) = tangentU p := by
  rw [(surface_hasFDerivAt hp).fderiv]
  simp [surfaceDerivative, tangentT, tangentU, rowCLM]

def areaVector (p : ℝ × ℝ) : ℝ × ℝ × ℝ :=
  cross3 (fderiv ℝ ruledSurface p (1,0)) (fderiv ℝ ruledSurface p (0,1))

theorem areaVector_eq {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    areaVector p = (observationM p,
      -Real.sin p.1*(2*p.2-Real.cos p.1*(2-Real.cos p.1))/qChart p.1,
      observationN p) := by
  have hq := qChart_sq hp
  have hq0 := qChart_ne_zero hp
  have htrig := Real.sin_sq_add_cos_sq p.1
  have hs2 : Real.sin p.1^2=1-Real.cos p.1^2 := by nlinarith
  rcases surface_fderiv_basis hp with ⟨ht,hu⟩
  unfold areaVector
  rw [ht,hu]
  ext <;> simp only [cross3, tangentT, tangentU, dQdt, observationM,
    observationNumerator, observationN]
  all_goals field_simp [hq0]
  all_goals unfold qSq at hq
  all_goals simp only [hq,hs2]; ring

private def vec3 (v : ℝ × ℝ × ℝ) : Fin 3 → ℝ := ![v.1,v.2.1,v.2.2]

theorem differential_injective_iff_cross
    (L : (ℝ × ℝ) →L[ℝ] (ℝ × ℝ × ℝ)) :
    Function.Injective L ↔ cross3 (L (1,0)) (L (0,1)) ≠ 0 := by
  have he (a b : ℝ) : L (a,b) = a • L (1,0) + b • L (0,1) := by
    rw [← map_smul, ← map_smul, ← map_add]
    congr 1 <;> ext <;> simp
  have hc : crossProduct (vec3 (L (1,0))) (vec3 (L (0,1))) =
      vec3 (cross3 (L (1,0)) (L (0,1))) := by
    ext i; fin_cases i <;> simp [vec3, cross3, cross_apply]
  have hv : ∀ v : ℝ × ℝ × ℝ, vec3 v = 0 ↔ v = 0 := by
    intro v
    simp [vec3, Matrix.cons_eq_zero_iff, Prod.ext_iff]
  have hneq : cross3 (L (1,0)) (L (0,1)) ≠ 0 ↔
      crossProduct (vec3 (L (1,0))) (vec3 (L (0,1))) ≠ 0 := by
    rw [hc]
    exact (not_congr (hv _)).symm
  rw [hneq, crossProduct_ne_zero_iff_linearIndependent, LinearIndependent.pair_iff]
  constructor
  · intro h a b hab
    have he0 : L (a,b) = 0 := by
      apply (hv _).mp
      rw [he]
      simpa [vec3] using hab
    have hz := h (he0.trans (map_zero L).symm)
    exact ⟨congrArg Prod.fst hz, congrArg Prod.snd hz⟩
  · intro h v w heq
    have he0 : L (v.1-w.1,v.2-w.2) = 0 := by
      change L (v-w) = 0
      rw [map_sub, heq, sub_self]
    have hz := h (v.1-w.1) (v.2-w.2) (by
      have := (hv _).mpr he0
      rw [he] at this
      simpa [vec3] using this)
    exact Prod.ext (sub_eq_zero.mp hz.1) (sub_eq_zero.mp hz.2)

def coreP (c : ℝ) : ℝ := c^2-3*c+1
def phaseD (c : ℝ) : ℝ := 1-c+c^2

theorem phaseD_pos (c : ℝ) : 0 < phaseD c := by
  unfold phaseD
  nlinarith [sq_nonneg (c-1/2)]

theorem numerator_on_N_zero (c : ℝ) :
    (1-(1-c)/2)*c^2*(2-c) - ((1-c)/2)*(1-c)^2*(1+c) =
      -(1+c)*coreP c/2 := by unfold coreP; ring

theorem observation_zero_iff {p : ℝ × ℝ} (hp : p ∈ observationDomain)
    (hc : 0 < Real.cos p.1) :
    observationMap p = 0 ↔
      (Real.cos p.1 = 1 ∧ p.2 = 1) ∨
      (coreP (Real.cos p.1) = 0 ∧ p.2 = (1-Real.cos p.1)/2) := by
  have hq := qChart_ne_zero hp
  constructor
  · intro hz
    have hn := congrArg Prod.fst hz
    have hm := congrArg Prod.snd hz
    change observationN p = 0 at hn
    change observationM p = 0 at hm
    have hh : observationNumerator p = 0 := (div_eq_zero_iff.mp hm).resolve_right hq
    by_cases h1 : Real.cos p.1 = 1
    · left; refine ⟨h1, ?_⟩
      norm_num [observationNumerator, h1] at hh
      linarith
    · have hu : p.2 = (1-Real.cos p.1)/2 := by
        unfold observationN at hn
        have := (mul_eq_zero.mp hn).resolve_left (sub_ne_zero.mpr (Ne.symm h1))
        linarith
      right; refine ⟨?_,hu⟩
      rw [observationNumerator,hu,numerator_on_N_zero] at hh
      have hp0 := mul_eq_zero.mp ((div_eq_zero_iff.mp hh).resolve_right (by norm_num : (2:ℝ) ≠ 0))
      exact hp0.resolve_left (by linarith)
  · rintro (⟨hc1,hu⟩ | ⟨hP,hu⟩)
    · ext <;> simp [observationMap,observationN,observationM,observationNumerator,hc1,hu]
    · ext
      · change (1-Real.cos p.1)*(1-Real.cos p.1-2*p.2)=0
        rw [hu]; ring
      · simp only [observationMap,observationM,observationNumerator,hu,
          numerator_on_N_zero,hP,mul_zero,zero_div,Prod.snd_zero]

theorem areaVector_zero_iff_observation_zero {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) (hc : 0 < Real.cos p.1) :
    areaVector p = 0 ↔ observationMap p = 0 := by
  rw [areaVector_eq hp]
  constructor
  · intro h
    exact Prod.ext (congrArg (fun v : ℝ × ℝ × ℝ => v.2.2) h)
      (congrArg (fun v : ℝ × ℝ × ℝ => v.1) h)
  · intro h
    rcases (observation_zero_iff hp hc).mp h with h1 | h2
    · rcases h1 with ⟨hc1,hu⟩
      have hs : Real.sin p.1 = 0 := by nlinarith [Real.sin_sq_add_cos_sq p.1]
      have hm := congrArg Prod.snd h
      have hn := congrArg Prod.fst h
      ext <;> simp_all [observationMap]
    · rcases h2 with ⟨hP,hu⟩
      have hm := congrArg Prod.snd h
      have hn := congrArg Prod.fst h
      have hmid : 2*p.2-Real.cos p.1*(2-Real.cos p.1) = 0 := by
        unfold coreP at hP
        rw [hu]; nlinarith
      ext <;> simp_all [observationMap]

theorem interior_regular_iff {p : ℝ × ℝ} (hp : p ∈ observationDomain)
    (hc : 0 < Real.cos p.1) :
    Function.Injective (fderiv ℝ ruledSurface p) ↔ observationMap p ≠ 0 := by
  rw [differential_injective_iff_cross]
  exact not_congr (areaVector_zero_iff_observation_zero hp hc)

theorem ruling_metric_range {c : ℝ} (hc0 : 0 ≤ c) (hc1 : c ≤ 1) :
    1 ≤ 2*c^2-6*c+5 ∧ 2*c^2-6*c+5 ≤ 5 := by
  constructor
  · nlinarith [mul_nonneg (show 0 ≤ 1-c by linarith) (show 0 ≤ 4-2*c by linarith)]
  · nlinarith [mul_nonneg hc0 (show 0 ≤ 6-2*c by linarith)]


theorem paired_label_image_at_u_one (t : ℝ) : ruledSurface (-t,1)=ruledSurface (t,1) := by
  simp [ruledSurface,qChart,qSq]

end
end RuledV5
