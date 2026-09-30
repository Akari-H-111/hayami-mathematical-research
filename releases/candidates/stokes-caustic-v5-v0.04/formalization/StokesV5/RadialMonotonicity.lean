import StokesV5.PhysicalLocus

namespace StokesV5
noncomputable section
open Polynomial

def radialNPoly : Polynomial ℝ := X ^ 5 - 5 * X ^ 4 + 7 * X ^ 3 - X ^ 2 - 2 * X
def radialPPoly : Polynomial ℝ := radialNPoly ^ 2 * X * (2 - X)
def radialRPoly : Polynomial ℝ :=
  2 * X ^ 12 - 26 * X ^ 11 + 141 * X ^ 10 - 414 * X ^ 9 + 707 * X ^ 8 -
    682 * X ^ 7 + 294 * X ^ 6 + 38 * X ^ 5 - 71 * X ^ 4 + 2 * X ^ 3 + 11 * X ^ 2 - 2 * X + 1
def radialQPoly : Polynomial ℝ :=
  2 * X ^ 17 - 36 * X ^ 16 + 306 * X ^ 15 - 1588 * X ^ 14 + 5462 * X ^ 13 -
    12800 * X ^ 12 + 20432 * X ^ 11 - 21630 * X ^ 10 + 14160 * X ^ 9 - 4868 * X ^ 8 +
    798 * X ^ 7 - 810 * X ^ 6 + 856 * X ^ 5 - 346 * X ^ 4 + 64 * X ^ 3 + 14 * X ^ 2 - 12 * X

theorem radialNPoly_eval (c : ℝ) : radialNPoly.eval c = -AR c := by
  simp [radialNPoly, AR]
  ring
theorem radialQPoly_eval (c : ℝ) : radialQPoly.eval c = q17R c := by
  simp [radialQPoly, q17R]

theorem radial_derivative_certificate :
    radialPPoly.derivative * radialRPoly - radialPPoly * radialRPoly.derivative =
      radialNPoly * radialQPoly := by
  simp [radialPPoly, radialNPoly, radialRPoly, radialQPoly,
    Polynomial.derivative_pow, Polynomial.C_ofNat]
  ring

theorem radialRPoly_sum_squares (c : ℝ) :
    radialRPoly.eval c = (c * BR c - 2 * AR c * (1 - c)) ^ 2 +
      (BR c + AR c) ^ 2 * (1 - c ^ 2) + AR c ^ 2 * (c * (2 - c)) := by
  simp [radialRPoly, AR, BR]
  ring

theorem radialRPoly_pos {c : ℝ} (hc0 : (613 : ℝ) / 1000 ≤ c) (hc1 : c ≤ 1) :
    0 < radialRPoly.eval c := by
  have hcpos : 0 < c := by linarith
  have hA : 0 ≤ AR c := by
    by_cases he : c = 1
    · norm_num [he, AR]
    · exact le_of_lt (AR_pos_on_open_unit hcpos (lt_of_le_of_ne hc1 he))
  have hB := BR_neg_on_physical hc0 hc1
  have hx : c * BR c - 2 * AR c * (1 - c) < 0 := by
    have hleft := mul_neg_of_pos_of_neg hcpos hB
    have hright : 0 ≤ 2 * AR c * (1 - c) := by positivity
    linarith
  have hx2 := sq_pos_of_ne_zero (ne_of_lt hx)
  have hy2 : 0 ≤ (BR c + AR c) ^ 2 * (1 - c ^ 2) := by
    apply mul_nonneg (sq_nonneg _)
    nlinarith
  have hc2 : 0 ≤ 2 - c := by linarith
  have hz2 : 0 ≤ AR c ^ 2 * (c * (2 - c)) := by positivity
  rw [radialRPoly_sum_squares]
  linarith

def radialThirdSquared (c : ℝ) : ℝ := radialPPoly.eval c / radialRPoly.eval c

theorem radialThirdSquared_hasDerivAt {c : ℝ} (hR : radialRPoly.eval c ≠ 0) :
    HasDerivAt radialThirdSquared (-AR c * q17R c / (radialRPoly.eval c) ^ 2) c := by
  have h := (radialPPoly.hasDerivAt c).div (radialRPoly.hasDerivAt c) hR
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_deriv
  have hc := congrArg (fun p : Polynomial ℝ => p.eval c) radial_derivative_certificate
  simp only [eval_sub, eval_mul, radialNPoly_eval, radialQPoly_eval] at hc
  rw [hc]

