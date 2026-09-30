import StokesV5.Polynomials

/-!
# Rational endpoint certificates

These exact inequalities are the endpoint data for the manuscript's Sturm
certificate. They establish neither uniqueness nor root-freeness by themselves.
-/

namespace StokesV5

def cLo : ℚ := 613 / 1000

def cHi : ℚ := 614 / 1000

theorem pB_at_cLo_neg : pB cLo < 0 := by
  norm_num [pB, cLo]

theorem pB_at_cHi_pos : 0 < pB cHi := by
  norm_num [pB, cHi]

theorem B_at_cLo_ne_zero : B cLo ≠ 0 := by
  norm_num [B, cLo]

theorem B_at_one_ne_zero : B 1 ≠ 0 := by
  norm_num [B]

end StokesV5
