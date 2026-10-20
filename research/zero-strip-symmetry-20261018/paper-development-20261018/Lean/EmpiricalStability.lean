import Mathlib.Data.Real.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

/-! Algebraic stability bounds for real test sums. No zeta or limit theorem. -/

namespace QuotientStability

theorem normalized_perturbation_bound (A B N M K : ℝ)
    (hN : 0 < N) (hM : 0 ≤ M) (hA : |A| ≤ K * N) (hB : |B| ≤ K * M) :
    |(A + B) / (N + M) - A / N| ≤ 2 * K * M / (N + M) := by
  have hD : 0 < N + M := add_pos_of_pos_of_nonneg hN hM
  have hr : 0 ≤ M / N := div_nonneg hM hN.le
  have hnum : |B - (M / N) * A| ≤ 2 * K * M := by
    calc
      _ ≤ |B| + |(M / N) * A| := by
        simpa using (abs_sub_le B 0 ((M / N) * A))
      _ = |B| + (M / N) * |A| := by rw [abs_mul, abs_of_nonneg hr]
      _ ≤ K * M + (M / N) * (K * N) :=
        add_le_add hB (mul_le_mul_of_nonneg_left hA hr)
      _ = 2 * K * M := by field_simp; ring
  have hid : (A + B) / (N + M) - A / N = (B - (M / N) * A) / (N + M) := by
    field_simp
    ring
  rw [hid, abs_div, abs_of_pos hD]
  exact div_le_div_of_nonneg_right hnum hD.le

theorem centered_perturbation_bound (B M I H K : ℝ)
    (hH : 0 < H) (hM : 0 ≤ M) (hB : |B| ≤ K * M) (hI : |I| ≤ K) :
    |(B - M * I) / H| ≤ 2 * K * M / H := by
  have hnum : |B - M * I| ≤ 2 * K * M := by
    calc
      _ ≤ |B| + |M * I| := by simpa using (abs_sub_le B 0 (M * I))
      _ = |B| + M * |I| := by rw [abs_mul, abs_of_nonneg hM]
      _ ≤ K * M + M * K := add_le_add hB (mul_le_mul_of_nonneg_left hI hM)
      _ = 2 * K * M := by ring
  rw [abs_div, abs_of_pos hH]
  exact div_le_div_of_nonneg_right hnum hH.le

#print axioms normalized_perturbation_bound
#print axioms centered_perturbation_bound

end QuotientStability
