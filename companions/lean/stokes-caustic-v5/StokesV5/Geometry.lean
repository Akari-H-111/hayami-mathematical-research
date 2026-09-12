import StokesV5.Polynomials

/-!
# Cleared-denominator geometry identities

The full Jacobian formula in v5 is a rational expression.  This module proves
its exact polynomial numerator reduction under the sole quadratic relation
`q^2 = c(2-c)`.  Nonzero-chart and fold-recognition hypotheses remain explicit
outside this finite algebra layer.
-/

namespace StokesV5

def jacobianRaw (c q u : ℚ) : ℚ :=
  c ^ 5 + c ^ 4 * u - 4 * c ^ 4 + 2 * c ^ 3 * q ^ 2 - 3 * c ^ 3 * u + 5 * c ^ 3 +
  c ^ 2 * q ^ 2 * u - 5 * c ^ 2 * q ^ 2 + 4 * c ^ 2 * u - 2 * c ^ 2 -
  2 * c * q ^ 2 * u + 2 * c * q ^ 2 - 3 * c * u + q ^ 2 + u

theorem jacobianRaw_reduce (c q u : ℚ) (hq : q ^ 2 = c * (2 - c)) :
    jacobianRaw c q u = A c + u * B c := by
  simp only [jacobianRaw, A, B]
  rw [hq]
  ring

def uFold (c : ℚ) : ℚ := -A c / B c

theorem B_mul_uFold (c : ℚ) (hB : B c ≠ 0) : B c * uFold c = -A c := by
  simp only [uFold]
  field_simp [hB]

theorem uFold_is_jacobian_root (c q : ℚ) (hB : B c ≠ 0)
    (hq : q ^ 2 = c * (2 - c)) : jacobianRaw c q (uFold c) = 0 := by
  rw [jacobianRaw_reduce _ _ _ hq]
  have h := B_mul_uFold c hB
  dsimp [uFold] at h ⊢
  field_simp [hB]
  ring

theorem radial_endpoint_norm_identity (c : ℚ) :
    (2 - c) ^ 2 + c * (2 - c) = 2 * (2 - c) := by
  ring

end StokesV5
