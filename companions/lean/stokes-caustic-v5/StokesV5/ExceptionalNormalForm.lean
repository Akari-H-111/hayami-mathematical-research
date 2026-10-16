import StokesV5.ExceptionalJet
import StokesV5.Discriminant
import Mathlib.Analysis.Calculus.InverseFunctionTheorem.Deriv

namespace StokesV5
noncomputable section
open Filter
open scoped Topology ContDiff

/-- Two-sided smooth local charts for the full fold-of-fold germ. -/
def HasFoldOfFoldNormalFormAt (f : (ℝ × ℝ) → ℝ × ℝ) (p : ℝ × ℝ) : Prop :=
  ∃ source target : (ℝ × ℝ) → ℝ × ℝ,
    IsSmoothChartAt source p ∧ IsSmoothChartAt target (f p) ∧
    source p = 0 ∧ target (f p) = 0 ∧
    (∀ᶠ x in nhds p, target (f x) =
      ((source x).1, (source x).1 * (source x).2 ^ 2 + (source x).2 ^ 4))

/-- The observation map before the ramification `c = cos t`. -/
def quotientObservationMap (p : ℝ × ℝ) : ℝ × ℝ :=
  ((1 - p.1) * (1 - p.1 - 2 * p.2),
    ((1 - p.2) * p.1 ^ 2 * (2 - p.1) -
      p.2 * (1 - p.1) ^ 2 * (1 + p.1)) / qC p.1)

theorem observationMap_factors (p : ℝ × ℝ) :
    observationMap p = quotientObservationMap (Real.cos p.1, p.2) := rfl

private def germW (c : ℝ) := 1 - c + c ^ 2
private def germP (c : ℝ) := -c ^ 4 + 3 * c ^ 3 - 3 * c + 1
private def germP2 (c a : ℝ) := -3 * a ^ 2 - 2 * a * c + 6 * a - c ^ 2 + 3 * c
private def germReduced (m c : ℝ) := (germP c + 2 * (1 - c) * m * qC c) / germW c

def exceptionalRemainder (c a : ℝ) : ℝ :=
  (germP2 c a + 2 * foldM a * ((1 - c) * qRemainder c a - qLinear a) - foldN a) /
    germW c

def exceptionalRemainderSlope (c a : ℝ) : ℝ :=
  (2 - 2 * a - c - 2 * foldM a * qRemainder c a - c * exceptionalRemainder 1 a) /
    germW c

def exceptionalRho (c a : ℝ) : ℝ :=
  Real.sqrt (exceptionalRemainder c a) +
    (1 - a) * exceptionalRemainderSlope c a /
      (Real.sqrt (exceptionalRemainder 1 a) + Real.sqrt (exceptionalRemainder c a))

def exceptionalAxis (a : ℝ) : ℝ := -2 * (1 - a) * Real.sqrt (exceptionalRemainder 1 a)

private theorem quotient_reduced {p : ℝ × ℝ} (hq : 0 < p.1 * (2 - p.1))
    (hw : germW p.1 ≠ 0) :
    (quotientObservationMap p).1 = germReduced (quotientObservationMap p).2 p.1 := by
  have hq0 : qC p.1 ≠ 0 := ne_of_gt (Real.sqrt_pos.2 hq)
  unfold quotientObservationMap germReduced germP germW at *
  field_simp [hq0, hw]
  ring

private theorem reduced_at_fold {a : ℝ} (hq : 0 < a * (2 - a)) (hw : germW a ≠ 0) :
    germReduced (foldM a) a = foldN a :=
  (quotient_reduced (p := (a, uFoldR a)) hq hw).symm

private theorem reduced_linear {a : ℝ} (ha : 0 < a * (2 - a)) (hB : BR a ≠ 0) :
    (-4 * a ^ 3 + 9 * a ^ 2 - 3) + 2 * foldM a * ((1 - a) * qLinear a - qC a) =
      foldN a * (2 * a - 1) := by
  have hq0 : qC a ≠ 0 := ne_of_gt (Real.sqrt_pos.2 ha)
  have hsq : qC a ^ 2 = a * (2 - a) := Real.sq_sqrt (le_of_lt ha)
  unfold foldM foldN uFoldR qLinear
  field_simp [hq0, hB]
  unfold AR BR
  ring_nf
  rw [hsq]
  ring

theorem exceptional_exact_fold_factor {c a : ℝ}
    (hc : 0 < c * (2 - c)) (ha : 0 < a * (2 - a))
    (hwc : germW c ≠ 0) (hwa : germW a ≠ 0) (hB : BR a ≠ 0)
    (hden : qC c + qC a + qLinear a * (c - a) ≠ 0) :
    germReduced (foldM a) c - foldN a = (c - a) ^ 2 * exceptionalRemainder c a := by
  have h0 := (div_eq_iff hwa).mp (reduced_at_fold ha hwa)
  have h1 := reduced_linear ha hB
  have hQ := qC_exact_quadratic hc ha hden
  have hP : germP c = germP a + (-4 * a ^ 3 + 9 * a ^ 2 - 3) * (c - a) +
      (c - a) ^ 2 * germP2 c a := by unfold germP germP2; ring
  have hW : germW c = germW a + (2 * a - 1) * (c - a) + (c - a) ^ 2 := by
    unfold germW; ring
  have hD : (1 - c) * qC c = (1 - a) * qC a +
      ((1 - a) * qLinear a - qC a) * (c - a) +
      (c - a) ^ 2 * ((1 - c) * qRemainder c a - qLinear a) := by rw [hQ]; ring
  have he : germP c + 2 * foldM a * ((1 - c) * qC c) - foldN a * germW c =
      (c - a) ^ 2 * (germP2 c a +
        2 * foldM a * ((1 - c) * qRemainder c a - qLinear a) - foldN a) := by
    rw [hP, hD, hW]
    linear_combination h0 + (c - a) * h1
  unfold germReduced exceptionalRemainder
  field_simp [hwc]
  linear_combination he

