import StokesV5.RadialMonotonicity
import StokesV5.Discriminant

namespace StokesV5
noncomputable section
open scoped Topology ContDiff

def radialX (c : ℝ) : ℝ := c + 2 * uFoldR c * (1 - c)
def radialZ (c : ℝ) : ℝ := uFoldR c * qC c
def radialRadiusSquared (c : ℝ) : ℝ :=
  radialX c ^ 2 + (1 - uFoldR c) ^ 2 * (1 - c ^ 2) + radialZ c ^ 2
def radialRadius (c : ℝ) : ℝ := Real.sqrt (radialRadiusSquared c)
def radialImage (c σ : ℝ) : ℝ × ℝ × ℝ :=
  (radialX c / radialRadius c,
    σ * (1 - uFoldR c) * Real.sqrt (1 - c ^ 2) / radialRadius c,
    radialZ c / radialRadius c)

theorem radialRadiusSquared_eq {c : ℝ} (hq : 0 < c * (2 - c)) (hB : BR c ≠ 0) :
    radialRadiusSquared c = radialRPoly.eval c / BR c ^ 2 := by
  have hsq : qC c ^ 2 = c * (2 - c) := Real.sq_sqrt (le_of_lt hq)
  rw [radialRPoly_sum_squares]
  unfold radialRadiusSquared radialX radialZ uFoldR
  rw [mul_pow, hsq]
  field_simp [hB]
  ring

theorem radialRadiusSquared_pos {c : ℝ} (hc : c ∈ Set.Icc physicalBoundary 1) :
    0 < radialRadiusSquared c := by
  have hc0 := le_trans physicalBoundary_spec.1 hc.1
  have hcpos : 0 < c := by linarith
  have hB := ne_of_lt (BR_neg_on_physical hc0 hc.2)
  rw [radialRadiusSquared_eq (mul_pos hcpos (by linarith [hc.2])) hB]
  exact div_pos (radialRPoly_pos hc0 hc.2) (sq_pos_of_ne_zero hB)

theorem radialImage_unit {c σ : ℝ} (hc : c ∈ Set.Icc physicalBoundary 1) (hσ : σ ^ 2 = 1) :
    (radialImage c σ).1 ^ 2 + (radialImage c σ).2.1 ^ 2 + (radialImage c σ).2.2 ^ 2 = 1 := by
  have hcpos : 0 < c := by linarith [physicalBoundary_spec.1, hc.1]
  have hs : 0 ≤ 1 - c ^ 2 := by nlinarith [hc.2]
  have hr0 : radialRadius c ≠ 0 := ne_of_gt (Real.sqrt_pos.2 (radialRadiusSquared_pos hc))
  have hr2 : radialRadius c ^ 2 = radialRadiusSquared c :=
    Real.sq_sqrt (le_of_lt (radialRadiusSquared_pos hc))
  simp only [radialImage, div_pow, mul_pow, hσ, one_mul, Real.sq_sqrt hs]
  rw [← add_div, ← add_div]
  change radialRadiusSquared c / radialRadius c ^ 2 = 1
  rw [hr2, div_self (ne_of_gt (radialRadiusSquared_pos hc))]

theorem radialImage_third_sq {c σ : ℝ} (hc : c ∈ Set.Icc physicalBoundary 1) :
    (radialImage c σ).2.2 ^ 2 = radialThirdSquared c := by
  have hc0 := le_trans physicalBoundary_spec.1 hc.1
  have hcpos : 0 < c := by linarith
  have hq : 0 < c * (2 - c) := mul_pos hcpos (by linarith [hc.2])
  have hB := ne_of_lt (BR_neg_on_physical hc0 hc.2)
  have hr2 : radialRadius c ^ 2 = radialRadiusSquared c :=
    Real.sq_sqrt (le_of_lt (radialRadiusSquared_pos hc))
  change (radialZ c / radialRadius c) ^ 2 = radialThirdSquared c
  rw [div_pow, hr2, radialRadiusSquared_eq hq hB]
  unfold radialZ uFoldR radialThirdSquared radialPPoly
  simp only [Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_X,
    Polynomial.eval_sub, Polynomial.eval_ofNat, radialNPoly_eval, mul_pow, div_pow]
  rw [show qC c ^ 2 = c * (2 - c) from Real.sq_sqrt (le_of_lt hq)]
  field_simp [hB]

