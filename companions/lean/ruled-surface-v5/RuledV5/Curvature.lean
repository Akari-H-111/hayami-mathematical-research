import RuledV5.Atlas

namespace RuledV5
noncomputable section
open StokesV5
open scoped Topology

-- Euclidean dot product: the nested-product norm is a sup norm.
def euclideanSq (v : ℝ × ℝ × ℝ) : ℝ := dot3 v v

def patchTangent (S : (ℝ × ℝ) → ℝ × ℝ × ℝ) (i : ℝ × ℝ) (p : ℝ × ℝ) :=
  fderiv ℝ S p i

def patchSecond (S : (ℝ × ℝ) → ℝ × ℝ × ℝ)
    (i j p : ℝ × ℝ) := fderiv ℝ (patchTangent S i) p j

def patchNormal (S : (ℝ × ℝ) → ℝ × ℝ × ℝ) (p : ℝ × ℝ) :=
  let V := cross3 (patchTangent S (1,0) p) (patchTangent S (0,1) p)
  (1 / Real.sqrt (euclideanSq V)) • V

-- Determinant of the second fundamental form divided by the first.
-- All coefficients use actual first and second Fréchet derivatives.
def gaussianCurvature (S : (ℝ × ℝ) → ℝ × ℝ × ℝ) (p : ℝ × ℝ) : ℝ :=
  let a := patchTangent S (1,0) p
  let b := patchTangent S (0,1) p
  let n := patchNormal S p
  (dot3 n (patchSecond S (1,0) (1,0) p) *
    dot3 n (patchSecond S (0,1) (0,1) p) -
    (dot3 n (patchSecond S (0,1) (1,0) p))^2) /
    (dot3 a a * dot3 b b - (dot3 a b)^2)

theorem euclideanSq_pos_iff (v : ℝ × ℝ × ℝ) : 0 < euclideanSq v ↔ v ≠ 0 := by
  simp only [euclideanSq,dot3]
  constructor
  · intro h hz
    simp only [hz,Prod.fst_zero,Prod.snd_zero,mul_zero,add_zero] at h
    exact (lt_irrefl 0) h
  · intro h
    have h0 := sq_nonneg v.1
    have h1 := sq_nonneg v.2.1
    have h2 := sq_nonneg v.2.2
    by_contra hn
    have hz : v=(0,0,0) := by
      have ha : v.1=0 := by nlinarith
      have hb : v.2.1=0 := by nlinarith
      have hc : v.2.2=0 := by nlinarith
      exact Prod.ext ha (Prod.ext hb hc)
    exact h hz

theorem cross_gram_identity (a b : ℝ × ℝ × ℝ) :
    dot3 a a * dot3 b b - (dot3 a b)^2=euclideanSq (cross3 a b) := by
  simp only [euclideanSq,dot3,cross3]
  ring

