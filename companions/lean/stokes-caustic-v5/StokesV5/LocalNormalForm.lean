import StokesV5.WhitneyFold
import Mathlib.Analysis.Calculus.InverseFunctionTheorem.ContDiff

namespace StokesV5

noncomputable section
open Filter
open scoped Topology ContDiff

/-- A smooth coordinate chart, including a smooth two-sided local inverse. -/
def IsSmoothChartAt (g : (ℝ × ℝ) → (ℝ × ℝ)) (p : ℝ × ℝ) : Prop :=
  ContDiffAt ℝ ∞ g p ∧ ∃ h : (ℝ × ℝ) → (ℝ × ℝ),
    ContDiffAt ℝ ∞ h (g p) ∧ h (g p) = p ∧
    (∀ᶠ x in nhds p, h (g x) = x) ∧
    (∀ᶠ y in nhds (g p), g (h y) = y)

/-- Actual local coordinate equivalence with the Whitney fold, not a criterion. -/
def HasWhitneyNormalFormAt (f : (ℝ × ℝ) → (ℝ × ℝ)) (p : ℝ × ℝ) : Prop :=
  ∃ source target : (ℝ × ℝ) → (ℝ × ℝ),
    IsSmoothChartAt source p ∧ IsSmoothChartAt target (f p) ∧
    source p = 0 ∧ target (f p) = 0 ∧
    ∀ᶠ x in nhds p, target (f x) = ((source x).1, (source x).2 ^ 2)

private theorem rowPair_bijective {a b c d : ℝ} (h : a * d - b * c ≠ 0) :
    Function.Bijective ((rowCLM a b).prod (rowCLM c d)) := by
  constructor
  · rintro ⟨x, y⟩ ⟨z, w⟩ he
    have h1 := congrArg Prod.fst he
    have h2 := congrArg Prod.snd he
    simp only [ContinuousLinearMap.prod_apply, rowCLM_apply] at h1 h2
    have hx : (a * d - b * c) * (x - z) = 0 := by linear_combination d * h1 - b * h2
    have hy : (a * d - b * c) * (y - w) = 0 := by linear_combination a * h2 - c * h1
    exact Prod.ext (sub_eq_zero.mp ((mul_eq_zero.mp hx).resolve_left h))
      (sub_eq_zero.mp ((mul_eq_zero.mp hy).resolve_left h))
  · rintro ⟨x, y⟩
    refine ⟨((d * x - b * y) / (a * d - b * c),
      (a * y - c * x) / (a * d - b * c)), ?_⟩
    ext <;> simp only [ContinuousLinearMap.prod_apply, rowCLM_apply]
    · rw [← mul_div_assoc, ← mul_div_assoc, ← add_div]
      apply (div_eq_iff h).2
      ring
    · rw [← mul_div_assoc, ← mul_div_assoc, ← add_div]
      apply (div_eq_iff h).2
      ring

theorem smoothChart_of_rows {g : (ℝ × ℝ) → (ℝ × ℝ)} {p : ℝ × ℝ}
    (hg : ContDiffAt ℝ ∞ g p) {a b c d : ℝ}
    (hd : HasFDerivAt g ((rowCLM a b).prod (rowCLM c d)) p)
    (hdet : a * d - b * c ≠ 0) : IsSmoothChartAt g p := by
  let e : (ℝ × ℝ) ≃L[ℝ] (ℝ × ℝ) :=
    (LinearEquiv.ofBijective ((rowCLM a b).prod (rowCLM c d)).toLinearMap
      (rowPair_bijective hdet)).toContinuousLinearEquiv
  have hd' : HasFDerivAt g (e : (ℝ × ℝ) →L[ℝ] (ℝ × ℝ)) p := hd
  have hs := hg.hasStrictFDerivAt' hd' (by simp)
  exact ⟨hg, hg.localInverse hd' (by simp), hg.to_localInverse hd' (by simp),
    hg.localInverse_apply_image hd' (by simp), hs.eventually_left_inverse,
    hs.eventually_right_inverse⟩

theorem observationM_contDiffAt {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    ContDiffAt ℝ ∞ observationM p := by
  have hn : ContDiff ℝ ∞ observationNumerator := by unfold observationNumerator; fun_prop
  have hq : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => qChart x.1) p := by
    unfold qChart qSq
    apply ContDiffAt.sqrt (f := fun x : ℝ × ℝ => Real.cos x.1 * (2 - Real.cos x.1))
      _ (ne_of_gt hp)
    fun_prop
  exact hn.contDiffAt.div hq (qChart_ne_zero hp)

def symmetrySource (u₀ : ℝ) (p : ℝ × ℝ) : ℝ × ℝ :=
  (1 - u₀ - observationM p,
    2 * Real.sin (p.1 / 2) * Real.sqrt (p.2 - (1 - Real.cos p.1) / 2))