theorem exceptional_remainder_boundary_difference {c a : ℝ} (hw : germW c ≠ 0) :
    exceptionalRemainder 1 a - exceptionalRemainder c a =
      (1 - c) * exceptionalRemainderSlope c a := by
  unfold exceptionalRemainderSlope
  have h1 : exceptionalRemainder 1 a =
      germP2 1 a - 2 * foldM a * qLinear a - foldN a := by
    norm_num [exceptionalRemainder, germW]; ring
  rw [h1]
  unfold exceptionalRemainder
  field_simp [hw]
  unfold germP2 germW
  ring

theorem exceptional_coefficients_at_one :
    exceptionalRemainder 1 1 = 3 ∧ exceptionalRho 1 1 = Real.sqrt 3 ∧
    exceptionalAxis 1 = 0 := by
  norm_num [exceptionalRemainder, exceptionalRho, exceptionalAxis,
    germP2, germW, foldM, foldN, uFoldR, AR, BR, qLinear, qRemainder, qC]

theorem exceptionalRemainder_contDiffAt :
    ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => exceptionalRemainder p.1 p.2) (1, 1) := by
  have hq1 := (qC_contDiffAt (c := 1) (by norm_num)).comp ((1, 1) : ℝ × ℝ) contDiffAt_fst
  have hq2 := (qC_contDiffAt (c := 1) (by norm_num)).comp ((1, 1) : ℝ × ℝ) contDiffAt_snd
  have hm := (foldM_contDiffAt (c := 1) (by norm_num [BR]) (by norm_num)).comp
    ((1, 1) : ℝ × ℝ) contDiffAt_snd
  have hn := (foldN_contDiffAt (c := 1) (by norm_num [BR])).comp ((1, 1) : ℝ × ℝ) contDiffAt_snd
  have hl : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => qLinear p.2) (1, 1) := by
    unfold qLinear
    fun_prop (disch := norm_num [qC])
  have hr : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => qRemainder p.1 p.2) (1, 1) := by
    unfold qRemainder
    fun_prop (disch := norm_num [qC, qLinear])
  unfold exceptionalRemainder germP2 germW
  fun_prop (disch := norm_num)

theorem exceptionalRho_contDiffAt :
    ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => exceptionalRho p.1 p.2) (1, 1) := by
  have hK := exceptionalRemainder_contDiffAt
  have hK1 := hK.comp ((1, 1) : ℝ × ℝ) (contDiffAt_const (c := (1 : ℝ)).prodMk (contDiffAt_snd (E := ℝ) (F := ℝ)))
  have hk := hK.sqrt (by norm_num [Function.comp_def, exceptional_coefficients_at_one.1])
  have hk1 := hK1.sqrt (by norm_num [Function.comp_def, exceptional_coefficients_at_one.1])
  have hm := (foldM_contDiffAt (c := 1) (by norm_num [BR]) (by norm_num)).comp
    ((1, 1) : ℝ × ℝ) contDiffAt_snd
  have hq1 := (qC_contDiffAt (c := 1) (by norm_num)).comp ((1, 1) : ℝ × ℝ) contDiffAt_fst
  have hq2 := (qC_contDiffAt (c := 1) (by norm_num)).comp ((1, 1) : ℝ × ℝ) contDiffAt_snd
  have hl : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => qLinear p.2) (1, 1) := by
    unfold qLinear
    fun_prop (disch := norm_num [qC])
  have hr : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => qRemainder p.1 p.2) (1, 1) := by
    unfold qRemainder
    fun_prop (disch := norm_num [qC, qLinear])
  have hL : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => exceptionalRemainderSlope p.1 p.2) (1, 1) := by
    unfold exceptionalRemainderSlope germW
    fun_prop (disch := norm_num)
  have hsum : Real.sqrt (exceptionalRemainder 1 1) +
      Real.sqrt (exceptionalRemainder 1 1) ≠ 0 := by
    rw [exceptional_coefficients_at_one.1]
    positivity
  unfold exceptionalRho
  exact hk.add (((contDiffAt_const.sub contDiffAt_snd).mul hL).div (hk1.add hk) hsum)


