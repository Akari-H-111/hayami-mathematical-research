import StokesV5.RationalNormalForm

namespace StokesV5
noncomputable section

def physicalBoundary : ℝ := exists_unique_pBR_zero_in_isolating_interval.choose

theorem physicalBoundary_spec :
    (613 : ℝ) / 1000 ≤ physicalBoundary ∧ physicalBoundary ≤ (614 : ℝ) / 1000 ∧
      pBR physicalBoundary = 0 :=
  exists_unique_pBR_zero_in_isolating_interval.choose_spec.1

theorem physicalBoundary_mem_unit : physicalBoundary ∈ Set.Icc (0 : ℝ) 1 := by
  have h := physicalBoundary_spec
  constructor <;> linarith [h.1, h.2.1]

theorem pBR_nonneg_iff_boundary_le {c : ℝ} (hc0 : 0 ≤ c) (hc1 : c ≤ 1) :
    0 ≤ pBR c ↔ physicalBoundary ≤ c := by
  have hb := physicalBoundary_mem_unit
  have hz := physicalBoundary_spec.2.2
  constructor
  · intro hp
    by_contra h
    have hlt := pBR_strictMonoOn_unit ⟨hc0, hc1⟩ hb (lt_of_not_ge h)
    linarith
  · intro h
    by_cases he : physicalBoundary = c
    · simpa [← he, hz]
    · have hlt := pBR_strictMonoOn_unit hb ⟨hc0, hc1⟩ (lt_of_le_of_ne h he)
      linarith

theorem physicalBoundary_unique_on_unit {c : ℝ} (hc0 : 0 ≤ c) (hc1 : c ≤ 1) :
    pBR c = 0 ↔ c = physicalBoundary := by
  constructor
  · intro h
    exact pBR_strictMonoOn_unit.injOn ⟨hc0, hc1⟩ physicalBoundary_mem_unit
      (h.trans physicalBoundary_spec.2.2.symm)
  · rintro rfl
    exact physicalBoundary_spec.2.2

theorem pBR_eq_neg_AR_sub_BR (c : ℝ) : pBR c = -AR c - BR c := by
  unfold pBR AR BR
  ring

theorem AR_pos_on_open_unit {c : ℝ} (hc0 : 0 < c) (hc1 : c < 1) : 0 < AR c := by
  have hfactor : 0 < 1 + 2 * c - c ^ 2 := by
    have h := mul_pos hc0 (show 0 < 2 - c by linarith)
    nlinarith
  exact mul_pos (mul_pos (mul_pos (by linarith) hc0) (by linarith)) hfactor

theorem physical_foldEquation_iff {c u : ℝ}
    (hc0 : 0 < c) (hc1 : c ≤ 1) (hu0 : 0 ≤ u) (hu1 : u ≤ 1) :
    AR c + u * BR c = 0 ↔ physicalBoundary ≤ c ∧ u = uFoldR c := by
  constructor
  · intro hf
    have hB : BR c < 0 := by
      by_cases he : c = 1
      · norm_num [he, BR]
      · have hA := AR_pos_on_open_unit hc0 (lt_of_le_of_ne hc1 he)
        nlinarith
    have hpb : 0 ≤ pBR c := by
      rw [pBR_eq_neg_AR_sub_BR]
      nlinarith
    refine ⟨(pBR_nonneg_iff_boundary_le (le_of_lt hc0) hc1).mp hpb, ?_⟩
    unfold uFoldR
    apply (eq_div_iff (ne_of_lt hB)).2
    linarith
  · rintro ⟨hb, rfl⟩
    have hB := ne_of_lt (BR_neg_on_physical (le_trans physicalBoundary_spec.1 hb) hc1)
    unfold uFoldR
    field_simp [hB]
    ring

theorem uFoldR_mem_unit_iff {c : ℝ} (hc0 : 0 < c) (hc1 : c ≤ 1) (hB : BR c ≠ 0) :
    (0 ≤ uFoldR c ∧ uFoldR c ≤ 1) ↔ physicalBoundary ≤ c := by
  have hfold : AR c + uFoldR c * BR c = 0 := by
    unfold uFoldR
    field_simp [hB]
    ring
  constructor
  · intro hu
    exact ((physical_foldEquation_iff hc0 hc1 hu.1 hu.2).mp hfold).1
  · intro hb
    have hBn := BR_neg_on_physical (le_trans physicalBoundary_spec.1 hb) hc1
    have hA : 0 ≤ AR c := by
      by_cases he : c = 1
      · norm_num [he, AR]
      · exact le_of_lt (AR_pos_on_open_unit hc0 (lt_of_le_of_ne hc1 he))
    have hpb := (pBR_nonneg_iff_boundary_le (le_of_lt hc0) hc1).mpr hb
    rw [pBR_eq_neg_AR_sub_BR] at hpb
    constructor
    · change 0 ≤ -AR c / BR c
      rw [div_nonneg_iff]
      exact Or.inr ⟨neg_nonpos.mpr hA, le_of_lt hBn⟩
    · change -AR c / BR c ≤ 1
      apply (div_le_iff_of_neg hBn).2
      linarith

