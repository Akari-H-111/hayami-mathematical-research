import StokesV5.PaperGeometry

namespace StokesV5
noncomputable section

theorem physicalBoundary_decimal_bounds :
    (613055096856275 : ℝ) / 10 ^ 15 < physicalBoundary ∧
      physicalBoundary < (613055096856276 : ℝ) / 10 ^ 15 := by
  have hlo : pBR ((613055096856275 : ℝ) / 10 ^ 15) < 0 := by norm_num [pBR]
  have hhi : 0 < pBR ((613055096856276 : ℝ) / 10 ^ 15) := by norm_num [pBR]
  have hlunit : (613055096856275 : ℝ) / 10 ^ 15 ∈ Set.Icc 0 1 := by norm_num
  have huunit : (613055096856276 : ℝ) / 10 ^ 15 ∈ Set.Icc 0 1 := by norm_num
  constructor
  · by_contra h
    have hm := pBR_strictMonoOn_unit.monotoneOn physicalBoundary_mem_unit hlunit (le_of_not_gt h)
    rw [physicalBoundary_spec.2.2] at hm
    linarith
  · by_contra h
    have hm := pBR_strictMonoOn_unit.monotoneOn huunit physicalBoundary_mem_unit (le_of_not_gt h)
    rw [physicalBoundary_spec.2.2] at hm
    linarith

theorem spherical_endpoint_decimal_bounds :
    (832749933396491 : ℝ) / 10 ^ 15 < Real.sqrt ((2 - physicalBoundary) / 2) ∧
    Real.sqrt ((2 - physicalBoundary) / 2) < (832749933396493 : ℝ) / 10 ^ 15 ∧
    (553649300937098 : ℝ) / 10 ^ 15 < Real.sqrt (physicalBoundary / 2) ∧
    Real.sqrt (physicalBoundary / 2) < (553649300937100 : ℝ) / 10 ^ 15 := by
  have hb := physicalBoundary_decimal_bounds
  refine ⟨Real.lt_sqrt_of_sq_lt ?_, (Real.sqrt_lt' (by norm_num)).mpr ?_,
    Real.lt_sqrt_of_sq_lt ?_, (Real.sqrt_lt' (by norm_num)).mpr ?_⟩ <;>
    nlinarith [hb.1, hb.2]

theorem discriminant_endpoint_N_decimal_bounds :
    -(62416344825 : ℝ) / 10 ^ 11 < physicalBoundary ^ 2 - 1 ∧
    physicalBoundary ^ 2 - 1 < -(62416344815 : ℝ) / 10 ^ 11 := by
  have h := physicalBoundary_decimal_bounds
  constructor <;> nlinarith [h.1, h.2, physicalBoundary_mem_unit.1]

theorem boundary_q_decimal_bounds :
    (922102836960765 : ℝ) / 10 ^ 15 < qC physicalBoundary ∧
      qC physicalBoundary < (922102836960768 : ℝ) / 10 ^ 15 := by
  have h := physicalBoundary_decimal_bounds
  have hlo : 0 ≤ 1 - physicalBoundary := by linarith [h.2]
  have hslo : (1 - (613055096856276 : ℝ) / 10 ^ 15) ^ 2 < (1 - physicalBoundary) ^ 2 :=
    sq_lt_sq₀ (by norm_num) hlo |>.mpr (by linarith [h.2])
  have hshi : (1 - physicalBoundary) ^ 2 < (1 - (613055096856275 : ℝ) / 10 ^ 15) ^ 2 :=
    sq_lt_sq₀ hlo (by norm_num) |>.mpr (by linarith [h.1])
  unfold qC
  refine ⟨Real.lt_sqrt_of_sq_lt ?_, (Real.sqrt_lt' (by norm_num)).mpr ?_⟩ <;>
    nlinarith

theorem discriminant_endpoint_M_decimal_bounds :
    -(26191966385 : ℝ) / 10 ^ 11 <
      -(1 - physicalBoundary) ^ 2 * (1 + physicalBoundary) / qC physicalBoundary ∧
    -(1 - physicalBoundary) ^ 2 * (1 + physicalBoundary) / qC physicalBoundary <
      -(26191966375 : ℝ) / 10 ^ 11 := by
  let l : ℝ := 613055096856275 / 10 ^ 15
  let h : ℝ := 613055096856276 / 10 ^ 15
  have hb := physicalBoundary_decimal_bounds
  change l < physicalBoundary ∧ physicalBoundary < h at hb
  have hn0 : 0 ≤ 1 - physicalBoundary := by dsimp [h] at hb; linarith [hb.2]
  have hlow : (1 - h) ^ 2 ≤ (1 - physicalBoundary) ^ 2 :=
    (sq_le_sq₀ (by norm_num [h]) hn0).mpr (by linarith [hb.2])
  have hhigh : (1 - physicalBoundary) ^ 2 ≤ (1 - l) ^ 2 :=
    (sq_le_sq₀ hn0 (by norm_num [l])).mpr (by linarith [hb.1])
  have hnl : (1 - h) ^ 2 * (1 + l) ≤ (1 - physicalBoundary) ^ 2 * (1 + physicalBoundary) :=
    mul_le_mul hlow (by linarith [hb.1]) (by norm_num [l]) (sq_nonneg _)
  have hnh : (1 - physicalBoundary) ^ 2 * (1 + physicalBoundary) ≤ (1 - l) ^ 2 * (1 + h) :=
    mul_le_mul hhigh (by linarith [hb.2]) (by linarith [physicalBoundary_mem_unit.1]) (sq_nonneg _)
  have hq := boundary_q_decimal_bounds
  have hq0 : 0 < qC physicalBoundary := by linarith [hq.1]
  constructor
  · apply (lt_div_iff₀ hq0).mpr
    dsimp [l, h] at hnh
    nlinarith [hnh, hq.1]
  · apply (div_lt_iff₀ hq0).mpr
    dsimp [l, h] at hnl
    nlinarith [hnl, hq.2]

end
end StokesV5
