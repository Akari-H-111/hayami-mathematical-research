import Mathlib.Data.Real.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Tactic.NormNum

/-!
# Kernel-checked elementary core for the zero-strip study

This file deliberately contains no claim about zeta zeros.  It formalizes the
ambient affine-linear symmetries and a general subgroup obstruction used in
the written analysis.
-/

namespace ZeroStrip

abbrev Plane := ℝ × ℝ

def C : Plane → Plane := fun p => (p.1, -p.2)
def F : Plane → Plane := fun p => (-p.1, -p.2)
def R : Plane → Plane := fun p => (-p.1, p.2)

theorem C_sq (p : Plane) : C (C p) = p := by
  rcases p with ⟨x, t⟩
  simp [C]

theorem F_sq (p : Plane) : F (F p) = p := by
  rcases p with ⟨x, t⟩
  simp [F]

theorem R_sq (p : Plane) : R (R p) = p := by
  rcases p with ⟨x, t⟩
  simp [R]

theorem C_comp_F (p : Plane) : C (F p) = R p := by
  rcases p with ⟨x, t⟩
  simp [C, F, R]

theorem F_comp_C (p : Plane) : F (C p) = R p := by
  rcases p with ⟨x, t⟩
  simp [C, F, R]

theorem ambient_maps_pairwise_distinct :
    C ≠ F ∧ C ≠ R ∧ F ≠ R ∧ C ≠ id ∧ F ≠ id ∧ R ≠ id := by
  constructor
  · intro h
    have := congrFun h (1, 0)
    norm_num [C, F] at this
  constructor
  · intro h
    have := congrFun h (1, 1)
    norm_num [C, R] at this
  constructor
  · intro h
    have := congrFun h (1, 1)
    norm_num [F, R] at this
  constructor
  · intro h
    have := congrFun h (0, 1)
    norm_num [C] at this
  constructor
  · intro h
    have := congrFun h (1, 0)
    norm_num [F] at this
  · intro h
    have := congrFun h (1, 0)
    norm_num [R] at this

def CMatrix : Matrix (Fin 2) (Fin 2) ℝ := !![1, 0; 0, -1]
def FMatrix : Matrix (Fin 2) (Fin 2) ℝ := !![-1, 0; 0, -1]
def RMatrix : Matrix (Fin 2) (Fin 2) ℝ := !![-1, 0; 0, 1]

theorem det_C : CMatrix.det = -1 := by
  simp [CMatrix, Matrix.det_fin_two]

theorem det_F : FMatrix.det = 1 := by
  simp [FMatrix, Matrix.det_fin_two]

theorem det_R : RMatrix.det = -1 := by
  simp [RMatrix, Matrix.det_fin_two]

theorem not_setOf_addSubgroup_of_zero_not_mem {G : Type*} [AddGroup G]
    (S : Set G) (hzero : 0 ∉ S) :
    ¬ ∃ H : AddSubgroup G, (H : Set G) = S := by
  rintro ⟨H, hH⟩
  apply hzero
  rw [← hH]
  exact H.zero_mem

end ZeroStrip

#print axioms ZeroStrip.C_sq
#print axioms ZeroStrip.F_sq
#print axioms ZeroStrip.R_sq
#print axioms ZeroStrip.C_comp_F
#print axioms ZeroStrip.F_comp_C
#print axioms ZeroStrip.ambient_maps_pairwise_distinct
#print axioms ZeroStrip.det_C
#print axioms ZeroStrip.det_F
#print axioms ZeroStrip.det_R
#print axioms ZeroStrip.not_setOf_addSubgroup_of_zero_not_mem