theorem radialImage_third {c σ : ℝ} (hc : c ∈ Set.Icc physicalBoundary 1) :
    (radialImage c σ).2.2 = radialThird c := by
  have hB := ne_of_lt (BR_neg_on_physical (le_trans physicalBoundary_spec.1 hc.1) hc.2)
  have hu := (uFoldR_mem_unit_iff (by linarith [physicalBoundary_spec.1, hc.1]) hc.2 hB).mpr hc.1
  have hnonneg : 0 ≤ (radialImage c σ).2.2 :=
    div_nonneg (mul_nonneg hu.1 (Real.sqrt_nonneg _)) (Real.sqrt_nonneg _)
  have h := Real.sqrt_sq hnonneg
  rw [radialImage_third_sq hc] at h
  exact h.symm

theorem radialImage_third_boundary_max {c σ : ℝ} (hc : c ∈ Set.Icc physicalBoundary 1) :
    (radialImage c σ).2.2 ≤ Real.sqrt (physicalBoundary / 2) ∧
      ((radialImage c σ).2.2 = Real.sqrt (physicalBoundary / 2) ↔ c = physicalBoundary) := by
  rw [radialImage_third hc]
  exact radialThird_boundary_max hc

theorem radialImage_third_strictAntiOn (σ : ℝ) :
    StrictAntiOn (fun c => (radialImage c σ).2.2) (Set.Icc physicalBoundary 1) := by
  intro a ha b hb hab
  dsimp only
  rw [radialImage_third ha, radialImage_third hb]
  exact radialThird_strictAntiOn ha hb hab

theorem radialImage_mirror (c σ : ℝ) :
    radialImage c (-σ) =
      ((radialImage c σ).1, -(radialImage c σ).2.1, (radialImage c σ).2.2) := by
  simp [radialImage, neg_div]

theorem radialImage_at_one (σ : ℝ) : radialImage 1 σ = (1, 0, 0) := by
  norm_num [radialImage, radialRadius, radialRadiusSquared, radialX, radialZ,
    uFoldR_at_one, qC]

theorem radialImage_at_boundary (σ : ℝ) :
    radialImage physicalBoundary σ =
      (Real.sqrt ((2 - physicalBoundary) / 2), 0, Real.sqrt (physicalBoundary / 2)) := by
  have hb := physicalBoundary_mem_unit
  have hphys : physicalBoundary ∈ Set.Icc physicalBoundary 1 := ⟨le_rfl, hb.2⟩
  have hx : radialX physicalBoundary = 2 - physicalBoundary := by
    simp only [radialX, uFoldR_at_boundary]
    ring
  have hr : radialRadiusSquared physicalBoundary = 2 * (2 - physicalBoundary) := by
    have hsq : qC physicalBoundary ^ 2 = physicalBoundary * (2 - physicalBoundary) :=
      Real.sq_sqrt (by nlinarith [hb.1, hb.2])
    simp only [radialRadiusSquared, hx, radialZ, uFoldR_at_boundary, sub_self,
      zero_pow (by norm_num : 2 ≠ 0), zero_mul, one_mul, add_zero, hsq]
    ring
  have hR2 : radialRadius physicalBoundary ^ 2 = 2 * (2 - physicalBoundary) := by
    rw [radialRadius, Real.sq_sqrt (le_of_lt (radialRadiusSquared_pos hphys)), hr]
  have hrpos := Real.sqrt_pos.2 (radialRadiusSquared_pos hphys)
  have hquot : (radialX physicalBoundary / radialRadius physicalBoundary) ^ 2 =
      (2 - physicalBoundary) / 2 := by
    rw [div_pow, hx, hR2]
    field_simp [show 2 - physicalBoundary ≠ 0 by linarith [hb.2]]
  have hfirst : radialX physicalBoundary / radialRadius physicalBoundary =
      Real.sqrt ((2 - physicalBoundary) / 2) := by
    have hnn : 0 ≤ radialX physicalBoundary / radialRadius physicalBoundary :=
      div_nonneg (by rw [hx]; linarith [hb.2]) (le_of_lt hrpos)
    have heq := Real.sqrt_sq hnn
    rw [hquot] at heq
    exact heq.symm
  apply Prod.ext
  · exact hfirst
  · apply Prod.ext
    · simp [radialImage, uFoldR_at_boundary]
    · rw [radialImage_third hphys, radialThird, radialThirdSquared_at_boundary]

def surfaceFold (t : ℝ) : ℝ × ℝ × ℝ :=
  (Real.cos t + 2 * uFoldR (Real.cos t) * (1 - Real.cos t),
    (1 - uFoldR (Real.cos t)) * Real.sin t,
    uFoldR (Real.cos t) * qChart t)