private theorem exceptional_square_difference {c a : ℝ} (hw : germW c ≠ 0)
    (hk : 0 < exceptionalRemainder c a) (hk1 : 0 < exceptionalRemainder 1 a) :
    (1 - c) * exceptionalRho c a =
      (1 - a) * Real.sqrt (exceptionalRemainder 1 a) -
        (c - a) * Real.sqrt (exceptionalRemainder c a) := by
  have hd := exceptional_remainder_boundary_difference (a := a) hw
  have hs := Real.sq_sqrt (le_of_lt hk)
  have hs1 := Real.sq_sqrt (le_of_lt hk1)
  have hsum : Real.sqrt (exceptionalRemainder 1 a) +
      Real.sqrt (exceptionalRemainder c a) ≠ 0 :=
    ne_of_gt (add_pos (Real.sqrt_pos.2 hk1) (Real.sqrt_pos.2 hk))
  unfold exceptionalRho
  field_simp [hsum]
  linear_combination (1 - a) * (hs - hs1 - hd)

private theorem exceptional_eventually : ∀ᶠ z : ℝ × ℝ in nhds (1, 1),
    0 < z.1 * (2 - z.1) ∧ germW z.1 ≠ 0 ∧
    0 < exceptionalRemainder z.1 z.2 ∧ 0 < exceptionalRho z.1 z.2 ∧
    germReduced (foldM z.2) z.1 =
      ((1 - z.1) * exceptionalRho z.1 z.2) ^ 2 +
        exceptionalAxis z.2 * ((1 - z.1) * exceptionalRho z.1 z.2) := by
  have hq : ContinuousAt (fun z : ℝ × ℝ => z.1 * (2 - z.1)) (1, 1) := by fun_prop
  have hw : ContinuousAt (fun z : ℝ × ℝ => germW z.1) (1, 1) := by unfold germW; fun_prop
  have hb : ContinuousAt (fun z : ℝ × ℝ => BR z.2) (1, 1) := by unfold BR; fun_prop
  have hq2 : ContinuousAt (fun z : ℝ × ℝ => z.2 * (2 - z.2)) (1, 1) := by fun_prop
  have hw2 : ContinuousAt (fun z : ℝ × ℝ => germW z.2) (1, 1) := by unfold germW; fun_prop
  have hqc := (qC_contDiffAt (c := 1) (by norm_num)).continuousAt
  have hl : ContinuousAt qLinear 1 := by
    unfold qLinear
    exact (continuousAt_const.sub continuousAt_id).div hqc (by norm_num [qC])
  have hsum : ContinuousAt (fun z : ℝ × ℝ => qC z.1 + qC z.2 +
      qLinear z.2 * (z.1 - z.2)) (1, 1) := by fun_prop
  have hsum1 : ContinuousAt (fun z : ℝ × ℝ => qC 1 + qC z.2 +
      qLinear z.2 * (1 - z.2)) (1, 1) := by fun_prop
  have hK := exceptionalRemainder_contDiffAt.continuousAt
  have hK1 : ContinuousAt (fun z : ℝ × ℝ => exceptionalRemainder 1 z.2) (1, 1) :=
    hK.comp (g := fun z : ℝ × ℝ => exceptionalRemainder z.1 z.2)
      (f := fun z : ℝ × ℝ => ((1 : ℝ), z.2)) (x := (1, 1))
      (continuousAt_const.prodMk continuousAt_snd)
  have hρ := exceptionalRho_contDiffAt.continuousAt
  filter_upwards [hq.eventually (Ioi_mem_nhds (show (0 : ℝ) < 1 * (2 - 1) by norm_num)),
    hq2.eventually (Ioi_mem_nhds (show (0 : ℝ) < 1 * (2 - 1) by norm_num)),
    hw.eventually_ne (show germW 1 ≠ 0 by norm_num [germW]),
    hw2.eventually_ne (show germW 1 ≠ 0 by norm_num [germW]),
    hb.eventually_ne (show BR 1 ≠ 0 by norm_num [BR]),
    hsum.eventually_ne (show qC 1 + qC 1 + qLinear 1 * (1 - 1) ≠ 0 by norm_num [qC]),
    hsum1.eventually_ne (show qC 1 + qC 1 + qLinear 1 * (1 - 1) ≠ 0 by norm_num [qC]),
    hK.eventually (Ioi_mem_nhds (show 0 < exceptionalRemainder 1 1 by
      rw [exceptional_coefficients_at_one.1]; norm_num)),
    hK1.eventually (Ioi_mem_nhds (show 0 < exceptionalRemainder 1 1 by
      rw [exceptional_coefficients_at_one.1]; norm_num)),
    hρ.eventually (Ioi_mem_nhds (show 0 < exceptionalRho 1 1 by
      rw [exceptional_coefficients_at_one.2.1]; positivity))]
    with z hq hq2 hw hw2 hb hsum hsum1 hk hk1 hρ
  refine ⟨hq, hw, hk, hρ, ?_⟩
  have hf := exceptional_exact_fold_factor hq hq2 hw hw2 hb hsum
  have hf1 := exceptional_exact_fold_factor (c := 1) (by norm_num) hq2
    (by norm_num [germW]) hw2 hb hsum1
  have hz : germReduced (foldM z.2) 1 = 0 := by norm_num [germReduced, germP, germW]
  rw [hz] at hf1
  have hR := exceptional_square_difference hw hk hk1
  rw [hR]
  unfold exceptionalAxis
  have hs := Real.sq_sqrt (le_of_lt hk)
  have hs1 := Real.sq_sqrt (le_of_lt hk1)
  linear_combination hf - hf1 - (z.1 - z.2) ^ 2 * hs + (1 - z.2) ^ 2 * hs1

