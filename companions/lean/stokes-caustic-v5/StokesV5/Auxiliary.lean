import StokesV5.PaperGeometry
import Mathlib.RingTheory.Polynomial.GaussLemma
import Mathlib.Algebra.Polynomial.Eval.Irreducible

namespace StokesV5
noncomputable section
open Polynomial Filter
open scoped Topology

instance : Fact (Nat.Prime 13) := ⟨by decide⟩

def chiralityPolynomial {R : Type*} [Ring R] : Polynomial R :=
  X ^ 5 - 2 * X ^ 4 - X ^ 3 + 13 * X ^ 2 - 20 * X + 5

theorem chiralityPolynomial_monic {R : Type*} [Ring R] [Nontrivial R] :
    (chiralityPolynomial (R := R)).Monic := by
  apply monic_of_natDegree_le_of_coeff_eq_one 5
  · unfold chiralityPolynomial; compute_degree
  · simp [chiralityPolynomial, coeff_X_pow, coeff_X]

private def quadraticR1 (a b : ZMod 13) : ZMod 13 :=
  a ^ 4 + 2 * a ^ 3 - 3 * a ^ 2 * b - a ^ 2 - 4 * a * b - 13 * a + b ^ 2 + b - 20
private def quadraticR0 (a b : ZMod 13) : ZMod 13 :=
  a ^ 3 * b + 2 * a ^ 2 * b - 2 * a * b ^ 2 - a * b - 2 * b ^ 2 - 13 * b + 5

private theorem chirality_mod13_no_root :
    ∀ a : ZMod 13, a ^ 5 - 2 * a ^ 4 - a ^ 3 + 13 * a ^ 2 - 20 * a + 5 ≠ 0 := by
  decide +kernel

private theorem chirality_mod13_no_quadratic :
    ∀ a b : ZMod 13, ¬(quadraticR1 a b = 0 ∧ quadraticR0 a b = 0) := by
  decide +kernel

theorem chiralityPolynomial_irreducible_mod13 :
    Irreducible (chiralityPolynomial (R := ZMod 13)) := by
  have hm := chiralityPolynomial_monic (R := ZMod 13)
  have hn : (chiralityPolynomial (R := ZMod 13)).natDegree = 5 := by
    unfold chiralityPolynomial; compute_degree!
  apply (irreducible_iff_lt_natDegree_lt hm.ne_zero
    (by intro h; have := natDegree_eq_zero_of_isUnit h; omega)).mpr
  intro q hq hdeg hdiv
  have hsmall : q.natDegree = 1 ∨ q.natDegree = 2 := by
    simp only [hn, Nat.reduceDiv, Finset.mem_Ioc] at hdeg
    omega
  rcases hsmall with h1 | h2
  · have he := eval_eq_zero_of_dvd_of_eval_eq_zero (x := -q.coeff 0) hdiv
      (by rw [hq.eq_X_add_C h1]; simp)
    exact chirality_mod13_no_root (-q.coeff 0) (by simpa [chiralityPolynomial] using he)
  · let a := q.coeff 1
    let b := q.coeff 0
    have hform : q = X ^ 2 + C a * X + C b := by
      rw [hq.as_sum, h2]
      simp [Finset.sum_range_succ, a, b]
      ring
    let quotient : Polynomial (ZMod 13) :=
      X ^ 3 - C (a + 2) * X ^ 2 + C (a ^ 2 + 2 * a - b - 1) * X +
        C (-a ^ 3 - 2 * a ^ 2 + 2 * a * b + a + 2 * b + 13)
    have hid : chiralityPolynomial = q * quotient + C (quadraticR1 a b) * X + C (quadraticR0 a b) := by
      rw [hform]
      dsimp [chiralityPolynomial, quotient, quadraticR1, quadraticR0]
      simp only [map_add, map_sub, map_mul, map_pow, map_neg, map_ofNat, map_one]
      ring
    have hr : q ∣ C (quadraticR1 a b) * X + C (quadraticR0 a b) := by
      have hsub := dvd_sub hdiv (dvd_mul_right q quotient)
      simpa only [hid, add_sub_cancel_left, add_assoc] using hsub
    have hz := eq_zero_of_dvd_of_natDegree_lt hr
      (by rw [h2]; exact lt_of_le_of_lt natDegree_linear_le (by norm_num))
    have hz0 := congrArg (fun p : Polynomial (ZMod 13) => p.coeff 0) hz
    have hz1 := congrArg (fun p : Polynomial (ZMod 13) => p.coeff 1) hz
    exact chirality_mod13_no_quadratic a b ⟨by simpa using hz1, by simpa using hz0⟩

