import RuledV5.Curvature
import StokesV5.NumericalBounds
import RuledV5.Signal

namespace RuledV5
noncomputable section
open StokesV5
open scoped ContDiff

def skeletonHeight (c : ℝ) : ℝ := c^2*(2-c)/phaseD c

theorem skeleton_height_physical {c : ℝ} (hc0 : 0 ≤ c) (hc1 : c ≤ 1) :
    skeletonHeight c ∈ Set.Icc 0 1 := by
  have hd := phaseD_pos c
  have hn : 0 ≤ c^2*(2-c) := mul_nonneg (sq_nonneg c) (by linarith)
  have he : phaseD c-c^2*(2-c)=(1-c)^2*(1+c) := by unfold phaseD; ring
  constructor
  · exact div_nonneg hn hd.le
  · apply (div_le_one hd).mpr
    have hs := mul_nonneg (sq_nonneg (1-c)) (show 0 ≤ 1+c by linarith)
    linarith

theorem observationM_skeleton_factor {p : ℝ × ℝ} :
    observationM p = phaseD (Real.cos p.1) / qChart p.1 *
      (skeletonHeight (Real.cos p.1)-p.2) := by
  have hd := ne_of_gt (phaseD_pos (Real.cos p.1))
  unfold observationM observationNumerator skeletonHeight phaseD
  unfold phaseD at hd
  field_simp [hd]
  ring