private theorem exceptionalAxis_smooth : ContDiffAt ℝ ∞ exceptionalAxis 1 := by
  have hK := exceptionalRemainder_contDiffAt.comp 1 (contDiffAt_const.prodMk contDiffAt_id)
  have hk := hK.sqrt (by norm_num [Function.comp_def, exceptional_coefficients_at_one.1])
  unfold exceptionalAxis
  fun_prop

private theorem exceptionalAxis_derivative : HasDerivAt exceptionalAxis (2 * Real.sqrt 3) 1 := by
  have hK := exceptionalRemainder_contDiffAt.comp 1 (contDiffAt_const.prodMk contDiffAt_id)
  have hk := hK.sqrt (by norm_num [Function.comp_def, exceptional_coefficients_at_one.1])
  have h := (((hasDerivAt_const 1 (-2 : ℝ)).mul
    ((hasDerivAt_const 1 (1 : ℝ)).sub (hasDerivAt_id 1))).mul
      (hk.differentiableAt (by simp)).hasDerivAt)
  apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_deriv
  simp [exceptional_coefficients_at_one.1]

private theorem foldM_inverse : ∃ r : ℝ → ℝ,
    ContDiffAt ℝ ∞ r 1 ∧ r 1 = 1 ∧ HasDerivAt r (1 / 3) 1 ∧
    (∀ᶠ m in nhds (1 : ℝ), foldM (r m) = m) := by
  have hm := foldM_contDiffAt (c := 1) (by norm_num [BR]) (by norm_num)
  have hd := foldM_hasDerivAt_one
  have hv : foldM 1 = 1 := by norm_num [foldM, uFoldR, AR, BR, qC]
  let e : ℝ ≃L[ℝ] ℝ := .unitsEquivAut ℝ (Units.mk0 3 (by norm_num))
  have hde : HasFDerivAt foldM (e : ℝ →L[ℝ] ℝ) 1 := hd.hasFDerivAt_equiv (by norm_num)
  let r : ℝ → ℝ := hm.localInverse hde (by simp)
  have hr : ContDiffAt ℝ ∞ r (foldM 1) := hm.to_localInverse hde (by simp)
  have hr0 : r (foldM 1) = 1 := hm.localInverse_apply_image hde (by simp)
  have hi : ∀ᶠ m in nhds (foldM 1), foldM (r m) = m :=
    (hm.hasStrictFDerivAt' hde (by simp)).eventually_right_inverse
  rw [hv] at hr hr0 hi
  have hcomp := (hr0 ▸ hd).comp 1 (hr.differentiableAt (by simp)).hasDerivAt
  have heq : (fun m => foldM (r m)) =ᶠ[nhds (1 : ℝ)] id := hi
  have he := (hcomp.congr_of_eventuallyEq heq.symm).unique (hasDerivAt_id 1)
  have hrd : HasDerivAt r (1 / 3) 1 := by
    apply (hr.differentiableAt (by simp)).hasDerivAt.congr_deriv
    linarith
  exact ⟨r, hr, hr0, hrd, hi⟩

def exceptionalNormalSource (r : ℝ → ℝ) (p : ℝ × ℝ) : ℝ × ℝ :=
  (exceptionalAxis (r (observationM p)),
    Real.sqrt (2 * exceptionalRho (Real.cos p.1) (r (observationM p))) * Real.sin (p.1 / 2))

def exceptionalNormalTarget (r : ℝ → ℝ) (z : ℝ × ℝ) : ℝ × ℝ :=
  (exceptionalAxis (r z.2), z.1)

theorem exceptionalNormalSource_equivariant (r : ℝ → ℝ) (p : ℝ × ℝ) :
    exceptionalNormalSource r (-p.1, p.2) =
      ((exceptionalNormalSource r p).1, -(exceptionalNormalSource r p).2) := by
  simp [exceptionalNormalSource, observationM, observationNumerator, qChart, qSq,
    neg_div, Real.cos_neg, Real.sin_neg]

private theorem exceptional_y_square (r : ℝ → ℝ) {p : ℝ × ℝ}
    (hρ : 0 ≤ exceptionalRho (Real.cos p.1) (r (observationM p))) :
    (exceptionalNormalSource r p).2 ^ 2 =
      (1 - Real.cos p.1) * exceptionalRho (Real.cos p.1) (r (observationM p)) := by
  have hc : 1 - Real.cos p.1 = 2 * Real.sin (p.1 / 2) ^ 2 := by
    have h := Real.cos_two_mul (p.1 / 2)
    rw [show 2 * (p.1 / 2) = p.1 by ring] at h
    nlinarith [Real.sin_sq_add_cos_sq (p.1 / 2)]
  simp only [exceptionalNormalSource, mul_pow, Real.sq_sqrt (mul_nonneg (show (0 : ℝ) ≤ 2 by norm_num) hρ)]
  rw [hc]
  ring

private theorem exceptional_charts {r : ℝ → ℝ}
    (hr : ContDiffAt ℝ ∞ r 1) (hr0 : r 1 = 1) (hrd : HasDerivAt r (1 / 3) 1)
    (hinv : ∀ᶠ m in nhds (1 : ℝ), foldM (r m) = m) :
    IsSmoothChartAt (exceptionalNormalSource r) 0 ∧
    IsSmoothChartAt (exceptionalNormalTarget r) (observationMap 0) ∧
    exceptionalNormalSource r 0 = 0 ∧ exceptionalNormalTarget r (observationMap 0) = 0 ∧
    (∀ᶠ p in nhds (0 : ℝ × ℝ), exceptionalNormalTarget r (observationMap p) =
      ((exceptionalNormalSource r p).1,
        (exceptionalNormalSource r p).1 * (exceptionalNormalSource r p).2 ^ 2 +
          (exceptionalNormalSource r p).2 ^ 4)) := by
  have hm0 : observationM 0 = 1 := by
    norm_num [observationM, observationNumerator, qChart, qSq]
  have hp : (0 : ℝ × ℝ) ∈ observationDomain := by norm_num [observationDomain, qSq]
  have hm := observationM_contDiffAt hp
  have hrc : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => r (observationM p)) 0 :=
    (hm0 ▸ hr).comp 0 hm
  have hrc0 : r (observationM 0) = 1 := by rw [hm0, hr0]
  have hpair : ContDiffAt ℝ ∞
      (fun p : ℝ × ℝ => (Real.cos p.1, r (observationM p))) 0 :=
    (by fun_prop : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => Real.cos p.1) 0).prodMk hrc
  have hpair0 : (Real.cos (0 : ℝ × ℝ).1, r (observationM 0)) = (1, 1) := by
    simp [hrc0]
  have hρ : ContDiffAt ℝ ∞
      (fun p : ℝ × ℝ => exceptionalRho (Real.cos p.1) (r (observationM p))) 0 := by
    have hh : ContDiffAt ℝ ∞ (fun z : ℝ × ℝ => exceptionalRho z.1 z.2)
        (Real.cos (0 : ℝ × ℝ).1, r (observationM 0)) := by
      rw [hpair0]; exact exceptionalRho_contDiffAt
    exact hh.comp 0 hpair
  have hρ0 : exceptionalRho (Real.cos (0 : ℝ × ℝ).1) (r (observationM 0)) = Real.sqrt 3 := by
    simpa [hrc0] using exceptional_coefficients_at_one.2.1
  have hroot : ContDiffAt ℝ ∞
      (fun p : ℝ × ℝ => Real.sqrt (2 * exceptionalRho (Real.cos p.1) (r (observationM p)))) 0 :=
    (contDiffAt_const.mul hρ).sqrt (by rw [hρ0]; positivity)
  have hX : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => exceptionalAxis (r (observationM p))) 0 := by
    have hA : ContDiffAt ℝ ∞ exceptionalAxis (r (observationM 0)) := by
      rw [hrc0]; exact exceptionalAxis_smooth
    exact hA.comp 0 hrc
  have hrcd : HasFDerivAt (fun p : ℝ × ℝ => r (observationM p)) (rowCLM 0 (-(1 / 3))) 0 := by
    have hd : HasDerivAt r (1 / 3) (observationM 0) := by rw [hm0]; exact hrd
    have h := hd.comp_hasFDerivAt 0 (observationM_hasFDerivAt hp)
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    norm_num [rowCLM, dMdt, dMdu, dNumeratorDt, dNumeratorDu, dQdt,
      observationNumerator, qChart, qSq]
  have hXd : HasFDerivAt (fun p : ℝ × ℝ => exceptionalAxis (r (observationM p)))
      (rowCLM 0 (-(2 * Real.sqrt 3 / 3))) 0 := by
    have hd : HasDerivAt exceptionalAxis (2 * Real.sqrt 3) (r (observationM 0)) := by
      rw [hrc0]; exact exceptionalAxis_derivative
    have h := hd.comp_hasFDerivAt 0 hrcd
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    simp [rowCLM] <;> ring
  have hsin : HasFDerivAt (fun p : ℝ × ℝ => Real.sin (p.1 / 2)) (rowCLM (1 / 2) 0) 0 := by
    have hhalf : HasFDerivAt (fun p : ℝ × ℝ => p.1 / 2)
        ((1 / 2 : ℝ) • ContinuousLinearMap.fst ℝ ℝ ℝ) 0 := by
      simpa only [one_div, div_eq_mul_inv, mul_comm, one_mul] using
        (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := 0)).const_mul (2 : ℝ)⁻¹
    have h := (Real.hasDerivAt_sin (0 / 2)).comp_hasFDerivAt 0 hhalf
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    norm_num [rowCLM]
  have hsrc : ContDiffAt ℝ ∞ (exceptionalNormalSource r) 0 :=
    hX.prodMk (hroot.mul (by fun_prop))
  have hsrcd : HasFDerivAt (exceptionalNormalSource r)
      ((rowCLM 0 (-(2 * Real.sqrt 3 / 3))).prod
        (rowCLM (Real.sqrt (2 * Real.sqrt 3) / 2) 0)) 0 := by
    have h := hXd.prodMk ((hroot.differentiableAt (by simp)).hasFDerivAt.mul hsin)
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    apply Prod.ext <;> simp [rowCLM, hrc0, exceptional_coefficients_at_one.2.1] <;> ring
  have hrt : ContDiffAt ℝ ∞ (fun z : ℝ × ℝ => r z.2) (observationMap 0) := by
    have hh : ContDiffAt ℝ ∞ r (observationMap 0).2 := by change ContDiffAt ℝ ∞ r (observationM 0); rw [hm0]; exact hr
    exact hh.comp (observationMap 0) contDiffAt_snd
  have hXt : ContDiffAt ℝ ∞ (fun z : ℝ × ℝ => exceptionalAxis (r z.2)) (observationMap 0) :=
    by
      have hA : ContDiffAt ℝ ∞ exceptionalAxis (r (observationMap 0).2) := by
        change ContDiffAt ℝ ∞ exceptionalAxis (r (observationM 0))
        rw [hrc0]; exact exceptionalAxis_smooth
      exact hA.comp (observationMap 0) hrt
  have hrtd : HasFDerivAt (fun z : ℝ × ℝ => r z.2) (rowCLM 0 (1 / 3)) (observationMap 0) := by
    have hh : HasDerivAt r (1 / 3) (observationMap 0).2 := by change HasDerivAt r (1 / 3) (observationM 0); rw [hm0]; exact hrd
    have h := hh.comp_hasFDerivAt (observationMap 0)
      (hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ))
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    simp [rowCLM]
  have htard : HasFDerivAt (exceptionalNormalTarget r)
      ((rowCLM 0 (2 * Real.sqrt 3 / 3)).prod (rowCLM 1 0)) (observationMap 0) := by
    have hd : HasDerivAt exceptionalAxis (2 * Real.sqrt 3) (r (observationMap 0).2) := by
      change HasDerivAt exceptionalAxis (2 * Real.sqrt 3) (r (observationM 0))
      rw [hrc0]; exact exceptionalAxis_derivative
    have h := (hd.comp_hasFDerivAt (observationMap 0) hrtd).prodMk (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ))
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    apply Prod.ext <;> simp [rowCLM] <;> ring
  refine ⟨smoothChart_of_rows hsrc hsrcd (by simp only [zero_mul, zero_sub, neg_mul, neg_neg]; positivity),
    smoothChart_of_rows (hXt.prodMk contDiffAt_fst) htard (by simp only [zero_mul, mul_one, zero_sub]; exact neg_ne_zero.mpr (by positivity)), ?_, ?_, ?_⟩
  · simp [exceptionalNormalSource, hrc0, exceptional_coefficients_at_one.2.2]
  · norm_num [exceptionalNormalTarget, observationMap, observationN, hrc0,
      exceptional_coefficients_at_one.2.2]
  · have hgood := (hpair0 ▸ exceptional_eventually).filter_mono hpair.continuousAt
    have hmt : Tendsto observationM (nhds (0 : ℝ × ℝ)) (nhds 1) := by
      simpa only [hm0] using hm.continuousAt.tendsto
    have hi := hinv.filter_mono hmt
    filter_upwards [hgood, hi] with p hp hi
    have hn := quotient_reduced (p := (Real.cos p.1, p.2)) hp.1 hp.2.1
    change observationN p = germReduced (observationM p) (Real.cos p.1) at hn
    have hf := hp.2.2.2.2
    rw [hi] at hf
    have hy := exceptional_y_square r (le_of_lt hp.2.2.2.1)
    apply Prod.ext
    · rfl
    · change observationN p = _
      rw [hn, hf, show (exceptionalNormalSource r p).2 ^ 4 =
        ((exceptionalNormalSource r p).2 ^ 2) ^ 2 by ring, hy]
      dsimp [exceptionalNormalSource]
      ring

