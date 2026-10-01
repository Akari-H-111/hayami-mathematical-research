import StokesV5.PhysicalLocus

namespace StokesV5
noncomputable section
open Filter
open scoped Topology ContDiff

theorem observationMap_symmetry (u : ℝ) : observationMap (0, u) = (0, 1 - u) := by
  norm_num [observationMap, observationN, observationM, observationNumerator, qChart, qSq]

theorem observationMap_even (t u : ℝ) : observationMap (-t, u) = observationMap (t, u) := by
  simp [observationMap, observationN, observationM, observationNumerator, qChart, qSq]

theorem observationMap_rational_branch (t : ℝ) :
    observationMap (t, uFoldR (Real.cos t)) = (foldN (Real.cos t), foldM (Real.cos t)) := rfl

theorem rational_discriminant_at_boundary :
    (foldN physicalBoundary, foldM physicalBoundary) =
      (physicalBoundary ^ 2 - 1,
        -(1 - physicalBoundary) ^ 2 * (1 + physicalBoundary) / qC physicalBoundary) := by
  simp only [foldN, foldM, uFoldR_at_boundary]
  apply Prod.ext <;> ring

theorem componentZero_not_rational_branch :
    (1 - (4 / 5 : ℝ)) / 2 = 1 / 10 ∧ uFoldR (4 / 5) = 392 / 925 ∧
      (1 - (4 / 5 : ℝ)) / 2 ≠ uFoldR (4 / 5) := by
  norm_num [uFoldR, AR, BR]

theorem symmetry_discriminant_image :
    observationMap '' {p : ℝ × ℝ | p.1 = 0 ∧ 0 ≤ p.2 ∧ p.2 ≤ 1} =
      {z : ℝ × ℝ | z.1 = 0 ∧ 0 ≤ z.2 ∧ z.2 ≤ 1} := by
  ext z
  constructor
  · rintro ⟨⟨t, u⟩, ⟨ht, hu0, hu1⟩, rfl⟩
    change t = 0 at ht
    subst t
    rw [observationMap_symmetry]
    exact ⟨rfl, by linarith, by linarith⟩
  · rintro ⟨hz, hz0, hz1⟩
    refine ⟨(0, 1 - z.2), ⟨rfl, by linarith, by linarith⟩, ?_⟩
    rw [observationMap_symmetry]
    ext <;> simp [hz]

def discriminantE (c : ℝ) : ℝ := c ^ 5 - 3 * c ^ 4 + 5 * c ^ 3 - 6 * c ^ 2 + c + 1
def discriminantJ (c : ℝ) : ℝ :=
  (2 * c ^ 4 - 7 * c ^ 3 + 6 * c ^ 2 + c + 1) / BR c
def discriminantH (c : ℝ) : ℝ :=
  (c ^ 4 - 2 * c ^ 3 + 2 * c ^ 2 - 4 * c -
    (c - 1) * discriminantE c / (qC c + 1)) / BR c

theorem foldN_exact_contact {c : ℝ} (hB : BR c ≠ 0) :
    foldN c = (c - 1) ^ 2 * discriminantJ c := by
  unfold foldN uFoldR discriminantJ
  field_simp [hB]
  unfold AR BR
  ring

theorem foldM_qC_expression {c : ℝ} (hq : 0 < c * (2 - c)) (hB : BR c ≠ 0) :
    foldM c = qC c * discriminantE c / BR c := by
  have hq0 : qC c ≠ 0 := ne_of_gt (Real.sqrt_pos.2 hq)
  have hsq : qC c ^ 2 = c * (2 - c) := Real.sq_sqrt (le_of_lt hq)
  unfold foldM uFoldR discriminantE
  field_simp [hB, hq0]
  unfold AR BR
  ring_nf
  rw [hsq]
  ring

theorem foldM_exact_contact {c : ℝ} (hq : 0 < c * (2 - c)) (hB : BR c ≠ 0) :
    foldM c = 1 + (c - 1) * discriminantH c := by
  have hqc : 0 ≤ qC c := Real.sqrt_nonneg _
  have hs : qC c + 1 ≠ 0 := ne_of_gt (by linarith)
  have hsq : qC c ^ 2 = c * (2 - c) := Real.sq_sqrt (le_of_lt hq)
  rw [foldM_qC_expression hq hB]
  unfold discriminantH discriminantE
  field_simp [hB, hs]
  unfold BR
  ring_nf
  rw [hsq]
  ring

