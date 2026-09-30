import StokesV5.RadialExpansions

namespace StokesV5
noncomputable section
open Filter Asymptotics
open scoped Topology ContDiff

def phaseCoeff (c : ℝ) : ℝ := (1 - c + c ^ 2) / qC c

theorem observationM_phase_form {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    observationM p = Real.cos p.1 * qChart p.1 - p.2 * phaseCoeff (Real.cos p.1) := by
  have hq := qChart_ne_zero hp
  have hsq := qChart_sq hp
  change observationNumerator p / qChart p.1 =
    Real.cos p.1 * qChart p.1 - p.2 * ((1 - Real.cos p.1 + Real.cos p.1 ^ 2) / qChart p.1)
  field_simp [hq]
  unfold observationNumerator qSq at *
  linear_combination -(Real.cos p.1) * hsq

theorem phaseCoeff_contDiffAt_one : ContDiffAt ℝ ∞ phaseCoeff 1 := by
  have hq := qC_contDiffAt (c := 1) (by norm_num)
  unfold phaseCoeff
  fun_prop (disch := norm_num [qC])

theorem phaseCoeff_t_expansion :
    (fun t : ℝ => phaseCoeff (Real.cos t) - 1) =O[nhds 0] (fun t => t ^ 2) := by
  have hp : (fun c : ℝ => phaseCoeff c - 1) =O[nhds 1] (fun c => c - 1) := by
    have hv : phaseCoeff 1 = 1 := by norm_num [phaseCoeff, qC]
    simpa only [hv] using
      (phaseCoeff_contDiffAt_one.differentiableAt (by simp)).hasDerivAt.isBigO_sub
  have hc : (fun t : ℝ => Real.cos t - 1) =O[nhds 0] (fun t => t ^ 2) := by
    simpa [deltaT] using delta_bigO_sq.neg_left
  exact (hp.comp_tendsto cos_tendsto_one).trans hc

/-- Uniform weighted jets; `T` has weight one and `U` weight two. -/
theorem observation_weighted_jets {α : Type*} {l : Filter α} (T U W : α → ℝ)
    (ht : Tendsto T l (nhds 0)) (hT : T =O[l] W)
    (hU : U =O[l] (fun a => W a ^ 2)) :
    (fun a => 1 - observationM (T a, U a) - U a - T a ^ 2 / 2)
      =O[l] (fun a => W a ^ 4) ∧
    (fun a => observationN (T a, U a) + U a * T a ^ 2 - T a ^ 4 / 4)
      =O[l] (fun a => W a ^ 6) := by
  have hd : (fun a => deltaT (T a)) =O[l] (fun a => W a ^ 2) :=
    (delta_bigO_sq.comp_tendsto ht).trans (hT.pow 2)
  have he : (fun a => deltaT (T a) - T a ^ 2 / 2) =O[l] (fun a => W a ^ 4) :=
    (cos_taylor_quartic.comp_tendsto ht).trans (hT.pow 4)
  have hq : (fun a => qChart (T a) - 1) =O[l] (fun a => W a ^ 4) :=
    (qChart_t_expansion.comp_tendsto ht).trans (hT.pow 4)
  have hc : (fun a => Real.cos (T a)) =O[l] (fun _ => (1 : ℝ)) :=
    Real.continuous_cos.continuousAt.isBigO.comp_tendsto ht
  have hphase : (fun a => phaseCoeff (Real.cos (T a)) - 1)
      =O[l] (fun a => W a ^ 2) := (phaseCoeff_t_expansion.comp_tendsto ht).trans (hT.pow 2)
  have h1 : (fun a => Real.cos (T a) * (1 - qChart (T a)))
      =O[l] (fun a => W a ^ 4) := by simpa using hc.mul hq.neg_left
  have h2 : (fun a => U a * (phaseCoeff (Real.cos (T a)) - 1))
      =O[l] (fun a => W a ^ 4) := by
    apply (hU.mul hphase).congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun a => by ring
  have hp : ∀ᶠ a in l, (T a, U a) ∈ observationDomain := by
    have h := near_one_chart.filter_mono (cos_tendsto_one.comp ht)
    exact h.mono fun _ h => h.1
  constructor
  · apply ((h1.add h2).add he).congr'
    · filter_upwards [hp] with a ha
      rw [observationM_phase_form ha]
      dsimp [deltaT]
      ring
    · exact Eventually.of_forall fun _ => rfl
  · have hsum : (fun a => deltaT (T a) + T a ^ 2 / 2 - 2 * U a)
        =O[l] (fun a => W a ^ 2) := by
      have hsq : (fun a => T a ^ 2 / 2) =O[l] (fun a => W a ^ 2) := by
        simpa [div_eq_mul_inv, mul_comm] using (hT.pow 2).const_mul_left (2 : ℝ)⁻¹
      exact (hd.add hsq).sub (hU.const_mul_left 2)
    apply (he.mul hsum).congr'
    · exact Eventually.of_forall fun a => by dsimp [observationN, deltaT]; ring
    · exact Eventually.of_forall fun a => by ring

def weightedRadius (p : ℝ × ℝ) : ℝ := |p.1| + Real.sqrt |p.2|

theorem weighted_fst_bigO :
    (fun p : ℝ × ℝ => p.1) =O[nhds 0] weightedRadius := by
  apply isBigO_iff.mpr
  refine ⟨1, Eventually.of_forall fun p => ?_⟩
  have hn : 0 ≤ weightedRadius p := add_nonneg (abs_nonneg _) (Real.sqrt_nonneg _)
  simp only [Real.norm_eq_abs, one_mul, abs_of_nonneg hn]
  dsimp [weightedRadius]
  linarith [Real.sqrt_nonneg |p.2|]

theorem weighted_snd_bigO :
    (fun p : ℝ × ℝ => p.2) =O[nhds 0] (fun p => weightedRadius p ^ 2) := by
  apply isBigO_iff.mpr
  refine ⟨1, Eventually.of_forall fun p => ?_⟩
  have hs := Real.sq_sqrt (abs_nonneg p.2)
  simp only [Real.norm_eq_abs, one_mul]
  rw [abs_of_nonneg (sq_nonneg (weightedRadius p))]
  dsimp [weightedRadius]
  nlinarith [abs_nonneg p.1, Real.sqrt_nonneg |p.2|]

theorem exceptional_weighted_expansions :
    (fun p : ℝ × ℝ => 1 - observationM p - p.2 - p.1 ^ 2 / 2)
      =O[nhds 0] (fun p => weightedRadius p ^ 4) ∧
    (fun p : ℝ × ℝ => observationN p + p.2 * p.1 ^ 2 - p.1 ^ 4 / 4)
      =O[nhds 0] (fun p => weightedRadius p ^ 6) :=
  observation_weighted_jets Prod.fst Prod.snd weightedRadius
    continuousAt_fst weighted_fst_bigO weighted_snd_bigO

def exceptionalSource (p : ℝ × ℝ) : ℝ × ℝ := (1 - observationM p, p.1)
def exceptionalInverseU (z : ℝ × ℝ) : ℝ :=
  (z.1 - 1 + Real.cos z.2 * qChart z.2) / phaseCoeff (Real.cos z.2)
def exceptionalSourceInverse (z : ℝ × ℝ) : ℝ × ℝ := (z.2, exceptionalInverseU z)
def exceptionalTarget (z : ℝ × ℝ) : ℝ × ℝ := (1 - z.2, z.1)

theorem exceptionalSource_isSmoothChart : IsSmoothChartAt exceptionalSource 0 := by
  have hp : (0 : ℝ × ℝ) ∈ observationDomain := by norm_num [observationDomain, qSq]
  have hs : ContDiffAt ℝ ∞ exceptionalSource 0 :=
    (contDiffAt_const.sub (observationM_contDiffAt hp)).prodMk contDiffAt_fst
  have hd : HasFDerivAt exceptionalSource ((rowCLM 0 1).prod (rowCLM 1 0)) 0 := by
    have h := ((hasFDerivAt_const 1 (0 : ℝ × ℝ)).sub (observationM_hasFDerivAt hp)).prodMk
      (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := 0))
    apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_fderiv
    ext <;> norm_num [rowCLM, dMdt, dMdu, dNumeratorDt, dNumeratorDu, dQdt,
      observationNumerator, qChart, qSq]
  exact smoothChart_of_rows hs hd (by norm_num)