/-- Actual normal-form witnesses with reflection equivariance for the same source chart. -/
theorem exceptional_equivariant_charts : ∃ r : ℝ → ℝ,
    IsSmoothChartAt (exceptionalNormalSource r) 0 ∧
    IsSmoothChartAt (exceptionalNormalTarget r) (observationMap 0) ∧
    exceptionalNormalSource r 0 = 0 ∧ exceptionalNormalTarget r (observationMap 0) = 0 ∧
    (∀ᶠ p in nhds (0 : ℝ × ℝ), exceptionalNormalTarget r (observationMap p) =
      ((exceptionalNormalSource r p).1,
        (exceptionalNormalSource r p).1 * (exceptionalNormalSource r p).2 ^ 2 +
          (exceptionalNormalSource r p).2 ^ 4)) ∧
    (∀ᶠ p in nhds (0 : ℝ × ℝ), exceptionalNormalSource r (-p.1, p.2) =
      ((exceptionalNormalSource r p).1, -(exceptionalNormalSource r p).2)) := by
  obtain ⟨r, hr, hr0, hrd, hi⟩ := foldM_inverse
  obtain ⟨hs, ht, hs0, ht0, he⟩ := exceptional_charts hr hr0 hrd hi
  exact ⟨r, hs, ht, hs0, ht0, he, Eventually.of_forall (exceptionalNormalSource_equivariant r)⟩

