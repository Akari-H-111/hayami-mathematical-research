import RuledV5.Transport
import Mathlib.Geometry.Manifold.Instances.Real
import Mathlib.Geometry.Manifold.Instances.Icc
import Mathlib.Geometry.Manifold.ContMDiff.Constructions

namespace RuledV5
noncomputable section
open StokesV5 Set
open scoped Topology Manifold ContDiff

-- A global coordinate on the same paired base, with simple zeros of Q at ±1.
def globalC (v : ℝ) : ℝ := (1-v^2)^2
def globalS (v : ℝ) : ℝ := v*Real.sqrt ((2-v^2)*(1+(1-v^2)^2))
def globalQ (v : ℝ) : ℝ := (1-v^2)*Real.sqrt (2-globalC v)
def globalAngle (v : ℝ) : ℝ :=
  if 0 ≤ v then Real.arccos (globalC v) else -Real.arccos (globalC v)
def globalSurface (p : ℝ × ℝ) : ℝ × ℝ × ℝ :=
  (globalC p.1+2*p.2*(1-globalC p.1),(1-p.2)*globalS p.1,p.2*globalQ p.1)

theorem global_c_bounds {v : ℝ} (hv : v ∈ Icc (-1) 1) :
    0 ≤ globalC v ∧ globalC v ≤ 1 := by
  have hsq : v^2 ≤ 1 := by nlinarith [mul_nonneg (by linarith [hv.1] : 0 ≤ 1+v) (by linarith [hv.2] : 0 ≤ 1-v)]
  unfold globalC
  constructor
  · positivity
  · nlinarith [sq_nonneg (1-v^2),sq_nonneg v]

theorem global_radicands_positive {v : ℝ} (hv : v ∈ Icc (-1) 1) :
    0 < (2-v^2)*(1+(1-v^2)^2) ∧ 0 < 2-globalC v := by
  have hc := global_c_bounds hv
  have hsq : v^2 ≤ 1 := by nlinarith [mul_nonneg (by linarith [hv.1] : 0 ≤ 1+v) (by linarith [hv.2] : 0 ≤ 1-v)]
  constructor
  · exact mul_pos (by linarith) (by positivity)
  · nlinarith [sq_nonneg (globalC v),sq_nonneg (globalC v-1)]

theorem global_circle_identities {v : ℝ} (hv : v ∈ Icc (-1) 1) :
    (globalC v)^2+(globalS v)^2=1 ∧
      (globalQ v)^2=globalC v*(2-globalC v) := by
  have hs := Real.sq_sqrt (global_radicands_positive hv).1.le
  have hq := Real.sq_sqrt (global_radicands_positive hv).2.le
  constructor
  · unfold globalS globalC
    rw [mul_pow,hs]
    ring
  · unfold globalQ
    rw [mul_pow,hq]
    unfold globalC
    ring

theorem global_angle_trig {v : ℝ} (hv : v ∈ Icc (-1) 1) :
    Real.cos (globalAngle v)=globalC v ∧ Real.sin (globalAngle v)=globalS v := by
  have hc := global_c_bounds hv
  have hcs := Real.cos_arccos (by linarith [hc.1]) hc.2
  have he := global_circle_identities hv
  have hr := Real.sqrt_nonneg (1-(globalC v)^2)
  have hsq := Real.sq_sqrt (show 0 ≤ 1-(globalC v)^2 by nlinarith [hc.1,hc.2])
  unfold globalAngle
  by_cases hv0 : 0 ≤ v
  · rw [if_pos hv0]
    refine ⟨hcs,?_⟩
    rw [Real.sin_arccos]
    have hs : 0 ≤ globalS v := mul_nonneg hv0 (Real.sqrt_nonneg _)
    nlinarith [he.1]
  · rw [if_neg hv0,Real.cos_neg,Real.sin_neg,Real.sin_arccos]
    refine ⟨hcs,?_⟩
    have hs : globalS v ≤ 0 := mul_nonpos_of_nonpos_of_nonneg (by linarith) (Real.sqrt_nonneg _)
    nlinarith [he.1]

