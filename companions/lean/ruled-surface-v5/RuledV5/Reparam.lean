import RuledV5.Curvature
import RuledV5.Transport

namespace RuledV5
noncomputable section
open StokesV5 Filter
open scoped Topology

-- Second-order chain rule for the actual composed surface.
theorem patch_second_comp {S : (ℝ × ℝ) → ℝ × ℝ × ℝ}
    {φ : (ℝ × ℝ) → ℝ × ℝ} {p : ℝ × ℝ}
    (hS : ContDiffAt ℝ 2 S (φ p)) (hφ : ContDiffAt ℝ 2 φ p)
    (i j : ℝ × ℝ) :
    patchSecond (S ∘ φ) i j p =
      fderiv ℝ (fderiv ℝ S) (φ p) (fderiv ℝ φ p j) (fderiv ℝ φ p i) +
      fderiv ℝ S (φ p) (fderiv ℝ (fderiv ℝ φ) p j i) := by
  have hds1 : ContDiffAt ℝ 1 (fderiv ℝ S) (φ p) := hS.fderiv_right (by norm_num)
  have hdφ1 : ContDiffAt ℝ 1 (fderiv ℝ φ) p := hφ.fderiv_right (by norm_num)
  have hds := hds1.differentiableAt (by norm_num)
  have hdφ := hdφ1.differentiableAt (by norm_num)
  have he : patchTangent (S ∘ φ) i =ᶠ[𝓝 p]
      fun x => fderiv ℝ S (φ x) (fderiv ℝ φ x i) := by
    have hs := hS.eventually (by norm_num)
    have ht := hφ.eventually (by norm_num)
    filter_upwards [hφ.continuousAt.tendsto.eventually hs,ht] with x hxS hxφ
    unfold patchTangent
    rw [fderiv_comp x (hxS.differentiableAt (by norm_num))
      (hxφ.differentiableAt (by norm_num))]
    rfl
  have hdc := hds.hasFDerivAt.comp p (hφ.differentiableAt (by norm_num)).hasFDerivAt
  have hdi := hdφ.hasFDerivAt.clm_apply (hasFDerivAt_const (c := i) p)
  have hf := (hdc.clm_apply hdi).fderiv
  unfold patchSecond
  rw [he.fderiv_eq]
  simpa [Function.comp_def,add_comm] using congrArg (fun L => L j) hf


def separatedMap (T : ℝ → ℝ) (p : ℝ × ℝ) : ℝ × ℝ := (T p.1,p.2)

theorem separated_first_jet {T : ℝ → ℝ} {p : ℝ × ℝ}
    (hT : ContDiffAt ℝ 2 T p.1) :
    fderiv ℝ (separatedMap T) p=
      (rowCLM (deriv T p.1) 0).prod (rowCLM 0 1) := by
  have ht := (hT.differentiableAt (by norm_num)).hasDerivAt.comp_hasFDerivAt p
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))
  have hh := (ht.prodMk (hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))).fderiv
  change fderiv ℝ (fun x => (T x.1,x.2)) p=_
  simpa [rowCLM] using hh

theorem separated_second_jet {T : ℝ → ℝ} {p : ℝ × ℝ}
    (hT : ContDiffAt ℝ 2 T p.1) (i j : ℝ × ℝ) :
    fderiv ℝ (fderiv ℝ (separatedMap T)) p j i=
      (deriv (deriv T) p.1*j.1*i.1,0) := by
  have hdf : ContDiffAt ℝ 1 (fderiv ℝ T) p.1 := hT.fderiv_right (by norm_num)
  have hd : ContDiffAt ℝ 1 (deriv T) p.1 := by
    change ContDiffAt ℝ 1 (fun x => fderiv ℝ T x 1) p.1
    exact hdf.clm_apply contDiffAt_const
  have hi : (fun x => fderiv ℝ (separatedMap T) x i) =ᶠ[𝓝 p]
      fun x => (deriv T x.1*i.1,i.2) := by
    filter_upwards [(continuousAt_fst.tendsto.eventually (hT.eventually (by norm_num)))] with x hx
    rw [separated_first_jet hx]
    simp [rowCLM]
  have hφ : ContDiffAt ℝ 2 (separatedMap T) p := by
    exact (hT.comp p contDiffAt_fst).prodMk contDiffAt_snd
  have hf1 : ContDiffAt ℝ 1 (fderiv ℝ (separatedMap T)) p := hφ.fderiv_right (by norm_num)
  have hf := fderiv_clm_apply (hf1.differentiableAt (by norm_num)) (differentiableAt_const i)
  have ht := ((hd.differentiableAt (by norm_num)).hasDerivAt.comp_hasFDerivAt p
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))).mul_const i.1
  have hh := (ht.prodMk (hasFDerivAt_const (𝕜 := ℝ) (c := i.2) p)).fderiv
  have he := hi.fderiv_eq (𝕜 := ℝ)
  rw [hf] at he
  have hhj := congrArg (fun L => L j) (he.trans hh)
  simpa [separatedMap,Function.comp_def,rowCLM,mul_assoc,mul_comm,mul_left_comm] using hhj


