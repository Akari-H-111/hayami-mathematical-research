import StokesV5.LocalNormalForm
import StokesV5.RationalCoordinates
import Mathlib.Analysis.Calculus.InverseFunctionTheorem.Deriv

namespace StokesV5
noncomputable section
open Filter
open scoped Topology ContDiff

def rationalSource (r : ℝ → ℝ) (a₀ : ℝ) (p : ℝ × ℝ) : ℝ × ℝ :=
  (r (observationN p) - a₀,
    (Real.cos p.1 - r (observationN p)) *
      Real.sqrt (-foldRemainder (Real.cos p.1) (r (observationN p))))

def rationalTarget (r : ℝ → ℝ) (a₀ : ℝ) (z : ℝ × ℝ) : ℝ × ℝ :=
  (r z.1 - a₀, foldM (r z.1) - z.2)

private theorem fold_factor_eventually {a : ℝ}
    (ha0 : (613 : ℝ) / 1000 ≤ a) (ha1 : a < 1) :
    ∀ᶠ z : ℝ × ℝ in nhds (a, a),
      z.1 ≠ 1 ∧ foldRemainder z.1 z.2 < 0 ∧
      reducedM (foldN z.2) z.1 - foldM z.2 = (z.1 - z.2) ^ 2 * foldRemainder z.1 z.2 := by
  have haq : 0 < a * (2 - a) := mul_pos (by linarith) (by linarith)
  have hB : BR a ≠ 0 := ne_of_lt (BR_neg_on_physical ha0 (le_of_lt ha1))
  have hsum : qC a + qC a + qLinear a * (a - a) ≠ 0 := by
    simpa [qC] using ne_of_gt (add_pos (Real.sqrt_pos.2 haq) (Real.sqrt_pos.2 haq))
  have hq1 : ContinuousAt (fun z : ℝ × ℝ => z.1 * (2 - z.1)) (a, a) := by fun_prop
  have hq2 : ContinuousAt (fun z : ℝ × ℝ => z.2 * (2 - z.2)) (a, a) := by fun_prop
  have hb : ContinuousAt (fun z : ℝ × ℝ => BR z.2) (a, a) := by unfold BR; fun_prop
  have hs : ContinuousAt (fun z : ℝ × ℝ => qC z.1 + qC z.2 + qLinear z.2 * (z.1 - z.2))
      (a, a) := by
    have hqc : Continuous qC := by unfold qC; fun_prop
    have hal : ContinuousAt qLinear a := by
      exact (continuousAt_const.sub continuousAt_id).div hqc.continuousAt
        (ne_of_gt (Real.sqrt_pos.2 haq))
    have hl : ContinuousAt (fun z : ℝ × ℝ => qLinear z.2) (a, a) :=
      hal.comp (g := qLinear) (f := Prod.snd) (x := (a, a)) continuousAt_snd
    exact ((hqc.continuousAt.comp continuousAt_fst).add
      (hqc.continuousAt.comp continuousAt_snd)).add
      (hl.mul (continuousAt_fst.sub continuousAt_snd))
  have hK := (foldRemainder_contDiffAt_diagonal haq (ne_of_lt ha1) hB).continuousAt
  filter_upwards [hq1.eventually (Ioi_mem_nhds haq), hq2.eventually (Ioi_mem_nhds haq),
    continuousAt_fst.eventually_ne (ne_of_lt ha1), continuousAt_snd.eventually_ne (ne_of_lt ha1),
    hb.eventually_ne hB, hs.eventually_ne hsum,
    hK.eventually (Iio_mem_nhds (foldRemainder_diagonal_neg ha0 ha1))]
    with z hzq1 hzq2 hz1 hz2 hzB hzsum hzK
  exact ⟨hz1, hzK, reduced_exact_fold_factor hzq1 hzq2 hz1 hz2 hzB hzsum⟩