theorem global_angle_range {v : ℝ} (hv : v ∈ Icc (-1) 1) :
    globalAngle v ∈ Icc (-(Real.pi/2)) (Real.pi/2) := by
  have hc := global_c_bounds hv
  have ha := Real.arccos_nonneg (globalC v)
  have hb := Real.arccos_le_pi_div_two.mpr hc.1
  unfold globalAngle
  split_ifs <;> constructor <;> linarith [Real.pi_pos]

theorem global_q_actual {v : ℝ} (hv : v ∈ Icc (-1) 1) :
    qChart (globalAngle v)=globalQ v := by
  have he := global_circle_identities hv
  have hsq : v^2 ≤ 1 := by nlinarith [mul_nonneg (by linarith [hv.1] : 0 ≤ 1+v) (by linarith [hv.2] : 0 ≤ 1-v)]
  have hc := global_c_bounds hv
  have hgn : 0 ≤ globalQ v := mul_nonneg (by linarith) (Real.sqrt_nonneg _)
  have hqs : (qChart (globalAngle v))^2=globalC v*(2-globalC v) := by
    unfold qChart qSq
    rw [(global_angle_trig hv).1,Real.sq_sqrt (mul_nonneg hc.1 (by linarith [hc.2]))]
  have hqn : 0 ≤ qChart (globalAngle v) := Real.sqrt_nonneg _
  nlinarith [he.2]

theorem global_surface_actual {v : ℝ} (hv : v ∈ Icc (-1) 1) (u : ℝ) :
    ruledSurface (globalAngle v,u)=globalSurface (v,u) := by
  unfold ruledSurface globalSurface
  simp only [global_angle_trig hv,global_q_actual hv]

theorem global_surface_contDiffAt {p : ℝ × ℝ} (hp : p.1 ∈ Icc (-1) 1) :
    ContDiffAt ℝ ∞ globalSurface p := by
  have hrad := global_radicands_positive hp
  have hc : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => globalC x.1) p := by unfold globalC;fun_prop
  have hs : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => globalS x.1) p := by
    unfold globalS
    exact (by fun_prop : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => x.1) p).mul
      ((by fun_prop : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => (2-x.1^2)*(1+(1-x.1^2)^2)) p).sqrt
        (ne_of_gt hrad.1))
  have hq : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => globalQ x.1) p := by
    unfold globalQ
    exact (by fun_prop : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => 1-x.1^2) p).mul
      ((contDiffAt_const.sub hc).sqrt (ne_of_gt hrad.2))
  have hu : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => x.2) p := by fun_prop
  unfold globalSurface
  exact (hc.add ((contDiffAt_const.mul hu).mul (contDiffAt_const.sub hc))).prodMk
    (((contDiffAt_const.sub hu).mul hs).prodMk (hu.mul hq))

theorem global_angle_continuous : Continuous globalAngle := by
  have ha : Continuous (fun v => Real.arccos (globalC v)) := by unfold globalC;fun_prop
  unfold globalAngle
  apply ha.if_le ha.neg continuous_const continuous_id
  intro v hv
  change 0=v at hv
  simp [← hv,globalC]

