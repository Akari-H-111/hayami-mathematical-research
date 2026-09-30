import StokesV5.FoldGeometry

namespace StokesV5

noncomputable section

/-!
# Plane-to-plane Whitney-fold criterion

`IsPlaneWhitneyFoldCriterionAt` encodes the standard intrinsic recognition
criterion for a map `ℝ² → ℝ²`: rank one, a nonzero kernel vector, vanishing
Jacobian, and nonzero derivative of the Jacobian in the kernel direction.
This is the criterion-level endpoint used by the v5 manuscript; it does not
construct the local source and target coordinate changes to `(x, y^2)`.
-/

def linearJacobian (L : (ℝ × ℝ) →L[ℝ] (ℝ × ℝ)) : ℝ :=
  (L (1, 0)).1 * (L (0, 1)).2 - (L (0, 1)).1 * (L (1, 0)).2

def mapJacobian (f : (ℝ × ℝ) → (ℝ × ℝ)) (p : ℝ × ℝ) : ℝ :=
  linearJacobian (fderiv ℝ f p)

def IsPlaneWhitneyFoldCriterionAt (f : (ℝ × ℝ) → (ℝ × ℝ))
    (p : ℝ × ℝ) : Prop :=
  DifferentiableAt ℝ f p ∧
    fderiv ℝ f p ≠ 0 ∧
    mapJacobian f p = 0 ∧
    ∃ k : ℝ × ℝ,
      k ≠ 0 ∧ fderiv ℝ f p k = 0 ∧
        DifferentiableAt ℝ (mapJacobian f) p ∧
        fderiv ℝ (mapJacobian f) p k ≠ 0

theorem linearJacobian_observationDerivative (p : ℝ × ℝ) :
    linearJacobian (observationDerivative p) = observationJacobian p := by
  simp [linearJacobian, observationDerivative, observationJacobian, rowCLM]

theorem mapJacobian_observationMap {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    mapJacobian observationMap p = observationJacobian p := by
  rw [mapJacobian, observationMap_fderiv_eq hp,
    linearJacobian_observationDerivative]

theorem mapJacobian_observationMap_eventuallyEq {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) :
    mapJacobian observationMap =ᶠ[nhds p] observationJacobian := by
  have hcont : ContinuousAt (fun x : ℝ × ℝ => qSq x.1) p := by
    unfold qSq
    fun_prop
  have hev : ∀ᶠ x in nhds p, 0 < qSq x.1 :=
    hcont.eventually (Ioi_mem_nhds hp)
  filter_upwards [hev] with x hx
  exact mapJacobian_observationMap hx

theorem mapJacobian_observationMap_hasFDerivAt_symmetry (u : ℝ) :
    HasFDerivAt (mapJacobian observationMap) (rowCLM (2 * u) 0) (0, u) := by
  have hp : (0, u) ∈ observationDomain := by norm_num [observationDomain, qSq]
  have hsin : HasFDerivAt (fun x : ℝ × ℝ => -2 * Real.sin x.1)
      (rowCLM (-2) 0) (0, u) := by
    have h := ((Real.hasDerivAt_sin 0).const_mul (-2 : ℝ)).comp_hasFDerivAt
      (0, u) (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := (0, u)))
    apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    simp [rowCLM]
  have hden : DifferentiableAt ℝ (fun x : ℝ × ℝ => (qChart x.1 ^ 3)⁻¹) (0, u) := by
    have hq := (qChart_comp_hasFDerivAt hp).differentiableAt.pow 3
    exact hq.inv (pow_ne_zero 3 (qChart_ne_zero hp))
  have hpref : HasFDerivAt jacobianPrefactor (rowCLM (-2) 0) (0, u) := by
    have h := hsin.mul hden.hasFDerivAt
    apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => by
      simp [jacobianPrefactor, div_eq_mul_inv])).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    norm_num [rowCLM, qChart, qSq]
  have hfact := foldFactor_hasFDerivAt (0, u)
  have hfac : HasFDerivAt factorizedJacobianMap (rowCLM (2 * u) 0) (0, u) := by
    have h := hpref.mul hfact
    apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_fderiv
    apply ContinuousLinearMap.ext
    rintro ⟨v, w⟩
    simp [jacobianPrefactor, foldFactor, AR, BR, rowCLM]
    ring
  have hobs : HasFDerivAt observationJacobian (rowCLM (2 * u) 0) (0, u) := by
    have heqJ : observationJacobian =ᶠ[nhds (0, u)] factorizedJacobianMap := by
      have heqFactor : ∀ᶠ x in nhds (0, u), 0 < qSq x.1 := by
        have hcont : ContinuousAt (fun x : ℝ × ℝ => qSq x.1) (0, u) := by
          unfold qSq
          fun_prop
        exact hcont.eventually (Ioi_mem_nhds hp)
      filter_upwards [heqFactor] with x hx
      rw [observationJacobian_factorization hx]
      simp [factorizedJacobianMap, jacobianPrefactor, foldFactor]
      ring
    exact hfac.congr_of_eventuallyEq heqJ
  have heq := mapJacobian_observationMap_eventuallyEq hp
  exact hobs.congr_of_eventuallyEq heq

