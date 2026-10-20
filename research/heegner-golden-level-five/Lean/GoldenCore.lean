import Mathlib.Analysis.Real.Sqrt
import Mathlib.Data.Real.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NoncommRing
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-!
# Algebraic core of the level-five golden reconstruction

This module kernel-checks the algebraic identities used in the Heegner
level-five workstream:

* the universal sextic quotient `P_j(t) = t^6 G_j(t - t^{-1})`;
* the `-163` decomposition `P_163 = A^2 - 5 B^2`;
* the conditional branch implication
  `P_163(t)=0`, `A(t)<0<B(t)` imply `sqrt 5 = -A(t)/B(t)`;
* the resulting golden-ratio formulas;
* the real-branch identity `4H = a_s^2 - 5 b_s^2`.

The identities are stated pointwise in an arbitrary field.  This is equivalent
to the corresponding polynomial identities and avoids depending on a
polynomial-ring build in the pinned read-only Mathlib checkout.  The classical
CM input, Klein's level-five equation, the rational enclosure of the analytic
branch, Sturm root counts, and the coprimality certificate are kept as explicit
hypotheses or as separately checked exact computations.  No claim of a complete
formalization of the paper is made.
-/

namespace HeegnerGolden

/-! ## The universal sextic quotient -/

/-- Pointwise form of Klein's level-five polynomial. -/
def level5Eval {K : Type*} [Field K] (j t : K) : K :=
  (t ^ 4 - 228 * t ^ 3 + 494 * t ^ 2 + 228 * t + 1) ^ 3 +
    j * t * (t ^ 2 + 11 * t - 1) ^ 5

/-- The sextic quotient in the variable `u = t - t^{-1}`. -/
def level5GEval {K : Type*} [Field K] (j u : K) : K :=
  (u ^ 2 - 228 * u + 496) ^ 3 + j * (u + 11) ^ 5

/-- Proposition 2.1: the universal sextic quotient.  This is an identity in
every field, so it applies to rational, real and complex branches. -/
theorem level5_quotient {K : Type*} [Field K] (j t : K) (ht : t ≠ 0) :
    level5Eval j t = t ^ 6 * level5GEval j (t - t⁻¹) := by
  unfold level5Eval level5GEval
  field_simp [ht]
  ring

/-! ## The `-163` decomposition -/

/-- Klein's level-five polynomial at `j = -640320^3`, evaluated at `t`. -/
def P163Eval {K : Type*} [Field K] (t : K) : K :=
  level5Eval (-640320 ^ 3 : K) t

/-- The explicit degree-six polynomial `A`, evaluated at `t`. -/
def AEval {K : Type*} [Field K] (t : K) : K :=
  t ^ 6 - 131268706320384342 * t ^ 5 - 2896632145572621515 * t ^ 4 -
    15717124384666951860 * t ^ 3 + 2896632145572621515 * t ^ 2 -
    131268706320384342 * t - 1

/-- The explicit degree-five polynomial `B`, evaluated at `t`. -/
def BEval {K : Type*} [Field K] (t : K) : K :=
  -58705150130167150 * t ^ 5 - 1295413276662289800 * t ^ 4 -
    7028911706986972100 * t ^ 3 + 1295413276662289800 * t ^ 2 -
    58705150130167150 * t

/-- The exact decomposition `P_163 = A^2 - 5 B^2`, at an arbitrary point of an
arbitrary field. -/
theorem P163Eval_eq {K : Type*} [Field K] (t : K) :
    P163Eval t = AEval t ^ 2 - 5 * BEval t ^ 2 := by
  unfold P163Eval level5Eval AEval BEval
  ring

/-! ## Conditional branch reconstruction -/

/-- Conditional branch sign: if `t` is a root, `B(t)` is nonzero and the
certified signs `A(t)<0<B(t)` hold, then `sqrt 5 = -A(t)/B(t)`. -/
theorem sqrt5_eq_neg_A_div_B {t : ℝ}
    (hP : P163Eval t = 0) (hB : BEval t ≠ 0)
    (hAneg : AEval t < 0) (hBpos : 0 < BEval t) :
    Real.sqrt 5 = -AEval t / BEval t := by
  have hsq : AEval t ^ 2 = 5 * BEval t ^ 2 := by
    have h := P163Eval_eq t
    nlinarith
  have hsqrt : (Real.sqrt 5) ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have hsq' : AEval t ^ 2 = (Real.sqrt 5 * BEval t) ^ 2 := by
    rw [mul_pow, hsqrt]
    nlinarith
  have hAB : AEval t = -Real.sqrt 5 * BEval t := by
    rcases sq_eq_sq_iff_eq_or_eq_neg.mp hsq' with h | h
    · nlinarith [Real.sqrt_nonneg 5, hBpos, hAneg]
    · linarith
  field_simp [hB]
  linarith

/-- The golden ratio `phi`. -/
noncomputable def phi : ℝ := (1 + Real.sqrt 5) / 2

/-- The inverse golden ratio `gamma`. -/
noncomputable def gamma : ℝ := (Real.sqrt 5 - 1) / 2

/-- The HMR parameter `c0 = phi^{-2}`. -/
noncomputable def c0 : ℝ := (3 - Real.sqrt 5) / 2