theorem global_angle_smooth_formula {v : ℝ} (hv : v^2 < 2) :
    globalAngle v=2*Real.arcsin (v*Real.sqrt (1-v^2/2)) := by
  let b := v*Real.sqrt (1-v^2/2)
  have hr : 0 < 1-v^2/2 := by linarith
  have hb : b^2=v^2*(1-v^2/2) := by
    dsimp [b];rw [mul_pow,Real.sq_sqrt hr.le]
  have hb1 : b ∈ Icc (-1) 1 := by
    constructor <;> nlinarith [sq_nonneg (v^2-1)]
  have hc : Real.cos (2*Real.arcsin b)=globalC v := by
    rw [Real.cos_two_mul]
    have hs := Real.sin_sq_add_cos_sq (Real.arcsin b)
    rw [Real.sin_arcsin hb1.1 hb1.2] at hs
    unfold globalC
    nlinarith [hb,hs]
  unfold globalAngle
  by_cases hv0 : 0 ≤ v
  · rw [if_pos hv0]
    have h0 : 0 ≤ Real.arcsin b := Real.arcsin_nonneg.mpr (mul_nonneg hv0 (Real.sqrt_nonneg _))
    have ht := Real.arccos_cos (show 0 ≤ 2*Real.arcsin b by linarith)
      (show 2*Real.arcsin b ≤ Real.pi by linarith [Real.arcsin_le_pi_div_two b])
    rw [hc] at ht
    exact ht
  · rw [if_neg hv0]
    have h0 : Real.arcsin b ≤ 0 := Real.arcsin_nonpos.mpr
      (mul_nonpos_of_nonpos_of_nonneg (by linarith) (Real.sqrt_nonneg _))
    have ht := Real.arccos_cos (show 0 ≤ -(2*Real.arcsin b) by linarith)
      (show -(2*Real.arcsin b) ≤ Real.pi by linarith [Real.neg_pi_div_two_le_arcsin b])
    rw [Real.cos_neg,hc] at ht
    linarith

theorem global_angle_contDiffAt {v : ℝ} (hv : v ∈ Icc (-1) 1) :
    ContDiffAt ℝ ∞ globalAngle v := by
  have hv2 : v^2 < 2 := by
    nlinarith [mul_nonneg (show 0 ≤ 1+v by linarith [hv.1])
      (show 0 ≤ 1-v by linarith [hv.2])]
  have hr : 0 < 1-v^2/2 := by linarith
  have hb : (v*Real.sqrt (1-v^2/2))^2=v^2*(1-v^2/2) := by
    rw [mul_pow,Real.sq_sqrt hr.le]
  have hne1 : v*Real.sqrt (1-v^2/2) ≠ 1 := by
    intro he;rw [he] at hb;nlinarith [sq_nonneg (v^2-1)]
  have hnem : v*Real.sqrt (1-v^2/2) ≠ -1 := by
    intro he;rw [he] at hb;nlinarith [sq_nonneg (v^2-1)]
  have ha : ContDiffAt ℝ ∞ Real.arcsin (v*Real.sqrt (1-v^2/2)) :=
    Real.contDiffAt_arcsin hnem hne1
  have hbfun : ContDiffAt ℝ ∞ (fun w : ℝ => w*Real.sqrt (1-w^2/2)) v :=
    contDiffAt_id.mul ((contDiffAt_const.sub ((contDiffAt_id.pow 2).div_const 2)).sqrt (ne_of_gt hr))
  have h : ContDiffAt ℝ ∞ (fun w : ℝ => 2*Real.arcsin (w*Real.sqrt (1-w^2/2))) v :=
    (by fun_prop : ContDiffAt ℝ ∞ (fun _ : ℝ => (2:ℝ)) v).mul
      (ha.comp v (f := fun w : ℝ => w*Real.sqrt (1-w^2/2)) hbfun)
  have he : globalAngle =ᶠ[𝓝 v]
      fun w => 2*Real.arcsin (w*Real.sqrt (1-w^2/2)) := by
    filter_upwards [((isOpen_lt (by fun_prop : Continuous (fun w : ℝ => w^2)) continuous_const).mem_nhds hv2)] with w hw
    exact global_angle_smooth_formula hw
  exact h.congr_of_eventuallyEq he

def globalAngleRate (v : ℝ) : ℝ := 2*(1-v^2) /
  (Real.sqrt (1-v^2/2)*Real.sqrt (1-(v*Real.sqrt (1-v^2/2))^2))

