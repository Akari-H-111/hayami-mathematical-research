import StokesV5.Polynomials

/-!
# Elementary real root barriers for Stokes caustic v5

The manuscript records these exclusions through an exact Sturm certificate.
For the fixed polynomials needed here, the same exclusions admit shorter
certificates: positive Bernstein expansions on the relevant interval.
This module deliberately works over `ℝ`, since root statements concern real
parameters rather than the rational coefficient field used by the data file.
-/

namespace StokesV5

def r7R (c : ℝ) : ℝ :=
  3 * c ^ 7 - 8 * c ^ 6 - 12 * c ^ 5 + 60 * c ^ 4 - 69 * c ^ 3 + 30 * c ^ 2 - 6 * c - 1

def pBR (c : ℝ) : ℝ := c ^ 5 - 5 * c ^ 4 + 6 * c ^ 3 - c ^ 2 + c - 1

def qCoreR (c : ℝ) : ℝ :=
  c ^ 15 - 16 * c ^ 14 + 121 * c ^ 13 - 552 * c ^ 12 + 1627 * c ^ 11 - 3146 * c ^ 10 +
    3924 * c ^ 9 - 2967 * c ^ 8 + 1146 * c ^ 7 - 142 * c ^ 6 + 115 * c ^ 5 - 175 * c ^ 4 +
    78 * c ^ 3 - 17 * c ^ 2 - 2 * c + 3

def q17R (c : ℝ) : ℝ :=
  2 * c ^ 17 - 36 * c ^ 16 + 306 * c ^ 15 - 1588 * c ^ 14 + 5462 * c ^ 13 - 12800 * c ^ 12 +
    20432 * c ^ 11 - 21630 * c ^ 10 + 14160 * c ^ 9 - 4868 * c ^ 8 + 798 * c ^ 7 - 810 * c ^ 6 +
    856 * c ^ 5 - 346 * c ^ 4 + 64 * c ^ 3 + 14 * c ^ 2 - 12 * c

theorem pBR_deriv (c : ℝ) : deriv pBR c = 5 * c ^ 4 - 20 * c ^ 3 + 18 * c ^ 2 - 2 * c + 1 := by
  have h := (((((hasDerivAt_pow 5 c).sub ((hasDerivAt_pow 4 c).const_mul 5)).add
      ((hasDerivAt_pow 3 c).const_mul 6)).sub (hasDerivAt_pow 2 c)).add
      (hasDerivAt_id c)).sub_const 1
  have hfun : pBR =ᶠ[nhds c]
      (fun x : ℝ => x ^ 5 - 5 * x ^ 4 + 6 * x ^ 3 - x ^ 2 + x - 1) :=
    Filter.Eventually.of_forall fun x => by rfl
  have h2 := h.congr_of_eventuallyEq hfun
  have hderiv :
      (5 : ℝ) * c ^ (5 - 1) - 5 * ((4 : ℝ) * c ^ (4 - 1)) +
          6 * ((3 : ℝ) * c ^ (3 - 1)) - (2 : ℝ) * c ^ (2 - 1) + 1 =
        5 * c ^ 4 - 20 * c ^ 3 + 18 * c ^ 2 - 2 * c + 1 := by
    norm_num
    ring
  exact (h2.congr_deriv hderiv).deriv

theorem pBR_deriv_pos_on_unit {c : ℝ} (hc0 : 0 ≤ c) (hc1 : c ≤ 1) : 0 < deriv pBR c := by
  have hnonneg : 0 ≤
      (1 - c) ^ 4 + 2 * c * (1 - c) ^ 3 + 18 * c ^ 2 * (1 - c) ^ 2 +
        14 * c ^ 3 * (1 - c) + 2 * c ^ 4 := by
    positivity
  have hpos : 0 <
      (1 - c) ^ 4 + 2 * c * (1 - c) ^ 3 + 18 * c ^ 2 * (1 - c) ^ 2 +
        14 * c ^ 3 * (1 - c) + 2 * c ^ 4 := by
    by_cases hcpos : 0 < c
    · have hrest : 0 ≤
          (1 - c) ^ 4 + 2 * c * (1 - c) ^ 3 + 18 * c ^ 2 * (1 - c) ^ 2 +
            14 * c ^ 3 * (1 - c) := by positivity
      have hlast : 0 < 2 * c ^ 4 := by positivity
      linarith
    · have hczero : c = 0 := le_antisymm (not_lt.mp hcpos) hc0
      rw [hczero]
      norm_num
  rw [pBR_deriv]
  have hidentity : 5 * c ^ 4 - 20 * c ^ 3 + 18 * c ^ 2 - 2 * c + 1 =
      (1 - c) ^ 4 + 2 * c * (1 - c) ^ 3 + 18 * c ^ 2 * (1 - c) ^ 2 +
        14 * c ^ 3 * (1 - c) + 2 * c ^ 4 := by ring
  linarith

