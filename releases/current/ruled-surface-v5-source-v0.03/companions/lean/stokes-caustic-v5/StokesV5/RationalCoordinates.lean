import StokesV5.WhitneyFold
import Mathlib.Analysis.Calculus.InverseFunctionTheorem.ContDiff

namespace StokesV5
noncomputable section
open scoped Topology ContDiff

def qC (c : ℝ) : ℝ := Real.sqrt (c * (2 - c))
def foldN (c : ℝ) : ℝ := (1 - c) * (1 - c - 2 * uFoldR c)
def foldM (c : ℝ) : ℝ :=
  ((1 - uFoldR c) * c ^ 2 * (2 - c) - uFoldR c * (1 - c) ^ 2 * (1 + c)) / qC c
def foldNDerivative (c : ℝ) : ℝ := 2 * (c - 1) * r7R c / BR c ^ 2

theorem foldN_hasDerivAt {c : ℝ} (hB : BR c ≠ 0) :
    HasDerivAt foldN (foldNDerivative c) c := by
  have hA : HasDerivAt AR
      ((-1) * c * (2 - c) * (1 + 2 * c - c ^ 2) +
        (1 - c) * (2 - c) * (1 + 2 * c - c ^ 2) -
        (1 - c) * c * (1 + 2 * c - c ^ 2) +
        (1 - c) * c * (2 - c) * (2 - 2 * c)) c := by
    have h := ((((hasDerivAt_const c (1 : ℝ)).sub (hasDerivAt_id c)).mul (hasDerivAt_id c)).mul
      ((hasDerivAt_const c 2).sub (hasDerivAt_id c))).mul
      (((hasDerivAt_const c 1).add ((hasDerivAt_id c).const_mul 2)).sub
        ((hasDerivAt_id c).pow 2))
    apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_deriv
    dsimp
    ring
  have hBd : HasDerivAt BR (3 * c ^ 2 - 3) c := by
    have h := (((hasDerivAt_id c).pow 3).sub ((hasDerivAt_id c).const_mul 3)).add_const 1
    apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_deriv
    dsimp
    ring
  have hu := hA.neg.div hBd hB
  have h := ((hasDerivAt_const c 1).sub (hasDerivAt_id c)).mul
    (((hasDerivAt_const c 1).sub (hasDerivAt_id c)).sub (hu.const_mul 2))
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_deriv
  dsimp
  unfold foldNDerivative r7R
  field_simp [hB]
  unfold AR BR
  ring

theorem foldNDerivative_pos {c : ℝ} (hc0 : (613 : ℝ) / 1000 ≤ c) (hc1 : c < 1) :
    0 < foldNDerivative c := by
  have hB := BR_neg_on_physical hc0 (le_of_lt hc1)
  have hR := r7R_neg_on_unit (by linarith) (le_of_lt hc1)
  unfold foldNDerivative
  exact div_pos (mul_pos_of_neg_of_neg (by linarith) hR) (sq_pos_of_ne_zero (ne_of_lt hB))

theorem foldN_contDiffAt {c : ℝ} (hB : BR c ≠ 0) : ContDiffAt ℝ ∞ foldN c := by
  unfold foldN uFoldR AR BR
  fun_prop (disch := exact hB)

theorem foldM_contDiffAt {c : ℝ} (hB : BR c ≠ 0) (hq : 0 < c * (2 - c)) :
    ContDiffAt ℝ ∞ foldM c := by
  have hu : ContDiffAt ℝ ∞ uFoldR c := by
    unfold uFoldR AR BR
    fun_prop (disch := exact hB)
  have hQ : ContDiffAt ℝ ∞ qC c := by
    exact (by fun_prop : ContDiffAt ℝ ∞ (fun x : ℝ => x * (2 - x)) c).sqrt (ne_of_gt hq)
  unfold foldM
  apply ContDiffAt.div _ hQ (ne_of_gt (Real.sqrt_pos.2 hq))
  fun_prop

def reducedNumerator (x c : ℝ) : ℝ :=
  (c ^ 4 - 3 * c ^ 3 + c ^ 2 * x - c * x + 3 * c + x - 1) / 2
def reducedM (x c : ℝ) : ℝ := reducedNumerator x c / ((1 - c) * qC c)
def qLinear (a : ℝ) : ℝ := (1 - a) / qC a
def qRemainder (c a : ℝ) : ℝ :=
  -(1 + qLinear a ^ 2) / (qC c + qC a + qLinear a * (c - a))
def numeratorRemainder (c a : ℝ) : ℝ :=
  (c ^ 2 + 2 * a * c + 3 * a ^ 2 - 3 * c - 6 * a + foldN a) / 2