theorem global_angle_hasDerivAt {v : ℝ} (hv : v ∈ Icc (-1) 1) :
    HasDerivAt globalAngle (globalAngleRate v) v := by
  have hv2 : v^2 < 2 := by
    nlinarith [mul_nonneg (show 0 ≤ 1+v by linarith [hv.1])
      (show 0 ≤ 1-v by linarith [hv.2])]
  have hr : 0 < 1-v^2/2 := by linarith
  have hs := Real.sq_sqrt hr.le
  have hn := ne_of_gt (Real.sqrt_pos.mpr hr)
  have hb : (v*Real.sqrt (1-v^2/2))^2=v^2*(1-v^2/2) := by rw [mul_pow,hs]
  have hnr : 0 < 1-(v*Real.sqrt (1-v^2/2))^2 := by nlinarith [sq_nonneg (v^2-1)]
  have hnb := ne_of_gt (Real.sqrt_pos.mpr hnr)
  have hne1 : v*Real.sqrt (1-v^2/2) ≠ 1 := by intro he;rw [he] at hnr;norm_num at hnr
  have hnem : v*Real.sqrt (1-v^2/2) ≠ -1 := by intro he;rw [he] at hnr;norm_num at hnr
  have hroot := (((hasDerivAt_const v (1:ℝ)).sub ((hasDerivAt_id v).pow 2 |>.div_const 2)).sqrt (ne_of_gt hr))
  have h := ((Real.hasDerivAt_arcsin hnem hne1).comp v ((hasDerivAt_id v).mul hroot)).const_mul 2
  have he : globalAngle =ᶠ[𝓝 v]
      fun w => 2*Real.arcsin (w*Real.sqrt (1-w^2/2)) := by
    filter_upwards [((isOpen_lt (by fun_prop : Continuous (fun w : ℝ => w^2)) continuous_const).mem_nhds hv2)] with w hw
    exact global_angle_smooth_formula hw
  apply (h.congr_of_eventuallyEq he).congr_deriv
  unfold globalAngleRate
  dsimp
  have hn' : Real.sqrt ((2-v^2)/2) ≠ 0 := by
    rw [show (2-v^2)/2=1-v^2/2 by ring];exact hn
  have hs' : (Real.sqrt ((2-v^2)/2))^2=(2-v^2)/2 := by
    rw [show (2-v^2)/2=1-v^2/2 by ring];exact hs
  have hb' : Real.sqrt (1-v^2*(Real.sqrt ((2-v^2)/2))^2) ≠ 0 := by
    simpa only [mul_pow,show 1-v^2/2=(2-v^2)/2 by ring] using hnb
  field_simp [hn',hb']
  nlinarith [hs']

def globalToAngular (p : ℝ × ℝ) : ℝ × ℝ := (globalAngle p.1,p.2)

theorem global_angular_overlap_isSmoothChartAt {p : ℝ × ℝ}
    (hp : p.1 ∈ Ioo (-1) 1) : IsSmoothChartAt globalToAngular p := by
  have hc : ContDiffAt ℝ ∞ globalToAngular p :=
    ((global_angle_contDiffAt ⟨hp.1.le,hp.2.le⟩).comp p (by fun_prop)).prodMk (by fun_prop)
  have hd : HasFDerivAt globalToAngular
      ((rowCLM (globalAngleRate p.1) 0).prod (rowCLM 0 1)) p := by
    apply (((global_angle_hasDerivAt ⟨hp.1.le,hp.2.le⟩).comp_hasFDerivAt p
      (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))).prodMk
        (hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))).congr_fderiv
    ext z <;> simp [rowCLM]
  apply smoothChart_of_rows hc hd
  have hs : p.1^2 < 1 := by
    nlinarith [mul_pos (show 0 < 1+p.1 by linarith [hp.1])
      (show 0 < 1-p.1 by linarith [hp.2])]
  have hr : 0 < 1-p.1^2/2 := by linarith
  have he := Real.sq_sqrt hr.le
  have hb : 0 < 1-(p.1*Real.sqrt (1-p.1^2/2))^2 := by
    rw [mul_pow,he];nlinarith [sq_nonneg (p.1^2-1)]
  have hh : 0 < globalAngleRate p.1 :=
    div_pos (by nlinarith) (mul_pos (Real.sqrt_pos.mpr hr) (Real.sqrt_pos.mpr hb))
  simpa using ne_of_gt hh

