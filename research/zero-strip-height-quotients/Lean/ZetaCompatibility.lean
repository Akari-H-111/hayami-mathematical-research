import Mathlib.NumberTheory.Harmonic.ZetaAsymp
import Mathlib.Tactic.Linarith

/-! Actual zeta zero-support compatibility. No multiplicity or counting claim. -/

open Complex ComplexConjugate

namespace ZeroStripZeta

def StripZero (s : ℂ) : Prop := 0 < s.re ∧ s.re < 1 ∧ riemannZeta s = 0

theorem stripZero_conjugate {s : ℂ} (h : StripZero s) : StripZero (conj s) := by
  rcases h with ⟨h0, h1, hz⟩
  refine ⟨by simpa using h0, by simpa using h1, ?_⟩
  simp [riemannZeta_conj, hz]

theorem stripZero_functional {s : ℂ} (h : StripZero s) : StripZero (1 - s) := by
  rcases h with ⟨h0, h1, hz⟩
  have hneg : ∀ n : ℕ, s ≠ -n := by
    intro n hn
    have hre := congrArg Complex.re hn
    simp at hre
    have hn0 : (0 : ℝ) ≤ n := Nat.cast_nonneg n
    linarith
  have hne : s ≠ 1 := by
    intro hs
    have hre := congrArg Complex.re hs
    simp at hre
    linarith
  refine ⟨?_, ?_, ?_⟩
  · simp only [sub_re, one_re]
    linarith
  · simp only [sub_re, one_re]
    linarith
  · rw [riemannZeta_one_sub hneg hne, hz]
    simp

theorem stripZero_conjugate_iff (s : ℂ) : StripZero (conj s) ↔ StripZero s := by
  constructor
  · intro h
    simpa using stripZero_conjugate h
  · exact stripZero_conjugate

theorem stripZero_functional_iff (s : ℂ) : StripZero (1 - s) ↔ StripZero s := by
  constructor
  · intro h
    simpa using stripZero_functional h
  · exact stripZero_functional

theorem stripZero_horizontal {s : ℂ} (h : StripZero s) :
    StripZero (1 - conj s) := stripZero_functional (stripZero_conjugate h)

#print axioms stripZero_conjugate
#print axioms stripZero_functional
#print axioms stripZero_conjugate_iff
#print axioms stripZero_functional_iff
#print axioms stripZero_horizontal

end ZeroStripZeta