def patchArea (S : (ℝ × ℝ) → ℝ × ℝ × ℝ) (p : ℝ × ℝ) :=
  cross3 (patchTangent S (1,0) p) (patchTangent S (0,1) p)

theorem gaussian_curvature_raw {S : (ℝ × ℝ) → ℝ × ℝ × ℝ} {p : ℝ × ℝ}
    (hv : patchArea S p ≠ 0) :
    gaussianCurvature S p=
      (dot3 (patchArea S p) (patchSecond S (1,0) (1,0) p)*
        dot3 (patchArea S p) (patchSecond S (0,1) (0,1) p)-
       (dot3 (patchArea S p) (patchSecond S (0,1) (1,0) p))^2)/
      (euclideanSq (patchArea S p))^2 := by
  have hd := (euclideanSq_pos_iff _).mpr hv
  have hs := Real.sq_sqrt hd.le
  have hn := ne_of_gt (Real.sqrt_pos.mpr hd)
  have hg := cross_gram_identity (patchTangent S (1,0) p) (patchTangent S (0,1) p)
  have he (a : ℝ) (v w : ℝ × ℝ × ℝ) : dot3 (a • v) w=a*dot3 v w := by
    simp [dot3];ring
  unfold gaussianCurvature
  dsimp only
  rw [hg]
  change _ / euclideanSq (patchArea S p)=_
  change (dot3 ((1/Real.sqrt (euclideanSq (patchArea S p))) • patchArea S p) _ *
    dot3 ((1/Real.sqrt (euclideanSq (patchArea S p))) • patchArea S p) _ -
    (dot3 ((1/Real.sqrt (euclideanSq (patchArea S p))) • patchArea S p) _)^2)/_=_
  rw [he,he,he]
  field_simp [hn,ne_of_gt hd]
  rw [hs]
  ring


theorem patch_second_iterated {S : (ℝ × ℝ) → ℝ × ℝ × ℝ} {p : ℝ × ℝ}
    (hS : ContDiffAt ℝ 2 S p) (i j : ℝ × ℝ) :
    patchSecond S i j p=fderiv ℝ (fderiv ℝ S) p j i := by
  have hd : ContDiffAt ℝ 1 (fderiv ℝ S) p := hS.fderiv_right (by norm_num)
  unfold patchSecond patchTangent
  rw [fderiv_clm_apply (hd.differentiableAt (by norm_num)) (differentiableAt_const i)]
  simp

theorem separated_tangent_basis {S : (ℝ × ℝ) → ℝ × ℝ × ℝ}
    {T : ℝ → ℝ} {p : ℝ × ℝ}
    (hS : ContDiffAt ℝ 2 S (separatedMap T p)) (hT : ContDiffAt ℝ 2 T p.1) :
    patchTangent (S ∘ separatedMap T) (1,0) p=
        deriv T p.1 • patchTangent S (1,0) (separatedMap T p) ∧
    patchTangent (S ∘ separatedMap T) (0,1) p=
        patchTangent S (0,1) (separatedMap T p) := by
  have hφ : ContDiffAt ℝ 2 (separatedMap T) p :=
    (hT.comp p contDiffAt_fst).prodMk contDiffAt_snd
  unfold patchTangent
  rw [fderiv_comp p (hS.differentiableAt (by norm_num)) (hφ.differentiableAt (by norm_num)),
    separated_first_jet hT]
  have he : (deriv T p.1,0)=deriv T p.1 • ((1,0):ℝ × ℝ) := by ext <;> simp
  simp [rowCLM]
  rw [he,map_smul]