theorem global_q_contDiffAt {v : ℝ} (hv : v ∈ Icc (-1) 1) :
    ContDiffAt ℝ ∞ globalQ v := by
  have h := (global_surface_contDiffAt (p := (v,1)) hv).snd.snd.comp v
    (contDiffAt_id.prodMk contDiffAt_const)
  simpa [globalSurface,Function.comp_def] using h

theorem global_q_hasDerivAt_edge {ε : ℝ} (he : ε=1 ∨ ε= -1) :
    HasDerivAt globalQ (-2*ε*Real.sqrt 2) ε := by
  have hc : HasDerivAt globalC 0 ε := by
    apply (((hasDerivAt_const ε (1:ℝ)).sub ((hasDerivAt_id ε).pow 2)).pow 2).congr_deriv
    rcases he with rfl | rfl <;> norm_num
  have hn : 2-globalC ε ≠ 0 := by rcases he with rfl | rfl <;> norm_num [globalC]
  have hroot := ((hasDerivAt_const ε (2:ℝ)).sub hc).sqrt hn
  have h := ((hasDerivAt_const ε (1:ℝ)).sub ((hasDerivAt_id ε).pow 2)).mul hroot
  change HasDerivAt globalQ _ ε at h
  apply h.congr_deriv
  rcases he with rfl | rfl <;> norm_num [globalC]

def globalToBoundary (p : ℝ × ℝ) : ℝ × ℝ := (globalQ p.1,p.2)

theorem global_boundary_overlap_isSmoothChartAt {ε : ℝ} (he : ε=1 ∨ ε= -1)
    (u : ℝ) : IsSmoothChartAt globalToBoundary (ε,u) := by
  have hv : ε ∈ Icc (-1:ℝ) 1 := by rcases he with rfl | rfl <;> norm_num
  have hc : ContDiffAt ℝ ∞ globalToBoundary (ε,u) :=
    ((global_q_contDiffAt hv).comp (ε,u) (f := fun x : ℝ × ℝ => x.1)
      (by fun_prop)).prodMk
        (by fun_prop : ContDiffAt ℝ ∞ (fun x : ℝ × ℝ => x.2) (ε,u))
  have hd : HasFDerivAt globalToBoundary
      ((rowCLM (-2*ε*Real.sqrt 2) 0).prod (rowCLM 0 1)) (ε,u) := by
    apply (((global_q_hasDerivAt_edge he).comp_hasFDerivAt (ε,u)
      (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (ε,u)))).prodMk
        (hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (ε,u)))).congr_fderiv
    ext z <;> simp [rowCLM]
  apply smoothChart_of_rows hc hd
  have hs := ne_of_gt (Real.sqrt_pos.mpr (by norm_num : (0:ℝ)<2))
  rcases he with rfl | rfl <;> simpa using hs

theorem global_boundary_surface_actual {ε v : ℝ} (hv : v ∈ Icc (-1) 1)
    (he : (ε=1 ∧ 0 ≤ v) ∨ (ε= -1 ∧ v ≤ 0)) (u : ℝ) :
    boundarySurface ε (globalQ v,u)=globalSurface (v,u) := by
  have hc := global_c_bounds hv
  have hs : Real.sin (globalAngle v)=ε*Real.sqrt (1-(Real.cos (globalAngle v))^2) := by
    rw [(global_angle_trig hv).1]
    rcases he with ⟨rfl,hv0⟩ | ⟨rfl,hv0⟩
    · simp [globalAngle,if_pos hv0,Real.sin_arccos]
    · by_cases hz : v=0
      · simp [hz,globalAngle,globalC]
      · have hvn : ¬ 0 ≤ v := not_le.mpr (lt_of_le_of_ne hv0 hz)
        simp [globalAngle,if_neg hvn,Real.sin_arccos]
  have hm := boundary_matches_interior
    (t := globalAngle v) (u := u)
    (by simpa [(global_angle_trig hv).1] using hc.1)
    (by simpa [(global_angle_trig hv).1] using hc.2) hs
  rw [global_q_actual hv] at hm
  exact hm.trans (global_surface_actual hv u)

