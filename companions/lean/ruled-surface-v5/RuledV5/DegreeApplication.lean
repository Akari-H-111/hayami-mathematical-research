import RuledV5.Degree
import RuledV5.ObservationGeometry

namespace RuledV5
noncomputable section
open StokesV5 Filter unitInterval
open scoped Topology ContDiff
local instance : AddCommGroup ℂ := Complex.instNormedAddCommGroup.toAddCommGroup

theorem smooth_chart_fderiv_bijective {g : (ℝ × ℝ) → ℝ × ℝ} {p : ℝ × ℝ}
    (hg : IsSmoothChartAt g p) : Function.Bijective (fderiv ℝ g p) := by
  obtain ⟨hgc,h,hc,hp,hl,hr⟩ := hg
  have hdg := hgc.differentiableAt (by norm_num)
  have hdh := hc.differentiableAt (by norm_num)
  have hleft : (fderiv ℝ h (g p)).comp (fderiv ℝ g p)=ContinuousLinearMap.id ℝ _ := by
    rw [← fderiv_comp p hdh hdg]
    have hh : (h ∘ g) =ᶠ[𝓝 p] id := hl
    simpa using hh.fderiv_eq (𝕜 := ℝ)
  have hright : (fderiv ℝ g p).comp (fderiv ℝ h (g p))=ContinuousLinearMap.id ℝ _ := by
    have hhdg : DifferentiableAt ℝ g (h (g p)) := by simpa [hp] using hdg
    have hhder := fderiv_comp (g p) hhdg hdh
    have he : (fderiv ℝ g p).comp (fderiv ℝ h (g p))=fderiv ℝ (g ∘ h) (g p) := by
      simpa only [hp] using hhder.symm
    rw [he]
    have hh : (g ∘ h) =ᶠ[𝓝 (g p)] id := hr
    simpa using hh.fderiv_eq (𝕜 := ℝ)
  constructor
  · intro x y he
    have hh := congrArg (fderiv ℝ h (g p)) he
    have hx := congrArg (fun L => L x) hleft
    have hy := congrArg (fun L => L y) hleft
    simpa only [ContinuousLinearMap.comp_apply,ContinuousLinearMap.id_apply] using hx.symm.trans (hh.trans hy)
  · intro y
    refine ⟨fderiv ℝ h (g p) y,?_⟩
    exact congrArg (fun L => L y) hright

def complexPlaneField (z : ℂ) : ℂ := Complex.equivRealProdCLM.symm
  (observationMap (Complex.equivRealProdCLM z))


def circleParameter (p : ℝ × ℝ) (r t : ℝ) : ℝ × ℝ :=
  (p.1+r*Real.cos (2*Real.pi*t),p.2+r*Real.sin (2*Real.pi*t))

theorem complex_circle_parameter (p : ℝ × ℝ) (r t : ℝ) :
    Complex.equivRealProdCLM (Complex.equivRealProdCLM.symm p+r • circleValue t)=
      circleParameter p r t := by
  rw [map_add,map_smul,ContinuousLinearEquiv.apply_symm_apply]
  have hcir : Complex.equivRealProdCLM (circleValue t)=
      (Real.cos (2*Real.pi*t),Real.sin (2*Real.pi*t)) :=
    Prod.ext (Complex.exp_ofReal_mul_I_re _) (Complex.exp_ofReal_mul_I_im _)
  rw [hcir]
  ext <;> simp [circleParameter]