theorem chiralityPolynomial_irreducible_rational :
    Irreducible (chiralityPolynomial (R := ℚ)) := by
  have hm := chiralityPolynomial_monic (R := ℤ)
  have hmap : (chiralityPolynomial (R := ℤ)).map (Int.castRingHom (ZMod 13)) =
      chiralityPolynomial := by simp [chiralityPolynomial]
  have hi : Irreducible (chiralityPolynomial (R := ℤ)) :=
    Polynomial.Monic.irreducible_of_irreducible_map (Int.castRingHom (ZMod 13)) _ hm
      (by rw [hmap]; exact chiralityPolynomial_irreducible_mod13)
  have h := (Polynomial.IsPrimitive.Int.irreducible_iff_irreducible_map_cast hm.isPrimitive).mp hi
  simpa [chiralityPolynomial] using h

def auxiliaryU (c : ℝ) : ℝ := (1 - c) / 2
def auxiliaryX (c : ℝ) : ℝ := c + 2 * auxiliaryU c * (1 - c)
def auxiliaryRadiusSquared (c : ℝ) : ℝ := auxiliaryX c ^ 2 +
  (1 - auxiliaryU c) ^ 2 * (1 - c ^ 2) + auxiliaryU c ^ 2 * c * (2 - c)
def auxiliaryD (c : ℝ) : ℝ := 2 * c ^ 4 - 6 * c ^ 3 + 7 * c ^ 2 - 4 * c + 5
def auxiliaryP (c : ℝ) : ℝ := c * (2 - c) * (1 - c) ^ 2
def auxiliaryThirdSquared (c : ℝ) : ℝ := auxiliaryP c / auxiliaryD c
def auxiliaryThird (c : ℝ) : ℝ := Real.sqrt (auxiliaryThirdSquared c)
def auxiliaryChirality (c : ℝ) : ℝ := (chiralityPolynomial (R := ℝ)).eval c
def auxiliaryImage (c σ : ℝ) : ℝ × ℝ × ℝ :=
  (auxiliaryX c / Real.sqrt (auxiliaryRadiusSquared c),
   σ * (1 - auxiliaryU c) * Real.sqrt (1 - c ^ 2) / Real.sqrt (auxiliaryRadiusSquared c),
   auxiliaryU c * qC c / Real.sqrt (auxiliaryRadiusSquared c))

theorem component_zero_iff {c u : ℝ} (hc : c ≠ 1) :
    (1 - c) * (1 - c - 2 * u) = 0 ↔ u = auxiliaryU c := by
  rw [mul_eq_zero]
  have h : 1 - c ≠ 0 := sub_ne_zero.mpr (Ne.symm hc)
  simp only [h, false_or]
  unfold auxiliaryU
  constructor <;> intro hh <;> linarith

theorem auxiliaryRadiusSquared_identity (c : ℝ) :
    4 * auxiliaryRadiusSquared c = auxiliaryD c := by
  dsimp [auxiliaryRadiusSquared, auxiliaryX, auxiliaryU, auxiliaryD]; ring

theorem auxiliaryD_pos {c : ℝ} (hc : c ∈ Set.Icc 0 1) : 0 < auxiliaryD c := by
  have hx : 0 < auxiliaryX c := by
    dsimp [auxiliaryX, auxiliaryU]
    nlinarith [sq_nonneg (c - 1 / 2)]
  have hrest : 0 ≤ (1 - auxiliaryU c) ^ 2 * (1 - c ^ 2) +
      auxiliaryU c ^ 2 * c * (2 - c) := by
    have h1 : 0 ≤ 1 - c ^ 2 := by nlinarith [hc.1, hc.2]
    have h2 : 0 ≤ 2 - c := by linarith [hc.2]
    have hc0 := hc.1
    positivity
  rw [← auxiliaryRadiusSquared_identity]
  dsimp [auxiliaryRadiusSquared]
  nlinarith [sq_pos_of_pos hx]

theorem auxiliary_endpoint (σ : ℝ) :
    auxiliaryImage 0 σ = (2 / Real.sqrt 5, σ / Real.sqrt 5, 0) := by
  have hs : Real.sqrt (5 / 4 : ℝ) = Real.sqrt 5 / 2 := by
    rw [Real.sqrt_div (by norm_num), show Real.sqrt (4 : ℝ) = 2 by norm_num]
  norm_num [auxiliaryImage, auxiliaryRadiusSquared, auxiliaryX, auxiliaryU, qC, hs]
  all_goals field_simp <;> ring