theorem ruled_second_u {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    patchSecond ruledSurface (0,1) (1,0) p =
      (2*Real.sin p.1,-Real.cos p.1,dQdt p) ∧
    patchSecond ruledSurface (0,1) (0,1) p=0 := by
  have ho : IsOpen observationDomain := by
    change IsOpen {p : ℝ × ℝ | 0 < qSq p.1}
    apply isOpen_lt continuous_const
    unfold qSq
    fun_prop
  have he : patchTangent ruledSurface (0,1) =ᶠ[𝓝 p] tangentU := by
    filter_upwards [ho.mem_nhds hp] with x hx
    exact (surface_fderiv_basis hx).2
  have hf : fderiv ℝ (patchTangent ruledSurface (0,1)) p = fderiv ℝ tangentU p :=
    he.fderiv_eq
  constructor
  · rw [patchSecond,hf]
    exact ruling_mixed_derivative hp
  · rw [patchSecond,hf,(ruling_hasFDerivAt hp).fderiv]
    simp [rowCLM]

theorem ruled_unit_normal {p : ℝ × ℝ}
    (hreg : Function.Injective (fderiv ℝ ruledSurface p)) :
    euclideanSq (patchNormal ruledSurface p)=1 := by
  have hv : areaVector p ≠ 0 := (differential_injective_iff_cross _).mp hreg
  have hd := (euclideanSq_pos_iff _).mpr hv
  have hs := Real.sq_sqrt hd.le
  have hn := ne_of_gt (Real.sqrt_pos.mpr hd)
  change euclideanSq ((1/Real.sqrt (euclideanSq (areaVector p))) • areaVector p)=1
  have he (a : ℝ) (v : ℝ × ℝ × ℝ) : euclideanSq (a • v)=a^2*euclideanSq v := by
    simp [euclideanSq,dot3]; ring
  rw [he,div_pow,one_pow,hs]
  field_simp

theorem gaussian_curvature_ruled {p : ℝ × ℝ} (hp : p ∈ observationDomain)
    (hreg : Function.Injective (fderiv ℝ ruledSurface p)) :
    gaussianCurvature ruledSurface p =
      -(-coreP (Real.cos p.1)*Real.sin p.1/qChart p.1)^2 /
        (euclideanSq (areaVector p))^2 := by
  have hv : areaVector p ≠ 0 := (differential_injective_iff_cross _).mp hreg
  have hd := (euclideanSq_pos_iff _).mpr hv
  have hs := Real.sq_sqrt hd.le
  have hn := ne_of_gt (Real.sqrt_pos.mpr hd)
  have htr := scalar_triple_product hp
  have hg := cross_gram_identity (patchTangent ruledSurface (1,0) p)
    (patchTangent ruledSurface (0,1) p)
  change _=euclideanSq (areaVector p) at hg
  unfold gaussianCurvature
  dsimp only
  rw [(ruled_second_u hp).2]
  have hd0 (v : ℝ × ℝ × ℝ) : dot3 v 0=0 := by simp [dot3]
  rw [hd0,mul_zero,zero_sub,hg,(ruled_second_u hp).1]
  have hm := ruling_mixed_derivative hp
  rw [← hm]
  change - (dot3 ((1/Real.sqrt (euclideanSq (areaVector p))) • areaVector p)
    (fderiv ℝ tangentU p (1,0)))^2 / _ = _
  have he (a : ℝ) (v w : ℝ × ℝ × ℝ) : dot3 (a • v) w=a*dot3 v w := by
    simp [dot3]; ring
  rw [he,htr]
  field_simp [hn,ne_of_gt hd,qChart_ne_zero hp]
  rw [hs]
  ring

theorem gaussian_curvature_nonpos {p : ℝ × ℝ} (hp : p ∈ observationDomain)
    (hreg : Function.Injective (fderiv ℝ ruledSurface p)) :
    gaussianCurvature ruledSurface p ≤ 0 := by
  rw [gaussian_curvature_ruled hp hreg]
  exact div_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr (sq_nonneg _)) (sq_nonneg _)

theorem gaussian_curvature_negative_iff {p : ℝ × ℝ} (hp : p ∈ observationDomain)
    (hreg : Function.Injective (fderiv ℝ ruledSurface p)) :
    gaussianCurvature ruledSurface p < 0 ↔
      Real.sin p.1 ≠ 0 ∧ coreP (Real.cos p.1) ≠ 0 := by
  have hv := (differential_injective_iff_cross _).mp hreg
  have hd := (euclideanSq_pos_iff _).mpr hv
  change 0 < euclideanSq (areaVector p) at hd
  rw [gaussian_curvature_ruled hp hreg,div_neg_iff]
  simp [sq_pos_of_pos hd,not_lt_of_ge (sq_nonneg (euclideanSq (areaVector p))),
    sq_pos_iff,
    qChart_ne_zero hp,and_comm]


theorem ruled_second_eq_iterated {p : ℝ × ℝ} (hp : p ∈ observationDomain)
    (i j : ℝ × ℝ) : patchSecond ruledSurface i j p =
      fderiv ℝ (fderiv ℝ ruledSurface) p j i := by
  have hf : ContDiffAt ℝ 1 (fderiv ℝ ruledSurface) p :=
    (surface_contDiffAt hp).fderiv_right (by decide)
  unfold patchSecond patchTangent
  rw [fderiv_clm_apply (hf.differentiableAt (by norm_num)) (differentiableAt_const i)]
  simp

theorem ruled_second_symmetric {p : ℝ × ℝ} (hp : p ∈ observationDomain)
    (i j : ℝ × ℝ) : patchSecond ruledSurface i j p=patchSecond ruledSurface j i p := by
  rw [ruled_second_eq_iterated hp,ruled_second_eq_iterated hp]
  exact ((surface_contDiffAt hp).isSymmSndFDerivAt (by rw [minSmoothness_of_isRCLikeNormedField]; decide)).eq j i

theorem ruled_normal_orthogonal (p : ℝ × ℝ) :
    dot3 (patchNormal ruledSurface p) (patchTangent ruledSurface (1,0) p)=0 ∧
    dot3 (patchNormal ruledSurface p) (patchTangent ruledSurface (0,1) p)=0 := by
  unfold patchNormal
  dsimp only
  have he (a : ℝ) (v w : ℝ × ℝ × ℝ) : dot3 (a • v) w=a*dot3 v w := by
    simp [dot3]; ring
  rw [he,he]
  simp only [dot3,cross3]
  constructor <;> ring

