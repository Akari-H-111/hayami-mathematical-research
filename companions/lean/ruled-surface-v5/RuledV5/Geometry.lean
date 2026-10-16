import RuledV5.Boundary
import StokesV5.Skeleton

namespace RuledV5
noncomputable section
open StokesV5

def dot3 (v w : ℝ × ℝ × ℝ) : ℝ := v.1*w.1+v.2.1*w.2.1+v.2.2*w.2.2

theorem ruling_hasFDerivAt {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    HasFDerivAt tangentU
      ((rowCLM (2*Real.sin p.1) 0).prod
        ((rowCLM (-Real.cos p.1) 0).prod (rowCLM (dQdt p) 0))) p := by
  have hc := (Real.hasDerivAt_cos p.1).comp_hasFDerivAt p
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))
  have hs := (Real.hasDerivAt_sin p.1).comp_hasFDerivAt p
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))
  have h := (((hasFDerivAt_const (1 : ℝ) p).sub hc).const_mul 2).prodMk
    (hs.neg.prodMk (qChart_comp_hasFDerivAt hp))
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_fderiv
  ext v <;> simp [rowCLM] <;> ring

theorem ruling_mixed_derivative {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    fderiv ℝ tangentU p (1,0)=(2*Real.sin p.1,-Real.cos p.1,dQdt p) := by
  rw [(ruling_hasFDerivAt hp).fderiv]
  simp [rowCLM]

theorem scalar_triple_product {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    dot3 (areaVector p) (fderiv ℝ tangentU p (1,0)) =
      -coreP (Real.cos p.1)*Real.sin p.1/qChart p.1 := by
  rw [areaVector_eq hp,ruling_mixed_derivative hp]
  have hq := qChart_sq hp
  have hs2 : Real.sin p.1^2=1-Real.cos p.1^2 := by nlinarith [Real.sin_sq_add_cos_sq p.1]
  unfold dot3 observationM observationNumerator observationN dQdt coreP
  field_simp [qChart_ne_zero hp]
  unfold qSq at hq
  try simp only [hq,hs2]
  ring

theorem first_form_G {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    dot3 (fderiv ℝ ruledSurface p (0,1)) (fderiv ℝ ruledSurface p (0,1))=
      2*(Real.cos p.1)^2-6*Real.cos p.1+5 := by
  rw [(surface_fderiv_basis hp).2]
  have hq := qChart_sq hp
  have hs2 : Real.sin p.1^2=1-Real.cos p.1^2 := by nlinarith [Real.sin_sq_add_cos_sq p.1]
  simp only [dot3,tangentU]
  unfold qSq at hq
  nlinarith [Real.sin_sq_add_cos_sq p.1, hq]

theorem first_form_F {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    dot3 (fderiv ℝ ruledSurface p (1,0)) (fderiv ℝ ruledSurface p (0,1))=
      Real.sin p.1*((3-2*Real.cos p.1)*p.2-(2-Real.cos p.1)) := by
  rw [(surface_fderiv_basis hp).1,(surface_fderiv_basis hp).2]
  unfold dot3 tangentT tangentU dQdt
  field_simp [qChart_ne_zero hp]
  ring

theorem first_form_E {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    dot3 (fderiv ℝ ruledSurface p (1,0)) (fderiv ℝ ruledSurface p (1,0))=
      1+(-4*(Real.sin p.1)^2-2*(Real.cos p.1)^2)*p.2+
      (4*(Real.sin p.1)^2+(Real.cos p.1)^2+
        (Real.sin p.1)^2*(1-Real.cos p.1)^2/(qChart p.1)^2)*p.2^2 := by
  rw [(surface_fderiv_basis hp).1]
  have hs2 : Real.sin p.1^2=1-Real.cos p.1^2 := by nlinarith [Real.sin_sq_add_cos_sq p.1]
  unfold dot3 tangentT dQdt
  field_simp [qChart_ne_zero hp]
  simp only [hs2]
  ring

theorem coreP_root_iff {c : ℝ} (hc0 : 0 ≤ c) (hc1 : c ≤ 1) :
    coreP c=0 ↔ c=(3-Real.sqrt 5)/2 := by
  have hsq : (Real.sqrt 5)^2=5 := Real.sq_sqrt (by norm_num)
  have hs0 := Real.sqrt_nonneg (5 : ℝ)
  have hs2 : 2 < Real.sqrt 5 := by nlinarith
  unfold coreP
  constructor
  · intro h
    have hprod : (2*c-3+Real.sqrt 5)*(2*c-3-Real.sqrt 5)=0 := by nlinarith
    have hneg : 2*c-3-Real.sqrt 5 ≠ 0 := by nlinarith
    have hz := (mul_eq_zero.mp hprod).resolve_right hneg
    linarith
  · intro h
    rw [h]
    nlinarith

theorem lateral_jacobian {p : ℝ × ℝ} (hp : p ∈ observationDomain)
    (hP : coreP (Real.cos p.1)=0) (hu : p.2=(1-Real.cos p.1)/2) :
    observationJacobian p = -5*Real.sin p.1*(1-Real.cos p.1)^2/qChart p.1 := by
  rw [observationJacobian_factorization hp,hu]
  have he (c : ℝ) : 2*(AR c+(1-c)/2*BR c)-5*(1-c)^2*(c*(2-c))=
      -(c-1)*coreP c*(2*c^2-6*c+1) := by unfold AR BR coreP; ring
  have h := he (Real.cos p.1)
  rw [hP,mul_zero,zero_mul] at h
  have hq := qChart_sq hp
  unfold qSq at hq
  field_simp [qChart_ne_zero hp]
  rw [hq]
  linear_combination -Real.sin p.1*h

theorem observation_even (t u : ℝ) : observationMap (-t,u)=observationMap (t,u) := by
  simp [observationMap,observationN,observationM,observationNumerator,qChart,qSq]

theorem jacobian_odd {t u : ℝ} (hp : (t,u) ∈ observationDomain) :
    observationJacobian (-t,u)= -observationJacobian (t,u) := by
  have hp' : (-t,u) ∈ observationDomain := by simpa [observationDomain,qSq] using hp
  rw [observationJacobian_factorization hp',observationJacobian_factorization hp]
  simp [qChart,qSq]
  ring

theorem polar_observation_zero : observationMap (0,1)=0 := by
  norm_num [observationMap,observationN,observationM,observationNumerator,qChart,qSq]

theorem polar_jacobian_zero : observationJacobian (0,1)=0 := by
  rw [observationJacobian_factorization (by norm_num [observationDomain,qSq])]
  norm_num

theorem skeleton_equation_iff {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    observationM p=0 ↔ p.2=(Real.cos p.1)^2*(2-Real.cos p.1)/phaseD (Real.cos p.1) := by
  have hq := qChart_ne_zero hp
  have hd := ne_of_gt (phaseD_pos (Real.cos p.1))
  rw [observationM,div_eq_zero_iff]
  simp only [hq,or_false]
  have he : observationNumerator p=(Real.cos p.1)^2*(2-Real.cos p.1)-p.2*phaseD (Real.cos p.1) := by
    unfold observationNumerator phaseD; ring
  rw [he,eq_div_iff hd]
  constructor <;> intro h <;> linarith

end
end RuledV5
