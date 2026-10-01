import StokesV5.LocalNormalForm
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.SpecialFunctions.Trigonometric.ArctanDeriv
import Mathlib.Analysis.Calculus.Deriv.MeanValue

namespace RuledV5
noncomputable section
open StokesV5 Filter
open scoped Topology

def whitney (p : ℝ × ℝ) : ℝ × ℝ := (p.1,p.2^2)

theorem whitney_fiber_iff (p q : ℝ × ℝ) :
    whitney p = whitney q ↔ p.1=q.1 ∧ (p.2=q.2 ∨ p.2= -q.2) := by
  simp only [whitney, Prod.mk.injEq]
  constructor
  · rintro ⟨hx,hy⟩
    refine ⟨hx, ?_⟩
    have h : (p.2-q.2)*(p.2+q.2)=0 := by nlinarith
    rcases mul_eq_zero.mp h with h | h
    · exact Or.inl (by linarith)
    · exact Or.inr (by linarith)
  · rintro ⟨hx,hy | hy⟩ <;> exact ⟨hx, by simp [hy]⟩

theorem transverse_crossing_observation_injective :
    Function.Injective (fun s : ℝ => whitney (s,s)) := by
  intro s t h
  exact congrArg Prod.fst h

theorem transverse_crossing_derivative : HasDerivAt (fun s : ℝ => s) 1 0 := hasDerivAt_id 0

theorem local_fold_fiber_criterion {f : (ℝ × ℝ) → (ℝ × ℝ)} {p : ℝ × ℝ}
    (hf : HasWhitneyNormalFormAt f p) (hc : ContinuousAt f p) :
    ∃ source : (ℝ × ℝ) → (ℝ × ℝ), IsSmoothChartAt source p ∧
      ∀ᶠ x in nhds p, ∀ᶠ y in nhds p,
        f x=f y ↔ (source x).1=(source y).1 ∧
          ((source x).2=(source y).2 ∨ (source x).2= -(source y).2) := by
  rcases hf with ⟨source,target,hs,ht,_,_,he⟩
  rcases ht.2 with ⟨inv,_,_,hl,_⟩
  have hli : ∀ᶠ x in nhds p, inv (target (f x))=f x := hc.tendsto.eventually hl
  refine ⟨source,hs,?_⟩
  filter_upwards [he,hli] with x hx hix
  filter_upwards [he,hli] with y hy hiy
  rw [← whitney_fiber_iff]
  change f x=f y ↔ whitney (source x)=whitney (source y)
  constructor
  · intro h
    simpa only [hx,hy,whitney] using congrArg target h
  · intro h
    have h' : target (f x)=target (f y) := hx.trans (h.trans hy.symm)
    simpa only [hix,hiy] using congrArg inv h'

def rotation (θ : ℝ) : ℂ := Complex.exp ((θ : ℂ)*Complex.I)
def rotatedSignal (θ : ℝ) (z : ℂ) : ℂ := rotation θ*z
def complexObservation (p : ℝ × ℝ) : ℂ :=
  (observationN p : ℂ)+(observationM p : ℂ)*Complex.I

theorem repeated_nonzero_signal_iff_phase_lock {z : ℂ} (hz : z ≠ 0) (θ₁ θ₂ : ℝ) :
    rotatedSignal θ₁ z=rotatedSignal θ₂ z ↔ rotation θ₁=rotation θ₂ := by
  exact mul_left_inj' hz

theorem phase_lock_iff (θ₁ θ₂ : ℝ) :
    rotation θ₁=rotation θ₂ ↔ ∃ n : ℤ, θ₁-θ₂=(n : ℝ)*(2*Real.pi) := by
  rw [rotation,rotation,Complex.exp_eq_exp_iff_exists_int]
  constructor
  · rintro ⟨n,h⟩
    refine ⟨n,?_⟩
    have hi := congrArg Complex.im h
    simp at hi
    linarith
  · rintro ⟨n,h⟩
    refine ⟨n,?_⟩
    apply Complex.ext <;> simp
    linarith