theorem exceptional_hasFoldOfFoldNormalFormAt :
    HasFoldOfFoldNormalFormAt observationMap (0, 0) := by
  obtain ⟨r, hs, ht, hs0, ht0, he, _⟩ := exceptional_equivariant_charts
  exact ⟨exceptionalNormalSource r, exceptionalNormalTarget r, hs, ht, hs0, ht0, he⟩

private theorem quotient_phase {p : ℝ × ℝ} (hp : 0 < p.1 * (2 - p.1)) :
    (quotientObservationMap p).2 = p.1 * qC p.1 - p.2 * phaseCoeff p.1 := by
  have hq0 : qC p.1 ≠ 0 := ne_of_gt (Real.sqrt_pos.2 hp)
  have hs : qC p.1 ^ 2 = p.1 * (2 - p.1) := Real.sq_sqrt (le_of_lt hp)
  unfold quotientObservationMap phaseCoeff
  field_simp [hq0]
  linear_combination -(p.1) * hs

private theorem quotientM_smooth :
    ContDiffAt ℝ ∞ (fun p => (quotientObservationMap p).2) (1, 0) := by
  have hq := (qC_contDiffAt (c := 1) (by norm_num)).comp ((1, 0) : ℝ × ℝ) contDiffAt_fst
  unfold quotientObservationMap
  fun_prop (disch := norm_num [qC])