theorem cos_qChart_bigO_sq :
    (fun t : ℝ => Real.cos t * qChart t - 1) =O[nhds 0] (fun t => t ^ 2) := by
  have hq : ContinuousAt qChart 0 := by unfold qChart qSq; fun_prop
  have hc : (fun t : ℝ => Real.cos t - 1) =O[nhds 0] (fun t => t ^ 2) := by
    simpa [deltaT] using delta_bigO_sq.neg_left
  have h1 : (fun t : ℝ => (Real.cos t - 1) * qChart t) =O[nhds 0] (fun t => t ^ 2) :=
    by simpa using hc.mul hq.isBigO
  have h2 := qChart_t_expansion.trans (pow_bigO_zero (by norm_num : 2 ≤ 4))
  apply (h1.add h2).congr'
  · exact Eventually.of_forall fun t => by ring
  · exact Eventually.of_forall fun _ => rfl

def coordinateWeight (z : ℝ × ℝ) : ℝ := weightedRadius (z.2, z.1)

theorem coordinate_y_bigO : (fun z : ℝ × ℝ => z.2) =O[nhds 0] coordinateWeight := by
  have h : Tendsto (fun z : ℝ × ℝ => (z.2, z.1)) (nhds 0) (nhds 0) := by
    have hh : ContinuousAt (fun z : ℝ × ℝ => (z.2, z.1)) 0 := by fun_prop
    exact hh.tendsto
  exact weighted_fst_bigO.comp_tendsto h