theorem rationalBranch_hasWhitneyNormalFormAt {t : ℝ}
    (hp : (t, uFoldR (Real.cos t)) ∈ observationDomain)
    (hc0 : (613 : ℝ) / 1000 ≤ Real.cos t) (hc1 : Real.cos t < 1)
    (hs : Real.sin t ≠ 0) :
    HasWhitneyNormalFormAt observationMap (t, uFoldR (Real.cos t)) := by
  let a := Real.cos t
  let p : ℝ × ℝ := (t, uFoldR a)
  have haq : 0 < a * (2 - a) := hp
  have hB : BR a ≠ 0 := ne_of_lt (BR_neg_on_physical hc0 (le_of_lt hc1))
  have hN := foldN_contDiffAt hB
  have hd := foldN_hasDerivAt hB
  have hd0 : foldNDerivative a ≠ 0 := ne_of_gt (foldNDerivative_pos hc0 hc1)
  let e : ℝ ≃L[ℝ] ℝ := .unitsEquivAut ℝ (Units.mk0 (foldNDerivative a) hd0)
  have hde : HasFDerivAt foldN (e : ℝ →L[ℝ] ℝ) a := hd.hasFDerivAt_equiv hd0
  let r := hN.localInverse hde (by simp)
  have hr : ContDiffAt ℝ ∞ r (foldN a) := hN.to_localInverse hde (by simp)
  have hr0 : r (foldN a) = a := hN.localInverse_apply_image hde (by simp)
  have hstrict := hN.hasStrictDerivAt' hd (by simp)
  have hrd : HasDerivAt r (foldNDerivative a)⁻¹ (foldN a) :=
    (hstrict.to_localInverse hd0).hasDerivAt
  have hright : ∀ᶠ x in nhds (foldN a), foldN (r x) = x :=
    (hN.hasStrictFDerivAt' hde (by simp)).eventually_right_inverse
  have hNp : observationN p = foldN a := rfl
  have hMp : observationM p = foldM a := rfl
  have hrp : r (observationN p) = a := (congrArg r hNp).trans hr0
  have hNc : ContDiffAt ℝ ∞ observationN p := by unfold observationN; fun_prop
  have hrc : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => r (observationN x)) p :=
    (hNp ▸ hr).comp p hNc
  have hcos : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => Real.cos x.1) p := by fun_prop
  have hpair : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => (Real.cos x.1, r (observationN x))) p :=
    hcos.prodMk hrc
  have hpairp : (Real.cos p.1, r (observationN p)) = (a, a) := by rw [hrp]
  have hK : ContDiffAt ℝ ∞
      (fun x : ℝ × ℝ => foldRemainder (Real.cos x.1) (r (observationN x))) p := by
    have hbase : ContDiffAt ℝ ∞ (fun z : ℝ × ℝ => foldRemainder z.1 z.2)
        (Real.cos p.1, r (observationN p)) := by
      rw [hpairp]
      exact foldRemainder_contDiffAt_diagonal haq (ne_of_lt hc1) hB
    exact hbase.comp p hpair
  have hKneg : foldRemainder (Real.cos p.1) (r (observationN p)) < 0 := by
    simpa only [hrp] using foldRemainder_diagonal_neg hc0 hc1
  have hroot : ContDiffAt ℝ ∞
      (fun x : ℝ × ℝ => Real.sqrt (-foldRemainder (Real.cos x.1) (r (observationN x)))) p :=
    hK.neg.sqrt (ne_of_gt (neg_pos.mpr hKneg))
  let ρ := (foldNDerivative a)⁻¹
  let k := Real.sqrt (-foldRemainder a a)
  have hk : 0 < k := Real.sqrt_pos.2 (neg_pos.mpr (foldRemainder_diagonal_neg hc0 hc1))
  have hrcd : HasFDerivAt (fun x : ℝ × ℝ => r (observationN x))
      (rowCLM (ρ * dNdt p) (ρ * dNdu p)) p := by
    have h := (hNp ▸ hrd).comp_hasFDerivAt p (observationN_hasFDerivAt p)
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    simp [rowCLM, ρ]
    ring
  have hcosd : HasFDerivAt (fun x : ℝ × ℝ => Real.cos x.1)
      (rowCLM (-Real.sin t) 0) p := by
    have h := (Real.hasDerivAt_cos p.1).comp_hasFDerivAt p
      (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    simp [rowCLM, p]
  have hsrc : ContDiffAt ℝ ∞ (rationalSource r a) p :=
    (hrc.sub contDiffAt_const).prodMk ((hcos.sub hrc).mul hroot)
  have hsrcd : HasFDerivAt (rationalSource r a)
      ((rowCLM (ρ * dNdt p) (ρ * dNdu p)).prod
        (rowCLM (k * (-Real.sin t - ρ * dNdt p)) (-k * ρ * dNdu p))) p := by
    have h := (hrcd.sub_const a).prodMk
      ((hcosd.sub hrcd).mul (hroot.differentiableAt (by simp)).hasFDerivAt)
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    apply Prod.ext <;> simp [rowCLM, hrp, p, a, k] <;> ring
  have hrbase : ContDiffAt ℝ ∞ r (observationMap p).1 := by
    change ContDiffAt ℝ ∞ r (observationN p)
    rw [hNp]
    exact hr
  have hrt : ContDiffAt ℝ ∞ (fun z : ℝ × ℝ => r z.1) (observationMap p) :=
    hrbase.comp (observationMap p) contDiffAt_fst
  have hfm : ContDiffAt ℝ ∞ foldM (r (observationMap p).1) := by
    change ContDiffAt ℝ ∞ foldM (r (observationN p))
    rw [hrp]
    exact foldM_contDiffAt hB haq
  have htar : ContDiffAt ℝ ∞ (rationalTarget r a) (observationMap p) :=
    (hrt.sub contDiffAt_const).prodMk
      ((hfm.comp (f := fun z : ℝ × ℝ => r z.1) (g := foldM)
        (observationMap p) hrt).sub contDiffAt_snd)
  have hrtd : HasFDerivAt (fun z : ℝ × ℝ => r z.1) (rowCLM ρ 0) (observationMap p) := by
    have h := (hNp ▸ hrd).comp_hasFDerivAt (observationMap p)
      (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ))
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    simp [rowCLM, ρ]
  have hmd : HasDerivAt foldM (deriv foldM a) a :=
    (foldM_contDiffAt hB haq).differentiableAt (by simp) |>.hasDerivAt
  have htard : HasFDerivAt (rationalTarget r a)
      ((rowCLM ρ 0).prod (rowCLM (deriv foldM a * ρ) (-1))) (observationMap p) := by
    have hmdr : HasDerivAt foldM (deriv foldM a) (r (observationMap p).1) := by
      change HasDerivAt foldM (deriv foldM a) (r (observationN p))
      rw [hrp]
      exact hmd
    have h := (hrtd.sub_const a).prodMk
      ((hmdr.comp_hasFDerivAt (observationMap p) hrtd).sub
        (hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ)))
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    apply Prod.ext <;> simp [rowCLM] <;> ring
  have hnu : dNdu p ≠ 0 := by
    unfold dNdu
    exact mul_ne_zero (by norm_num) (sub_ne_zero.mpr (ne_of_gt hc1))
  have hρ : ρ ≠ 0 := inv_ne_zero hd0
  refine ⟨rationalSource r a, rationalTarget r a,
    smoothChart_of_rows hsrc hsrcd ?_, smoothChart_of_rows htar htard ?_, ?_, ?_, ?_⟩
  · have heq : ρ * dNdt p * (-k * ρ * dNdu p) -
        ρ * dNdu p * (k * (-Real.sin t - ρ * dNdt p)) = k * ρ * dNdu p * Real.sin t := by ring
    rw [heq]
    exact mul_ne_zero (mul_ne_zero (mul_ne_zero (ne_of_gt hk) hρ) hnu) hs
  · simpa using hρ
  · change rationalSource r a p = 0
    unfold rationalSource
    rw [hrp]
    change (a - a, (a - a) * _) = 0
    simp
  · change (r (observationN p) - a, foldM (r (observationN p)) - observationM p) = 0
    rw [hrp, hMp]
    simp
  · have hgood := (hpairp ▸ fold_factor_eventually hc0 hc1).filter_mono hpair.continuousAt
    have hinv := hright.filter_mono hNc.continuousAt
    filter_upwards [hgood, hinv] with x hx hix
    have hobs := observationM_reduced hx.1
    have hfactor := hx.2.2
    rw [hix] at hfactor
    rw [← hobs] at hfactor
    ext
    · rfl
    · simp only [rationalTarget, rationalSource, observationMap, mul_pow,
        Real.sq_sqrt (le_of_lt (neg_pos.mpr hx.2.1))]
      nlinarith [hfactor]

end
end StokesV5
