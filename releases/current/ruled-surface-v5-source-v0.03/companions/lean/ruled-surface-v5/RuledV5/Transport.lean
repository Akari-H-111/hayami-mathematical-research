import RuledV5.Corner
import RuledV5.ObservationGeometry

namespace RuledV5
noncomputable section
open StokesV5 Filter
open scoped Topology

def boundaryAngleRate (ε r : ℝ) : ℝ :=
  -ε*r/(Real.sqrt (1-(boundaryC r)^2)*Real.sqrt (1-r^2))

theorem boundary_angle_hasDerivAt (ε : ℝ) {r : ℝ} (hr : r ∈ Set.Ioo (-1) 1) :
    HasDerivAt (boundaryAngle ε) (boundaryAngleRate ε r) r := by
  have hc := boundaryC_bounds hr
  have ha := (Real.hasDerivAt_arccos (by linarith [hc.1]) (ne_of_lt hc.2)).comp r
    (boundaryC_hasDerivAt hr)
  apply (ha.const_mul ε).congr_deriv
  unfold boundaryAngleRate
  field_simp

theorem boundary_transition_hasFDerivAt (ε : ℝ) {p : ℝ × ℝ}
    (hr : p.1 ∈ Set.Ioo (-1) 1) :
    HasFDerivAt (boundaryToAngular ε)
      ((rowCLM (boundaryAngleRate ε p.1) 0).prod (rowCLM 0 1)) p := by
  apply (((boundary_angle_hasDerivAt ε hr).comp_hasFDerivAt p
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))).prodMk
      (hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))).congr_fderiv
  ext v <;> simp [rowCLM]

theorem boundary_actual_area_transform {ε : ℝ} (he : ε=1 ∨ ε= -1)
    {p : ℝ × ℝ} (hr : p.1 ∈ Set.Ioo 0 1) :
    cross3 (fderiv ℝ (boundarySurface ε) p (1,0))
      (fderiv ℝ (boundarySurface ε) p (0,1)) =
      boundaryAngleRate ε p.1 • areaVector (boundaryToAngular ε p) := by
  have hp : boundaryToAngular ε p ∈ observationDomain := by
    apply Real.sqrt_pos.mp
    change 0 < qChart (boundaryAngle ε p.1)
    rw [boundaryAngle_qChart he hr.1.le hr.2]
    exact hr.1
  have hident : boundarySurface ε =ᶠ[𝓝 p]
      fun x => ruledSurface (boundaryToAngular ε x) := by
    filter_upwards [((isOpen_Ioo.preimage continuous_fst).mem_nhds hr)] with x hx
    exact (boundaryAngle_surface_inverse (u := x.2) he hx.1.le hx.2).symm
  have hder := (surface_hasFDerivAt hp).comp p
    (boundary_transition_hasFDerivAt ε ⟨by linarith [hr.1],hr.2⟩)
  have hd := hident.fderiv_eq.trans hder.fderiv
  rw [hd]
  have ht : (((surfaceDerivative (boundaryToAngular ε p)).comp
      ((rowCLM (boundaryAngleRate ε p.1) 0).prod (rowCLM 0 1))) (1,0)) =
      boundaryAngleRate ε p.1 • fderiv ℝ ruledSurface (boundaryToAngular ε p) (1,0) := by
    rw [(surface_hasFDerivAt hp).fderiv]
    simp only [ContinuousLinearMap.comp_apply,ContinuousLinearMap.prod_apply,rowCLM]
    simp
    rw [← map_smul]
    congr 1 <;> ext <;> simp
  have hu : (((surfaceDerivative (boundaryToAngular ε p)).comp
      ((rowCLM (boundaryAngleRate ε p.1) 0).prod (rowCLM 0 1))) (0,1)) =
      fderiv ℝ ruledSurface (boundaryToAngular ε p) (0,1) := by
    rw [(surface_hasFDerivAt hp).fderiv]
    simp [rowCLM]
  rw [ht,hu]
  unfold areaVector
  ext <;> simp [cross3] <;> ring

def boundaryObservation (ε : ℝ) (p : ℝ × ℝ) : ℝ × ℝ :=
  let V := cross3 (fderiv ℝ (boundarySurface ε) p (1,0))
    (fderiv ℝ (boundarySurface ε) p (0,1))
  (V.2.2,V.1)

theorem boundary_actual_observation_transform {ε : ℝ} (he : ε=1 ∨ ε= -1)
    {p : ℝ × ℝ} (hr : p.1 ∈ Set.Ioo 0 1) :
    boundaryObservation ε p=boundaryAngleRate ε p.1 • observationMap (boundaryToAngular ε p) := by
  have hp : boundaryToAngular ε p ∈ observationDomain := by
    apply Real.sqrt_pos.mp
    change 0 < qChart (boundaryAngle ε p.1)
    rw [boundaryAngle_qChart he hr.1.le hr.2];exact hr.1
  unfold boundaryObservation
  rw [boundary_actual_area_transform he hr,areaVector_eq hp]
  rfl