theorem phase_locked_retracing {p q : ℝ × ℝ} {θ₁ θ₂ : ℝ}
    (hf : observationMap p=observationMap q) (hθ : rotation θ₁=rotation θ₂) :
    rotatedSignal θ₁ (complexObservation p)=rotatedSignal θ₂ (complexObservation q) := by
  have hn := congrArg Prod.fst hf
  have hm := congrArg Prod.snd hf
  simp only [observationMap] at hn hm
  simp [rotatedSignal,complexObservation,hn,hm,hθ]

theorem zero_signal (θ : ℝ) : rotatedSignal θ 0=0 := by simp [rotatedSignal]

theorem unlocked_rotation_counterexample :
    rotatedSignal 0 (1 : ℂ) ≠ rotatedSignal Real.pi (1 : ℂ) := by
  norm_num [rotatedSignal,rotation,Complex.exp_mul_I]

def phaseResponse (ξ a ω t : ℝ) : ℝ := Real.arctan ((a*Real.cos (ω*t))^2/ξ)

theorem squared_cosine_response (ξ a ω t : ℝ) :
    (a*Real.cos (ω*t))^2/ξ = (a^2/ξ)/2*(1+Real.cos (2*ω*t)) := by
  rw [show 2*ω*t=2*(ω*t) by ring,Real.cos_two_mul]
  have h := Real.sin_sq_add_cos_sq (ω*t)
  ring

theorem phase_response_half_period {ω : ℝ} (hω : ω ≠ 0) (ξ a t : ℝ) :
    phaseResponse ξ a ω (t+Real.pi/ω)=phaseResponse ξ a ω t := by
  unfold phaseResponse
  have he : ω*(t+Real.pi/ω)=ω*t+Real.pi := by field_simp
  rw [he,Real.cos_add_pi]
  congr 1
  ring

theorem arctan_remainder_nonneg {x : ℝ} (hx : 0 ≤ x) :
    0 ≤ x-Real.arctan x ∧ x-Real.arctan x ≤ x^3/3 := by
  have h1 (v : ℝ) : HasDerivAt (fun y : ℝ => y-Real.arctan y)
      (v^2/(1+v^2)) v := by
    apply ((hasDerivAt_id v).sub (Real.hasDerivAt_arctan v)).congr_deriv
    field_simp
    ring
  have h2 (v : ℝ) : HasDerivAt (fun y : ℝ => y^3/3-y+Real.arctan y)
      (v^4/(1+v^2)) v := by
    apply ((((hasDerivAt_id v).pow 3).div_const 3).sub
      (hasDerivAt_id v) |>.add (Real.hasDerivAt_arctan v)).congr_deriv
    field_simp
    simp only [id_eq]
    ring
  have hm1 := monotone_of_hasDerivAt_nonneg h1 (fun v => by positivity)
  have hm2 := monotone_of_hasDerivAt_nonneg h2 (fun v => by positivity)
  have ha := hm1 hx
  have hb := hm2 hx
  norm_num at ha hb
  exact ⟨by linarith,by linarith⟩

theorem arctan_remainder_bound (x : ℝ) :
    |Real.arctan x-x| ≤ |x|^3/3 := by
  by_cases hx : 0 ≤ x
  · have h := arctan_remainder_nonneg hx
    rw [abs_of_nonneg hx,abs_of_nonpos (by linarith : Real.arctan x-x ≤ 0)]
    linarith
  · have hn : 0 ≤ -x := by linarith
    have h := arctan_remainder_nonneg hn
    rw [Real.arctan_neg] at h
    rw [abs_of_nonpos (by linarith : x ≤ 0),abs_of_nonneg (by linarith : 0 ≤ Real.arctan x-x)]
    linarith [h.2]