-- The derivative is conjugated by the orientation-preserving (Re,Im) identification.
theorem observation_zero_circle_winding {p : ℝ × ℝ} (hp : p ∈ observationDomain)
    (hzero : observationMap p=0) {ε : ℤ} (hε : ε=1 ∨ ε= -1)
    (hJ : 0 < observationJacobian p*(ε:ℝ)) :
    ∃ δ : ℝ, 0 < δ ∧ ∀ r : ℝ, r ∈ Set.Ioo 0 δ →
      ∃ γ : C(I,NonzeroComplex),
        (∀ t : I, (γ t).val=complexObservation
          (p.1+r*Real.cos (2*Real.pi*t),p.2+r*Real.sin (2*Real.pi*t))) ∧
        loopWinding γ=ε := by
  have hjn : observationJacobian p ≠ 0 := by
    intro hz;rw [hz,zero_mul] at hJ;exact (lt_irrefl 0) hJ
  let A : (ℝ × ℝ) ≃L[ℝ] (ℝ × ℝ) :=
    (LinearEquiv.ofBijective (fderiv ℝ observationMap p).toLinearMap
      (smooth_chart_fderiv_bijective (observation_local_inverse hp hjn))).toContinuousLinearEquiv
  let e := Complex.equivRealProdCLM
  let L : ℂ ≃L[ℝ] ℂ := e.trans (A.trans e.symm)
  let z := e.symm p
  have hd : HasFDerivAt complexPlaneField (L : ℂ →L[ℝ] ℂ) z := by
    have hh := e.symm.hasFDerivAt.comp z
      ((observationMap_hasFDerivAt hp).comp z e.hasFDerivAt)
    convert hh using 1 <;> first | rfl | (ext x; rfl)
  have hc : ContDiffAt ℝ 1 complexPlaneField z := by
    have ho : ContDiffAt ℝ ∞ observationMap p :=
      (by unfold observationN;fun_prop : ContDiffAt ℝ ∞ observationN p).prodMk
        (observationM_contDiffAt hp)
    have hh := e.symm.contDiff.contDiffAt.comp z (ho.comp z e.contDiff.contDiffAt)
    exact hh.of_le (by decide)
  have hz : complexPlaneField z=0 := by
    change e.symm (observationMap (e (e.symm p)))=0
    rw [e.apply_symm_apply,hzero,map_zero]
  have hj : planeJacobian (L : ℂ →L[ℝ] ℂ)=observationJacobian p := by
    change (e.symm (fderiv ℝ observationMap p (e 1))).re*
        (e.symm (fderiv ℝ observationMap p (e Complex.I))).im-
      (e.symm (fderiv ℝ observationMap p (e 1))).im*
        (e.symm (fderiv ℝ observationMap p (e Complex.I))).re=observationJacobian p
    rw [observationMap_fderiv_eq hp]
    have h1 : e (1:ℂ)=(1,0) := rfl
    have hI : e Complex.I=(0,1) := rfl
    rw [h1,hI]
    simp [e,observationDerivative,rowCLM,observationJacobian]
    ring
  obtain ⟨δ,hδ,hγ⟩ := nondegenerate_zero_circle_winding L hd hc hz hε (by rw [hj];exact hJ)
  refine ⟨δ,hδ,?_⟩
  intro r hr
  obtain ⟨γ,hg,hw⟩ := hγ r hr
  refine ⟨γ,?_,hw⟩
  intro t
  rw [hg]
  unfold complexPlaneField
  have he := complex_circle_parameter p r (t:ℝ)
  change e.symm (observationMap (e (z+r • circleValue t)))=_
  rw [he]
  simp [e,Complex.equivRealProdCLM_symm_apply,observationMap,complexObservation,circleParameter]


def physicalAngularInterior : Set (ℝ × ℝ) :=
  (Set.Ioo (-(Real.pi/2)) (Real.pi/2)).prod (Set.Ioo 0 1)

def HasLocalObservationIndex (p : ℝ × ℝ) (n : ℤ) : Prop :=
  ∃ δ : ℝ, 0 < δ ∧ ∀ r : ℝ, r ∈ Set.Ioo 0 δ →
    ∃ γ : C(I,NonzeroComplex),
      (∀ t : I, circleParameter p r t ∈ physicalAngularInterior ∧
        (γ t).val=complexObservation (circleParameter p r t)) ∧ loopWinding γ=n

theorem observation_index_of_nondegenerate_zero {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) (hphys : p ∈ physicalAngularInterior)
    (hzero : observationMap p=0) {ε : ℤ} (hε : ε=1 ∨ ε= -1)
    (hJ : 0 < observationJacobian p*(ε:ℝ)) : HasLocalObservationIndex p ε := by
  obtain ⟨δ₀,hδ₀,hγ⟩ := observation_zero_circle_winding hp hzero hε hJ
  have ho : IsOpen physicalAngularInterior := isOpen_Ioo.prod isOpen_Ioo
  have hu : Complex.equivRealProdCLM ⁻¹' physicalAngularInterior ∈
      𝓝 (Complex.equivRealProdCLM.symm p) := by
    apply (ho.preimage Complex.equivRealProdCLM.continuous).mem_nhds
    simpa using hphys
  obtain ⟨δ₁,hδ₁,hball⟩ := Metric.mem_nhds_iff.mp hu
  refine ⟨min δ₀ δ₁,lt_min hδ₀ hδ₁,?_⟩
  intro r hr
  obtain ⟨γ,hg,hw⟩ := hγ r ⟨hr.1,lt_of_lt_of_le hr.2 (min_le_left _ _)⟩
  refine ⟨γ,?_,hw⟩
  intro t
  constructor
  · have hh : Complex.equivRealProdCLM.symm p+r • circleValue t ∈
        Complex.equivRealProdCLM ⁻¹' physicalAngularInterior := by
      apply hball
      change dist (Complex.equivRealProdCLM.symm p+r • circleValue t)
        (Complex.equivRealProdCLM.symm p)<δ₁
      rw [dist_eq_norm,add_sub_cancel_left,norm_smul,circle_value_norm,
        Real.norm_eq_abs,abs_of_pos hr.1,mul_one]
      exact lt_of_lt_of_le hr.2 (min_le_right _ _)
    change Complex.equivRealProdCLM (Complex.equivRealProdCLM.symm p+r • circleValue t) ∈ physicalAngularInterior at hh
    rw [complex_circle_parameter] at hh
    exact hh
  · exact hg t