theorem pBR_strictMonoOn_unit : StrictMonoOn pBR (Set.Icc (0 : ℝ) 1) := by
  apply strictMonoOn_of_deriv_pos (convex_Icc _ _)
  · have hpcont : Continuous pBR := by
      unfold pBR
      fun_prop
    exact hpcont.continuousOn
  · intro c hc
    have hc' : c ∈ Set.Icc (0 : ℝ) 1 := interior_subset hc
    exact pBR_deriv_pos_on_unit hc'.1 hc'.2

theorem exists_unique_pBR_zero_in_isolating_interval :
    ∃! c : ℝ, (613 : ℝ) / 1000 ≤ c ∧ c ≤ (614 : ℝ) / 1000 ∧ pBR c = 0 := by
  have hlo : pBR ((613 : ℝ) / 1000) < 0 := by norm_num [pBR]
  have hhi : 0 < pBR ((614 : ℝ) / 1000) := by norm_num [pBR]
  have hcont : ContinuousOn pBR (Set.Icc ((613 : ℝ) / 1000) ((614 : ℝ) / 1000)) := by
    have hpcont : Continuous pBR := by
      unfold pBR
      fun_prop
    exact hpcont.continuousOn
  have hexists : ∃ c ∈ Set.Icc ((613 : ℝ) / 1000) ((614 : ℝ) / 1000), pBR c = 0 := by
    obtain ⟨c, hc, hzero⟩ := intermediate_value_Icc (show (613 : ℝ) / 1000 ≤ (614 : ℝ) / 1000 by norm_num) hcont
      (show 0 ∈ Set.Icc (pBR ((613 : ℝ) / 1000)) (pBR ((614 : ℝ) / 1000)) by constructor <;> linarith)
    exact ⟨c, hc, hzero⟩
  obtain ⟨c, hc, hzero⟩ := hexists
  refine ⟨c, ⟨hc.1, hc.2, hzero⟩, ?_⟩
  intro d hd
  have hcunit : c ∈ Set.Icc (0 : ℝ) 1 := by constructor <;> linarith [hc.1, hc.2]
  have hdunit : d ∈ Set.Icc (0 : ℝ) 1 := by constructor <;> linarith [hd.1, hd.2]
  rcases lt_trichotomy c d with hlt | heq | hgt
  · have := pBR_strictMonoOn_unit hcunit hdunit hlt
    linarith [hd.2]
  · exact heq.symm
  · have := pBR_strictMonoOn_unit hdunit hcunit hgt
    linarith [hd.2]

theorem r7R_neg_on_unit {c : ℝ} (hc0 : 0 ≤ c) (hc1 : c ≤ 1) : r7R c < 0 := by
  have hnonneg : 0 ≤
      (1 - c) ^ 7 + 13 * c * (1 - c) ^ 6 + 27 * c ^ 2 * (1 - c) ^ 5 +
        44 * c ^ 3 * (1 - c) ^ 4 + 71 * c ^ 4 * (1 - c) ^ 3 +
        57 * c ^ 5 * (1 - c) ^ 2 + 21 * c ^ 6 * (1 - c) + 3 * c ^ 7 := by
    positivity
  have hpos : 0 <
      (1 - c) ^ 7 + 13 * c * (1 - c) ^ 6 + 27 * c ^ 2 * (1 - c) ^ 5 +
        44 * c ^ 3 * (1 - c) ^ 4 + 71 * c ^ 4 * (1 - c) ^ 3 +
        57 * c ^ 5 * (1 - c) ^ 2 + 21 * c ^ 6 * (1 - c) + 3 * c ^ 7 := by
    by_cases hcpos : 0 < c
    · have hrest : 0 ≤
          (1 - c) ^ 7 + 13 * c * (1 - c) ^ 6 + 27 * c ^ 2 * (1 - c) ^ 5 +
            44 * c ^ 3 * (1 - c) ^ 4 + 71 * c ^ 4 * (1 - c) ^ 3 +
            57 * c ^ 5 * (1 - c) ^ 2 + 21 * c ^ 6 * (1 - c) := by positivity
      have hlast : 0 < 3 * c ^ 7 := by positivity
      linarith
    · have hczero : c = 0 := le_antisymm (not_lt.mp hcpos) hc0
      rw [hczero]
      norm_num
  have hidentity : -r7R c =
      (1 - c) ^ 7 + 13 * c * (1 - c) ^ 6 + 27 * c ^ 2 * (1 - c) ^ 5 +
        44 * c ^ 3 * (1 - c) ^ 4 + 71 * c ^ 4 * (1 - c) ^ 3 +
        57 * c ^ 5 * (1 - c) ^ 2 + 21 * c ^ 6 * (1 - c) + 3 * c ^ 7 := by
    simp only [r7R]
    ring
  linarith