theorem separated_second_basis {S : (ℝ × ℝ) → ℝ × ℝ × ℝ}
    {T : ℝ → ℝ} {p : ℝ × ℝ}
    (hS : ContDiffAt ℝ 2 S (separatedMap T p)) (hT : ContDiffAt ℝ 2 T p.1) :
    patchSecond (S ∘ separatedMap T) (1,0) (1,0) p=
      (deriv T p.1)^2 • patchSecond S (1,0) (1,0) (separatedMap T p)+
      deriv (deriv T) p.1 • patchTangent S (1,0) (separatedMap T p) ∧
    patchSecond (S ∘ separatedMap T) (0,1) (1,0) p=
      deriv T p.1 • patchSecond S (0,1) (1,0) (separatedMap T p) ∧
    patchSecond (S ∘ separatedMap T) (0,1) (0,1) p=
      patchSecond S (0,1) (0,1) (separatedMap T p) := by
  have hφ : ContDiffAt ℝ 2 (separatedMap T) p :=
    (hT.comp p contDiffAt_fst).prodMk contDiffAt_snd
  have he (a : ℝ) : (a,0)=a • ((1,0):ℝ × ℝ) := by ext <;> simp
  constructor
  · rw [patch_second_comp hS hφ,separated_first_jet hT,separated_second_jet hT]
    simp [rowCLM,patch_second_iterated hS,patchTangent]
    rw [he (deriv T p.1),he (deriv (deriv T) p.1),map_smul,map_smul,map_smul]
    simp [smul_smul,pow_two]
  constructor
  · rw [patch_second_comp hS hφ,separated_first_jet hT,separated_second_jet hT]
    simp [rowCLM,patch_second_iterated hS]
    have hz : fderiv ℝ S (separatedMap T p) (0,0)=0 := map_zero _
    rw [hz,add_zero,he (deriv T p.1),map_smul]
    simp
  · rw [patch_second_comp hS hφ,separated_first_jet hT,separated_second_jet hT]
    simp [rowCLM,patch_second_iterated hS]
    change fderiv ℝ S (separatedMap T p) 0=0
    exact map_zero _


theorem gaussian_curvature_separated {S : (ℝ × ℝ) → ℝ × ℝ × ℝ}
    {T : ℝ → ℝ} {p : ℝ × ℝ}
    (hS : ContDiffAt ℝ 2 S (separatedMap T p)) (hT : ContDiffAt ℝ 2 T p.1)
    (hα : deriv T p.1 ≠ 0) (hV : patchArea S (separatedMap T p) ≠ 0) :
    gaussianCurvature (S ∘ separatedMap T) p=
      gaussianCurvature S (separatedMap T p) := by
  have ht := separated_tangent_basis hS hT
  have hb := separated_second_basis hS hT
  have hv : patchArea (S ∘ separatedMap T) p=
      deriv T p.1 • patchArea S (separatedMap T p) := by
    unfold patchArea
    rw [ht.1,ht.2]
    ext <;> simp [cross3] <;> ring
  have hvn : patchArea (S ∘ separatedMap T) p ≠ 0 := by
    rw [hv];exact smul_ne_zero hα hV
  have hd := ne_of_gt ((euclideanSq_pos_iff _).mpr hV)
  have he (a : ℝ) (v w : ℝ × ℝ × ℝ) : dot3 (a • v) w=a*dot3 v w := by
    simp [dot3];ring
  have hf (a b : ℝ) (v w z : ℝ × ℝ × ℝ) :
      dot3 v (a • w+b • z)=a*dot3 v w+b*dot3 v z := by
    simp [dot3];ring
  have hs (a : ℝ) (v : ℝ × ℝ × ℝ) : euclideanSq (a • v)=a^2*euclideanSq v := by
    simp [euclideanSq,dot3];ring
  have hz : dot3 (patchArea S (separatedMap T p))
      (patchTangent S (1,0) (separatedMap T p))=0 := by
    simp [patchArea,dot3,cross3];ring
  have hright (a : ℝ) (v w : ℝ × ℝ × ℝ) : dot3 v (a • w)=a*dot3 v w := by
    simp [dot3];ring
  rw [gaussian_curvature_raw hvn,gaussian_curvature_raw hV,hv,hb.1,hb.2.1,hb.2.2,
    he,he,he,hf,hright,hz,hs]
  field_simp [hα,hd]
  ring


theorem gaussian_curvature_congr {S R : (ℝ × ℝ) → ℝ × ℝ × ℝ} {p : ℝ × ℝ}
    (h : S =ᶠ[𝓝 p] R) : gaussianCurvature S p=gaussianCurvature R p := by
  have ht (i : ℝ × ℝ) : patchTangent S i =ᶠ[𝓝 p] patchTangent R i := by
    filter_upwards [h.eventuallyEq_nhds] with x hx
    exact congrArg (fun L => L i) (hx.fderiv_eq (𝕜 := ℝ))
  have hd (i j : ℝ × ℝ) : patchSecond S i j p=patchSecond R i j p :=
    congrArg (fun L => L j) ((ht i).fderiv_eq (𝕜 := ℝ))
  unfold gaussianCurvature patchNormal
  rw [(ht (1,0)).eq_of_nhds,(ht (0,1)).eq_of_nhds,hd,hd,hd]

