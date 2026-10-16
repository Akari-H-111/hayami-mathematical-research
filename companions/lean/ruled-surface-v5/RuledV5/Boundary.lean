import RuledV5.Surface

namespace RuledV5
noncomputable section
open StokesV5
open scoped Topology ContDiff

def boundaryC (r : ℝ) : ℝ := 1-Real.sqrt (1-r^2)
def boundaryS (ε r : ℝ) : ℝ := ε*Real.sqrt (1-(boundaryC r)^2)
def boundarySurface (ε : ℝ) (p : ℝ × ℝ) : ℝ × ℝ × ℝ :=
  (boundaryC p.1+2*p.2*(1-boundaryC p.1), (1-p.2)*boundaryS ε p.1, p.2*p.1)

theorem boundaryC_at_zero : boundaryC 0=0 := by norm_num [boundaryC]
theorem boundaryS_at_zero (ε : ℝ) : boundaryS ε 0=ε := by norm_num [boundaryS,boundaryC]

theorem boundaryC_hasDerivAt_zero : HasDerivAt boundaryC 0 0 := by
  have hr := (hasDerivAt_const (0 : ℝ) (1 : ℝ)).sub ((hasDerivAt_id (0 : ℝ)).pow 2)
  have h := (hr.sqrt (by norm_num)).const_sub (1 : ℝ)
  convert h using 1 <;> first | rfl | norm_num [boundaryC]

theorem boundaryS_hasDerivAt_zero (ε : ℝ) : HasDerivAt (boundaryS ε) 0 0 := by
  have hr := (hasDerivAt_const (0 : ℝ) (1 : ℝ)).sub (boundaryC_hasDerivAt_zero.pow 2)
  have h := (hr.sqrt (by norm_num [boundaryC])).const_mul ε
  convert h using 1 <;> first | rfl | norm_num [boundaryS,boundaryC]

theorem boundary_contDiffAt (ε u : ℝ) : ContDiffAt ℝ ∞ (boundarySurface ε) (0,u) := by
  have hc : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => boundaryC p.1) (0,u) := by
    apply contDiffAt_const.sub
    apply ContDiffAt.sqrt (by fun_prop) (by norm_num)
  have hs : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => boundaryS ε p.1) (0,u) := by
    exact contDiffAt_const.mul ((contDiffAt_const.sub (hc.pow 2)).sqrt
      (by norm_num [boundaryC]))
  have hu : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => p.2) (0,u) := by fun_prop
  have hr : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => p.1) (0,u) := by fun_prop
  have htwo : ContDiffAt ℝ ∞ (fun p : ℝ × ℝ => 2*p.2) (0,u) := by fun_prop
  unfold boundarySurface
  exact (hc.add (htwo.mul (contDiffAt_const.sub hc))).prodMk
    (((contDiffAt_const.sub hu).mul hs).prodMk (hu.mul hr))

def boundaryDerivative (ε u : ℝ) : (ℝ × ℝ) →L[ℝ] (ℝ × ℝ × ℝ) :=
  (rowCLM 0 2).prod ((rowCLM 0 (-ε)).prod (rowCLM u 0))

theorem boundary_hasFDerivAt (ε u : ℝ) :
    HasFDerivAt (boundarySurface ε) (boundaryDerivative ε u) (0,u) := by
  have hc := boundaryC_hasDerivAt_zero.comp_hasFDerivAt (0,u)
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (0,u)))
  have hs := (boundaryS_hasDerivAt_zero ε).comp_hasFDerivAt (0,u)
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (0,u)))
  have hu := hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (0,u))
  have hr := hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (0,u))
  have hx := hc.add ((hu.const_mul 2).mul ((hasFDerivAt_const (1 : ℝ) (0,u)).sub hc))
  have hy := ((hasFDerivAt_const (1 : ℝ) (0,u)).sub hu).mul hs
  have hz := hu.mul hr
  apply ((hx.prodMk (hy.prodMk hz)).congr_of_eventuallyEq
    (Filter.Eventually.of_forall fun _ => rfl)).congr_fderiv
  ext v <;> simp [boundaryDerivative,rowCLM,boundaryC_at_zero,boundaryS_at_zero]

theorem boundary_derivative_basis (ε u : ℝ) :
    fderiv ℝ (boundarySurface ε) (0,u) (1,0)=(0,0,u) ∧
    fderiv ℝ (boundarySurface ε) (0,u) (0,1)=(2,-ε,0) := by
  rw [(boundary_hasFDerivAt ε u).fderiv]
  simp [boundaryDerivative,rowCLM]

theorem boundary_areaVector (ε u : ℝ) :
    cross3 (fderiv ℝ (boundarySurface ε) (0,u) (1,0))
      (fderiv ℝ (boundarySurface ε) (0,u) (0,1))=(ε*u,2*u,0) := by
  rcases boundary_derivative_basis ε u with ⟨hr,hu⟩
  rw [hr,hu]
  simp [cross3,mul_comm]

theorem boundary_regular_iff (ε u : ℝ) :
    Function.Injective (fderiv ℝ (boundarySurface ε) (0,u)) ↔ u ≠ 0 := by
  rw [differential_injective_iff_cross,boundary_areaVector]
  constructor
  · intro h hu
    apply h
    simp [hu]
  · intro hu h
    have hy := congrArg (fun v : ℝ × ℝ × ℝ => v.2.1) h
    change 2*u=0 at hy
    exact hu (by linarith)

theorem boundary_corner_kernel (ε : ℝ) :
    fderiv ℝ (boundarySurface ε) (0,0) (1,0)=0 ∧ ((1,0) : ℝ × ℝ) ≠ 0 ∧
      fderiv ℝ (boundarySurface ε) (0,0) (0,1) ≠ 0 := by
  rcases boundary_derivative_basis ε 0 with ⟨hr,hu⟩
  rw [hr,hu]
  norm_num

theorem boundaryC_qChart {t : ℝ} (hc0 : 0 ≤ Real.cos t) (hc1 : Real.cos t ≤ 1) :
    boundaryC (qChart t)=Real.cos t := by
  have hq : (qChart t)^2=qSq t := Real.sq_sqrt (by
    unfold qSq
    exact mul_nonneg hc0 (by linarith))
  have he : 1-(qChart t)^2=(1-Real.cos t)^2 := by rw [hq]; unfold qSq; ring
  unfold boundaryC
  rw [he,Real.sqrt_sq (by linarith : 0 ≤ 1-Real.cos t)]
  ring

theorem boundary_matches_interior {t u ε : ℝ}
    (hc0 : 0 ≤ Real.cos t) (hc1 : Real.cos t ≤ 1)
    (hs : Real.sin t=ε*Real.sqrt (1-(Real.cos t)^2)) :
    boundarySurface ε (qChart t,u)=ruledSurface (t,u) := by
  simp [boundarySurface,ruledSurface,boundaryS,boundaryC_qChart hc0 hc1,hs]

theorem transition_derivative_nonzero {t u : ℝ} (hp : (t,u) ∈ observationDomain)
    (hc1 : Real.cos t < 1) (hs : Real.sin t ≠ 0) : dQdt (t,u) ≠ 0 := by
  unfold dQdt
  exact div_ne_zero (mul_ne_zero (neg_ne_zero.mpr hs) (by linarith)) (qChart_ne_zero hp)


theorem paired_boundary_images_at_u_one :
    boundarySurface 1 (0,1)=(2,0,0) ∧ boundarySurface (-1) (0,1)=(2,0,0) := by
  norm_num [boundarySurface,boundaryC,boundaryS]

end
end RuledV5