theorem BR_neg_on_physical {c : ℝ} (hc0 : (613 : ℝ) / 1000 ≤ c) (hc1 : c ≤ 1) : BR c < 0 := by
  let x : ℝ := (1000 * c - 613) / 387
  have hx0 : 0 ≤ x := by dsimp [x]; linarith
  have hx1 : x ≤ 1 := by dsimp [x]; linarith
  have hnonneg : 0 ≤
      (608653603 : ℝ) / 1000000000 * (1 - x) ^ 3 +
        (2550693 : ℝ) / 1000000 * x * (1 - x) ^ 2 + 3 * x ^ 2 * (1 - x) + x ^ 3 := by
    positivity
  have hpos : 0 <
      (608653603 : ℝ) / 1000000000 * (1 - x) ^ 3 +
        (2550693 : ℝ) / 1000000 * x * (1 - x) ^ 2 + 3 * x ^ 2 * (1 - x) + x ^ 3 := by
    by_cases hxpos : 0 < x
    · have hrest : 0 ≤
          (608653603 : ℝ) / 1000000000 * (1 - x) ^ 3 +
            (2550693 : ℝ) / 1000000 * x * (1 - x) ^ 2 + 3 * x ^ 2 * (1 - x) := by
        positivity
      have hlast : 0 < x ^ 3 := by positivity
      linarith
    · have hxzero : x = 0 := le_antisymm (not_lt.mp hxpos) hx0
      rw [hxzero]
      norm_num
  have hidentity : -BR c =
      (608653603 : ℝ) / 1000000000 * (1 - x) ^ 3 +
        (2550693 : ℝ) / 1000000 * x * (1 - x) ^ 2 + 3 * x ^ 2 * (1 - x) + x ^ 3 := by
    dsimp [x, BR]
    ring
  linarith

