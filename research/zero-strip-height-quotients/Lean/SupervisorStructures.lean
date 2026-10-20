import Mathlib.Topology.Instances.AddCircle.Defs
import Mathlib.Topology.Algebra.Ring.Real
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! Supplementary models. No zeta theorem or quotient homeomorphism is asserted. -/

namespace ZeroStripSupplement

abbrev Cylinder (T : ℝ) := ℝ × AddCircle T

example (T : ℝ) : AddCommGroup (Cylinder T) := inferInstance
example (T : ℝ) : IsTopologicalAddGroup (Cylinder T) := inferInstance

theorem cylinder_add_continuous (T : ℝ) :
    Continuous (fun p : Cylinder T × Cylinder T => p.1 + p.2) := continuous_add

theorem cylinder_neg_continuous (T : ℝ) :
    Continuous (fun p : Cylinder T => -p) := continuous_neg

def project (T : ℝ) (p : ℝ × ℝ) : Cylinder T := (p.1, (p.2 : AddCircle T))

theorem project_deck (T : ℝ) (p : ℝ × ℝ) :
    project T (p.1, p.2 + T) = project T p := by
  exact Prod.ext rfl (AddCircle.coe_add_period T p.2)

theorem project_add (T : ℝ) (p q : ℝ × ℝ) :
    project T (p + q) = project T p + project T q := by
  exact Prod.ext rfl (AddCircle.coe_add T p.2 q.2)

def glide (T : ℝ) (p : ℝ × ℝ) : ℝ × ℝ := (-p.1, p.2 + T)

theorem glide_square (T : ℝ) (p : ℝ × ℝ) :
    glide T (glide T p) = (p.1, p.2 + 2 * T) := by
  apply Prod.ext
  · simp [glide]
  · simp only [glide]
    ring

theorem reflection_fixed_iff (p : ℝ × ℝ) : (-p.1, p.2) = p ↔ p.1 = 0 := by
  constructor
  · intro h
    have hx := congrArg Prod.fst h
    dsimp at hx
    linarith
  · intro h
    exact Prod.ext (by simp [h]) rfl

theorem constant_cell_count (N : ℕ → ℝ) (M : ℝ) (h0 : N 0 = 0)
    (hstep : ∀ n, N (n + 1) = N n + M) : ∀ n, N n = (n : ℝ) * M := by
  intro n
  induction n with
  | zero => simpa using h0
  | succ n ih =>
    rw [hstep, ih]
    rw [Nat.cast_add, Nat.cast_one]
    ring

theorem superlinear_excludes_constant_cells (N : ℕ → ℝ) (M : ℝ)
    (h0 : N 0 = 0)
    (hgrowth : ∀ A : ℝ, ∃ n : ℕ, A * (n : ℝ) < N n) :
    ¬ (∀ n, N (n + 1) = N n + M) := by
  intro hstep
  obtain ⟨n, hn⟩ := hgrowth M
  rw [constant_cell_count N M h0 hstep n, mul_comm] at hn
  exact (lt_irrefl _ hn)

#print axioms cylinder_add_continuous
#print axioms cylinder_neg_continuous
#print axioms project_deck
#print axioms project_add
#print axioms glide_square
#print axioms reflection_fixed_iff
#print axioms constant_cell_count
#print axioms superlinear_excludes_constant_cells

end ZeroStripSupplement
