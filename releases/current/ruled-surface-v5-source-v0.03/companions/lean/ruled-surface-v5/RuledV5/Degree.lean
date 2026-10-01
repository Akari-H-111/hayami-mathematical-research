import Mathlib.Analysis.Complex.CoveringMap
import Mathlib.Topology.Homotopy.Lifting

namespace RuledV5
noncomputable section
open scoped Topology
open unitInterval

abbrev NonzeroComplex := {z : ℂ // z ≠ 0}
def nonzeroExp (z : ℂ) : NonzeroComplex := ⟨z.exp,z.exp_ne_zero⟩

-- A genuine winding construction through a continuous logarithm lift.
-- No Jacobian or orientation sign is used in its definition.
def windingLift (γ : C(I,NonzeroComplex)) (z : ℂ) (hz : γ 0=nonzeroExp z) : C(I,ℂ) :=
  Complex.isCoveringMap_exp.liftPath γ z hz

def windingValue (γ : C(I,NonzeroComplex)) (z : ℂ) (hz : γ 0=nonzeroExp z) : ℝ :=
  ((windingLift γ z hz 1)-z).im/(2*Real.pi)

theorem winding_lift_actual (γ : C(I,NonzeroComplex)) (z : ℂ)
    (hz : γ 0=nonzeroExp z) :
    Continuous (windingLift γ z hz) ∧
    nonzeroExp ∘ windingLift γ z hz=γ ∧ windingLift γ z hz 0=z := by
  exact ⟨(windingLift γ z hz).continuous,Complex.isCoveringMap_exp.liftPath_lifts ..,
    Complex.isCoveringMap_exp.liftPath_zero ..⟩

theorem winding_value_integral (γ : C(I,NonzeroComplex)) (z : ℂ)
    (hz : γ 0=nonzeroExp z) (hclosed : γ 1=γ 0) :
    ∃ n : ℤ, windingValue γ z hz=n := by
  have he : Complex.exp (windingLift γ z hz 1)=Complex.exp z := by
    have h := congr_fun (winding_lift_actual γ z hz).2.1 (1:I)
    exact congrArg Subtype.val (h.trans (hclosed.trans hz))
  obtain ⟨n,hn⟩ := Complex.exp_eq_exp_iff_exists_int.mp he
  refine ⟨n,?_⟩
  unfold windingValue
  rw [hn]
  simp [Complex.mul_im,Complex.ofReal_im,Complex.ofReal_re]

theorem winding_value_homotopy_invariant {γ₀ γ₁ : C(I,NonzeroComplex)} (z : ℂ)
    (h₀ : γ₀ 0=nonzeroExp z) (h₁ : γ₁ 0=nonzeroExp z)
    (h : γ₀.HomotopicRel γ₁ {0,1}) :
    windingValue γ₀ z h₀=windingValue γ₁ z h₁ := by
  unfold windingValue windingLift
  rw [Complex.isCoveringMap_exp.liftPath_apply_one_eq_of_homotopicRel h z h₀ h₁]


theorem winding_value_initial_independent (γ : C(I,NonzeroComplex)) (z w : ℂ)
    (hz : γ 0=nonzeroExp z) (hw : γ 0=nonzeroExp w) :
    windingValue γ z hz=windingValue γ w hw := by
  have he : Complex.exp z=Complex.exp w := congrArg Subtype.val (hz.symm.trans hw)
  obtain ⟨n,hn⟩ := Complex.exp_eq_exp_iff_exists_int.mp he
  let Γ : C(I,ℂ) := ⟨fun t => windingLift γ w hw t + n*(2*Real.pi*Complex.I),by fun_prop⟩
  have hΓ : Γ=windingLift γ z hz := by
    apply (Complex.isCoveringMap_exp.eq_liftPath_iff' hz).mpr
    constructor
    · funext t
      apply Subtype.ext
      change Complex.exp (windingLift γ w hw t + n*(2*Real.pi*Complex.I))=(γ t).val
      have hp : Complex.exp (windingLift γ w hw t + n*(2*Real.pi*Complex.I))=
          Complex.exp (windingLift γ w hw t) :=
        Complex.exp_eq_exp_iff_exists_int.mpr ⟨n,rfl⟩
      rw [hp]
      exact congrArg Subtype.val (congr_fun (winding_lift_actual γ w hw).2.1 t)
    · change windingLift γ w hw 0+n*(2*Real.pi*Complex.I)=z
      rw [(winding_lift_actual γ w hw).2.2,hn]
  unfold windingValue
  rw [← hΓ,hn]
  dsimp [Γ]
  ring

def exponentialLoop (z : ℂ) (n : ℤ) : C(I,NonzeroComplex) :=
  ⟨fun t => nonzeroExp (z+(t:ℝ)*(n:ℂ)*(2*Real.pi*Complex.I)),by
    unfold nonzeroExp;fun_prop⟩

theorem exponential_loop_closed (z : ℂ) (n : ℤ) :
    exponentialLoop z n 0=nonzeroExp z ∧ exponentialLoop z n 1=nonzeroExp z := by
  constructor
  · apply Subtype.ext;simp [exponentialLoop,nonzeroExp]
  · apply Subtype.ext
    change Complex.exp (z+(1:ℝ)*(n:ℂ)*(2*Real.pi*Complex.I))=Complex.exp z
    apply Complex.exp_eq_exp_iff_exists_int.mpr
    exact ⟨n,by simp⟩

theorem exponential_loop_winding (z : ℂ) (n : ℤ) :
    windingValue (exponentialLoop z n) z (exponential_loop_closed z n).1=n := by
  let Γ : C(I,ℂ) := ⟨fun t => z+(t:ℝ)*(n:ℂ)*(2*Real.pi*Complex.I),by fun_prop⟩
  have hΓ : Γ=windingLift (exponentialLoop z n) z (exponential_loop_closed z n).1 := by
    apply (Complex.isCoveringMap_exp.eq_liftPath_iff' (exponential_loop_closed z n).1).mpr
    exact ⟨rfl,by simp [Γ]⟩
  unfold windingValue
  rw [← hΓ]
  simp [Γ,Complex.mul_im,Complex.ofReal_im,Complex.ofReal_re]


def normalizedLoop (γ : C(I,NonzeroComplex)) : C(I,NonzeroComplex) :=
  ⟨fun t => ⟨(γ t).val/(γ 0).val,div_ne_zero (γ t).property (γ 0).property⟩,by
    apply Continuous.subtype_mk
    exact (continuous_subtype_val.comp γ.continuous).div_const _⟩

theorem normalized_loop_start (γ : C(I,NonzeroComplex)) :
    normalizedLoop γ 0=nonzeroExp 0 := by
  apply Subtype.ext;simp [normalizedLoop,nonzeroExp,(γ 0).property]

def loopWinding (γ : C(I,NonzeroComplex)) : ℝ :=
  windingValue (normalizedLoop γ) 0 (normalized_loop_start γ)

theorem loop_winding_integral (γ : C(I,NonzeroComplex)) (hγ : γ 1=γ 0) :
    ∃ n : ℤ, loopWinding γ=n := by
  apply winding_value_integral
  apply Subtype.ext
  change (γ 1).val/(γ 0).val=(γ 0).val/(γ 0).val
  rw [hγ]

theorem loop_winding_free_homotopy {γ₀ γ₁ : C(I,NonzeroComplex)}
    (H : γ₀.Homotopy γ₁) (hclosed : ∀ t, H (t,1)=H (t,0)) :
    loopWinding γ₀=loopWinding γ₁ := by
  let G : (normalizedLoop γ₀).HomotopyRel (normalizedLoop γ₁) {0,1} := {
    toFun := fun x => ⟨(H x).val/(H (x.1,0)).val,
      div_ne_zero (H x).property (H (x.1,0)).property⟩
    continuous_toFun := by
      apply Continuous.subtype_mk
      apply Continuous.div (by fun_prop) (by fun_prop)
      intro x;exact (H (x.1,0)).property
    map_zero_left := by intro t;apply Subtype.ext;simp [normalizedLoop]
    map_one_left := by intro t;apply Subtype.ext;simp [normalizedLoop]
    prop' := by
      intro t x hx
      rcases hx with rfl | rfl
      · apply Subtype.ext;simp [normalizedLoop,(H (t,0)).property,(γ₀ 0).property]
      · apply Subtype.ext
        change (H (t,1)).val/(H (t,0)).val=(γ₀ 1).val/(γ₀ 0).val
        rw [hclosed t]
        have hg : γ₀ 1=γ₀ 0 := by simpa using hclosed 0
        rw [hg];simp [(H (t,0)).property,(γ₀ 0).property] }
  exact winding_value_homotopy_invariant 0 (normalized_loop_start γ₀)
    (normalized_loop_start γ₁) ⟨G⟩

theorem loop_winding_based {γ : C(I,NonzeroComplex)} (hγ : γ 0=nonzeroExp 0) :
    loopWinding γ=windingValue γ 0 hγ := by
  have hg : normalizedLoop γ=γ := by
    ext t
    change (γ t).val/(γ 0).val=(γ t).val
    rw [hγ];simp [nonzeroExp]
  unfold loopWinding
  simp only [hg]

theorem exponential_loop_index (n : ℤ) : loopWinding (exponentialLoop 0 n)=n := by
  rw [loop_winding_based (exponential_loop_closed 0 n).1]
  exact exponential_loop_winding 0 n


def ellipseRaw (β : ℂ) (t : ℝ) : ℂ :=
  Real.cos (2*Real.pi*t)+Real.sin (2*Real.pi*t)*β

theorem ellipse_ne_zero {β : ℂ} (hβ : β.im ≠ 0) (t : ℝ) : ellipseRaw β t ≠ 0 := by
  intro hz
  have him := congrArg Complex.im hz
  simp only [ellipseRaw,Complex.add_im,Complex.ofReal_im,Complex.ofReal_re,
    Complex.mul_im,Complex.zero_im,zero_mul,mul_zero,zero_add,add_zero] at him
  have hs : Real.sin (2*Real.pi*t)=0 := (mul_eq_zero.mp him).resolve_right hβ
  have hre := congrArg Complex.re hz
  simp only [ellipseRaw,Complex.add_re,Complex.ofReal_re,Complex.ofReal_im,
    Complex.mul_re,Complex.zero_re,hs,zero_mul,mul_zero,zero_sub,neg_zero,add_zero] at hre
  have hh := Real.sin_sq_add_cos_sq (2*Real.pi*t)
  rw [hs,hre] at hh
  norm_num at hh

def ellipseLoop (β : ℂ) (hβ : β.im ≠ 0) : C(I,NonzeroComplex) :=
  ⟨fun t => ⟨ellipseRaw β t,ellipse_ne_zero hβ t⟩,by
    apply Continuous.subtype_mk;unfold ellipseRaw;fun_prop⟩

theorem ellipse_loop_endpoints (β : ℂ) (hβ : β.im ≠ 0) :
    ellipseLoop β hβ 0=nonzeroExp 0 ∧ ellipseLoop β hβ 1=nonzeroExp 0 := by
  constructor <;> apply Subtype.ext <;> simp [ellipseLoop,ellipseRaw,nonzeroExp]

theorem ellipse_loop_winding {β : ℂ} {ε : ℤ} (hε : ε=1 ∨ ε= -1)
    (hβε : 0 < β.im*(ε:ℝ)) : loopWinding (ellipseLoop β (by
      intro hz;rw [hz,zero_mul] at hβε;exact (lt_irrefl 0) hβε))=ε := by
  have hβ : β.im ≠ 0 := by intro hz;rw [hz,zero_mul] at hβε;exact (lt_irrefl 0) hβε
  have he : (((ε:ℂ)*Complex.I).im) ≠ 0 := by rcases hε with rfl | rfl <;> norm_num
  let blend (t : I) : ℂ := (1-(t:ℝ)) • β+(t:ℝ) • ((ε:ℂ)*Complex.I)
  have hb (t : I) : (blend t).im ≠ 0 := by
    have hi : (blend t).im*(ε:ℝ)=(1-(t:ℝ))*(β.im*(ε:ℝ))+(t:ℝ) := by
      rcases hε with rfl | rfl <;> simp [blend,Complex.smul_im,smul_eq_mul] <;> ring
    have hp : 0 < (blend t).im*(ε:ℝ) := by
      rw [hi]
      by_cases ht : (t:ℝ)=0
      · simp [ht,hβε]
      · have hh := mul_nonneg (sub_nonneg.mpr t.property.2) hβε.le
        have htpos := lt_of_le_of_ne t.property.1 (Ne.symm ht)
        linarith
    intro hz;rw [hz,zero_mul] at hp;exact (lt_irrefl 0) hp
  let H : (ellipseLoop β hβ).Homotopy (ellipseLoop ((ε:ℂ)*Complex.I) he) := {
    toFun := fun x => ⟨ellipseRaw (blend x.1) x.2,ellipse_ne_zero (hb x.1) x.2⟩
    continuous_toFun := by apply Continuous.subtype_mk;dsimp [ellipseRaw,blend];fun_prop
    map_zero_left := by intro t;apply Subtype.ext;simp [blend,ellipseLoop]
    map_one_left := by intro t;apply Subtype.ext;simp [blend,ellipseLoop] }
  have hH : ∀ t, H (t,1)=H (t,0) := by
    intro t;apply Subtype.ext
    change ellipseRaw (blend t) (1:ℝ)=ellipseRaw (blend t) (0:ℝ)
    simp [ellipseRaw]
  rw [loop_winding_free_homotopy H hH]
  have heq : ellipseLoop ((ε:ℂ)*Complex.I) he=exponentialLoop 0 ε := by
    ext t
    change ellipseRaw ((ε:ℂ)*Complex.I) (t:ℝ)=
      Complex.exp (0+(t:ℝ)*(ε:ℂ)*(2*Real.pi*Complex.I))
    rw [show (0:ℂ)+(t:ℝ)*(ε:ℂ)*(2*Real.pi*Complex.I)=
      (2*Real.pi*(t:ℝ)*(ε:ℂ))*Complex.I by ring,Complex.exp_mul_I]
    rcases hε with rfl | rfl <;> simp [ellipseRaw] <;> ring
  rw [heq]
  exact exponential_loop_index ε


def circleValue (t : ℝ) : ℂ := Complex.exp ((2*Real.pi*t:ℝ)*Complex.I)

def linearCircleLoop (L : ℂ ≃L[ℝ] ℂ) : C(I,NonzeroComplex) :=
  ⟨fun t => ⟨L (circleValue t),by
    intro h;have hz : circleValue t=0 := L.injective (h.trans L.map_zero.symm)
    exact Complex.exp_ne_zero _ hz⟩,by
    apply Continuous.subtype_mk;unfold circleValue;fun_prop⟩

def planeJacobian (L : ℂ →L[ℝ] ℂ) : ℝ :=
  (L 1).re*(L Complex.I).im-(L 1).im*(L Complex.I).re

theorem loop_winding_normalized (γ : C(I,NonzeroComplex)) :
    loopWinding (normalizedLoop γ)=loopWinding γ := by
  rw [loop_winding_based (normalized_loop_start γ)]
  rfl

theorem linear_circle_winding (L : ℂ ≃L[ℝ] ℂ) {ε : ℤ}
    (hε : ε=1 ∨ ε= -1) (hD : 0 < planeJacobian L*(ε:ℝ)) :
    loopWinding (linearCircleLoop L)=ε := by
  have hA : L (1:ℂ) ≠ 0 := by
    intro h;have hz : (1:ℂ)=0 := L.injective (h.trans L.map_zero.symm)
    exact one_ne_zero hz
  have hn : 0 < Complex.normSq (L 1) := Complex.normSq_pos.mpr hA
  have hi : ((L Complex.I)/(L 1)).im=planeJacobian L/Complex.normSq (L 1) := by
    rw [Complex.div_im]
    change (L Complex.I).im*(L 1).re/Complex.normSq (L 1)-
      (L Complex.I).re*(L 1).im/Complex.normSq (L 1)=
      ((L 1).re*(L Complex.I).im-(L 1).im*(L Complex.I).re)/Complex.normSq (L 1)
    ring
  have hb : 0 < ((L Complex.I)/(L 1)).im*(ε:ℝ) := by
    rw [hi,div_mul_eq_mul_div];exact div_pos hD hn
  have hβ : ((L Complex.I)/(L 1)).im ≠ 0 := by
    intro hz;rw [hz,zero_mul] at hb;exact (lt_irrefl 0) hb
  have hg : normalizedLoop (linearCircleLoop L)=ellipseLoop ((L Complex.I)/(L 1)) hβ := by
    ext t
    change L (circleValue (t:ℝ))/L (circleValue (0:ℝ))=ellipseRaw ((L Complex.I)/(L 1)) (t:ℝ)
    have hc : L (circleValue (t:ℝ))=
        Real.cos (2*Real.pi*(t:ℝ)) • L (1:ℂ)+Real.sin (2*Real.pi*(t:ℝ)) • L Complex.I := by
      unfold circleValue
      rw [Complex.exp_ofReal_mul_I]
      have he : ((Real.cos (2*Real.pi*(t:ℝ)):ℝ):ℂ)+
          Real.sin (2*Real.pi*(t:ℝ))*Complex.I=
          Real.cos (2*Real.pi*(t:ℝ)) • (1:ℂ)+Real.sin (2*Real.pi*(t:ℝ)) • Complex.I := by
        simp [Complex.real_smul]
      rw [he,map_add,map_smul,map_smul]
    rw [hc]
    simp only [circleValue,mul_zero,Complex.ofReal_zero,zero_mul,Complex.exp_zero]
    unfold ellipseRaw
    simp only [Complex.real_smul]
    field_simp [hA] <;> ring
  rw [← loop_winding_normalized (linearCircleLoop L),hg]
  exact ellipse_loop_winding hε hb


theorem nondegenerate_zero_small_homotopy {F : ℂ → ℂ} {z : ℂ}
    (L : ℂ ≃L[ℝ] ℂ) (hf : HasFDerivAt F (L : ℂ →L[ℝ] ℂ) z) (hz : F z=0) :
    ∃ δ : ℝ, 0 < δ ∧ ∀ w : ℂ, w ≠ z → ‖w-z‖<δ →
      ∀ τ : ℝ, τ ∈ Set.Icc 0 1 → L (w-z)+τ • (F w-L (w-z)) ≠ 0 := by
  let C := ‖(L.symm : ℂ →L[ℝ] ℂ)‖+1
  have hC : 0 < C := by dsimp [C];positivity
  have hc : 0 < 1/(2*C) := by positivity
  have he := hf.isLittleO.def hc
  rw [Metric.eventually_nhds_iff] at he
  obtain ⟨δ,hδ,he⟩ := he
  refine ⟨δ,hδ,?_⟩
  intro w hw hwd τ hτ
  have h := he (y := w) (by simpa [dist_eq_norm] using hwd)
  rw [hz,sub_zero] at h
  have hlow : ‖w-z‖≤C*‖L (w-z)‖ := by
    have hh := (L.symm : ℂ →L[ℝ] ℂ).le_opNorm (L (w-z))
    have hh' : ‖w-z‖≤‖(L.symm : ℂ →L[ℝ] ℂ)‖*‖L (w-z)‖ := by simpa using hh
    dsimp [C];nlinarith [norm_nonneg (L (w-z))]
  have herror : ‖F w-L (w-z)‖≤‖L (w-z)‖/2 := calc
    _ ≤ (1/(2*C))*‖w-z‖ := h
    _ ≤ (1/(2*C))*(C*‖L (w-z)‖) := mul_le_mul_of_nonneg_left hlow hc.le
    _ = ‖L (w-z)‖/2 := by field_simp [ne_of_gt hC]
  have hτnorm : ‖τ • (F w-L (w-z))‖≤‖F w-L (w-z)‖ := by
    rw [norm_smul,Real.norm_eq_abs,abs_of_nonneg hτ.1]
    nlinarith [mul_nonneg (sub_nonneg.mpr hτ.2) (norm_nonneg (F w-L (w-z)))]
  have hn : 0 < ‖L (w-z)‖ := by
    apply norm_pos_iff.mpr
    intro h0
    have hh : w-z=0 := L.injective (h0.trans L.map_zero.symm)
    exact hw (sub_eq_zero.mp hh)
  intro hzero
  have hh : L (w-z)= -(τ • (F w-L (w-z))) := eq_neg_of_add_eq_zero_left hzero
  have hnorm := congrArg norm hh
  rw [norm_neg] at hnorm
  linarith


theorem circle_value_norm (t : ℝ) : ‖circleValue t‖=1 :=
  Complex.norm_exp_ofReal_mul_I _

theorem circle_value_endpoints : circleValue 0=1 ∧ circleValue 1=1 := by
  constructor
  · simp [circleValue]
  · unfold circleValue
    apply Complex.exp_eq_one_iff.mpr
    exact ⟨1,by norm_num⟩

-- Every sufficiently small, positively oriented source circle has the stated winding.
-- This is the local zero index, proved through actual loops rather than defined by det(D F).
theorem nondegenerate_zero_circle_winding {F : ℂ → ℂ} {z : ℂ}
    (L : ℂ ≃L[ℝ] ℂ) (hf : HasFDerivAt F (L : ℂ →L[ℝ] ℂ) z)
    (hF : ContDiffAt ℝ 1 F z) (hz : F z=0) {ε : ℤ}
    (hε : ε=1 ∨ ε= -1) (hD : 0 < planeJacobian L*(ε:ℝ)) :
    ∃ δ : ℝ, 0 < δ ∧ ∀ r : ℝ, r ∈ Set.Ioo 0 δ →
      ∃ γ : C(I,NonzeroComplex),
        (∀ t : I, (γ t).val=F (z+r • circleValue t)) ∧ loopWinding γ=ε := by
  obtain ⟨δ₀,hδ₀,hsmall⟩ := nondegenerate_zero_small_homotopy L hf hz
  obtain ⟨U,hU,hFc⟩ := hF.contDiffOn (m := 1) le_rfl (by simp)
  obtain ⟨δ₁,hδ₁,hball⟩ := Metric.mem_nhds_iff.mp hU
  refine ⟨min δ₀ δ₁,lt_min hδ₀ hδ₁,?_⟩
  intro r hr
  have hd (t : I) : ‖z+r • circleValue t-z‖=r := by
    rw [add_sub_cancel_left,norm_smul,circle_value_norm,Real.norm_eq_abs,abs_of_pos hr.1,mul_one]
  have hn (t : I) : z+r • circleValue t ≠ z := by
    intro he
    have hh := hd t
    rw [he,sub_self,norm_zero] at hh
    linarith [hr.1]
  have hs (τ t : I) : L (r • circleValue t)+
      (τ:ℝ) • (F (z+r • circleValue t)-L (r • circleValue t)) ≠ 0 := by
    simpa only [add_sub_cancel_left] using
      hsmall (z+r • circleValue t) (hn t)
        (by rw [hd];exact lt_of_lt_of_le hr.2 (min_le_left _ _)) τ τ.property
  have hc : Continuous (fun t : I => F (z+r • circleValue t)) := by
    apply hFc.continuousOn.comp_continuous (by unfold circleValue;fun_prop)
    intro t
    apply hball
    change dist (z+r • circleValue t) z<δ₁
    rw [dist_eq_norm,hd]
    exact lt_of_lt_of_le hr.2 (min_le_right _ _)
  let γ₀ : C(I,NonzeroComplex) := ⟨fun t => ⟨L (r • circleValue t),by simpa using hs 0 t⟩,by
    apply Continuous.subtype_mk;unfold circleValue;fun_prop⟩
  let γ₁ : C(I,NonzeroComplex) := ⟨fun t => ⟨F (z+r • circleValue t),by simpa using hs 1 t⟩,
    hc.subtype_mk (fun t => by simpa using hs 1 t)⟩
  let H : γ₀.Homotopy γ₁ := {
    toFun := fun x => ⟨L (r • circleValue x.2)+(x.1:ℝ) •
      (F (z+r • circleValue x.2)-L (r • circleValue x.2)),hs x.1 x.2⟩
    continuous_toFun := by
      apply Continuous.subtype_mk
      exact (by unfold circleValue;fun_prop : Continuous (fun x : I × I => L (r • circleValue x.2))).add
        (continuous_subtype_val.comp continuous_fst |>.smul
          ((hc.comp continuous_snd).sub (by unfold circleValue;fun_prop)))
    map_zero_left := by intro t;apply Subtype.ext;simp [γ₀]
    map_one_left := by intro t;apply Subtype.ext;simp [γ₁] }
  have hclosed : ∀ τ, H (τ,1)=H (τ,0) := by
    intro τ;apply Subtype.ext
    change L (r • circleValue 1)+(τ:ℝ) • (F (z+r • circleValue 1)-L (r • circleValue 1))=
      L (r • circleValue 0)+(τ:ℝ) • (F (z+r • circleValue 0)-L (r • circleValue 0))
    rw [circle_value_endpoints.1,circle_value_endpoints.2]
  have heq : normalizedLoop γ₀=normalizedLoop (linearCircleLoop L) := by
    ext t
    change L (r • circleValue (t:ℝ))/L (r • circleValue 0)=
      L (circleValue (t:ℝ))/L (circleValue 0)
    rw [map_smul,map_smul]
    simp only [Complex.real_smul]
    exact mul_div_mul_left _ _ (Complex.ofReal_ne_zero.mpr (ne_of_gt hr.1))
  have hw : loopWinding γ₀=ε := by
    rw [← loop_winding_normalized γ₀,heq,loop_winding_normalized]
    exact linear_circle_winding L hε hD
  refine ⟨γ₁,fun _ => rfl,?_⟩
  rw [← loop_winding_free_homotopy H hclosed]
  exact hw

end
end RuledV5
