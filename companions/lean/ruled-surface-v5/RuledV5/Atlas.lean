import RuledV5.Geometry
import StokesV5.LocalNormalForm
import Mathlib.Analysis.SpecialFunctions.Trigonometric.InverseDeriv

namespace RuledV5
noncomputable section
open StokesV5
open scoped Topology ContDiff

def lateralCos : ℝ := (3-Real.sqrt 5)/2
def lateralAngle : ℝ := Real.arccos lateralCos
def lateralRuling : ℝ := (1-lateralCos)/2

theorem lateral_parameters_bounds :
    0 < lateralCos ∧ lateralCos < 1 ∧
    0 < lateralAngle ∧ lateralAngle < Real.pi/2 ∧
    0 < lateralRuling ∧ lateralRuling < 1 := by
  have hs := Real.sq_sqrt (by norm_num : (0:ℝ) ≤ 5)
  have hn := Real.sqrt_nonneg (5:ℝ)
  have h2 : 2 < Real.sqrt 5 := by nlinarith
  have h3 : Real.sqrt 5 < 3 := by nlinarith
  have hc0 : 0 < lateralCos := by unfold lateralCos; linarith
  have hc1 : lateralCos < 1 := by unfold lateralCos; linarith
  exact ⟨hc0,hc1,Real.arccos_pos.mpr hc1,
    Real.arccos_lt_pi_div_two.mpr hc0,by unfold lateralRuling; linarith,
    by unfold lateralRuling; linarith⟩

theorem physical_cos_labels {t c : ℝ}
    (ht : t ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2))
    (hc0 : 0 ≤ c) (hc1 : c ≤ 1) :
    Real.cos t=c ↔ t=Real.arccos c ∨ t= -Real.arccos c := by
  constructor
  · intro h
    by_cases h0 : 0 ≤ t
    · left
      have := Real.arccos_cos h0 (by linarith [ht.2,Real.pi_pos] : t ≤ Real.pi)
      rw [h] at this
      exact this.symm
    · right
      have := Real.arccos_cos (show 0 ≤ -t by linarith)
        (show -t ≤ Real.pi by linarith [ht.1,Real.pi_pos])
      rw [Real.cos_neg,h] at this
      linarith
  · rintro (rfl | rfl) <;> simp [Real.cos_arccos (by linarith : -1 ≤ c) hc1]

theorem interior_singular_parameters {p : ℝ × ℝ}
    (ht : p.1 ∈ Set.Ioo (-(Real.pi/2)) (Real.pi/2)) :
    ¬ Function.Injective (fderiv ℝ ruledSurface p) ↔
      p=(0,1) ∨ p=(lateralAngle,lateralRuling) ∨
        p=(-lateralAngle,lateralRuling) := by
  have hc0 := Real.cos_pos_of_mem_Ioo ht
  have hc1 := Real.cos_le_one p.1
  have hp : p ∈ observationDomain := by
    change 0 < Real.cos p.1*(2-Real.cos p.1)
    exact mul_pos hc0 (by linarith)
  rw [interior_regular_iff hp hc0,not_not,observation_zero_iff hp hc0]
  have hone : Real.cos p.1=1 ↔ p.1=0 :=
    Real.cos_eq_one_iff_of_lt_of_lt
      (by linarith [ht.1,Real.pi_pos]) (by linarith [ht.2,Real.pi_pos])
  have hlat : coreP (Real.cos p.1)=0 ↔
      p.1=lateralAngle ∨ p.1= -lateralAngle := by
    rw [coreP_root_iff hc0.le hc1]
    exact physical_cos_labels ⟨ht.1.le,ht.2.le⟩
      lateral_parameters_bounds.1.le lateral_parameters_bounds.2.1.le
  constructor
  · rintro (⟨hc,hu⟩ | ⟨hc,hu⟩)
    · exact Or.inl (Prod.ext (hone.mp hc) hu)
    · have hcos := (coreP_root_iff hc0.le hc1).mp hc
      have hur : p.2=lateralRuling := by simpa [lateralRuling,lateralCos,hcos] using hu
      rcases hlat.mp hc with h | h
      · exact Or.inr (Or.inl (Prod.ext h hur))
      · exact Or.inr (Or.inr (Prod.ext h hur))
  · rintro (rfl | rfl | rfl)
    · left; norm_num
    · right
      have hcos : Real.cos lateralAngle=lateralCos :=
        Real.cos_arccos (by linarith [lateral_parameters_bounds.1])
          lateral_parameters_bounds.2.1.le
      simp only [hcos]
      exact ⟨(coreP_root_iff lateral_parameters_bounds.1.le
        lateral_parameters_bounds.2.1.le).mpr rfl,rfl⟩
    · right
      have hcos : Real.cos (-lateralAngle)=lateralCos := by
        rw [Real.cos_neg]
        exact Real.cos_arccos (by linarith [lateral_parameters_bounds.1])
          lateral_parameters_bounds.2.1.le
      simp only [hcos]
      exact ⟨(coreP_root_iff lateral_parameters_bounds.1.le
        lateral_parameters_bounds.2.1.le).mpr rfl,rfl⟩

