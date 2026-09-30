import StokesV5.PaperGeometry

namespace StokesV5
noncomputable section
open Filter
open scoped Topology ContDiff

theorem planeCLM_apply (L : (ℝ × ℝ) →L[ℝ] (ℝ × ℝ)) (v : ℝ × ℝ) :
    L v = v.1 • L (1, 0) + v.2 • L (0, 1) := by
  rw [← map_smul, ← map_smul, ← map_add]
  congr 1
  ext <;> simp

theorem linearJacobian_comp (L M : (ℝ × ℝ) →L[ℝ] (ℝ × ℝ)) :
    linearJacobian (L.comp M) = linearJacobian L * linearJacobian M := by
  simp only [linearJacobian, ContinuousLinearMap.comp_apply]
  rw [planeCLM_apply L (M (1, 0)), planeCLM_apply L (M (0, 1))]
  change ((M (1, 0)).1 * (L (1, 0)).1 + (M (1, 0)).2 * (L (0, 1)).1) *
      ((M (0, 1)).1 * (L (1, 0)).2 + (M (0, 1)).2 * (L (0, 1)).2) -
      ((M (0, 1)).1 * (L (1, 0)).1 + (M (0, 1)).2 * (L (0, 1)).1) *
      ((M (1, 0)).1 * (L (1, 0)).2 + (M (1, 0)).2 * (L (0, 1)).2) = _
  ring

theorem smoothChart_jacobian_ne_zero {g : (ℝ × ℝ) → ℝ × ℝ} {p : ℝ × ℝ}
    (hg : IsSmoothChartAt g p) : mapJacobian g p ≠ 0 := by
  obtain ⟨hs, h, hh, _, hleft, _⟩ := hg
  have hleft' : (fun x => h (g x)) =ᶠ[nhds p] id := hleft
  have hd := hh.differentiableAt (by simp) |>.hasFDerivAt
  have he := (hd.comp p (hs.differentiableAt (by simp)).hasFDerivAt).congr_of_eventuallyEq
    hleft'.symm
  have hid := he.unique (hasFDerivAt_id p)
  have hj := congrArg linearJacobian hid
  rw [linearJacobian_comp] at hj
  have hj' : linearJacobian (fderiv ℝ h (g p)) * linearJacobian (fderiv ℝ g p) = 1 := by
    simpa [linearJacobian] using hj
  intro hz
  change linearJacobian (fderiv ℝ g p) = 0 at hz
  rw [hz, mul_zero] at hj'
  norm_num at hj'

theorem mapJacobian_contDiffAt {g : (ℝ × ℝ) → ℝ × ℝ} {p : ℝ × ℝ}
    (hg : ContDiffAt ℝ ∞ g p) : ContDiffAt ℝ 1 (mapJacobian g) p := by
  have hD : ContDiffAt ℝ 1 (fderiv ℝ g) p :=
    hg.fderiv_right (by exact ENat.natCast_le_of_coe_top_le_withTop le_rfl 2)
  have h1 := hD.clm_apply (contDiffAt_const (c := (1, 0)))
  have h2 := hD.clm_apply (contDiffAt_const (c := (0, 1)))
  exact (h1.fst.mul h2.snd).sub (h2.fst.mul h1.snd)

theorem smooth_eventually_differentiable {g : (ℝ × ℝ) → ℝ × ℝ} {p : ℝ × ℝ}
    (hg : ContDiffAt ℝ ∞ g p) : ∀ᶠ x in nhds p, DifferentiableAt ℝ g x := by
  have h1 : ContDiffAt ℝ 1 g p := hg.of_le (by simp)
  exact (h1.eventually (by simp)).mono fun _ h => h.differentiableAt_one

theorem mapJacobian_comp {f g : (ℝ × ℝ) → ℝ × ℝ} {p : ℝ × ℝ}
    (hf : DifferentiableAt ℝ f p) (hg : DifferentiableAt ℝ g (f p)) :
    mapJacobian (fun x => g (f x)) p = mapJacobian g (f p) * mapJacobian f p := by
  unfold mapJacobian
  change linearJacobian (fderiv ℝ (g ∘ f) p) = _
  rw [fderiv_comp p hg hf, linearJacobian_comp]