theorem coordinate_x_bigO :
    (fun z : ℝ × ℝ => z.1) =O[nhds 0] (fun z => coordinateWeight z ^ 2) := by
  have h : Tendsto (fun z : ℝ × ℝ => (z.2, z.1)) (nhds 0) (nhds 0) := by
    have hh : ContinuousAt (fun z : ℝ × ℝ => (z.2, z.1)) 0 := by fun_prop
    exact hh.tendsto
  exact weighted_snd_bigO.comp_tendsto h

theorem exceptionalInverseU_bigO :
    exceptionalInverseU =O[nhds (0 : ℝ × ℝ)] (fun z => coordinateWeight z ^ 2) := by
  have hy : Tendsto (Prod.snd : ℝ × ℝ → ℝ) (nhds 0) (nhds 0) :=
    continuousAt_snd
  have hc : (fun z : ℝ × ℝ => Real.cos z.2 * qChart z.2 - 1)
      =O[nhds 0] (fun z => coordinateWeight z ^ 2) :=
    (cos_qChart_bigO_sq.comp_tendsto hy).trans (coordinate_y_bigO.pow 2)
  have hi : ContinuousAt (fun z : ℝ × ℝ => (phaseCoeff (Real.cos z.2))⁻¹) 0 := by
    have hphase := phaseCoeff_contDiffAt_one.continuousAt
    have hp : ContinuousAt (fun z : ℝ × ℝ => phaseCoeff (Real.cos z.2)) 0 := by
      have hc : ContinuousAt (fun z : ℝ × ℝ => Real.cos z.2) 0 := by fun_prop
      exact hphase.comp_of_eq hc (by simp)
    exact hp.inv₀ (by norm_num [phaseCoeff, qC])
  have h := (coordinate_x_bigO.add hc).mul hi.isBigO
  apply h.congr'
  · exact Eventually.of_forall fun z => by dsimp [exceptionalInverseU]; ring
  · exact Eventually.of_forall fun z => by simp