def symmetryTarget (u₀ : ℝ) (z : ℝ × ℝ) : ℝ × ℝ :=
  (1 - u₀ - z.2, -z.1)

theorem symmetry_normalForm_identity {u₀ : ℝ} {p : ℝ × ℝ}
    (hp : 0 ≤ p.2 - (1 - Real.cos p.1) / 2) :
    symmetryTarget u₀ (observationMap p) =
      ((symmetrySource u₀ p).1, (symmetrySource u₀ p).2 ^ 2) := by
  have hc : 1 - Real.cos p.1 = 2 * Real.sin (p.1 / 2) ^ 2 := by
    have h := Real.cos_two_mul (p.1 / 2)
    rw [show 2 * (p.1 / 2) = p.1 by ring] at h
    have hsc := Real.sin_sq_add_cos_sq (p.1 / 2)
    nlinarith
  ext
  · rfl
  · simp only [symmetryTarget, symmetrySource, observationMap, observationN,
      mul_pow, Real.sq_sqrt hp]
    rw [hc]
    ring

theorem symmetry_hasWhitneyNormalFormAt {u : ℝ} (hu : 0 < u) :
    HasWhitneyNormalFormAt observationMap (0, u) := by
  have hp : (0, u) ∈ observationDomain := by norm_num [observationDomain, qSq]
  have hr : ContDiffAt ℝ ∞
      (fun p : ℝ × ℝ => Real.sqrt (p.2 - (1 - Real.cos p.1) / 2)) (0, u) := by
    apply ContDiffAt.sqrt (by fun_prop)
    simpa using ne_of_gt hu
  have hsrc : ContDiffAt ℝ ∞ (symmetrySource u) (0, u) := by
    unfold symmetrySource
    exact ((contDiffAt_const.sub contDiffAt_const).sub (observationM_contDiffAt hp)).prodMk
      ((by fun_prop : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => 2 * Real.sin (p.1 / 2)) (0, u)).mul hr)
  have hsrcd : HasFDerivAt (symmetrySource u)
      ((rowCLM 0 1).prod (rowCLM (Real.sqrt u) 0)) (0, u) := by
    have hm := (hasFDerivAt_const (1 - u) (0, u)).sub (observationM_hasFDerivAt hp)
    have hhalf : HasFDerivAt (fun p : ℝ × ℝ => p.1 / 2)
        ((1 / 2 : ℝ) • ContinuousLinearMap.fst ℝ ℝ ℝ) (0, u) := by
      simpa only [one_div, div_eq_mul_inv, mul_comm, one_mul] using
        (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (0, u))).const_mul (2 : ℝ)⁻¹
    have hs := ((Real.hasDerivAt_sin (((0, u) : ℝ × ℝ).1 / 2)).comp_hasFDerivAt
      (0, u) hhalf).const_mul 2
    have h := hm.prodMk (hs.mul (hr.differentiableAt (by simp)).hasFDerivAt)
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    ext v <;> norm_num [rowCLM, dMdt, dMdu, dNumeratorDt, dNumeratorDu, dQdt,
      observationNumerator, qChart, qSq]
  have htar : ContDiff ℝ ∞ (symmetryTarget u) := by unfold symmetryTarget; fun_prop
  have htard : HasFDerivAt (symmetryTarget u)
      ((rowCLM 0 (-1)).prod (rowCLM (-1) 0)) (observationMap (0, u)) := by
    have h := ((hasFDerivAt_const (1 - u) (observationMap (0, u))).sub
      (hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := observationMap (0, u)))).prodMk
      ((hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := observationMap (0, u))).neg)
    convert h using 1 <;> ext v <;> simp [symmetryTarget, rowCLM]
  refine ⟨symmetrySource u, symmetryTarget u,
    smoothChart_of_rows hsrc hsrcd ?_, smoothChart_of_rows htar.contDiffAt htard (by norm_num),
    ?_, ?_, ?_⟩
  · simpa using ne_of_gt (Real.sqrt_pos.2 hu)
  · norm_num [symmetrySource, observationM, observationNumerator, qChart, qSq]
  · norm_num [symmetryTarget, observationMap, observationN, observationM,
      observationNumerator, qChart, qSq]
  · have hc : ContinuousAt (fun p : ℝ × ℝ => p.2 - (1 - Real.cos p.1) / 2) (0, u) :=
      by fun_prop
    have hev := hc.eventually (Ioi_mem_nhds (by simpa using hu))
    filter_upwards [hev] with p hp'
    exact symmetry_normalForm_identity (le_of_lt hp')

end
end StokesV5