def curveRadius (t : ℝ) : ℝ :=
  Real.sqrt ((surfaceFold t).1 ^ 2 + (surfaceFold t).2.1 ^ 2 + (surfaceFold t).2.2 ^ 2)
def radialCurve (t : ℝ) : ℝ × ℝ × ℝ :=
  ((surfaceFold t).1 / curveRadius t, (surfaceFold t).2.1 / curveRadius t,
    (surfaceFold t).2.2 / curveRadius t)

theorem curveRadius_eq_radialRadius (t : ℝ) : curveRadius t = radialRadius (Real.cos t) := by
  unfold curveRadius radialRadius radialRadiusSquared surfaceFold radialX radialZ qChart qSq qC
  congr 1
  simp only [mul_pow]
  have h : Real.sin t ^ 2 = 1 - Real.cos t ^ 2 := by
    nlinarith [Real.sin_sq_add_cos_sq t]
  rw [h]

theorem radialCurve_third {t : ℝ} (ht : Real.cos t ∈ Set.Icc physicalBoundary 1) :
    (radialCurve t).2.2 = radialThird (Real.cos t) := by
  change uFoldR (Real.cos t) * qC (Real.cos t) / curveRadius t = _
  rw [curveRadius_eq_radialRadius]
  exact radialImage_third (σ := 1) ht

theorem radialCurve_third_boundary_max {t : ℝ}
    (ht : Real.cos t ∈ Set.Icc physicalBoundary 1) :
    (radialCurve t).2.2 ≤ Real.sqrt (physicalBoundary / 2) ∧
      ((radialCurve t).2.2 = Real.sqrt (physicalBoundary / 2) ↔ Real.cos t = physicalBoundary) := by
  rw [radialCurve_third ht]
  exact radialThird_boundary_max ht

theorem surfaceFold_at_zero : surfaceFold 0 = (1, 0, 0) := by
  norm_num [surfaceFold, uFoldR_at_one, qChart, qSq]

theorem surfaceFold_hasDerivAt_zero : HasDerivAt surfaceFold (0, 1, 0) 0 := by
  have hu : HasDerivAt (fun t => uFoldR (Real.cos t)) 0 0 :=
    rationalCriticalGraph_hasDerivAt_zero.snd
  have hcos : HasDerivAt Real.cos 0 0 := by simpa using Real.hasDerivAt_cos 0
  have hsin : HasDerivAt Real.sin 1 0 := by simpa using Real.hasDerivAt_sin 0
  have hq : HasDerivAt qChart 0 0 := by
    have hqc : HasDerivAt qC (deriv qC 1) (Real.cos 0) := by
      simpa using ((qC_contDiffAt (c := 1) (by norm_num)).differentiableAt (by simp)).hasDerivAt
    have h := hqc.comp 0 hcos
    convert! h using 1 <;> (first | rfl | simp)
  have hx := hcos.add ((hu.const_mul 2).mul ((hasDerivAt_const 0 (1 : ℝ)).sub hcos))
  have hy := ((hasDerivAt_const 0 (1 : ℝ)).sub hu).mul hsin
  have hz := hu.mul hq
  have h := hx.prodMk (hy.prodMk hz)
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_deriv
  norm_num [uFoldR_at_one, qChart, qSq]

theorem radialCurve_hasDerivAt_zero : HasDerivAt radialCurve (0, 1, 0) 0 := by
  have hx : HasDerivAt (fun t => (surfaceFold t).1) 0 0 := surfaceFold_hasDerivAt_zero.fst
  have hy : HasDerivAt (fun t => (surfaceFold t).2.1) 1 0 := surfaceFold_hasDerivAt_zero.snd.fst
  have hz : HasDerivAt (fun t => (surfaceFold t).2.2) 0 0 := surfaceFold_hasDerivAt_zero.snd.snd
  have hsum := ((hx.pow 2).add (hy.pow 2)).add (hz.pow 2)
  have hsqrt := hsum.sqrt (by norm_num [surfaceFold_at_zero])
  have hrad : HasDerivAt curveRadius 0 0 := by
    apply (hsqrt.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_deriv
    norm_num [surfaceFold_at_zero]
  have hrval : curveRadius 0 = 1 := by norm_num [curveRadius, surfaceFold_at_zero]
  have h := (hx.div hrad (by rw [hrval]; norm_num)).prodMk
    ((hy.div hrad (by rw [hrval]; norm_num)).prodMk (hz.div hrad (by rw [hrval]; norm_num)))
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_deriv
  norm_num [surfaceFold_at_zero, hrval]

end
end StokesV5