-- At the two endpoint labels the differential uses the smooth r chart.
-- It is not the derivative of the nonsmooth closed angular rectangle.
def atlasDifferential (p : ℝ × ℝ) : (ℝ × ℝ) →L[ℝ] (ℝ × ℝ × ℝ) :=
  if p.1= -(Real.pi/2) then fderiv ℝ (boundarySurface (-1)) (0,p.2)
  else if p.1=Real.pi/2 then fderiv ℝ (boundarySurface 1) (0,p.2)
  else fderiv ℝ ruledSurface p

def singularParameters : Finset (ℝ × ℝ) :=
  {(0,1),(lateralAngle,lateralRuling),(-lateralAngle,lateralRuling),
    (-(Real.pi/2),0),(Real.pi/2,0)}

theorem completed_singular_parameters {p : ℝ × ℝ}
    (ht : p.1 ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2)) :
    ¬ Function.Injective (atlasDifferential p) ↔ p ∈ singularParameters := by
  by_cases hm : p.1= -(Real.pi/2)
  · rw [atlasDifferential,if_pos hm,boundary_regular_iff,not_not]
    have hb := lateral_parameters_bounds
    simp only [singularParameters,Finset.mem_insert,Finset.mem_singleton,Prod.ext_iff]
    simp only [hm]
    constructor
    · intro h; exact Or.inr (Or.inr (Or.inr (Or.inl ⟨True.intro,h⟩)))
    · rintro (h | h | h | h | h)
      · linarith [h.1,Real.pi_pos]
      · linarith [h.1,hb.2.2.1]
      · linarith [h.1,hb.2.2.2.1]
      · exact h.2
      · linarith [h.1,Real.pi_pos]
  · by_cases hp : p.1=Real.pi/2
    · rw [atlasDifferential,if_neg hm,if_pos hp,boundary_regular_iff,not_not]
      have hb := lateral_parameters_bounds
      simp only [singularParameters,Finset.mem_insert,Finset.mem_singleton,Prod.ext_iff]
      simp only [hp]
      constructor
      · intro h; exact Or.inr (Or.inr (Or.inr (Or.inr ⟨True.intro,h⟩)))
      · rintro (h | h | h | h | h)
        · linarith [h.1,Real.pi_pos]
        · linarith [h.1,hb.2.2.2.1]
        · linarith [h.1,hb.2.2.1,Real.pi_pos]
        · linarith [h.1,Real.pi_pos]
        · exact h.2
    · have hto : p.1 ∈ Set.Ioo (-(Real.pi/2)) (Real.pi/2) :=
        ⟨lt_of_le_of_ne ht.1 (Ne.symm hm),lt_of_le_of_ne ht.2 hp⟩
      rw [atlasDifferential,if_neg hm,if_neg hp,interior_singular_parameters hto]
      simp only [singularParameters,Finset.mem_insert,Finset.mem_singleton]
      have hpm : p ≠ (-(Real.pi/2),0) := fun h => hm (congrArg Prod.fst h)
      have hpp : p ≠ (Real.pi/2,0) := fun h => hp (congrArg Prod.fst h)
      simp only [hpm,hpp,or_false]

theorem singularParameters_card : singularParameters.card=5 := by
  have hb := lateral_parameters_bounds
  have ht0 : lateralAngle ≠ 0 := ne_of_gt hb.2.2.1
  have htm : lateralAngle ≠ -lateralAngle := by linarith [hb.2.2.1]
  have htp : lateralAngle ≠ Real.pi/2 := ne_of_lt hb.2.2.2.1
  have htn : lateralAngle ≠ -(Real.pi/2) := by linarith [hb.2.2.1,Real.pi_pos]
  have hum : lateralRuling ≠ 0 := ne_of_gt hb.2.2.2.2.1
  have hpi : -(Real.pi/2) ≠ Real.pi/2 := by linarith [Real.pi_pos]
  simp [singularParameters,Prod.ext_iff,
    ht0,Ne.symm ht0,htm,htp,htn,hum,hpi]