theorem auxiliaryThirdSquared_hasDerivAt {c : ℝ} (hD : auxiliaryD c ≠ 0) :
    HasDerivAt auxiliaryThirdSquared
      (-2 * (c - 1) * auxiliaryChirality c / auxiliaryD c ^ 2) c := by
  let P : Polynomial ℝ := X * (2 - X) * (1 - X) ^ 2
  let D : Polynomial ℝ := 2 * X ^ 4 - 6 * X ^ 3 + 7 * X ^ 2 - 4 * X + 5
  have h := (P.hasDerivAt c).div (D.hasDerivAt c) (by simpa [D, auxiliaryD] using hD)
  apply (h.congr_of_eventuallyEq (Eventually.of_forall fun x => by
    simp [P, D, auxiliaryP, auxiliaryD, auxiliaryThirdSquared])).congr_deriv
  simp [P, D, Polynomial.derivative_pow, auxiliaryChirality, chiralityPolynomial, auxiliaryD]
  ring

theorem auxiliaryChirality_hasDerivAt (c : ℝ) :
    HasDerivAt auxiliaryChirality ((c - 1) * (5 * c ^ 3 - 3 * c ^ 2 - 6 * c + 20)) c := by
  have h := (chiralityPolynomial (R := ℝ)).hasDerivAt c
  apply h.congr_deriv
  simp [chiralityPolynomial, Polynomial.derivative_pow]; ring

theorem auxiliaryChirality_strictAntiOn : StrictAntiOn auxiliaryChirality (Set.Icc 0 1) := by
  apply strictAntiOn_of_deriv_neg (convex_Icc _ _) (chiralityPolynomial.continuous.continuousOn)
  intro c hc
  have hc' : 0 < c ∧ c < 1 := by simpa using hc
  change deriv auxiliaryChirality c < 0
  rw [(auxiliaryChirality_hasDerivAt c).deriv]
  have hcore : 0 < 5 * c ^ 3 - 3 * c ^ 2 - 6 * c + 20 := by
    have hs : c ^ 2 ≤ 1 := by nlinarith
    have hc0 := le_of_lt hc'.1
    have hp : 0 ≤ c ^ 3 := by positivity
    linarith
  exact mul_neg_of_neg_of_pos (by linarith) hcore

theorem exists_unique_auxiliary_chirality :
    ∃! c : ℝ, (3103 : ℝ) / 10000 ≤ c ∧ c ≤ (3104 : ℝ) / 10000 ∧
      auxiliaryChirality c = 0 := by
  have hlo : 0 < auxiliaryChirality ((3103 : ℝ) / 10000) := by
    norm_num [auxiliaryChirality, chiralityPolynomial]
  have hhi : auxiliaryChirality ((3104 : ℝ) / 10000) < 0 := by
    norm_num [auxiliaryChirality, chiralityPolynomial]
  obtain ⟨c, hc, hz⟩ := intermediate_value_Icc' (by norm_num : (3103 : ℝ) / 10000 ≤ 3104 / 10000)
    (chiralityPolynomial.continuous.continuousOn : ContinuousOn auxiliaryChirality _)
    (show (0 : ℝ) ∈ Set.Icc (auxiliaryChirality (3104 / 10000)) (auxiliaryChirality (3103 / 10000))
      by constructor <;> linarith)
  refine ⟨c, ⟨hc.1, hc.2, hz⟩, ?_⟩
  intro d hd
  exact auxiliaryChirality_strictAntiOn.injOn
    (by constructor <;> linarith [hd.1, hd.2.1])
    (by constructor <;> linarith [hc.1, hc.2]) (hd.2.2.trans hz.symm)

def auxiliaryMaximum : ℝ := exists_unique_auxiliary_chirality.choose
theorem auxiliaryMaximum_spec :
    (3103 : ℝ) / 10000 ≤ auxiliaryMaximum ∧ auxiliaryMaximum ≤ (3104 : ℝ) / 10000 ∧
      auxiliaryChirality auxiliaryMaximum = 0 :=
  exists_unique_auxiliary_chirality.choose_spec.1

theorem auxiliaryMaximum_outside_physical : auxiliaryMaximum < physicalBoundary := by
  linarith [auxiliaryMaximum_spec.2.1, physicalBoundary_spec.1]