theorem phi_formula {t : ℝ} (hB : BEval t ≠ 0)
    (h : Real.sqrt 5 = -AEval t / BEval t) :
    (BEval t - AEval t) / (2 * BEval t) = phi := by
  unfold phi
  field_simp [hB] at h ⊢
  linarith

theorem gamma_formula {t : ℝ} (hB : BEval t ≠ 0)
    (h : Real.sqrt 5 = -AEval t / BEval t) :
    -(AEval t + BEval t) / (2 * BEval t) = gamma := by
  unfold gamma
  field_simp [hB] at h ⊢
  linarith

theorem c0_formula {t : ℝ} (hB : BEval t ≠ 0)
    (h : Real.sqrt 5 = -AEval t / BEval t) :
    (3 * BEval t + AEval t) / (2 * BEval t) = c0 := by
  unfold c0
  field_simp [hB] at h ⊢
  linarith

theorem phi_sq : phi ^ 2 = phi + 1 := by
  unfold phi
  have h : (Real.sqrt 5) ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  nlinarith

theorem c0_eq_two_sub_phi : c0 = 2 - phi := by
  unfold c0 phi
  ring

theorem c0_eq_phi_inv_sq : c0 = phi⁻¹ ^ 2 := by
  unfold c0 phi
  have hsqrt : (Real.sqrt 5) ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have hphi : (1 + Real.sqrt 5) / 2 ≠ 0 := by positivity
  field_simp [hphi]
  nlinarith

/-! ## The common involution -/

open Matrix

/-- The homogeneous inversion matrix `M`, with `gamma^2 = c0`. -/
noncomputable def M (g c0 : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  (1 / Real.sqrt (1 + c0)) • !![ -1, g; g, 1]

/-- The coordinate-exchange matrix `J`. -/
def J : Matrix (Fin 2) (Fin 2) ℝ := !![0, 1; 1, 0]

/-- The conjugated involution `A = J M J`. -/
noncomputable def A (g c0 : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  J * M g c0 * J

theorem M_sq (g c0 : ℝ) (hg : g ^ 2 = c0) (hpos : 0 < 1 + c0) :
    M g c0 * M g c0 = 1 := by
  have hsqrt : (Real.sqrt (1 + c0)) ^ 2 = 1 + c0 :=
    Real.sq_sqrt (le_of_lt hpos)
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [M, Matrix.mul_apply] <;>
    field_simp [hpos.ne', hsqrt]
  all_goals
    try rw [hsqrt, hg]
  all_goals
    ring

theorem J_sq : J * J = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [J, Matrix.mul_apply]

theorem A_sq (g c0 : ℝ) (hg : g ^ 2 = c0) (hpos : 0 < 1 + c0) :
    A g c0 * A g c0 = 1 := by
  unfold A
  calc
    J * M g c0 * J * (J * M g c0 * J)
        = J * M g c0 * (J * J) * M g c0 * J := by noncomm_ring
    _ = J * M g c0 * 1 * M g c0 * J := by rw [J_sq]
    _ = J * (M g c0 * M g c0) * J := by noncomm_ring
    _ = J * 1 * J := by rw [M_sq g c0 hg hpos]
    _ = J * J := by noncomm_ring
    _ = 1 := J_sq

/-! ## The real positive branch -/

/-- The degree-twelve real-branch factor `H`. -/
def H (s : ℝ) : ℝ :=
  s ^ 12 + 3049 * s ^ 11 + 6824 * s ^ 10 - 2600 * s ^ 9 -
    26275 * s ^ 8 - 13636 * s ^ 7 + 21661 * s ^ 6 + 13636 * s ^ 5 -
    26275 * s ^ 4 + 2600 * s ^ 3 + 6824 * s ^ 2 - 3049 * s + 1

def aS (s : ℝ) : ℝ :=
  2 * s ^ 6 + 3049 * s ^ 5 + 4935 * s ^ 4 + 1160 * s ^ 3 -
    4935 * s ^ 2 + 3049 * s - 2

def bS (s : ℝ) : ℝ :=
  -1363 * s ^ 5 - 2209 * s ^ 4 - 522 * s ^ 3 + 2209 * s ^ 2 - 1363 * s

/-- Equation (11): `4H = a_s^2 - 5 b_s^2`. -/
theorem H_identity (s : ℝ) : 4 * H s = aS s ^ 2 - 5 * bS s ^ 2 := by
  unfold H aS bS
  ring

end HeegnerGolden

#print axioms HeegnerGolden.level5_quotient
#print axioms HeegnerGolden.P163Eval_eq
#print axioms HeegnerGolden.sqrt5_eq_neg_A_div_B
#print axioms HeegnerGolden.phi_formula
#print axioms HeegnerGolden.gamma_formula
#print axioms HeegnerGolden.c0_formula
#print axioms HeegnerGolden.phi_sq
#print axioms HeegnerGolden.c0_eq_two_sub_phi
#print axioms HeegnerGolden.c0_eq_phi_inv_sq
#print axioms HeegnerGolden.M_sq
#print axioms HeegnerGolden.J_sq
#print axioms HeegnerGolden.A_sq
#print axioms HeegnerGolden.H_identity