theorem radialThirdSquared_strictAntiOn :
    StrictAntiOn radialThirdSquared (Set.Icc physicalBoundary 1) := by
  apply strictAntiOn_of_deriv_neg (convex_Icc _ _)
  · exact radialPPoly.continuous.continuousOn.div radialRPoly.continuous.continuousOn
      (fun c hc => ne_of_gt (radialRPoly_pos (le_trans physicalBoundary_spec.1 hc.1) hc.2))
  · intro c hc
    have hc' : physicalBoundary < c ∧ c < 1 := by
      simpa using hc
    have hc0 : (613 : ℝ) / 1000 ≤ c := le_trans physicalBoundary_spec.1 (le_of_lt hc'.1)
    have hR := radialRPoly_pos hc0 (le_of_lt hc'.2)
    rw [(radialThirdSquared_hasDerivAt (ne_of_gt hR)).deriv]
    apply div_neg_of_neg_of_pos
    · exact mul_neg_of_neg_of_pos
        (neg_neg_of_pos (AR_pos_on_open_unit (by linarith [physicalBoundary_spec.1]) hc'.2))
        (q17R_pos_on_three_fifths (by linarith) (le_of_lt hc'.2))
    · exact sq_pos_of_ne_zero (ne_of_gt hR)

theorem radialThirdSquared_nonneg {c : ℝ}
    (hc0 : (613 : ℝ) / 1000 ≤ c) (hc1 : c ≤ 1) : 0 ≤ radialThirdSquared c := by
  unfold radialThirdSquared radialPPoly
  simp only [eval_mul, eval_pow, eval_X, eval_sub, eval_ofNat]
  apply div_nonneg _ (le_of_lt (radialRPoly_pos hc0 hc1))
  have hcpos : 0 ≤ c := by linarith
  have hc2 : 0 ≤ 2 - c := by linarith
  positivity

theorem radialThirdSquared_at_one : radialThirdSquared 1 = 0 := by
  norm_num [radialThirdSquared, radialPPoly, radialNPoly, radialRPoly]

theorem radialThirdSquared_at_boundary :
    radialThirdSquared physicalBoundary = physicalBoundary / 2 := by
  have hB := ne_of_lt (BR_neg_on_physical physicalBoundary_spec.1 physicalBoundary_mem_unit.2)
  have hz := physicalBoundary_spec.2.2
  rw [pBR_eq_neg_AR_sub_BR] at hz
  have hA : AR physicalBoundary = -BR physicalBoundary := by linarith
  have hR := ne_of_gt (radialRPoly_pos physicalBoundary_spec.1 physicalBoundary_mem_unit.2)
  unfold radialThirdSquared
  apply (div_eq_iff hR).2
  simp only [radialPPoly, eval_mul, eval_pow, eval_X, eval_sub, eval_ofNat,
    radialNPoly_eval, radialRPoly_sum_squares]
  rw [hA]
  ring

def radialThird (c : ℝ) : ℝ := Real.sqrt (radialThirdSquared c)

theorem radialThird_strictAntiOn : StrictAntiOn radialThird (Set.Icc physicalBoundary 1) := by
  intro a ha b hb hab
  exact Real.sqrt_lt_sqrt (radialThirdSquared_nonneg
    (le_trans physicalBoundary_spec.1 hb.1) hb.2)
    (radialThirdSquared_strictAntiOn ha hb hab)

theorem radialThird_boundary_max {c : ℝ} (hc : c ∈ Set.Icc physicalBoundary 1) :
    radialThird c ≤ Real.sqrt (physicalBoundary / 2) ∧
      (radialThird c = Real.sqrt (physicalBoundary / 2) ↔ c = physicalBoundary) := by
  have hval : radialThird physicalBoundary = Real.sqrt (physicalBoundary / 2) := by
    rw [radialThird, radialThirdSquared_at_boundary]
  have hb : physicalBoundary ∈ Set.Icc physicalBoundary 1 :=
    ⟨le_rfl, physicalBoundary_mem_unit.2⟩
  constructor
  · rw [← hval]
    exact radialThird_strictAntiOn.antitoneOn hb hc hc.1
  · rw [← hval]
    constructor
    · exact radialThird_strictAntiOn.injOn hc hb
    · rintro rfl; rfl

end
end StokesV5