theorem auxiliaryThirdSquared_strictMono_before :
    StrictMonoOn auxiliaryThirdSquared (Set.Icc 0 auxiliaryMaximum) := by
  apply strictMonoOn_of_deriv_pos (convex_Icc _ _)
  · exact (by unfold auxiliaryP; fun_prop : Continuous auxiliaryP).continuousOn.div
      (by unfold auxiliaryD; fun_prop : Continuous auxiliaryD).continuousOn
      (fun c hc => ne_of_gt (auxiliaryD_pos ⟨hc.1, by linarith [hc.2, auxiliaryMaximum_spec.2.1]⟩))
  · intro c hc
    have hc' : 0 < c ∧ c < auxiliaryMaximum := by simpa using hc
    have hcu : c ∈ Set.Icc 0 1 := ⟨le_of_lt hc'.1, by linarith [hc'.2, auxiliaryMaximum_spec.2.1]⟩
    have hau : auxiliaryMaximum ∈ Set.Icc 0 1 := by
      constructor <;> linarith [auxiliaryMaximum_spec.1, auxiliaryMaximum_spec.2.1]
    have hH : 0 < auxiliaryChirality c := by
      have h := auxiliaryChirality_strictAntiOn hcu hau hc'.2
      rw [auxiliaryMaximum_spec.2.2] at h
      exact h
    rw [(auxiliaryThirdSquared_hasDerivAt (ne_of_gt (auxiliaryD_pos hcu))).deriv]
    apply div_pos _ (sq_pos_of_pos (auxiliaryD_pos hcu))
    exact mul_pos (by linarith [hcu.2, hc'.2, auxiliaryMaximum_spec.2.1]) hH

theorem auxiliaryThirdSquared_strictAnti_after :
    StrictAntiOn auxiliaryThirdSquared (Set.Icc auxiliaryMaximum 1) := by
  apply strictAntiOn_of_deriv_neg (convex_Icc _ _)
  · exact (by unfold auxiliaryP; fun_prop : Continuous auxiliaryP).continuousOn.div
      (by unfold auxiliaryD; fun_prop : Continuous auxiliaryD).continuousOn
      (fun c hc => ne_of_gt (auxiliaryD_pos ⟨by linarith [hc.1, auxiliaryMaximum_spec.1], hc.2⟩))
  · intro c hc
    have hc' : auxiliaryMaximum < c ∧ c < 1 := by simpa using hc
    have hcu : c ∈ Set.Icc 0 1 := ⟨by linarith [hc'.1, auxiliaryMaximum_spec.1], le_of_lt hc'.2⟩
    have hau : auxiliaryMaximum ∈ Set.Icc 0 1 := by
      constructor <;> linarith [auxiliaryMaximum_spec.1, auxiliaryMaximum_spec.2.1]
    have hH : auxiliaryChirality c < 0 := by
      have h := auxiliaryChirality_strictAntiOn hau hcu hc'.1
      rw [auxiliaryMaximum_spec.2.2] at h
      exact h
    rw [(auxiliaryThirdSquared_hasDerivAt (ne_of_gt (auxiliaryD_pos hcu))).deriv]
    apply div_neg_of_neg_of_pos _ (sq_pos_of_pos (auxiliaryD_pos hcu))
    exact mul_neg_of_pos_of_neg (by linarith [hc'.2]) hH

theorem auxiliaryThird_boundary_max {c : ℝ} (hc : c ∈ Set.Icc 0 1) :
    auxiliaryThird c ≤ auxiliaryThird auxiliaryMaximum := by
  apply Real.sqrt_le_sqrt
  by_cases h : c ≤ auxiliaryMaximum
  · exact auxiliaryThirdSquared_strictMono_before.monotoneOn ⟨hc.1, h⟩
      ⟨by linarith [auxiliaryMaximum_spec.1], le_rfl⟩ h
  · exact auxiliaryThirdSquared_strictAnti_after.antitoneOn
      ⟨le_rfl, by linarith [auxiliaryMaximum_spec.2.1]⟩ ⟨le_of_not_ge h, hc.2⟩ (le_of_not_ge h)

theorem auxiliaryImage_third_squared {c σ : ℝ} (hc : c ∈ Set.Icc 0 1) :
    (auxiliaryImage c σ).2.2 ^ 2 = auxiliaryThirdSquared c := by
  have hr : 0 < auxiliaryRadiusSquared c := by
    have hD := auxiliaryD_pos hc
    rw [← auxiliaryRadiusSquared_identity] at hD
    linarith
  change (auxiliaryU c * qC c / Real.sqrt (auxiliaryRadiusSquared c)) ^ 2 = _
  rw [div_pow, mul_pow, Real.sq_sqrt (le_of_lt hr)]
  have hq : 0 ≤ c * (2 - c) := mul_nonneg hc.1 (by linarith [hc.2])
  rw [show qC c ^ 2 = c * (2 - c) from Real.sq_sqrt hq]
  unfold auxiliaryU auxiliaryThirdSquared auxiliaryP
  field_simp [ne_of_gt hr, ne_of_gt (auxiliaryD_pos hc)]
  rw [← auxiliaryRadiusSquared_identity]
  ring

theorem auxiliaryImage_third {c σ : ℝ} (hc : c ∈ Set.Icc 0 1) :
    (auxiliaryImage c σ).2.2 = auxiliaryThird c := by
  have hu : 0 ≤ auxiliaryU c := by unfold auxiliaryU; linarith [hc.2]
  have hn : 0 ≤ (auxiliaryImage c σ).2.2 :=
    div_nonneg (mul_nonneg hu (Real.sqrt_nonneg _)) (Real.sqrt_nonneg _)
  rw [← Real.sqrt_sq hn, auxiliaryImage_third_squared hc]
  rfl

end
end StokesV5