theorem singularParameters_physical {p : ℝ × ℝ} (hp : p ∈ singularParameters) :
    p.1 ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2) ∧ p.2 ∈ Set.Icc 0 1 := by
  have hb := lateral_parameters_bounds
  simp only [singularParameters,Finset.mem_insert,Finset.mem_singleton] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl
  all_goals simp only [Set.mem_Icc]
  all_goals constructor <;> constructor <;> linarith [Real.pi_pos]

theorem boundaryC_bounds {r : ℝ} (hr : r ∈ Set.Ioo (-1) 1) :
    0 ≤ boundaryC r ∧ boundaryC r < 1 := by
  have hr2 : r^2 < 1 := by
    have := mul_pos (show 0 < 1+r by linarith [hr.1])
      (show 0 < 1-r by linarith [hr.2])
    nlinarith
  have hs := Real.sqrt_nonneg (1-r^2)
  have hsq := Real.sq_sqrt (show 0 ≤ 1-r^2 by linarith)
  have hsp := Real.sqrt_pos.mpr (show 0 < 1-r^2 by linarith)
  unfold boundaryC
  constructor <;> nlinarith [sq_nonneg r]

theorem boundaryC_circle_identity {r : ℝ} (hr : r ∈ Set.Icc (-1) 1) :
    boundaryC r*(2-boundaryC r)=r^2 := by
  have hr2 : r^2 ≤ 1 := by
    have := mul_nonneg (show 0 ≤ 1+r by linarith [hr.1])
      (show 0 ≤ 1-r by linarith [hr.2])
    nlinarith
  have hs := Real.sq_sqrt (show 0 ≤ 1-r^2 by linarith)
  unfold boundaryC
  nlinarith

def boundaryAngle (ε r : ℝ) : ℝ := ε*Real.arccos (boundaryC r)

theorem boundaryAngle_cos_sin {ε r : ℝ} (he : ε=1 ∨ ε= -1)
    (hr : r ∈ Set.Ioo (-1) 1) :
    Real.cos (boundaryAngle ε r)=boundaryC r ∧
      Real.sin (boundaryAngle ε r)=boundaryS ε r := by
  have hc := boundaryC_bounds hr
  have hcos := Real.cos_arccos (show -1 ≤ boundaryC r by linarith [hc.1]) hc.2.le
  rcases he with rfl | rfl <;>
    simp [boundaryAngle,boundaryS,hcos,Real.sin_arccos]

theorem boundaryAngle_qChart {ε r : ℝ} (he : ε=1 ∨ ε= -1)
    (hr0 : 0 ≤ r) (hr1 : r < 1) : qChart (boundaryAngle ε r)=r := by
  have hr : r ∈ Set.Ioo (-1) 1 := ⟨by linarith,hr1⟩
  have hc := (boundaryAngle_cos_sin he hr).1
  unfold qChart qSq
  rw [hc,boundaryC_circle_identity ⟨hr.1.le,hr.2.le⟩,Real.sqrt_sq hr0]

theorem boundaryAngle_surface_inverse {ε r u : ℝ} (he : ε=1 ∨ ε= -1)
    (hr0 : 0 ≤ r) (hr1 : r < 1) :
    ruledSurface (boundaryAngle ε r,u)=boundarySurface ε (r,u) := by
  have h := boundaryAngle_cos_sin he ⟨by linarith,hr1⟩
  simp [ruledSurface,boundarySurface,h.1,h.2,boundaryAngle_qChart he hr0 hr1]

theorem boundaryC_contDiffAt {r : ℝ} (hr : r ∈ Set.Ioo (-1) 1) :
    ContDiffAt ℝ ∞ boundaryC r := by
  have h := boundaryC_bounds hr
  have hn : 1-r^2 ≠ 0 := by
    have := mul_pos (show 0 < 1+r by linarith [hr.1])
      (show 0 < 1-r by linarith [hr.2])
    nlinarith
  unfold boundaryC
  exact contDiffAt_const.sub ((contDiffAt_const.sub (contDiffAt_id.pow 2)).sqrt hn)

theorem boundaryAngle_contDiffAt (ε : ℝ) {r : ℝ} (hr : r ∈ Set.Ioo (-1) 1) :
    ContDiffAt ℝ ∞ (boundaryAngle ε) r := by
  have hc := boundaryC_bounds hr
  exact contDiffAt_const.mul ((Real.contDiffAt_arccos
    (by linarith [hc.1]) (ne_of_lt hc.2)).comp r (boundaryC_contDiffAt hr))