theorem lateral_observation_indices :
    HasLocalObservationIndex (lateralAngle,lateralRuling) (-1) ∧
      HasLocalObservationIndex (-lateralAngle,lateralRuling) 1 := by
  have hb := lateral_parameters_bounds
  have hc : Real.cos lateralAngle=lateralCos := Real.cos_arccos (by linarith [hb.1]) hb.2.1.le
  have hp : (lateralAngle,lateralRuling) ∈ observationDomain := by
    change 0 < Real.cos lateralAngle*(2-Real.cos lateralAngle)
    rw [hc];exact mul_pos hb.1 (by linarith [hb.2.1])
  have hn : (-lateralAngle,lateralRuling) ∈ observationDomain := by
    simpa [observationDomain,qSq,Real.cos_neg] using hp
  have hP : coreP (Real.cos lateralAngle)=0 := by
    rw [hc];exact (coreP_root_iff hb.1.le hb.2.1.le).mpr rfl
  have hzero : observationMap (lateralAngle,lateralRuling)=0 :=
    (observation_zero_iff hp (by rw [hc];exact hb.1)).mpr
      (Or.inr ⟨hP,by simp [lateralRuling,hc]⟩)
  have hzeron : observationMap (-lateralAngle,lateralRuling)=0 := by
    rw [observation_even,hzero]
  constructor
  · apply observation_index_of_nondegenerate_zero hp _ hzero (by simp) _
    · change lateralAngle ∈ Set.Ioo (-(Real.pi/2)) (Real.pi/2) ∧ lateralRuling ∈ Set.Ioo 0 1
      exact ⟨⟨by linarith [hb.2.2.1,Real.pi_pos],hb.2.2.2.1⟩,hb.2.2.2.2⟩
    · simpa using neg_pos.mpr positive_lateral_jacobian_negative
  · apply observation_index_of_nondegenerate_zero hn _ hzeron (by simp) _
    · change -lateralAngle ∈ Set.Ioo (-(Real.pi/2)) (Real.pi/2) ∧ lateralRuling ∈ Set.Ioo 0 1
      exact ⟨⟨by linarith [hb.2.2.2.1],by linarith [hb.2.2.1,Real.pi_pos]⟩,hb.2.2.2.2⟩
    · simpa using negative_lateral_jacobian_positive


theorem local_observation_index_unique {p : ℝ × ℝ} {n m : ℤ}
    (hn : HasLocalObservationIndex p n) (hm : HasLocalObservationIndex p m) : n=m := by
  obtain ⟨δn,hδn,hn⟩ := hn
  obtain ⟨δm,hδm,hm⟩ := hm
  let r := min δn δm/2
  have hr : 0 < r := by dsimp [r];exact div_pos (lt_min hδn hδm) (by norm_num)
  have hrn : r<δn := by dsimp [r];linarith [min_le_left δn δm,lt_min hδn hδm]
  have hrm : r<δm := by dsimp [r];linarith [min_le_right δn δm,lt_min hδn hδm]
  obtain ⟨γn,hγn,hwn⟩ := hn r ⟨hr,hrn⟩
  obtain ⟨γm,hγm,hwm⟩ := hm r ⟨hr,hrm⟩
  have he : γn=γm := by
    ext t
    exact (hγn t).2.trans (hγm t).2.symm
  have hh : (n:ℝ)=(m:ℝ) := hwn.symm.trans ((congrArg loopWinding he).trans hwm)
  exact_mod_cast hh

def localObservationIndex (p : ℝ × ℝ) : Option ℤ := by
  classical
  exact if h : ∃ n, HasLocalObservationIndex p n then some h.choose else none

theorem local_observation_index_eq_of_has {p : ℝ × ℝ} {n : ℤ}
    (hn : HasLocalObservationIndex p n) : localObservationIndex p=some n := by
  classical
  unfold localObservationIndex
  rw [dif_pos (show ∃ n, HasLocalObservationIndex p n from ⟨n,hn⟩)]
  congr 1
  exact local_observation_index_unique (Exists.choose_spec _) hn

theorem lateral_dipole_indices :
    localObservationIndex (lateralAngle,lateralRuling)=some (-1) ∧
      localObservationIndex (-lateralAngle,lateralRuling)=some 1 :=
  ⟨local_observation_index_eq_of_has lateral_observation_indices.1,
    local_observation_index_eq_of_has lateral_observation_indices.2⟩

theorem polar_has_no_interior_index (n : ℤ) : ¬ HasLocalObservationIndex (0,1) n := by
  rintro ⟨δ,hδ,h⟩
  have hr : δ/2 ∈ Set.Ioo 0 δ := by constructor <;> linarith
  obtain ⟨γ,hg,_⟩ := h (δ/2) hr
  let t : I := ⟨1/4,by constructor <;> norm_num⟩
  have hh := (hg t).1.2.2
  change 1+δ/2*Real.sin (2*Real.pi*(1/4))<1 at hh
  rw [show 2*Real.pi*(1/4)=Real.pi/2 by ring,Real.sin_pi_div_two] at hh
  linarith

theorem polar_observation_index_none : localObservationIndex (0,1)=none := by
  classical
  unfold localObservationIndex
  split_ifs with h
  · obtain ⟨n,hn⟩ := h
    exact False.elim (polar_has_no_interior_index n hn)
  · rfl

end
end RuledV5