theorem phase_response_error_bound {ξ : ℝ} (hξ : ξ ≠ 0) (a ω t : ℝ) :
    |phaseResponse ξ a ω t-(a^2/ξ)/2*(1+Real.cos (2*ω*t))| ≤ |a^2/ξ|^3/3 := by
  have hc : |Real.cos (ω*t)| ≤ 1 := Real.abs_cos_le_one _
  have hcos : |Real.cos (ω*t)|^2 ≤ 1 := by nlinarith [abs_nonneg (Real.cos (ω*t))]
  have hab : |(a*Real.cos (ω*t))^2/ξ| ≤ |a^2/ξ| := by
    have he : (a*Real.cos (ω*t))^2/ξ=(a^2/ξ)*(Real.cos (ω*t))^2 := by ring
    rw [he,abs_mul,abs_pow]
    nlinarith [abs_nonneg (a^2/ξ)]
  have hpow : |(a*Real.cos (ω*t))^2/ξ|^3 ≤ |a^2/ξ|^3 :=
    pow_le_pow_left₀ (abs_nonneg _) hab 3
  unfold phaseResponse
  rw [← squared_cosine_response]
  exact le_trans (arctan_remainder_bound _) (by linarith)


theorem phase_response_positive_period {ω : ℝ} (hω : ω ≠ 0) (ξ a t : ℝ) :
    0 < Real.pi/|ω| ∧ phaseResponse ξ a ω (t+Real.pi/|ω|)=phaseResponse ξ a ω t := by
  constructor
  · exact div_pos Real.pi_pos (abs_pos.mpr hω)
  · rcases lt_or_gt_of_ne hω with hn | hp
    · have h := phase_response_half_period hω ξ a (t-Real.pi/ω)
      have ht : t-Real.pi/ω+Real.pi/ω=t := by ring
      rw [ht] at h
      rw [abs_of_neg hn]
      have he : t+Real.pi/(-ω)=t-Real.pi/ω := by field_simp <;> ring
      rw [he];exact h.symm
    · simpa [abs_of_pos hp] using phase_response_half_period hω ξ a t


theorem uniform_rotation_phase_lock {z : ℂ} (hz : z ≠ 0) (ω t₁ t₂ : ℝ) :
    rotatedSignal (ω*t₁) z=rotatedSignal (ω*t₂) z ↔
      ∃ n : ℤ, ω*(t₁-t₂)=(n:ℝ)*(2*Real.pi) := by
  rw [repeated_nonzero_signal_iff_phase_lock hz,phase_lock_iff]
  simp only [mul_sub]


theorem local_fold_common_neighborhood {f : (ℝ × ℝ) → ℝ × ℝ} {p : ℝ × ℝ}
    (hf : HasWhitneyNormalFormAt f p) (hc : ContinuousAt f p) :
    ∃ source : (ℝ × ℝ) → ℝ × ℝ, IsSmoothChartAt source p ∧
      ∃ U : Set (ℝ × ℝ), IsOpen U ∧ p ∈ U ∧
        ∀ x ∈ U, ∀ y ∈ U, f x=f y ↔ (source x).1=(source y).1 ∧
          ((source x).2=(source y).2 ∨ (source x).2= -(source y).2) := by
  obtain ⟨source,target,hs,ht,_,_,he⟩ := hf
  obtain ⟨inv,_,_,hl,_⟩ := ht.2
  have hi : ∀ᶠ x in 𝓝 p, inv (target (f x))=f x := hc.tendsto.eventually hl
  obtain ⟨U,hU,hopen,hp⟩ := mem_nhds_iff.mp (he.and hi)
  refine ⟨source,hs,U,hopen,hp,?_⟩
  intro x hx y hy
  obtain ⟨hex,hix⟩ := hU hx
  obtain ⟨hey,hiy⟩ := hU hy
  rw [← whitney_fiber_iff]
  constructor
  · intro h
    simpa only [hex,hey,whitney] using congrArg target h
  · intro h
    have hh : target (f x)=target (f y) := hex.trans (h.trans hey.symm)
    simpa only [hix,hiy] using congrArg inv hh


theorem unlocked_rotation_counterexample_nonreal :
    rotatedSignal 0 (1+Complex.I) ≠ rotatedSignal Real.pi (1+Complex.I) := by
  simp only [rotatedSignal,rotation,Complex.exp_mul_I]
  intro h
  have hr := congrArg Complex.re h
  norm_num at hr

end
end RuledV5