theorem global_c_strictAntiOn : StrictAntiOn globalC (Icc (0:ℝ) 1) := by
  intro x hx y hy hxy
  have hsq : x^2<y^2 := by nlinarith [mul_pos (sub_pos.mpr hxy) (show 0<x+y by linarith [hx.1])]
  have hy2 : y^2 ≤ 1 := by nlinarith [mul_nonneg hy.1 (by linarith [hy.2] : 0 ≤ 1-y)]
  have hx2 : x^2 ≤ 1 := by linarith
  unfold globalC
  nlinarith [mul_pos (show 0<(1-x^2)-(1-y^2) by linarith)
    (show 0<(1-x^2)+(1-y^2) by linarith)]

theorem global_angle_odd (v : ℝ) : globalAngle (-v)= -globalAngle v := by
  unfold globalAngle globalC
  simp only [neg_sq]
  split_ifs <;> simp_all
  all_goals have hv : v=0 := by linarith
  all_goals simp [hv]

theorem global_angle_strictMonoOn : StrictMonoOn globalAngle (Icc (-1) 1) := by
  have hpos : StrictMonoOn globalAngle (Icc (0:ℝ) 1) := by
    intro x hx y hy hxy
    simp only [globalAngle,if_pos hx.1,if_pos hy.1]
    exact Real.strictAntiOn_arccos
      ⟨by linarith [(global_c_bounds ⟨by linarith [hy.1],hy.2⟩).1],(global_c_bounds ⟨by linarith [hy.1],hy.2⟩).2⟩
      ⟨by linarith [(global_c_bounds ⟨by linarith [hx.1],hx.2⟩).1],(global_c_bounds ⟨by linarith [hx.1],hx.2⟩).2⟩
      (global_c_strictAntiOn hx hy hxy)
  intro x hx y hy hxy
  by_cases hx0 : 0 ≤ x
  · exact hpos ⟨hx0,hx.2⟩ ⟨by linarith,hy.2⟩ hxy
  · by_cases hy0 : y ≤ 0
    · have h := hpos (show -y ∈ Icc (0:ℝ) 1 by constructor <;> linarith [hy.1])
        (show -x ∈ Icc (0:ℝ) 1 by constructor <;> linarith [hx.1]) (by linarith)
      rw [global_angle_odd,global_angle_odd] at h
      linarith
    · have hneg := hpos (show (0:ℝ) ∈ Icc (0:ℝ) 1 by norm_num)
        (show -x ∈ Icc (0:ℝ) 1 by constructor <;> linarith [hx.1]) (by linarith)
      have hplus := hpos (show (0:ℝ) ∈ Icc (0:ℝ) 1 by norm_num)
        ⟨by linarith,hy.2⟩ (by linarith)
      rw [global_angle_odd] at hneg
      have hz : globalAngle 0=0 := by simp [globalAngle,globalC]
      rw [hz] at hneg hplus
      linarith

def globalBaseMap (v : Icc (-1:ℝ) 1) : Icc (-(Real.pi/2)) (Real.pi/2) :=
  ⟨globalAngle v,global_angle_range v.property⟩

theorem global_base_map_bijective : Function.Bijective globalBaseMap := by
  constructor
  · intro x y h
    exact Subtype.ext (global_angle_strictMonoOn.injOn x.property y.property (congrArg Subtype.val h))
  · intro t
    have hlo : globalAngle (-1)= -(Real.pi/2) := by norm_num [globalAngle,globalC]
    have hhi : globalAngle 1=Real.pi/2 := by norm_num [globalAngle,globalC]
    have ht : (t:ℝ) ∈ Icc (globalAngle (-1)) (globalAngle 1) := by simpa [hlo,hhi] using t.property
    rcases intermediate_value_Icc (by norm_num : (-1:ℝ) ≤ 1)
      global_angle_continuous.continuousOn ht with ⟨v,hv,he⟩
    exact ⟨⟨v,hv⟩,Subtype.ext he⟩