theorem mapJacobian_square_comp {g : (ℝ × ℝ) → ℝ × ℝ} {p : ℝ × ℝ}
    (hg : DifferentiableAt ℝ g p) :
    mapJacobian (fun x => ((g x).1, (g x).2 ^ 2)) p = 2 * (g p).2 * mapJacobian g p := by
  have hd := hg.hasFDerivAt.fst.prodMk (hg.hasFDerivAt.snd.pow 2)
  rw [mapJacobian, hd.fderiv]
  simp [linearJacobian, mapJacobian, ContinuousLinearMap.prod_apply, ContinuousLinearMap.comp_apply]
  ring

theorem exceptional_not_hasWhitneyNormalFormAt :
    ¬HasWhitneyNormalFormAt observationMap (0, 0) := by
  rintro ⟨source, target, hs, ht, hs0, _, heq⟩
  let p : ℝ × ℝ := (0, 0)
  have hF : ContDiffAt ℝ ∞ observationMap p := by
    have hp : p ∈ observationDomain := by norm_num [p, observationDomain, qSq]
    exact (by unfold observationN; fun_prop : ContDiffAt ℝ ∞ observationN p).prodMk
      (observationM_contDiffAt hp)
  have hf := smooth_eventually_differentiable hF
  have hsrc := smooth_eventually_differentiable hs.1
  have htar := hF.continuousAt.tendsto.eventually (smooth_eventually_differentiable ht.1)
  have hjeq : ∀ᶠ x in nhds p,
      mapJacobian target (observationMap x) * mapJacobian observationMap x =
        2 * (source x).2 * mapJacobian source x := by
    have heq' : (fun x => target (observationMap x)) =ᶠ[nhds p]
        (fun x => ((source x).1, (source x).2 ^ 2)) := heq
    have hd := heq'.fderiv (𝕜 := ℝ)
    filter_upwards [hf, hsrc, htar, hd] with x hxF hxS hxT hxD
    have hj := congrArg linearJacobian hxD
    change mapJacobian (fun x => target (observationMap x)) x =
      mapJacobian (fun x => ((source x).1, (source x).2 ^ 2)) x at hj
    rw [mapJacobian_comp hxF hxT, mapJacobian_square_comp hxS] at hj
    exact hj
  have hJ := mapJacobian_observationMap_hasFDerivAt_symmetry 0
  have hrow : rowCLM (2 * 0) 0 = 0 := by
    apply ContinuousLinearMap.ext
    intro v
    simp [rowCLM_apply]
  rw [hrow] at hJ
  have hJ0 : mapJacobian observationMap p = 0 := by
    rw [mapJacobian_observationMap (by norm_num [p, observationDomain, qSq]),
      observationJacobian_factorization (by norm_num [p, observationDomain, qSq])]
    norm_num [p]
  have hT : DifferentiableAt ℝ (fun x => mapJacobian target (observationMap x)) p :=
    ((mapJacobian_contDiffAt ht.1).differentiableAt_one).comp p (hF.differentiableAt (by simp))
  have hleft := hT.hasFDerivAt.mul hJ
  have hleft0 := hleft
  simp only [hJ0, zero_smul, smul_zero, add_zero] at hleft0
  have hS := (mapJacobian_contDiffAt hs.1).differentiableAt_one
  have hright := ((hs.1.differentiableAt (by simp)).hasFDerivAt.snd.const_mul 2).mul hS.hasFDerivAt
  have hjeq' : (fun x => mapJacobian target (observationMap x) * mapJacobian observationMap x)
      =ᶠ[nhds p] (fun x => 2 * (source x).2 * mapJacobian source x) := hjeq
  have hr := hright.unique (hleft0.congr_of_eventuallyEq hjeq'.symm)
  have hSn := smoothChart_jacobian_ne_zero hs
  have he1 := congrArg (fun L : (ℝ × ℝ) →L[ℝ] ℝ => L (1, 0)) hr
  have he2 := congrArg (fun L : (ℝ × ℝ) →L[ℝ] ℝ => L (0, 1)) hr
  simp [hs0, p, ContinuousLinearMap.comp_apply] at he1 he2
  have h1 : (fderiv ℝ source p (1, 0)).2 = 0 := he1.resolve_left hSn
  have h2 : (fderiv ℝ source p (0, 1)).2 = 0 := he2.resolve_left hSn
  apply hSn
  change mapJacobian source p = 0
  simp [mapJacobian, linearJacobian, h1, h2]

end
end StokesV5