theorem q17R_pos_on_three_fifths {c : ℝ} (hc0 : (3 : ℝ) / 5 ≤ c) (hc1 : c ≤ 1) : 0 < q17R c := by
  let x : ℝ := (5 * c - 3) / 2
  have hx0 : 0 ≤ x := by dsimp [x]; linarith
  have hx1 : x ≤ 1 := by dsimp [x]; linarith
  have hnonneg : 0 ≤
      (6682813038 : ℝ) / 30517578125 * (1 - x) ^ 15 +
        (39131435474 : ℝ) / 6103515625 * x * (1 - x) ^ 14 +
        (81010629234 : ℝ) / 1220703125 * x ^ 2 * (1 - x) ^ 13 +
        (3687120502 : ℝ) / 9765625 * x ^ 3 * (1 - x) ^ 12 +
        (67837498686 : ℝ) / 48828125 * x ^ 4 * (1 - x) ^ 11 +
        (34998744082 : ℝ) / 9765625 * x ^ 5 * (1 - x) ^ 10 +
        (13240268434 : ℝ) / 1953125 * x ^ 6 * (1 - x) ^ 9 +
        (3768335382 : ℝ) / 390625 * x ^ 7 * (1 - x) ^ 8 +
        (817573722 : ℝ) / 78125 * x ^ 8 * (1 - x) ^ 7 +
        (135684294 : ℝ) / 15625 * x ^ 9 * (1 - x) ^ 6 +
        (17127014 : ℝ) / 3125 * x ^ 10 * (1 - x) ^ 5 +
        (1617762 : ℝ) / 625 * x ^ 11 * (1 - x) ^ 4 +
        (110842 : ℝ) / 125 * x ^ 12 * (1 - x) ^ 3 +
        (5206 : ℝ) / 25 * x ^ 13 * (1 - x) ^ 2 + 30 * x ^ 14 * (1 - x) + 2 * x ^ 15 := by
    positivity
  have hpos : 0 <
      (6682813038 : ℝ) / 30517578125 * (1 - x) ^ 15 +
        (39131435474 : ℝ) / 6103515625 * x * (1 - x) ^ 14 +
        (81010629234 : ℝ) / 1220703125 * x ^ 2 * (1 - x) ^ 13 +
        (3687120502 : ℝ) / 9765625 * x ^ 3 * (1 - x) ^ 12 +
        (67837498686 : ℝ) / 48828125 * x ^ 4 * (1 - x) ^ 11 +
        (34998744082 : ℝ) / 9765625 * x ^ 5 * (1 - x) ^ 10 +
        (13240268434 : ℝ) / 1953125 * x ^ 6 * (1 - x) ^ 9 +
        (3768335382 : ℝ) / 390625 * x ^ 7 * (1 - x) ^ 8 +
        (817573722 : ℝ) / 78125 * x ^ 8 * (1 - x) ^ 7 +
        (135684294 : ℝ) / 15625 * x ^ 9 * (1 - x) ^ 6 +
        (17127014 : ℝ) / 3125 * x ^ 10 * (1 - x) ^ 5 +
        (1617762 : ℝ) / 625 * x ^ 11 * (1 - x) ^ 4 +
        (110842 : ℝ) / 125 * x ^ 12 * (1 - x) ^ 3 +
        (5206 : ℝ) / 25 * x ^ 13 * (1 - x) ^ 2 + 30 * x ^ 14 * (1 - x) + 2 * x ^ 15 := by
    by_cases hxpos : 0 < x
    · have hrest : 0 ≤
          (6682813038 : ℝ) / 30517578125 * (1 - x) ^ 15 +
            (39131435474 : ℝ) / 6103515625 * x * (1 - x) ^ 14 +
            (81010629234 : ℝ) / 1220703125 * x ^ 2 * (1 - x) ^ 13 +
            (3687120502 : ℝ) / 9765625 * x ^ 3 * (1 - x) ^ 12 +
            (67837498686 : ℝ) / 48828125 * x ^ 4 * (1 - x) ^ 11 +
            (34998744082 : ℝ) / 9765625 * x ^ 5 * (1 - x) ^ 10 +
            (13240268434 : ℝ) / 1953125 * x ^ 6 * (1 - x) ^ 9 +
            (3768335382 : ℝ) / 390625 * x ^ 7 * (1 - x) ^ 8 +
            (817573722 : ℝ) / 78125 * x ^ 8 * (1 - x) ^ 7 +
            (135684294 : ℝ) / 15625 * x ^ 9 * (1 - x) ^ 6 +
            (17127014 : ℝ) / 3125 * x ^ 10 * (1 - x) ^ 5 +
            (1617762 : ℝ) / 625 * x ^ 11 * (1 - x) ^ 4 +
            (110842 : ℝ) / 125 * x ^ 12 * (1 - x) ^ 3 +
            (5206 : ℝ) / 25 * x ^ 13 * (1 - x) ^ 2 + 30 * x ^ 14 * (1 - x) := by
        positivity
      have hlast : 0 < 2 * x ^ 15 := by positivity
      linarith
    · have hxzero : x = 0 := le_antisymm (not_lt.mp hxpos) hx0
      rw [hxzero]
      norm_num
  have hcore : qCoreR c < 0 := by
    have hidentity : -qCoreR c =
        (6682813038 : ℝ) / 30517578125 * (1 - x) ^ 15 +
          (39131435474 : ℝ) / 6103515625 * x * (1 - x) ^ 14 +
          (81010629234 : ℝ) / 1220703125 * x ^ 2 * (1 - x) ^ 13 +
          (3687120502 : ℝ) / 9765625 * x ^ 3 * (1 - x) ^ 12 +
          (67837498686 : ℝ) / 48828125 * x ^ 4 * (1 - x) ^ 11 +
          (34998744082 : ℝ) / 9765625 * x ^ 5 * (1 - x) ^ 10 +
          (13240268434 : ℝ) / 1953125 * x ^ 6 * (1 - x) ^ 9 +
          (3768335382 : ℝ) / 390625 * x ^ 7 * (1 - x) ^ 8 +
          (817573722 : ℝ) / 78125 * x ^ 8 * (1 - x) ^ 7 +
          (135684294 : ℝ) / 15625 * x ^ 9 * (1 - x) ^ 6 +
          (17127014 : ℝ) / 3125 * x ^ 10 * (1 - x) ^ 5 +
          (1617762 : ℝ) / 625 * x ^ 11 * (1 - x) ^ 4 +
          (110842 : ℝ) / 125 * x ^ 12 * (1 - x) ^ 3 +
          (5206 : ℝ) / 25 * x ^ 13 * (1 - x) ^ 2 + 30 * x ^ 14 * (1 - x) + 2 * x ^ 15 := by
      dsimp [x, qCoreR]
      ring
    linarith
  have hcpos : 0 < c := by linarith
  have hcm2 : c - 2 < 0 := by linarith
  have hfactor : q17R c = 2 * c * (c - 2) * qCoreR c := by
    simp only [q17R, qCoreR]
    ring
  rw [hfactor]
  have hpair : 0 < (c - 2) * qCoreR c := mul_pos_of_neg_of_neg hcm2 hcore
  have hwhole : 0 < (2 * c) * ((c - 2) * qCoreR c) :=
    mul_pos (mul_pos (by norm_num) hcpos) hpair
  simpa only [mul_assoc] using hwhole

end StokesV5