theorem discriminant_coefficients_at_one : discriminantJ 1 = -3 ∧ discriminantH 1 = 3 := by
  norm_num [discriminantJ, discriminantH, discriminantE, BR, qC]

private theorem discriminantH_contDiffAt_one : ContDiffAt ℝ ∞ discriminantH 1 := by
  have hq : ContDiffAt ℝ ∞ qC 1 := qC_contDiffAt (by norm_num)
  unfold discriminantH discriminantE BR
  fun_prop (disch := norm_num [qC])

private theorem contact_eventually : ∀ᶠ c in nhds (1 : ℝ),
    foldN c = (c - 1) ^ 2 * discriminantJ c ∧
    foldM c = 1 + (c - 1) * discriminantH c ∧ discriminantH c ≠ 0 := by
  have hq : ContinuousAt (fun c : ℝ => c * (2 - c)) 1 := by fun_prop
  have hb : ContinuousAt BR 1 := by unfold BR; fun_prop
  have hh := discriminantH_contDiffAt_one.continuousAt
  filter_upwards [hq.eventually (Ioi_mem_nhds (show (0 : ℝ) < 1 * (2 - 1) by norm_num)),
    hb.eventually_ne (show BR 1 ≠ (0 : ℝ) by norm_num [BR]),
    hh.eventually_ne (show discriminantH 1 ≠ (0 : ℝ) by
      rw [discriminant_coefficients_at_one.2]; norm_num)] with c hc hB hH
  exact ⟨foldN_exact_contact hB, foldM_exact_contact hc hB, hH⟩