theorem uFoldR_at_boundary : uFoldR physicalBoundary = 1 := by
  have hB := ne_of_lt (BR_neg_on_physical physicalBoundary_spec.1
    physicalBoundary_mem_unit.2)
  have hz := physicalBoundary_spec.2.2
  rw [pBR_eq_neg_AR_sub_BR] at hz
  unfold uFoldR
  apply (div_eq_iff hB).2
  linarith

theorem uFoldR_at_one : uFoldR 1 = 0 := by norm_num [uFoldR, AR, BR]

theorem observationMap_critical_iff {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    mapJacobian observationMap p = 0 ↔
      Real.sin p.1 = 0 ∨ AR (Real.cos p.1) + p.2 * BR (Real.cos p.1) = 0 := by
  rw [mapJacobian_observationMap hp, observationJacobian_factorization hp,
    div_eq_zero_iff]
  have hq := pow_ne_zero 3 (qChart_ne_zero hp)
  simp [hq, mul_eq_zero]

theorem ordinary_physical_rational_normalForm {t : ℝ}
    (ht : t ∈ Set.Ioo (-(Real.pi / 2)) (Real.pi / 2))
    (hb : physicalBoundary ≤ Real.cos t) (ht0 : t ≠ 0) :
    HasWhitneyNormalFormAt observationMap (t, uFoldR (Real.cos t)) := by
  have hc := Real.cos_pos_of_mem_Ioo ht
  have hs : Real.sin t ≠ 0 := by
    intro h
    apply ht0
    exact (Real.sin_eq_zero_iff_of_lt_of_lt (by linarith [ht.1, Real.pi_pos])
      (by linarith [ht.2, Real.pi_pos])).mp h
  have hc1 : Real.cos t < 1 := by
    have htrig := Real.sin_sq_add_cos_sq t
    have hsin := sq_pos_of_ne_zero hs
    nlinarith [Real.cos_le_one t]
  apply rationalBranch_hasWhitneyNormalFormAt
    (mul_pos hc (by linarith [Real.cos_le_one t]))
    (le_trans physicalBoundary_spec.1 hb) hc1 hs

theorem physical_critical_locus_iff {t u : ℝ}
    (ht : t ∈ Set.Ioo (-(Real.pi / 2)) (Real.pi / 2))
    (hu0 : 0 ≤ u) (hu1 : u ≤ 1) :
    mapJacobian observationMap (t, u) = 0 ↔
      t = 0 ∨ (physicalBoundary ≤ Real.cos t ∧ u = uFoldR (Real.cos t)) := by
  have hc := Real.cos_pos_of_mem_Ioo ht
  rw [observationMap_critical_iff (mul_pos hc (by linarith [Real.cos_le_one t])),
    physical_foldEquation_iff hc (Real.cos_le_one t) hu0 hu1]
  have hs : Real.sin t = 0 ↔ t = 0 :=
    Real.sin_eq_zero_iff_of_lt_of_lt (by linarith [ht.1, Real.pi_pos])
      (by linarith [ht.2, Real.pi_pos])
  exact or_congr hs Iff.rfl

theorem physical_critical_point_normalForm {t u : ℝ}
    (ht : t ∈ Set.Ioo (-(Real.pi / 2)) (Real.pi / 2))
    (hu0 : 0 ≤ u) (hu1 : u ≤ 1) (hJ : mapJacobian observationMap (t, u) = 0) :
    (t, u) = (0, 0) ∨ HasWhitneyNormalFormAt observationMap (t, u) := by
  have hc := Real.cos_pos_of_mem_Ioo ht
  have hp : (t, u) ∈ observationDomain :=
    mul_pos hc (by linarith [Real.cos_le_one t])
  by_cases ht0 : t = 0
  · subst t
    by_cases hu : u = 0
    · exact Or.inl (by rw [hu])
    · exact Or.inr (symmetry_hasWhitneyNormalFormAt (lt_of_le_of_ne hu0 (Ne.symm hu)))
  · have hsin : Real.sin t ≠ 0 := by
      intro h
      apply ht0
      exact (Real.sin_eq_zero_iff_of_lt_of_lt (by linarith [ht.1, Real.pi_pos])
        (by linarith [ht.2, Real.pi_pos])).mp h
    have hf := ((observationMap_critical_iff hp).mp hJ).resolve_left hsin
    have hphys := (physical_foldEquation_iff hc (Real.cos_le_one t) hu0 hu1).mp hf
    rw [hphys.2]
    exact Or.inr (ordinary_physical_rational_normalForm ht hphys.1 ht0)

end
end StokesV5
