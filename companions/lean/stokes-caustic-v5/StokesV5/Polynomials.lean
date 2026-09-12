import Mathlib

/-!
# Exact polynomial data for Stokes caustic v5

These are the rational polynomial certificates used in the final manuscript.
No root-count or smooth-fold theorem is imported here.
-/

namespace StokesV5

def A (c : ℚ) : ℚ := (1 - c) * c * (2 - c) * (1 + 2 * c - c ^ 2)

def B (c : ℚ) : ℚ := c ^ 3 - 3 * c + 1

def pB (c : ℚ) : ℚ := c ^ 5 - 5 * c ^ 4 + 6 * c ^ 3 - c ^ 2 + c - 1

def r7 (c : ℚ) : ℚ :=
  3 * c ^ 7 - 8 * c ^ 6 - 12 * c ^ 5 + 60 * c ^ 4 - 69 * c ^ 3 + 30 * c ^ 2 - 6 * c - 1

def q17 (c : ℚ) : ℚ :=
  2 * c ^ 17 - 36 * c ^ 16 + 306 * c ^ 15 - 1588 * c ^ 14 + 5462 * c ^ 13 - 12800 * c ^ 12 +
  20432 * c ^ 11 - 21630 * c ^ 10 + 14160 * c ^ 9 - 4868 * c ^ 8 + 798 * c ^ 7 - 810 * c ^ 6 +
  856 * c ^ 5 - 346 * c ^ 4 + 64 * c ^ 3 + 14 * c ^ 2 - 12 * c

def nFold (c : ℚ) : ℚ := -A c

theorem pB_eq_nFold_sub_B (c : ℚ) : pB c = nFold c - B c := by
  simp only [pB, nFold, A, B]
  ring

theorem pB_zero_at_boundary_iff (c : ℚ) : pB c = 0 ↔ nFold c = B c := by
  rw [pB_eq_nFold_sub_B]
  constructor <;> intro h <;> linarith

end StokesV5