private theorem quotientM_derivative :
    HasFDerivAt (fun p => (quotientObservationMap p).2) (rowCLM 1 (-1)) (1, 0) := by
  have hq : HasDerivAt qC 0 1 := by
    have h := ((hasDerivAt_id (1 : ℝ)).mul
      ((hasDerivAt_const 1 (2 : ℝ)).sub (hasDerivAt_id 1))).sqrt (by norm_num)
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_deriv
    norm_num
  have hqc := hq.comp_hasFDerivAt ((1, 0) : ℝ × ℝ)
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ))
  have hpc := phaseCoeff_contDiffAt_one.comp ((1, 0) : ℝ × ℝ) contDiffAt_fst
  have h := ((hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (1, 0))).mul hqc).sub
    ((hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (1, 0))).mul
      (hpc.differentiableAt (by simp)).hasFDerivAt)
  have he : (fun p : ℝ × ℝ => (quotientObservationMap p).2) =ᶠ[nhds (1, 0)]
      (fun p => p.1 * qC p.1 - p.2 * phaseCoeff p.1) := by
    have hc : ContinuousAt (fun p : ℝ × ℝ => p.1 * (2 - p.1)) (1, 0) := by fun_prop
    filter_upwards [hc.eventually (Ioi_mem_nhds (show (0 : ℝ) < 1 * (2 - 1) by norm_num))] with p hp
    exact quotient_phase hp
  apply (h.congr_of_eventuallyEq he).congr_fderiv
  apply ContinuousLinearMap.ext
  rintro ⟨v, w⟩
  norm_num [qC, phaseCoeff, rowCLM]
  ring