theorem boundary_surface_contDiffAt (ε : ℝ) {p : ℝ × ℝ}
    (hr : p.1 ∈ Set.Ioo (-1) 1) : ContDiffAt ℝ ∞ (boundarySurface ε) p := by
  have hc : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => boundaryC x.1) p :=
    (boundaryC_contDiffAt hr).comp p (by fun_prop)
  have hbounds := boundaryC_bounds hr
  have hn : 1-(boundaryC p.1)^2 ≠ 0 := by
    have := mul_pos (show 0 < 1+boundaryC p.1 by linarith [hbounds.1])
      (show 0 < 1-boundaryC p.1 by linarith [hbounds.2])
    nlinarith
  have hs : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => boundaryS ε x.1) p :=
    contDiffAt_const.mul ((contDiffAt_const.sub (hc.pow 2)).sqrt hn)
  unfold boundarySurface
  apply ContDiffAt.prodMk
  · exact hc.add ((by fun_prop : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => 2*x.2) p).mul
      (contDiffAt_const.sub hc))
  · exact ((contDiffAt_const.sub (by fun_prop)).mul hs).prodMk (by fun_prop)

theorem angular_boundary_left_inverse {t : ℝ}
    (ht : t ∈ Set.Ioc 0 (Real.pi/2)) :
    Real.arccos (boundaryC (qChart t))=t := by
  have hc := Real.cos_nonneg_of_mem_Icc
    (show t ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2) by
      exact ⟨by linarith [ht.1,Real.pi_pos],ht.2⟩)
  rw [boundaryC_qChart hc (Real.cos_le_one t)]
  exact Real.arccos_cos ht.1.le (by linarith [ht.2,Real.pi_pos])

theorem angular_qChart_range {t : ℝ} (ht : t ∈ Set.Ioc 0 (Real.pi/2)) :
    qChart t ∈ Set.Ico 0 1 := by
  have hc := Real.cos_nonneg_of_mem_Icc
    (show t ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2) by
      exact ⟨by linarith [ht.1,Real.pi_pos],ht.2⟩)
  have hc1 : Real.cos t < 1 := lt_of_le_of_ne (Real.cos_le_one t) (by
    intro h
    have hz := (Real.cos_eq_one_iff_of_lt_of_lt
      (show -(2*Real.pi)<t by linarith [ht.1,Real.pi_pos])
      (show t<2*Real.pi by linarith [ht.2,Real.pi_pos])).mp h
    linarith [ht.1])
  have hq0 : 0 ≤ qChart t := Real.sqrt_nonneg _
  have hq2 : (qChart t)^2=Real.cos t*(2-Real.cos t) :=
    Real.sq_sqrt (mul_nonneg hc (by linarith [Real.cos_le_one t]))
  refine ⟨hq0,?_⟩
  have hd : 0 < (1-Real.cos t)^2 := sq_pos_of_pos (by linarith)
  nlinarith

-- A genuine homeomorphism of the physical half-base, including Q=0.
-- The negative half uses t ↦ -t; smooth compatibility is on Q>0 overlaps.
def boundaryCoordinateHomeomorph :
    Set.Ioc (0:ℝ) (Real.pi/2) ≃ₜ Set.Ico (0:ℝ) 1 where
  toFun t := ⟨qChart t,angular_qChart_range t.property⟩
  invFun r := ⟨Real.arccos (boundaryC r),
    Real.arccos_pos.mpr (boundaryC_bounds ⟨by linarith [r.property.1],r.property.2⟩).2,
    Real.arccos_le_pi_div_two.mpr
      (boundaryC_bounds ⟨by linarith [r.property.1],r.property.2⟩).1⟩
  left_inv t := Subtype.ext (angular_boundary_left_inverse t.property)
  right_inv r := Subtype.ext (by
    simpa [boundaryAngle] using boundaryAngle_qChart (ε := 1) (Or.inl rfl)
      r.property.1 r.property.2)
  continuous_toFun := by
    apply Continuous.subtype_mk
    change Continuous (fun t : Set.Ioc (0:ℝ) (Real.pi/2) => qChart t)
    unfold qChart qSq
    fun_prop
  continuous_invFun := by
    apply Continuous.subtype_mk
    change Continuous (fun r : Set.Ico (0:ℝ) 1 => Real.arccos (boundaryC r))
    unfold boundaryC
    fun_prop

theorem boundary_coordinate_homeomorphism :
    Continuous boundaryCoordinateHomeomorph ∧
    Continuous boundaryCoordinateHomeomorph.symm ∧
    Function.Bijective boundaryCoordinateHomeomorph :=
  ⟨boundaryCoordinateHomeomorph.continuous,
    boundaryCoordinateHomeomorph.symm.continuous,boundaryCoordinateHomeomorph.bijective⟩