theorem gaussian_curvature_boundary_overlap {ε : ℝ} (he : ε=1 ∨ ε= -1)
    {p : ℝ × ℝ} (hr : p.1 ∈ Set.Ioo 0 1)
    (hreg : Function.Injective (fderiv ℝ ruledSurface (boundaryToAngular ε p))) :
    gaussianCurvature (boundarySurface ε) p=
      gaussianCurvature ruledSurface (boundaryToAngular ε p) := by
  have hr' : p.1 ∈ Set.Ioo (-1) 1 := ⟨by linarith [hr.1],hr.2⟩
  have hp : boundaryToAngular ε p ∈ observationDomain := by
    apply Real.sqrt_pos.mp
    change 0 < qChart (boundaryAngle ε p.1)
    rw [boundaryAngle_qChart he hr.1.le hr.2];exact hr.1
  have hid : boundarySurface ε =ᶠ[𝓝 p] ruledSurface ∘ separatedMap (boundaryAngle ε) := by
    filter_upwards [((isOpen_Ioo.preimage continuous_fst).mem_nhds hr)] with x hx
    exact (boundaryAngle_surface_inverse (u := x.2) he hx.1.le hx.2).symm
  rw [gaussian_curvature_congr hid]
  apply gaussian_curvature_separated ((surface_contDiffAt hp).of_le (by decide))
    ((boundaryAngle_contDiffAt ε hr').of_le (by decide))
  · rw [(boundary_angle_hasDerivAt ε hr').deriv,boundary_angle_rate_physical he hr]
    have hc := boundaryC_bounds hr'
    have hs : 0 < 1-(boundaryC p.1)^2 := by
      nlinarith [mul_pos (show 0 < 1-boundaryC p.1 by linarith [hc.2])
        (show 0 < 1+boundaryC p.1 by linarith [hc.1])]
    have hn : boundaryS ε p.1 ≠ 0 := by
      unfold boundaryS
      apply mul_ne_zero
      · rcases he with rfl | rfl <;> norm_num
      · exact ne_of_gt (Real.sqrt_pos.mpr hs)
    exact div_ne_zero (neg_ne_zero.mpr (ne_of_gt hr.1))
      (mul_ne_zero hn (by linarith [hc.2]))
  · exact (differential_injective_iff_cross _).mp hreg

theorem boundary_second_u (ε u : ℝ) :
    patchSecond (boundarySurface ε) (0,1) (1,0) (0,u)=(0,0,1) ∧
    patchSecond (boundarySurface ε) (0,1) (0,1) (0,u)=0 := by
  have he : patchTangent (boundarySurface ε) (0,1) =ᶠ[𝓝 (0,u)]
      boundaryTangentU ε := by
    filter_upwards [((isOpen_Ioo.preimage continuous_fst).mem_nhds
      (show (0,u).1 ∈ Set.Ioo (-1:ℝ) 1 by norm_num))] with p hp
    exact (boundary_actual_tangent_basis ε hp).2
  have hc := boundaryC_hasDerivAt_zero.comp_hasFDerivAt (0,u)
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (0,u)))
  have hs := (boundaryS_hasDerivAt_zero ε).comp_hasFDerivAt (0,u)
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (0,u)))
  have hr := hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (0,u))
  have hd := (((hasFDerivAt_const (1:ℝ) (0,u)).sub hc).const_mul 2).prodMk
    (hs.neg.prodMk hr)
  change HasFDerivAt (boundaryTangentU ε) _ (0,u) at hd
  unfold patchSecond
  rw [he.fderiv_eq,hd.fderiv]
  constructor <;> ext <;> simp

theorem gaussian_curvature_boundary_edge (ε u : ℝ) (hu : u ≠ 0) :
    gaussianCurvature (boundarySurface ε) (0,u)=0 := by
  have hv : patchArea (boundarySurface ε) (0,u) ≠ 0 :=
    (differential_injective_iff_cross _).mp ((boundary_regular_iff ε u).mpr hu)
  rw [gaussian_curvature_raw hv,(boundary_second_u ε u).1,(boundary_second_u ε u).2]
  change (dot3 _ _ * dot3 _ 0 - (dot3 _ (0,0,1))^2)/_=0
  change patchArea (boundarySurface ε) (0,u) ≠ 0 at hv
  have ha : patchArea (boundarySurface ε) (0,u)=(ε*u,2*u,0) :=
    boundary_areaVector ε u
  simp [ha,dot3]

end
end RuledV5