/-- The quotient map has actual Whitney coordinates at its ordinary fold. -/
theorem quotient_hasWhitneyNormalFormAt :
    HasWhitneyNormalFormAt quotientObservationMap (1, 0) := by
  obtain ⟨r, hr, hr0, hrd, hinv⟩ := foldM_inverse
  let M : (ℝ × ℝ) → ℝ := fun p => (quotientObservationMap p).2
  have hm0 : M (1, 0) = 1 := by norm_num [M, quotientObservationMap, qC]
  have hrc : ContDiffAt ℝ ∞ (fun p => r (M p)) (1, 0) :=
    (hm0 ▸ hr).comp (1, 0) quotientM_smooth
  have hrc0 : r (M (1, 0)) = 1 := by rw [hm0, hr0]
  have hpair : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => (p.1, r (M p))) (1, 0) :=
    contDiffAt_fst.prodMk hrc
  have hpair0 : (((1, 0) : ℝ × ℝ).1, r (M (1, 0))) = (1, 1) := by simp [hrc0]
  have hρ : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => exceptionalRho p.1 (r (M p))) (1, 0) := by
    have hh : ContDiffAt ℝ ∞ (fun z : ℝ × ℝ => exceptionalRho z.1 z.2)
        (((1, 0) : ℝ × ℝ).1, r (M (1, 0))) := by
      rw [hpair0]; exact exceptionalRho_contDiffAt
    exact hh.comp (1, 0) hpair
  have hρ0 : exceptionalRho 1 (r (M (1, 0))) = Real.sqrt 3 := by
    rw [hrc0]; exact exceptional_coefficients_at_one.2.1
  have hAbase : ContDiffAt ℝ ∞ exceptionalAxis (r (M (1, 0))) := by
    rw [hrc0]; exact exceptionalAxis_smooth
  have hAdbase : HasDerivAt exceptionalAxis (2 * Real.sqrt 3) (r (M (1, 0))) := by
    rw [hrc0]; exact exceptionalAxis_derivative
  have hX : ContDiffAt ℝ ∞ (fun p => exceptionalAxis (r (M p))) (1, 0) :=
    hAbase.comp (f := fun p => r (M p)) (g := exceptionalAxis) (1, 0) hrc
  have hrcd : HasFDerivAt (fun p => r (M p)) (rowCLM (1 / 3) (-(1 / 3))) (1, 0) := by
    have hd : HasDerivAt r (1 / 3) (M (1, 0)) := by rw [hm0]; exact hrd
    have h := hd.comp_hasFDerivAt (1, 0) quotientM_derivative
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    simp [rowCLM]
  have hXd : HasFDerivAt (fun p => exceptionalAxis (r (M p)))
      (rowCLM (2 * Real.sqrt 3 / 3) (-(2 * Real.sqrt 3 / 3))) (1, 0) := by
    have h := hAdbase.comp_hasFDerivAt (1, 0) hrcd
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    simp [rowCLM] <;> ring
  let source : (ℝ × ℝ) → ℝ × ℝ := fun p =>
    (r (M p) - 1, (1 - p.1) * exceptionalRho p.1 (r (M p)) + exceptionalAxis (r (M p)) / 2)
  let target : (ℝ × ℝ) → ℝ × ℝ := fun z =>
    (r z.2 - 1, z.1 + exceptionalAxis (r z.2) ^ 2 / 4)
  have hs : ContDiffAt ℝ ∞ source (1, 0) :=
    (hrc.sub contDiffAt_const).prodMk
      (((contDiffAt_const.sub contDiffAt_fst).mul hρ).add (hX.div_const 2))
  have hsd : HasFDerivAt source
      ((rowCLM (1 / 3) (-(1 / 3))).prod
        (rowCLM (-(2 * Real.sqrt 3 / 3)) (-(Real.sqrt 3 / 3)))) (1, 0) := by
    have h := (hrcd.sub_const 1).prodMk
      ((((hasFDerivAt_const 1 (1, 0)).sub
        (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ))).mul
          (hρ.differentiableAt (by simp)).hasFDerivAt).add (hXd.mul_const (2 : ℝ)⁻¹))
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    apply Prod.ext <;> simp [rowCLM, hrc0, exceptional_coefficients_at_one.2.1] <;> ring
  have htbase : quotientObservationMap (1, 0) = (0, 1) := by norm_num [quotientObservationMap, qC]
  have hrt : ContDiffAt ℝ ∞ (fun z : ℝ × ℝ => r z.2) (0, 1) :=
    hr.comp (0, 1) contDiffAt_snd
  have hXt : ContDiffAt ℝ ∞ (fun z : ℝ × ℝ => exceptionalAxis (r z.2)) (0, 1) :=
    by
      have hA : ContDiffAt ℝ ∞ exceptionalAxis (r (1 : ℝ)) := by
        rw [hr0]; exact exceptionalAxis_smooth
      exact hA.comp (0, 1) hrt
  have ht : ContDiffAt ℝ ∞ target (0, 1) := by dsimp [target]; fun_prop
  have hrtd : HasFDerivAt (fun z : ℝ × ℝ => r z.2) (rowCLM 0 (1 / 3)) (0, 1) := by
    have h := hrd.comp_hasFDerivAt ((0, 1) : ℝ × ℝ)
      (hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ))
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    simp [rowCLM]
  have htard : HasFDerivAt target ((rowCLM 0 (1 / 3)).prod (rowCLM 1 0)) (0, 1) := by
    have h := (hrtd.sub_const 1).prodMk
      ((hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (0, 1))).add
        (((hXt.differentiableAt (by simp)).hasFDerivAt.pow 2).mul_const (4 : ℝ)⁻¹))
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    apply Prod.ext <;> simp [rowCLM, hr0, exceptional_coefficients_at_one.2.2]
  refine ⟨source, target, smoothChart_of_rows hs hsd ?_, ?_, ?_, ?_, ?_⟩
  · have h3 : 0 < Real.sqrt (3 : ℝ) := by positivity
    nlinarith
  · rw [htbase]
    exact smoothChart_of_rows ht htard (by norm_num)
  · simp [source, hrc0, exceptional_coefficients_at_one.2.2]
  · simp [target, htbase, hr0, exceptional_coefficients_at_one.2.2]
  · have hg := (hpair0 ▸ exceptional_eventually).filter_mono hpair.continuousAt
    have hmt : Tendsto M (nhds ((1, 0) : ℝ × ℝ)) (nhds 1) := by
      simpa only [hm0] using (show ContinuousAt M (1, 0) from quotientM_smooth.continuousAt).tendsto
    have hi := hinv.filter_mono hmt
    filter_upwards [hg, hi] with p hp hi
    have hn := quotient_reduced (p := p) hp.1 hp.2.1
    have hf := hp.2.2.2.2
    change foldM (r (M p)) = M p at hi
    rw [hi] at hf
    apply Prod.ext
    · rfl
    · change (quotientObservationMap p).1 + exceptionalAxis (r (M p)) ^ 2 / 4 =
        ((1 - p.1) * exceptionalRho p.1 (r (M p)) + exceptionalAxis (r (M p)) / 2) ^ 2
      rw [hn, hf]
      ring

end
end StokesV5