theorem boundary_observation_at_edge (ε u : ℝ) :
    boundaryObservation ε (0,u)=(0,ε*u) := by
  unfold boundaryObservation
  rw [boundary_areaVector]

theorem boundary_angle_rate_physical {ε r : ℝ} (he : ε=1 ∨ ε= -1)
    (hr : r ∈ Set.Ioo 0 1) :
    boundaryAngleRate ε r= -r/(boundaryS ε r*(1-boundaryC r)) := by
  have hsq : Real.sqrt (1-r^2)=1-boundaryC r := by unfold boundaryC;ring
  have hr' : r ∈ Set.Ioo (-1) 1 := ⟨by linarith [hr.1],hr.2⟩
  have hc := boundaryC_bounds hr'
  have hpos : 0 < 1-(boundaryC r)^2 := by
    nlinarith [mul_pos (show 0 < 1-boundaryC r by linarith [hc.2])
      (show 0 < 1+boundaryC r by linarith [hc.1])]
  have hn := ne_of_gt (Real.sqrt_pos.mpr hpos)
  have hc1 : 1-boundaryC r ≠ 0 := by linarith [hc.2]
  unfold boundaryAngleRate boundaryS
  rw [hsq]
  rcases he with rfl | rfl <;> field_simp <;> ring

theorem angular_field_boundary_residue {ε : ℝ} (he : ε=1 ∨ ε= -1) (u : ℝ) :
    Tendsto (fun r : ℝ => r*observationM (boundaryAngle ε r,u))
      (𝓝[>] 0) (𝓝 (-u)) := by
  let h : ℝ → ℝ := fun r => (boundaryC r)^2*(2-boundaryC r)-u*phaseD (boundaryC r)
  have hc : ContinuousAt boundaryC 0 := (boundaryC_contDiffAt (by norm_num)).continuousAt
  have hh : ContinuousAt h 0 := by unfold h phaseD;fun_prop
  have hl : Tendsto h (𝓝[>] (0:ℝ)) (𝓝 (-u)) := by
    simpa [h,boundaryC_at_zero,phaseD] using hh.tendsto.mono_left nhdsWithin_le_nhds
  have hid : (fun r : ℝ => r*observationM (boundaryAngle ε r,u)) =ᶠ[𝓝[>] 0] h := by
    filter_upwards [self_mem_nhdsWithin,
      (eventually_lt_nhds (show (0:ℝ)<1 by norm_num)).filter_mono nhdsWithin_le_nhds]
      with r hr0 hr1
    change (0:ℝ)<r at hr0
    have hc := (boundaryAngle_cos_sin he (show r ∈ Set.Ioo (-1) 1 by constructor <;> linarith)).1
    unfold observationM observationNumerator
    dsimp only
    rw [hc,boundaryAngle_qChart he hr0.le hr1]
    dsimp [h,phaseD]
    field_simp
    ring
  exact hl.congr' hid.symm

theorem angular_field_boundary_diverges {ε u : ℝ} (he : ε=1 ∨ ε= -1) (hu : 0 < u) :
    Tendsto (fun r : ℝ => observationM (boundaryAngle ε r,u)) (𝓝[>] 0) atBot := by
  have hl := tendsto_inv_nhdsGT_zero.atTop_mul_neg (show -u<0 by linarith)
    (angular_field_boundary_residue he u)
  have hid : (fun r : ℝ => r⁻¹*(r*observationM (boundaryAngle ε r,u))) =ᶠ[𝓝[>] 0]
      fun r => observationM (boundaryAngle ε r,u) := by
    filter_upwards [self_mem_nhdsWithin] with r hr
    change (0:ℝ)<r at hr
    field_simp
  exact hl.congr' hid

theorem boundary_observation_limit (ε u : ℝ) :
    Tendsto (fun r : ℝ => boundaryObservation ε (r,u)) (𝓝 0) (𝓝 (0,ε*u)) := by
  have hs := boundary_surface_contDiffAt ε (p := (0,u)) (by norm_num)
  have hd : ContinuousAt (fderiv ℝ (boundarySurface ε)) (0,u) :=
    hs.continuousAt_fderiv (by norm_num)
  have hf : ContinuousAt (boundaryObservation ε) (0,u) := by
    unfold boundaryObservation cross3
    fun_prop
  have hp : Tendsto (fun r : ℝ => (r,u)) (𝓝 0) (𝓝 (0,u)) :=
    (continuousAt_id.prodMk continuousAt_const).tendsto
  simpa only [Function.comp_def,boundary_observation_at_edge] using hf.tendsto.comp hp

end
end RuledV5