theorem observationM_positive_iff {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    0 < observationM p ↔ p.2 < skeletonHeight (Real.cos p.1) := by
  have hq : 0 < qChart p.1 := Real.sqrt_pos.mpr hp
  have hm := div_pos (phaseD_pos (Real.cos p.1)) hq
  rw [observationM_skeleton_factor,mul_pos_iff_of_pos_left hm,sub_pos]

theorem observationM_negative_iff {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    observationM p < 0 ↔ skeletonHeight (Real.cos p.1) < p.2 := by
  have hq : 0 < qChart p.1 := Real.sqrt_pos.mpr hp
  have hm := div_pos (phaseD_pos (Real.cos p.1)) hq
  rw [observationM_skeleton_factor,mul_neg_iff]
  simp [hm,not_lt_of_ge hm.le,sub_neg]

theorem complex_observation_components (p : ℝ × ℝ) :
    (complexObservation p).re=observationN p ∧ (complexObservation p).im=observationM p := by
  simp [complexObservation]

theorem skeleton_phase_zero_iff {p : ℝ × ℝ} (hm : observationM p=0)
    (hf : complexObservation p ≠ 0) :
    Complex.arg (complexObservation p)=0 ↔ 0 < observationN p := by
  have hn : observationN p ≠ 0 := by
    intro hn
    exact hf (by simp [complexObservation,hn,hm])
  rw [Complex.arg_eq_zero_iff,(complex_observation_components p).1,
    (complex_observation_components p).2,hm]
  constructor
  · rintro ⟨h,_⟩;exact lt_of_le_of_ne h (Ne.symm hn)
  · intro h;exact ⟨h.le,rfl⟩

theorem skeleton_phase_pi_iff {p : ℝ × ℝ} (hm : observationM p=0) :
    Complex.arg (complexObservation p)=Real.pi ↔ observationN p < 0 := by
  rw [Complex.arg_eq_pi_iff,(complex_observation_components p).1,
    (complex_observation_components p).2,hm]
  simp

theorem skeleton_nonzero_phase_classification {p : ℝ × ℝ}
    (hm : observationM p=0) (hf : complexObservation p ≠ 0) :
    Complex.arg (complexObservation p)=0 ∨ Complex.arg (complexObservation p)=Real.pi := by
  by_cases hn : 0 < observationN p
  · exact Or.inl ((skeleton_phase_zero_iff hm hf).mpr hn)
  · have hz : observationN p ≠ 0 := by
      intro hz;exact hf (by simp [complexObservation,hz,hm])
    exact Or.inr ((skeleton_phase_pi_iff hm).mpr (lt_of_le_of_ne (le_of_not_gt hn) hz))

theorem off_skeleton_phase_not_axis {p : ℝ × ℝ} (hm : observationM p ≠ 0) :
    Complex.arg (complexObservation p) ≠ 0 ∧ Complex.arg (complexObservation p) ≠ Real.pi := by
  constructor
  · intro h;exact hm (by simpa [(complex_observation_components p).2] using (Complex.arg_eq_zero_iff.mp h).2)
  · intro h;exact hm (by simpa [(complex_observation_components p).2] using (Complex.arg_eq_pi_iff.mp h).2)

theorem positive_lateral_jacobian_negative :
    observationJacobian (lateralAngle,lateralRuling)<0 := by
  have hb := lateral_parameters_bounds
  have hc : Real.cos lateralAngle=lateralCos := Real.cos_arccos (by linarith [hb.1]) hb.2.1.le
  have hp : (lateralAngle,lateralRuling) ∈ observationDomain := by
    change 0 < Real.cos lateralAngle*(2-Real.cos lateralAngle)
    rw [hc]; exact mul_pos hb.1 (by linarith [hb.2.1])
  have hP : coreP (Real.cos lateralAngle)=0 := by
    rw [hc];exact (coreP_root_iff hb.1.le hb.2.1.le).mpr rfl
  rw [lateral_jacobian hp hP (by simp [lateralRuling,hc])]
  have hs : 0 < Real.sin lateralAngle := Real.sin_pos_of_pos_of_lt_pi hb.2.2.1
    (by linarith [hb.2.2.2.1,Real.pi_pos])
  have hq : 0 < qChart lateralAngle := Real.sqrt_pos.mpr hp
  have hc1 : 0 < 1-Real.cos lateralAngle := by rw [hc]; linarith [hb.2.1]
  apply div_neg_of_neg_of_pos _ hq
  have hh := mul_pos (mul_pos (show (0:ℝ)<5 by norm_num) hs) (sq_pos_of_pos hc1)
  linarith

theorem negative_lateral_jacobian_positive :
    0 < observationJacobian (-lateralAngle,lateralRuling) := by
  have hb := lateral_parameters_bounds
  have hc : Real.cos lateralAngle=lateralCos := Real.cos_arccos (by linarith [hb.1]) hb.2.1.le
  have hp : (lateralAngle,lateralRuling) ∈ observationDomain := by
    change 0 < Real.cos lateralAngle*(2-Real.cos lateralAngle)
    rw [hc]; exact mul_pos hb.1 (by linarith [hb.2.1])
  rw [jacobian_odd hp]
  linarith [positive_lateral_jacobian_negative]

-- This is a determinant-sign theorem, not a definition of local degree.
theorem lateral_jacobians_nonzero :
    observationJacobian (lateralAngle,lateralRuling) ≠ 0 ∧
    observationJacobian (-lateralAngle,lateralRuling) ≠ 0 :=
  ⟨ne_of_lt positive_lateral_jacobian_negative,ne_of_gt negative_lateral_jacobian_positive⟩

theorem observation_local_inverse {p : ℝ × ℝ} (hp : p ∈ observationDomain)
    (hj : observationJacobian p ≠ 0) : IsSmoothChartAt observationMap p := by
  apply smoothChart_of_rows
    ((by unfold observationN;fun_prop : ContDiffAt ℝ ∞ observationN p).prodMk
      (observationM_contDiffAt hp)) (observationMap_hasExplicitFDerivAt hp)
  exact hj

theorem lateral_actual_local_inverses :
    IsSmoothChartAt observationMap (lateralAngle,lateralRuling) ∧
      IsSmoothChartAt observationMap (-lateralAngle,lateralRuling) := by
  have hb := lateral_parameters_bounds
  have hc : Real.cos lateralAngle=lateralCos := Real.cos_arccos (by linarith [hb.1]) hb.2.1.le
  have hp : (lateralAngle,lateralRuling) ∈ observationDomain := by
    change 0 < Real.cos lateralAngle*(2-Real.cos lateralAngle)
    rw [hc];exact mul_pos hb.1 (by linarith [hb.2.1])
  have hn : (-lateralAngle,lateralRuling) ∈ observationDomain := by
    simpa [observationDomain,qSq,Real.cos_neg] using hp
  exact ⟨observation_local_inverse hp lateral_jacobians_nonzero.1,
    observation_local_inverse hn lateral_jacobians_nonzero.2⟩

def projectionCLM (θ : ℝ) : (ℝ × ℝ × ℝ) →L[ℝ] (ℝ × ℝ) :=
  ((Real.cos θ • ContinuousLinearMap.fst ℝ ℝ (ℝ × ℝ)) +
    (Real.sin θ • (ContinuousLinearMap.snd ℝ ℝ ℝ).comp
      (ContinuousLinearMap.snd ℝ ℝ (ℝ × ℝ)))).prod
    ((ContinuousLinearMap.fst ℝ ℝ ℝ).comp (ContinuousLinearMap.snd ℝ ℝ (ℝ × ℝ)))

def projectionSurface (θ : ℝ) (p : ℝ × ℝ) := projectionCLM θ (ruledSurface p)

theorem projection_hasFDerivAt (θ : ℝ) {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    HasFDerivAt (projectionSurface θ) ((projectionCLM θ).comp (surfaceDerivative p)) p :=
  (projectionCLM θ).hasFDerivAt.comp p (surface_hasFDerivAt hp)

theorem actual_projection_jacobian (θ : ℝ) {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    mapJacobian (projectionSurface θ) p =
      observationN p*Real.cos θ-observationM p*Real.sin θ := by
  have ht := (surface_hasFDerivAt hp).fderiv
  have ha (v : ℝ × ℝ) : fderiv ℝ (projectionSurface θ) p v =
      projectionCLM θ (fderiv ℝ ruledSurface p v) := by
    rw [(projection_hasFDerivAt θ hp).fderiv,ht]
    rfl
  have hproj (v : ℝ × ℝ × ℝ) : projectionCLM θ v =
      (Real.cos θ*v.1+Real.sin θ*v.2.2,v.2.1) := rfl
  have he : mapJacobian (projectionSurface θ) p =
      (areaVector p).2.2*Real.cos θ-(areaVector p).1*Real.sin θ := by
    unfold mapJacobian linearJacobian
    rw [ha,ha,hproj,hproj]
    dsimp [areaVector,cross3]
    ring
  rw [he,areaVector_eq hp]


def intersectionCos : ℝ := exists_unique_skeleton_intersection.exists.choose

theorem intersection_cos_bounds :
    (673741:ℝ)/10^6 < intersectionCos ∧ intersectionCos < (673742:ℝ)/10^6 ∧
      discriminantE intersectionCos=0 := by
  have h := exists_unique_skeleton_intersection.exists.choose_spec
  change (673741:ℝ)/10^6 ≤ intersectionCos ∧ intersectionCos ≤ (673742:ℝ)/10^6 ∧
    discriminantE intersectionCos=0 at h
  have hlo : discriminantE ((673741:ℝ)/10^6) ≠ 0 := by norm_num [discriminantE]
  have hhi : discriminantE ((673742:ℝ)/10^6) ≠ 0 := by norm_num [discriminantE]
  refine ⟨lt_of_le_of_ne h.1 (fun he => hlo (by simpa [← he] using h.2.2)),
    lt_of_le_of_ne h.2.1 (fun he => hhi (he ▸ h.2.2)),h.2.2⟩

theorem intersection_cos_physical : intersectionCos ∈ Set.Icc physicalBoundary 1 := by
  have h := intersection_cos_bounds
  constructor <;> linarith [h.1,h.2.1,physicalBoundary_spec.2.1]

theorem intersection_cos_unique {c : ℝ} (hc : c ∈ Set.Icc physicalBoundary 1) :
    discriminantE c=0 ↔ c=intersectionCos := by
  constructor
  · intro hz
    exact discriminantE_strictAntiOn_physical.injOn hc intersection_cos_physical
      (hz.trans intersection_cos_bounds.2.2.symm)
  · rintro rfl; exact intersection_cos_bounds.2.2

theorem entire_skeleton_critical_intersection {t u : ℝ}
    (ht : t ∈ Set.Ioo (-(Real.pi/2)) (Real.pi/2)) (hu : u ∈ Set.Icc 0 1) :
    observationM (t,u)=0 ∧ mapJacobian observationMap (t,u)=0 ↔
      (t=0 ∧ u=1) ∨
      (Real.cos t=intersectionCos ∧ u=skeletonHeight intersectionCos) := by
  have hc := Real.cos_pos_of_mem_Ioo ht
  have hp : (t,u) ∈ observationDomain := mul_pos hc (by linarith [Real.cos_le_one t])
  have hfoldM : observationM (t,uFoldR (Real.cos t))=foldM (Real.cos t) :=
    congrArg Prod.snd (observationMap_rational_branch t)
  have hskel : observationM (t,u)=0 ↔ u=skeletonHeight (Real.cos t) :=
    skeleton_equation_iff hp
  have hskelF : observationM (t,uFoldR (Real.cos t))=0 ↔
      uFoldR (Real.cos t)=skeletonHeight (Real.cos t) :=
    skeleton_equation_iff (p := (t,uFoldR (Real.cos t))) hp
  rw [physical_critical_locus_iff ht hu.1 hu.2]
  constructor
  · rintro ⟨hm, hzero | ⟨hb,huf⟩⟩
    · left; refine ⟨hzero,?_⟩
      rw [hzero] at hm
      norm_num [observationM,observationNumerator,qChart,qSq] at hm
      linarith
    · have hE := (skeleton_fold_intersection_iff ⟨hb,Real.cos_le_one t⟩).mp
        (by simpa [huf,hfoldM] using hm)
      have hce := (intersection_cos_unique ⟨hb,Real.cos_le_one t⟩).mp hE
      exact Or.inr ⟨hce,by simpa [hce] using hskel.mp hm⟩
  · rintro (⟨rfl,rfl⟩ | ⟨hce,huS⟩)
    · exact ⟨by norm_num [observationM,observationNumerator,qChart,qSq],Or.inl rfl⟩
    · have hb : physicalBoundary ≤ Real.cos t := by rw [hce];exact intersection_cos_physical.1
      have hf := (skeleton_fold_intersection_iff ⟨hb,Real.cos_le_one t⟩).mpr
        (by rw [hce];exact intersection_cos_bounds.2.2)
      have hus := hskelF.mp (hfoldM.trans hf)
      exact ⟨hskel.mpr (by simpa [hce] using huS),
        Or.inr ⟨hb,by rw [hce]; rw [hce] at hus; exact huS.trans hus.symm⟩⟩

theorem rational_intersection_surface_regular {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) (hc : Real.cos p.1=intersectionCos) :
    Function.Injective (fderiv ℝ ruledSurface p) := by
  have hb := intersection_cos_bounds
  have hcp : 0 < Real.cos p.1 := by rw [hc];linarith [hb.1]
  rw [interior_regular_iff hp hcp]
  intro hz
  rcases (observation_zero_iff hp hcp).mp hz with h | h
  · linarith [h.1,hc,hb.2.1]
  · have hr := (coreP_root_iff hcp.le (Real.cos_le_one p.1)).mp h.1
    have hsq := Real.sq_sqrt (by norm_num : (0:ℝ) ≤ 5)
    have hn := Real.sqrt_nonneg (5:ℝ)
    have hs : (22:ℝ)/10 < Real.sqrt 5 := by nlinarith
    linarith [hr,hc,hb.1]

theorem physical_boundary_strict_bounds :
    (613:ℝ)/1000 < physicalBoundary ∧ physicalBoundary < (614:ℝ)/1000 := by
  constructor <;> linarith [physicalBoundary_decimal_bounds.1,physicalBoundary_decimal_bounds.2]

def asymptoteCos : ℝ := 2*Real.cos (4*Real.pi/9)

theorem asymptote_cos_bounds : 0 < asymptoteCos ∧ asymptoteCos < 1 := by
  have hp := Real.pi_pos
  have hc := Real.cos_pos_of_mem_Ioo (show 4*Real.pi/9 ∈ Set.Ioo (-(Real.pi/2)) (Real.pi/2) by
    constructor <;> linarith)
  have hh := Real.strictAntiOn_cos
    (show Real.pi/3 ∈ Set.Icc 0 Real.pi by constructor <;> linarith)
    (show 4*Real.pi/9 ∈ Set.Icc 0 Real.pi by constructor <;> linarith)
    (show Real.pi/3 < 4*Real.pi/9 by linarith)
  rw [Real.cos_pi_div_three] at hh
  unfold asymptoteCos
  constructor <;> linarith

theorem asymptote_cos_cubic : BR asymptoteCos=0 := by
  have hh := Real.cos_three_mul (4*Real.pi/9)
  rw [show 3*(4*Real.pi/9)=Real.pi/3+Real.pi by ring,
    Real.cos_add_pi,Real.cos_pi_div_three] at hh
  unfold BR asymptoteCos
  nlinarith [hh]

theorem asymptote_not_critical {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) (hc : Real.cos p.1=asymptoteCos)
    (hs : Real.sin p.1 ≠ 0) : mapJacobian observationMap p ≠ 0 := by
  change ¬ mapJacobian observationMap p=0
  rw [observationMap_critical_iff hp]
  simp only [hc,asymptote_cos_cubic,mul_zero,add_zero,hs,false_or]
  exact ne_of_gt (AR_pos_on_open_unit asymptote_cos_bounds.1 asymptote_cos_bounds.2)

theorem asymptote_unique_cubic_root {c : ℝ} (hc : c ∈ Set.Icc 0 1) :
    BR c=0 ↔ c=asymptoteCos := by
  have hm : StrictAntiOn BR (Set.Icc (0:ℝ) 1) := by
    intro x hx y hy hxy
    have hx1 : x < 1 := lt_of_lt_of_le hxy hy.2
    have hx2 : x^2 < 1 := by
      nlinarith [mul_pos (show 0<1-x by linarith) (show 0<1+x by linarith [hx.1])]
    have hy2 : y^2 ≤ 1 := by
      nlinarith [mul_nonneg (show 0≤1-y by linarith [hy.2]) (show 0≤1+y by linarith [hy.1])]
    have hxy1 : x*y ≤ 1 := by
      nlinarith [mul_nonneg hy.1 (show 0≤1-x by linarith)]
    have hg : 0 < 3-x^2-x*y-y^2 := by linarith
    have hh := mul_pos (sub_pos.mpr hxy) hg
    unfold BR
    nlinarith [hh]
  constructor
  · intro hz
    exact hm.injOn hc ⟨asymptote_cos_bounds.1.le,asymptote_cos_bounds.2.le⟩
      (hz.trans asymptote_cos_cubic.symm)
  · rintro rfl;exact asymptote_cos_cubic

end
end RuledV5