def globalBaseHomeomorph : Icc (-1:ℝ) 1 ≃ₜ Icc (-(Real.pi/2)) (Real.pi/2) :=
  (Equiv.ofBijective globalBaseMap global_base_map_bijective).toHomeomorphOfContinuousClosed
    (global_angle_continuous.comp continuous_subtype_val |>.subtype_mk _)
    (global_angle_continuous.comp continuous_subtype_val |>.subtype_mk _ |>.isClosedMap)

abbrev GlobalDomain := Icc (-1:ℝ) 1 × Icc (0:ℝ) 1
instance : Fact ((-1:ℝ)<1) := ⟨by norm_num⟩

theorem global_domain_isManifold :
    IsManifold ((𝓡∂ 1).prod (𝓡∂ 1)) ∞ GlobalDomain := by infer_instance

theorem global_domain_homeomorphism :
    Nonempty (GlobalDomain ≃ₜ (Icc (-(Real.pi/2)) (Real.pi/2) × Icc (0:ℝ) 1)) :=
  ⟨globalBaseHomeomorph.prodCongr (Homeomorph.refl _)⟩

theorem global_surface_contMDiff :
    ContMDiff ((𝓡∂ 1).prod (𝓡∂ 1)) 𝓘(ℝ,ℝ × ℝ × ℝ) ∞
      (fun p : GlobalDomain => globalSurface ((p.1:ℝ),(p.2:ℝ))) := by
  have hc : ContMDiff ((𝓡∂ 1).prod (𝓡∂ 1)) 𝓘(ℝ,ℝ × ℝ) ∞
      (fun p : GlobalDomain => ((p.1:ℝ),(p.2:ℝ))) :=
    ((contMDiff_subtypeVal_Icc (x := -1) (y := 1)).comp contMDiff_fst).prodMk_space
      ((contMDiff_subtypeVal_Icc (x := 0) (y := 1)).comp contMDiff_snd)
  intro p
  exact (global_surface_contDiffAt p.1.property).contMDiffAt.comp p (hc p)


def pairingConstraint (p : ℝ × ℝ) : ℝ := Real.cos p.1+Real.cos p.2-1

theorem pairing_constraint_hasFDerivAt (p : ℝ × ℝ) :
    HasFDerivAt pairingConstraint (rowCLM (-Real.sin p.1) (-Real.sin p.2)) p := by
  have ht := (Real.hasDerivAt_cos p.1).comp_hasFDerivAt p
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))
  have hφ := (Real.hasDerivAt_cos p.2).comp_hasFDerivAt p
    (hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))
  apply ((ht.add hφ).sub_const 1).congr_fderiv
  ext v <;> simp [rowCLM] <;> ring

theorem pairing_constraint_regular {p : ℝ × ℝ}
    (ht : p.1 ∈ Icc (-(Real.pi/2)) (Real.pi/2))
    (hφ : p.2 ∈ Icc 0 (Real.pi/2)) (hz : pairingConstraint p=0) :
    fderiv ℝ pairingConstraint p ≠ 0 := by
  rw [(pairing_constraint_hasFDerivAt p).fderiv]
  intro he
  have h1 := congrArg (fun L => L (1,0)) he
  have h2 := congrArg (fun L => L (0,1)) he
  simp [rowCLM] at h1 h2
  have hc1 := Real.cos_nonneg_of_mem_Icc ht
  have hc2 := Real.cos_nonneg_of_mem_Icc
    (show p.2 ∈ Icc (-(Real.pi/2)) (Real.pi/2) by constructor <;> linarith [hφ.1,hφ.2,Real.pi_pos])
  have hs1 := Real.sin_sq_add_cos_sq p.1
  have hs2 := Real.sin_sq_add_cos_sq p.2
  rw [h1] at hs1
  rw [h2] at hs2
  have ht1 : Real.cos p.1=1 := by nlinarith
  have hφ1 : Real.cos p.2=1 := by nlinarith
  unfold pairingConstraint at hz
  rw [ht1,hφ1] at hz
  norm_num at hz

end
end RuledV5