def foldRemainder (c a : ℝ) : ℝ :=
  (numeratorRemainder c a - foldM a * ((1 - c) * qRemainder c a - qLinear a)) /
    ((1 - c) * qC c)

theorem observationM_reduced {p : ℝ × ℝ} (hc : Real.cos p.1 ≠ 1) :
    observationM p = reducedM (observationN p) (Real.cos p.1) := by
  have hc' : 1 - Real.cos p.1 ≠ 0 := sub_ne_zero.mpr (Ne.symm hc)
  unfold observationM reducedM reducedNumerator observationN observationNumerator qC qChart qSq
  field_simp
  ring

theorem foldM_reduced {a : ℝ} (ha : a ≠ 1) : foldM a = reducedM (foldN a) a := by
  have ha' : 1 - a ≠ 0 := sub_ne_zero.mpr (Ne.symm ha)
  unfold foldM reducedM reducedNumerator foldN
  field_simp
  ring

theorem qC_exact_quadratic {c a : ℝ} (hc : 0 < c * (2 - c)) (ha : 0 < a * (2 - a))
    (hden : qC c + qC a + qLinear a * (c - a) ≠ 0) :
    qC c = qC a + qLinear a * (c - a) + (c - a) ^ 2 * qRemainder c a := by
  have hqa : qC a ≠ 0 := ne_of_gt (Real.sqrt_pos.2 ha)
  have hca : qC c ^ 2 = c * (2 - c) := Real.sq_sqrt (le_of_lt hc)
  have haa : qC a ^ 2 = a * (2 - a) := Real.sq_sqrt (le_of_lt ha)
  apply mul_right_cancel₀ hden
  unfold qRemainder
  field_simp [hden]
  unfold qLinear
  field_simp [hqa]
  ring_nf
  rw [hca, haa]
  rw [show qC a ^ 4 = (qC a ^ 2) ^ 2 by ring, haa]
  ring