theorem discriminant_quadratic_contact :
    Tendsto (fun c : ℝ => foldN c / (1 - foldM c) ^ 2)
      (nhdsWithin 1 ({1}ᶜ : Set ℝ)) (nhds (-1 / 3 : ℝ)) := by
  have hj : ContinuousAt discriminantJ 1 := by
    unfold discriminantJ BR
    fun_prop (disch := norm_num)
  have hh := discriminantH_contDiffAt_one.continuousAt
  have hcont := hj.div (hh.pow 2)
    (by rw [discriminant_coefficients_at_one.2]; norm_num : discriminantH 1 ^ 2 ≠ 0)
  have hlim : Tendsto (fun c => discriminantJ c / discriminantH c ^ 2)
      (nhdsWithin 1 ({1}ᶜ : Set ℝ)) (nhds (-1 / 3 : ℝ)) := by
    have hconst : discriminantJ 1 / discriminantH 1 ^ 2 = (-1 / 3 : ℝ) := by
      rw [discriminant_coefficients_at_one.1, discriminant_coefficients_at_one.2]
      norm_num
    rw [← hconst]
    exact hcont.tendsto.mono_left nhdsWithin_le_nhds
  have heq : (fun c : ℝ => foldN c / (1 - foldM c) ^ 2) =ᶠ[nhdsWithin 1 ({1}ᶜ : Set ℝ)]
      (fun c => discriminantJ c / discriminantH c ^ 2) := by
    filter_upwards [self_mem_nhdsWithin, contact_eventually.filter_mono nhdsWithin_le_nhds]
      with c hc hcontact
    have hc1 : c - 1 ≠ 0 := sub_ne_zero.mpr (by simpa using hc)
    rw [hcontact.1, hcontact.2.1]
    field_simp [hc1, hcontact.2.2]
    ring
  exact (tendsto_congr' heq).mpr hlim

theorem foldM_hasDerivAt_one : HasDerivAt foldM 3 1 := by
  have hH := (discriminantH_contDiffAt_one.differentiableAt (by simp)).hasDerivAt
  have h := ((hasDerivAt_const 1 (1 : ℝ)).add
    (((hasDerivAt_id (1 : ℝ)).sub_const 1).mul hH))
  have heq : foldM =ᶠ[nhds (1 : ℝ)]
      (fun c => 1 + (c - 1) * discriminantH c) := contact_eventually.mono fun _ h => h.2.1
  apply (h.congr_of_eventuallyEq heq).congr_deriv
  norm_num [discriminant_coefficients_at_one.2]

theorem discriminant_hasDerivAt_one :
    HasDerivAt (fun c => (foldN c, foldM c)) (0, 3) 1 := by
  have hn := foldN_hasDerivAt (c := 1) (by norm_num [BR])
  have hn' : HasDerivAt foldN 0 1 := by simpa [foldNDerivative] using hn
  exact hn'.prodMk foldM_hasDerivAt_one

theorem discriminant_contact_cubic_error :
    (fun c : ℝ => foldN c + (1 / 3 : ℝ) * (1 - foldM c) ^ 2)
      =O[nhds 1] (fun c => (1 - foldM c) ^ 3) := by
  have hj : ContDiffAt ℝ ∞ discriminantJ 1 := by
    unfold discriminantJ BR
    fun_prop (disch := norm_num)
  have hh := discriminantH_contDiffAt_one
  let coeff := fun c : ℝ => discriminantJ c + (1 / 3 : ℝ) * discriminantH c ^ 2
  have hcoeff : ContDiffAt ℝ ∞ coeff 1 := hj.add (contDiffAt_const.mul (hh.pow 2))
  have hc0 : coeff 1 = 0 := by
    dsimp [coeff]
    rw [discriminant_coefficients_at_one.1, discriminant_coefficients_at_one.2]
    norm_num
  have hsmall : coeff =O[nhds 1] (fun c : ℝ => c - 1) := by
    simpa only [hc0, sub_zero] using
      (hcoeff.differentiableAt (by simp)).hasDerivAt.isBigO_sub
  have hd : (fun c : ℝ => c - 1) =O[nhds 1] (fun c => c - 1) :=
    Asymptotics.isBigO_refl _ _
  have hproduct := hsmall.mul (hd.pow 2)
  have hres : (fun c : ℝ => foldN c + (1 / 3 : ℝ) * (1 - foldM c) ^ 2)
      =O[nhds 1] (fun c => (c - 1) ^ 3) := by
    apply hproduct.congr'
    · filter_upwards [contact_eventually] with c hc
      rw [hc.1, hc.2.1]
      dsimp [coeff]
      ring
    · exact Eventually.of_forall fun c => by ring
  have hinv : (fun c : ℝ => (discriminantH c)⁻¹) =O[nhds 1] (fun _ => (1 : ℝ)) :=
    (hh.continuousAt.inv₀ (by rw [discriminant_coefficients_at_one.2]; norm_num)).isBigO
  have hf : (fun c : ℝ => 1 - foldM c) =O[nhds 1] (fun c => 1 - foldM c) :=
    Asymptotics.isBigO_refl _ _
  have hreverse : (fun c : ℝ => c - 1) =O[nhds 1] (fun c => 1 - foldM c) := by
    apply (hinv.mul hf).neg_left.congr'
    · filter_upwards [contact_eventually] with c hc
      rw [hc.2.1]
      field_simp [hc.2.2]
      ring
    · exact Eventually.of_forall fun c => by simp
  exact hres.trans (hreverse.pow 3)

theorem rationalCriticalGraph_hasDerivAt_zero :
    HasDerivAt (fun t => (t, uFoldR (Real.cos t))) (1, 0) 0 := by
  have hu : ContDiffAt ℝ ∞ uFoldR 1 := by
    unfold uFoldR AR BR
    fun_prop (disch := norm_num)
  have huc : HasDerivAt uFoldR (deriv uFoldR 1) (Real.cos 0) := by
    simpa using (hu.differentiableAt (by simp)).hasDerivAt
  have h := huc.comp 0 (Real.hasDerivAt_cos 0)
  have h0 : HasDerivAt (fun t => uFoldR (Real.cos t)) 0 0 := by
    convert! h using 1 <;> (first | rfl | simp)
  exact (hasDerivAt_id 0).prodMk h0

theorem symmetryCriticalGraph_hasDerivAt_zero :
    HasDerivAt (fun u : ℝ => ((0 : ℝ), u)) (0, 1) 0 :=
  (hasDerivAt_const 0 (0 : ℝ)).prodMk (hasDerivAt_id 0)

theorem critical_branches_transverse_at_zero :
    let v := deriv (fun t : ℝ => (t, uFoldR (Real.cos t))) 0
    let w := deriv (fun u : ℝ => ((0 : ℝ), u)) 0
    v.1 * w.2 - v.2 * w.1 = 1 := by
  dsimp only
  rw [rationalCriticalGraph_hasDerivAt_zero.deriv, symmetryCriticalGraph_hasDerivAt_zero.deriv]
  norm_num

end
end StokesV5