theorem curvature_zero_iff_parameter {p : ℝ × ℝ}
    (ht : p.1 ∈ Set.Ioo (-(Real.pi/2)) (Real.pi/2))
    (hreg : Function.Injective (fderiv ℝ ruledSurface p)) :
    gaussianCurvature ruledSurface p=0 ↔
      p.1=0 ∨ p.1=lateralAngle ∨ p.1= -lateralAngle := by
  have hc := Real.cos_pos_of_mem_Ioo ht
  have hp : p ∈ observationDomain := mul_pos hc (by linarith [Real.cos_le_one p.1])
  have he : gaussianCurvature ruledSurface p=0 ↔ ¬ gaussianCurvature ruledSurface p<0 := by
    have hh := gaussian_curvature_nonpos hp hreg
    constructor
    · intro hz;rw [hz];exact not_lt_of_ge le_rfl
    · intro hh';linarith
  have hs : Real.sin p.1=0 ↔ p.1=0 :=
    Real.sin_eq_zero_iff_of_lt_of_lt (by linarith [ht.1,Real.pi_pos])
      (by linarith [ht.2,Real.pi_pos])
  have hP : coreP (Real.cos p.1)=0 ↔ p.1=lateralAngle ∨ p.1= -lateralAngle := by
    rw [coreP_root_iff hc.le (Real.cos_le_one p.1)]
    exact physical_cos_labels ⟨ht.1.le,ht.2.le⟩
      lateral_parameters_bounds.1.le lateral_parameters_bounds.2.1.le
  rw [he,gaussian_curvature_negative_iff hp hreg]
  simp only [not_and_or,not_not,hs,hP]

theorem negative_curvature_witness :
    Function.Injective (fderiv ℝ ruledSurface (Real.pi/3,0)) ∧
      gaussianCurvature ruledSurface (Real.pi/3,0)<0 := by
  have hp : (Real.pi/3,0) ∈ observationDomain := by
    change 0 < Real.cos (Real.pi/3)*(2-Real.cos (Real.pi/3))
    norm_num [Real.cos_pi_div_three]
  have hc : 0 < Real.cos (Real.pi/3) := by norm_num [Real.cos_pi_div_three]
  have hreg : Function.Injective (fderiv ℝ ruledSurface (Real.pi/3,0)) := by
    rw [interior_regular_iff hp hc]
    intro hz
    have hn := congrArg Prod.fst hz
    norm_num [observationMap,observationN,Real.cos_pi_div_three] at hn
  refine ⟨hreg,(gaussian_curvature_negative_iff hp hreg).mpr ⟨?_,?_⟩⟩
  · exact ne_of_gt (Real.sin_pos_of_pos_of_lt_pi (by linarith [Real.pi_pos])
      (by linarith [Real.pi_pos]))
  · norm_num [coreP,Real.cos_pi_div_three]


def IsDevelopableOn (S : (ℝ × ℝ) → ℝ × ℝ × ℝ) (D : Set (ℝ × ℝ)) : Prop :=
  ∀ p ∈ D, Function.Injective (fderiv ℝ S p) → gaussianCurvature S p=0

theorem ruled_not_developable :
    ¬ IsDevelopableOn ruledSurface
      ((Set.Ioo (-(Real.pi/2)) (Real.pi/2)).prod (Set.Icc 0 1)) := by
  intro h
  have hp : (Real.pi/3,(0:ℝ)) ∈ (Set.Ioo (-(Real.pi/2)) (Real.pi/2)).prod (Set.Icc (0:ℝ) 1) := by
    constructor
    · constructor <;> linarith [Real.pi_pos]
    · norm_num
  have hz := h (Real.pi/3,0) hp negative_curvature_witness.1
  linarith [negative_curvature_witness.2]

theorem ruling_metric_endpoint_values {ε : ℝ} (he : ε=1 ∨ ε= -1) (u : ℝ) :
    dot3 (fderiv ℝ ruledSurface (0,u) (0,1)) (fderiv ℝ ruledSurface (0,u) (0,1))=1 ∧
      dot3 (fderiv ℝ (boundarySurface ε) (0,u) (0,1))
        (fderiv ℝ (boundarySurface ε) (0,u) (0,1))=5 := by
  constructor
  · rw [first_form_G (by norm_num [observationDomain,qSq])]
    norm_num
  · rw [(boundary_derivative_basis ε u).2]
    rcases he with rfl | rfl <;> norm_num [dot3]

end
end RuledV5