theorem foldRemainder_diagonal {a : ℝ} (ha : 0 < a * (2 - a))
    (ha1 : a ≠ 1) (hB : BR a ≠ 0) :
    foldRemainder a a = -r7R a / (2 * (1 - a) * qC a ^ 3 * BR a) := by
  have hq0 : qC a ≠ 0 := ne_of_gt (Real.sqrt_pos.2 ha)
  have hq : qC a ^ 2 = a * (2 - a) := Real.sq_sqrt (le_of_lt ha)
  have ha' : 1 - a ≠ 0 := sub_ne_zero.mpr (Ne.symm ha1)
  unfold foldRemainder numeratorRemainder qRemainder qLinear foldM foldN uFoldR
  simp only [sub_self, mul_zero, add_zero]
  rw [show qC a + qC a = 2 * qC a by ring]
  field_simp [hq0, ha', hB]
  unfold AR BR r7R at *
  ring_nf
  simp only [show qC a ^ 4 = (qC a ^ 2) ^ 2 by ring, hq]
  ring

theorem numerator_exact_quadratic (c a : ℝ) :
    reducedNumerator (foldN a) c = reducedNumerator (foldN a) a +
      ((4 * a ^ 3 - 9 * a ^ 2 + 2 * a * foldN a - foldN a + 3) / 2) * (c - a) +
      (c - a) ^ 2 * numeratorRemainder c a := by
  unfold reducedNumerator numeratorRemainder
  ring

theorem reduced_linear_critical {a : ℝ} (ha : 0 < a * (2 - a))
    (ha1 : a ≠ 1) (hB : BR a ≠ 0) :
    (4 * a ^ 3 - 9 * a ^ 2 + 2 * a * foldN a - foldN a + 3) / 2 =
      foldM a * ((1 - a) * qLinear a - qC a) := by
  have hq0 : qC a ≠ 0 := ne_of_gt (Real.sqrt_pos.2 ha)
  have hq : qC a ^ 2 = a * (2 - a) := Real.sq_sqrt (le_of_lt ha)
  unfold foldM foldN uFoldR qLinear
  field_simp [hq0, hB]
  unfold AR BR
  ring_nf
  rw [hq]
  ring

theorem reduced_exact_fold_factor {c a : ℝ}
    (hc : 0 < c * (2 - c)) (ha : 0 < a * (2 - a))
    (hc1 : c ≠ 1) (ha1 : a ≠ 1) (hB : BR a ≠ 0)
    (hden : qC c + qC a + qLinear a * (c - a) ≠ 0) :
    reducedM (foldN a) c - foldM a = (c - a) ^ 2 * foldRemainder c a := by
  have hqa : qC a ≠ 0 := ne_of_gt (Real.sqrt_pos.2 ha)
  have hqc : qC c ≠ 0 := ne_of_gt (Real.sqrt_pos.2 hc)
  have hDa : (1 - a) * qC a ≠ 0 := mul_ne_zero (sub_ne_zero.mpr (Ne.symm ha1)) hqa
  have hDc : (1 - c) * qC c ≠ 0 := mul_ne_zero (sub_ne_zero.mpr (Ne.symm hc1)) hqc
  have hL0 : reducedNumerator (foldN a) a = foldM a * ((1 - a) * qC a) := by
    exact (div_eq_iff hDa).mp (foldM_reduced ha1).symm
  have hL1 := reduced_linear_critical ha ha1 hB
  have hQ := qC_exact_quadratic hc ha hden
  have hD : (1 - c) * qC c = (1 - a) * qC a +
      ((1 - a) * qLinear a - qC a) * (c - a) +
      (c - a) ^ 2 * ((1 - c) * qRemainder c a - qLinear a) := by
    rw [hQ]
    ring
  have hL := numerator_exact_quadratic c a
  have hcancel : reducedNumerator (foldN a) c - foldM a * ((1 - c) * qC c) =
      (c - a) ^ 2 *
        (numeratorRemainder c a - foldM a * ((1 - c) * qRemainder c a - qLinear a)) := by
    rw [hL, hL0, hL1, hD]
    ring
  unfold reducedM foldRemainder
  rw [← mul_div_assoc, div_sub' hDc]
  simpa only [mul_comm] using congrArg (fun x : ℝ => x / ((1 - c) * qC c)) hcancel

theorem foldRemainder_diagonal_neg {a : ℝ}
    (ha0 : (613 : ℝ) / 1000 ≤ a) (ha1 : a < 1) : foldRemainder a a < 0 := by
  have hapos : 0 < a := by linarith
  have haq : 0 < a * (2 - a) := mul_pos hapos (by linarith)
  have hB := BR_neg_on_physical ha0 (le_of_lt ha1)
  have hR := r7R_neg_on_unit (le_of_lt hapos) (le_of_lt ha1)
  rw [foldRemainder_diagonal haq (ne_of_lt ha1) (ne_of_lt hB)]
  exact div_neg_of_pos_of_neg (neg_pos.mpr hR)
    (mul_neg_of_pos_of_neg (mul_pos (mul_pos (by norm_num) (by linarith))
      (pow_pos (Real.sqrt_pos.2 haq) 3)) hB)

theorem qC_contDiffAt {c : ℝ} (hc : 0 < c * (2 - c)) : ContDiffAt ℝ ∞ qC c :=
  (by fun_prop : ContDiffAt ℝ ∞ (fun x : ℝ => x * (2 - x)) c).sqrt (ne_of_gt hc)

theorem foldRemainder_contDiffAt_diagonal {a : ℝ}
    (ha : 0 < a * (2 - a)) (ha1 : a ≠ 1) (hB : BR a ≠ 0) :
    ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => foldRemainder p.1 p.2) (a, a) := by
  have hqa : qC a ≠ 0 := ne_of_gt (Real.sqrt_pos.2 ha)
  have hD : (1 - a) * qC a ≠ 0 := mul_ne_zero (sub_ne_zero.mpr (Ne.symm ha1)) hqa
  have hsum : qC a + qC a + qLinear a * (a - a) ≠ 0 := by
    simp only [sub_self, mul_zero, add_zero]
    exact ne_of_gt (add_pos (Real.sqrt_pos.2 ha) (Real.sqrt_pos.2 ha))
  have hqfst := (qC_contDiffAt ha).comp (a, a) contDiffAt_fst
  have hqsnd := (qC_contDiffAt ha).comp (a, a) contDiffAt_snd
  have hn := (foldN_contDiffAt hB).comp (a, a) contDiffAt_snd
  have hm := (foldM_contDiffAt hB ha).comp (a, a) contDiffAt_snd
  have hl : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => qLinear p.2) (a, a) :=
    (contDiffAt_const.sub contDiffAt_snd).div hqsnd hqa
  have hr : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => qRemainder p.1 p.2) (a, a) := by
    unfold qRemainder
    exact (contDiffAt_const.add (hl.pow 2)).neg.div
      ((hqfst.add hqsnd).add (hl.mul (contDiffAt_fst.sub contDiffAt_snd))) hsum
  unfold foldRemainder numeratorRemainder
  apply ContDiffAt.div _ ((contDiffAt_const.sub contDiffAt_fst).mul hqfst) hD
  fun_prop

end
end StokesV5
