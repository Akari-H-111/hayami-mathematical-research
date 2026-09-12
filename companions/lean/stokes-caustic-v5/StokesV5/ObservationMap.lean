import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
import Mathlib.Analysis.Calculus.FDeriv.Prod
import StokesV5.Polynomials

/-!
# Real observation map on the positive-Q chart

This module defines the two-variable map used in the v5 manuscript and proves
the analytic chart facts needed before computing its Jacobian.  It does not
yet invoke a Whitney-fold recognition theorem.
-/

namespace StokesV5

noncomputable section

def qSq (t : ℝ) : ℝ := Real.cos t * (2 - Real.cos t)

def qChart (t : ℝ) : ℝ := Real.sqrt (qSq t)

def observationDomain : Set (ℝ × ℝ) := {p | 0 < qSq p.1}

def observationN (p : ℝ × ℝ) : ℝ :=
  (1 - Real.cos p.1) * (1 - Real.cos p.1 - 2 * p.2)

def observationNumerator (p : ℝ × ℝ) : ℝ :=
  (1 - p.2) * Real.cos p.1 ^ 2 * (2 - Real.cos p.1) -
    p.2 * (1 - Real.cos p.1) ^ 2 * (1 + Real.cos p.1)

def observationM (p : ℝ × ℝ) : ℝ :=
  observationNumerator p / qChart p.1

def observationMap (p : ℝ × ℝ) : ℝ × ℝ :=
  (observationN p, observationM p)

theorem qChart_pos {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    0 < qChart p.1 := by
  exact Real.sqrt_pos.2 hp

theorem qChart_ne_zero {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    qChart p.1 ≠ 0 := ne_of_gt (qChart_pos hp)

theorem qChart_sq {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    qChart p.1 ^ 2 = qSq p.1 := by
  exact Real.sq_sqrt (le_of_lt hp)

theorem observationMap_differentiableAt {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) :
    DifferentiableAt ℝ observationMap p := by
  have hq : qChart p.1 ≠ 0 := qChart_ne_zero hp
  have hqDiff : DifferentiableAt ℝ (fun x : ℝ × ℝ => qChart x.1) p := by
    unfold qChart
    apply DifferentiableAt.sqrt
    · unfold qSq
      fun_prop
    · exact ne_of_gt hp
  have hN : DifferentiableAt ℝ observationN p := by
    unfold observationN
    fun_prop
  have hNumerator : DifferentiableAt ℝ observationNumerator p := by
    unfold observationNumerator
    fun_prop
  have hM : DifferentiableAt ℝ observationM p := by
    unfold observationM
    convert hNumerator.mul (hqDiff.inv hq) using 1 <;> rfl
  exact hN.prodMk hM

theorem observationMap_hasFDerivAt {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) :
    HasFDerivAt observationMap (fderiv ℝ observationMap p) p :=
  (observationMap_differentiableAt hp).hasFDerivAt

end

end StokesV5