theorem exceptional_inverse_right :
    ∀ᶠ z : ℝ × ℝ in nhds 0, exceptionalSource (exceptionalSourceInverse z) = z := by
  have hc : Tendsto (fun z : ℝ × ℝ => Real.cos z.2) (nhds 0) (nhds 1) :=
    cos_tendsto_one.comp continuousAt_snd
  have hphase : ∀ᶠ z : ℝ × ℝ in nhds 0, phaseCoeff (Real.cos z.2) ≠ 0 := by
    have he : ∀ᶠ c : ℝ in nhds 1, phaseCoeff c ≠ 0 :=
      phaseCoeff_contDiffAt_one.continuousAt.eventually_ne (by norm_num [phaseCoeff, qC])
    exact he.filter_mono hc
  filter_upwards [near_one_chart.filter_mono hc, hphase] with z hq hp
  apply Prod.ext
  · have hobs := observationM_phase_form (p := exceptionalSourceInverse z) hq.1
    change 1 - observationM (exceptionalSourceInverse z) = z.1
    rw [hobs]
    dsimp [exceptionalSourceInverse, exceptionalInverseU]
    field_simp [hp]
    ring
  · rfl

theorem exceptional_inverse_left :
    ∀ᶠ p : ℝ × ℝ in nhds 0, exceptionalSourceInverse (exceptionalSource p) = p := by
  have hc : Tendsto (fun p : ℝ × ℝ => Real.cos p.1) (nhds 0) (nhds 1) :=
    cos_tendsto_one.comp continuousAt_fst
  have hphase : ∀ᶠ p : ℝ × ℝ in nhds 0, phaseCoeff (Real.cos p.1) ≠ 0 := by
    have he : ∀ᶠ c : ℝ in nhds 1, phaseCoeff c ≠ 0 :=
      phaseCoeff_contDiffAt_one.continuousAt.eventually_ne (by norm_num [phaseCoeff, qC])
    exact he.filter_mono hc
  filter_upwards [near_one_chart.filter_mono hc, hphase] with p hq hp
  apply Prod.ext
  · rfl
  · change exceptionalInverseU (exceptionalSource p) = p.2
    dsimp [exceptionalInverseU, exceptionalSource]
    rw [observationM_phase_form hq.1]
    field_simp [hp]
    ring

theorem exceptional_coordinate_jet :
    (fun z : ℝ × ℝ => observationN (exceptionalSourceInverse z) + z.1 * z.2 ^ 2 -
        (3 / 4 : ℝ) * z.2 ^ 4) =O[nhds 0] (fun z => coordinateWeight z ^ 6) := by
  have hy : Tendsto (Prod.snd : ℝ × ℝ → ℝ) (nhds 0) (nhds 0) :=
    continuousAt_snd
  have h := observation_weighted_jets Prod.snd exceptionalInverseU coordinateWeight
    hy coordinate_y_bigO exceptionalInverseU_bigO
  have hex : (fun z : ℝ × ℝ => z.1 - exceptionalInverseU z - z.2 ^ 2 / 2)
      =O[nhds 0] (fun z => coordinateWeight z ^ 4) := by
    apply h.1.congr'
    · filter_upwards [exceptional_inverse_right] with z hz
      have hx := congrArg Prod.fst hz
      simpa [exceptionalSource, exceptionalSourceInverse] using hx
    · exact Eventually.of_forall fun _ => rfl
  have hp : (fun z : ℝ × ℝ =>
      (z.1 - exceptionalInverseU z - z.2 ^ 2 / 2) * z.2 ^ 2)
      =O[nhds 0] (fun z => coordinateWeight z ^ 6) := by
    apply (hex.mul (coordinate_y_bigO.pow 2)).congr'
    · exact Eventually.of_forall fun _ => rfl
    · exact Eventually.of_forall fun z => by ring
  apply (h.2.add hp).congr'
  · exact Eventually.of_forall fun z => by dsimp [exceptionalSourceInverse]; ring
  · exact Eventually.of_forall fun _ => rfl