theorem signed_angular_boundary_left_inverse {ε t : ℝ}
    (he : ε=1 ∨ ε= -1) (ht : t ∈ Set.Ioc 0 (Real.pi/2)) :
    boundaryAngle ε (qChart (ε*t))=ε*t := by
  rcases he with rfl | rfl
  · simpa [boundaryAngle] using angular_boundary_left_inverse ht
  · simpa [boundaryAngle,qChart,qSq] using
      congrArg Neg.neg (angular_boundary_left_inverse ht)

def angularToBoundary (p : ℝ × ℝ) : ℝ × ℝ := (qChart p.1,p.2)
def boundaryToAngular (ε : ℝ) (p : ℝ × ℝ) : ℝ × ℝ := (boundaryAngle ε p.1,p.2)

theorem transition_right_inverse {ε : ℝ} {p : ℝ × ℝ}
    (he : ε=1 ∨ ε= -1) (hr : p.1 ∈ Set.Ico 0 1) :
    angularToBoundary (boundaryToAngular ε p)=p := by
  exact Prod.ext (boundaryAngle_qChart he hr.1 hr.2) rfl

theorem transition_left_inverse {ε t u : ℝ}
    (he : ε=1 ∨ ε= -1) (ht : t ∈ Set.Ioc 0 (Real.pi/2)) :
    boundaryToAngular ε (angularToBoundary (ε*t,u))=(ε*t,u) := by
  exact Prod.ext (signed_angular_boundary_left_inverse he ht) rfl

theorem angular_transition_contDiffAt {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    ContDiffAt ℝ ∞ angularToBoundary p := by
  have hq : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => qChart x.1) p := by
    unfold qChart
    exact (by unfold qSq; fun_prop :
      ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => qSq x.1) p).sqrt (ne_of_gt hp)
  exact hq.prodMk (by fun_prop)

theorem angular_transition_hasFDerivAt {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    HasFDerivAt angularToBoundary
      ((rowCLM (dQdt p) 0).prod (rowCLM 0 1)) p := by
  apply ((qChart_comp_hasFDerivAt hp).prodMk
    (hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))).congr_fderiv
  ext v <;> simp [rowCLM]

theorem angular_transition_isSmoothChartAt {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) (hc1 : Real.cos p.1 < 1)
    (hs : Real.sin p.1 ≠ 0) : IsSmoothChartAt angularToBoundary p := by
  apply smoothChart_of_rows (angular_transition_contDiffAt hp)
    (angular_transition_hasFDerivAt hp)
  simpa using transition_derivative_nonzero hp hc1 hs

theorem boundary_transition_contDiffAt (ε : ℝ) {p : ℝ × ℝ}
    (hr : p.1 ∈ Set.Ioo (-1) 1) : ContDiffAt ℝ ∞ (boundaryToAngular ε) p := by
  exact ((boundaryAngle_contDiffAt ε hr).comp p (by fun_prop)).prodMk (by fun_prop)

theorem boundary_pairing_constraint {ε r : ℝ} (he : ε=1 ∨ ε= -1)
    (hr : r ∈ Set.Ico 0 1) :
    Real.cos (boundaryAngle ε r)+Real.cos (Real.arcsin r)=1 := by
  rw [(boundaryAngle_cos_sin he ⟨by linarith [hr.1],hr.2⟩).1,Real.cos_arcsin]
  unfold boundaryC
  ring

theorem boundary_pairing_regular_at_zero (ε : ℝ) :
    HasDerivAt (fun r : ℝ => (boundaryAngle ε r,Real.arcsin r)) (0,1) 0 := by
  have ha : HasDerivAt (boundaryAngle ε) 0 0 := by
    have hc : HasDerivAt Real.arccos (-1) (boundaryC 0) := by
      simpa [boundaryC_at_zero] using Real.hasDerivAt_arccos
        (by norm_num : (0:ℝ) ≠ -1) (by norm_num : (0:ℝ) ≠ 1)
    have h := (hc.comp (0:ℝ) boundaryC_hasDerivAt_zero).const_mul ε
    convert h using 1 <;> first | rfl | norm_num
  have hb : HasDerivAt Real.arcsin 1 0 := by
    convert Real.hasDerivAt_arcsin (by norm_num : (0:ℝ) ≠ -1)
      (by norm_num : (0:ℝ) ≠ 1) using 1 <;> norm_num
  exact ha.prodMk hb

end
end RuledV5