theorem symmetry_isPlaneWhitneyFoldCriterionAt {u : ℝ} (hu : 0 < u) :
    IsPlaneWhitneyFoldCriterionAt observationMap (0, u) := by
  have hp : (0, u) ∈ observationDomain := by norm_num [observationDomain, qSq]
  have hmapJ := mapJacobian_observationMap_hasFDerivAt_symmetry u
  refine ⟨(observationMap_hasExplicitFDerivAt hp).differentiableAt,
    ?_, mapJacobian_observationMap hp |>.trans ?_, (1, 0), by norm_num, ?_, ?_, ?_⟩
  · rw [observationMap_fderiv_eq hp]
    exact observationDerivative_symmetry_nonzero u
  · rw [observationJacobian_factorization hp]
    norm_num [AR]
  · rw [observationMap_fderiv_eq hp, observationDerivative_symmetry_apply]
    norm_num
  · exact hmapJ.differentiableAt
  · rw [hmapJ.fderiv]
    simp [rowCLM]
    linarith

theorem exceptional_not_isPlaneWhitneyFoldCriterionAt :
    ¬IsPlaneWhitneyFoldCriterionAt observationMap (0, 0) := by
  intro h
  rcases h.2.2.2 with ⟨k, _, _, _, htrans⟩
  rw [(mapJacobian_observationMap_hasFDerivAt_symmetry 0).fderiv] at htrans
  simp [rowCLM] at htrans

theorem rationalBranch_isPlaneWhitneyFoldCriterionAt {t : ℝ}
    (hp : (t, uFoldR (Real.cos t)) ∈ observationDomain)
    (hc0 : (613 : ℝ) / 1000 ≤ Real.cos t) (hc1 : Real.cos t < 1)
    (hs : Real.sin t ≠ 0) :
    IsPlaneWhitneyFoldCriterionAt observationMap (t, uFoldR (Real.cos t)) := by
  let p : ℝ × ℝ := (t, uFoldR (Real.cos t))
  have hB : BR (Real.cos t) ≠ 0 := ne_of_lt (BR_neg_on_physical hc0 (le_of_lt hc1))
  have hfold : foldFactor p = 0 := uFoldR_foldEquation hB
  have hcert := rationalBranch_kernel_and_nonzero hp hc1 hfold
  have hJderiv := observationJacobian_hasFDerivAt_onFold hp hfold
  have heq := mapJacobian_observationMap_eventuallyEq hp
  refine ⟨(observationMap_hasExplicitFDerivAt hp).differentiableAt,
    ?_, mapJacobian_observationMap hp |>.trans ?_, kernelVector p,
    hcert.2.1, ?_, hJderiv.differentiableAt.congr_of_eventuallyEq heq, ?_⟩
  · rw [observationMap_fderiv_eq hp]
    exact hcert.2.2
  · exact observationJacobian_zero_of_foldEquation hp hfold
  · rw [observationMap_fderiv_eq hp]
    exact hcert.1
  · rw [(hJderiv.congr_of_eventuallyEq heq).fderiv]
    have htrans := rationalBranch_kernel_transverse hp hc0 hc1 hs
    rw [hJderiv.fderiv] at htrans
    simpa [p] using htrans

end

end StokesV5