def exceptionalFourJet (p : ℝ × ℝ) : ℝ × ℝ :=
  (p.1, -p.1 * p.2 ^ 2 + (3 / 4 : ℝ) * p.2 ^ 4)
def jetScalingSource (p : ℝ × ℝ) : ℝ × ℝ := (-(3 / 4 : ℝ) * p.1, p.2)
def jetScalingTarget (p : ℝ × ℝ) : ℝ × ℝ := (-(4 / 3 : ℝ) * p.1, (4 / 3 : ℝ) * p.2)

theorem exceptional_four_jet_rescaling (p : ℝ × ℝ) :
    jetScalingTarget (exceptionalFourJet (jetScalingSource p)) =
      (p.1, p.1 * p.2 ^ 2 + p.2 ^ 4) := by
  ext <;> dsimp [jetScalingTarget, exceptionalFourJet, jetScalingSource] <;> ring

theorem exceptionalInverse_contDiffAt_zero :
    ContDiffAt ℝ ∞ exceptionalSourceInverse 0 := by
  have hq : ContDiffAt ℝ ∞ (fun z : ℝ × ℝ => qChart z.2) 0 := by
    unfold qChart qSq
    fun_prop (disch := norm_num)
  have hp : ContDiffAt ℝ ∞ (fun z : ℝ × ℝ => phaseCoeff (Real.cos z.2)) 0 := by
    have hc : ContDiffAt ℝ ∞ (fun z : ℝ × ℝ => Real.cos z.2) 0 := by fun_prop
    have hphase : ContDiffAt ℝ ∞ phaseCoeff (Real.cos (0 : ℝ)) := by
      simpa only [Real.cos_zero] using phaseCoeff_contDiffAt_one
    exact hphase.comp (0 : ℝ × ℝ) hc
  unfold exceptionalSourceInverse exceptionalInverseU
  exact contDiffAt_snd.prodMk
    (((contDiffAt_fst.sub contDiffAt_const).add (contDiffAt_snd.cos.mul hq)).div hp
      (by norm_num [phaseCoeff, qC]))

theorem exceptional_coordinate_identity :
    ∀ᶠ z : ℝ × ℝ in nhds 0,
      exceptionalTarget (observationMap (exceptionalSourceInverse z)) =
        (z.1, observationN (exceptionalSourceInverse z)) := by
  filter_upwards [exceptional_inverse_right] with z hz
  apply Prod.ext
  · change 1 - observationM (exceptionalSourceInverse z) = z.1
    exact congrArg Prod.fst hz
  · rfl

theorem jetScalingSource_isSmoothChart : IsSmoothChartAt jetScalingSource 0 := by
  refine ⟨by unfold jetScalingSource; fun_prop,
    (fun z => (-(4 / 3 : ℝ) * z.1, z.2)), by fun_prop, ?_, ?_, ?_⟩
  · norm_num [jetScalingSource]
  · exact Eventually.of_forall fun z => by ext <;> dsimp [jetScalingSource] <;> ring
  · exact Eventually.of_forall fun z => by ext <;> dsimp [jetScalingSource] <;> ring

theorem jetScalingTarget_isSmoothChart : IsSmoothChartAt jetScalingTarget 0 := by
  refine ⟨by unfold jetScalingTarget; fun_prop,
    (fun z => (-(3 / 4 : ℝ) * z.1, (3 / 4 : ℝ) * z.2)), by fun_prop, ?_, ?_, ?_⟩
  · norm_num [jetScalingTarget]
  · exact Eventually.of_forall fun z => by ext <;> dsimp [jetScalingTarget] <;> ring
  · exact Eventually.of_forall fun z => by ext <;> dsimp [jetScalingTarget] <;> ring

end
end StokesV5
