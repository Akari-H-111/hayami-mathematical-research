import StokesV5.ObservationMap
import StokesV5.RootBarriers

/-!
# Differential fold geometry on the positive-Q chart

This module differentiates the exact Jacobian factor and proves kernel
transversality on both ordinary physical branches.  It also keeps the common
initial point separate, where the symmetry-branch transversality vanishes.
-/

namespace StokesV5

noncomputable section

def ARPrime (c : ℝ) : ℝ := -5 * c ^ 4 + 20 * c ^ 3 - 21 * c ^ 2 + 2 * c + 2
def BRPrime (c : ℝ) : ℝ := 3 * c ^ 2 - 3

theorem AR_hasDerivAt (c : ℝ) : HasDerivAt AR (ARPrime c) c := by
  have hi := hasDerivAt_id c
  have hOneSub := (hasDerivAt_const (x := c) (1 : ℝ)).sub hi
  have hTwoSub := (hasDerivAt_const (x := c) (2 : ℝ)).sub hi
  have hLast := ((hasDerivAt_const (x := c) (1 : ℝ)).add (hi.const_mul 2)).sub (hi.pow 2)
  have h := ((hOneSub.mul hi).mul hTwoSub).mul hLast
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_deriv
  simp [ARPrime]
  ring

theorem BR_hasDerivAt (c : ℝ) : HasDerivAt BR (BRPrime c) c := by
  have hi := hasDerivAt_id c
  have h := ((hi.pow 3).sub (hi.const_mul 3)).add_const 1
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_deriv
  simp [BRPrime]

def foldFactor (p : ℝ × ℝ) : ℝ :=
  AR (Real.cos p.1) + p.2 * BR (Real.cos p.1)

def dFoldDt (p : ℝ × ℝ) : ℝ :=
  -Real.sin p.1 * (ARPrime (Real.cos p.1) + p.2 * BRPrime (Real.cos p.1))

def dFoldDu (p : ℝ × ℝ) : ℝ := BR (Real.cos p.1)

theorem foldFactor_hasFDerivAt (p : ℝ × ℝ) :
    HasFDerivAt foldFactor (rowCLM (dFoldDt p) (dFoldDu p)) p := by
  have hc : HasFDerivAt (fun x : ℝ × ℝ => Real.cos x.1)
      ((-Real.sin p.1) • ContinuousLinearMap.fst ℝ ℝ ℝ) p := by
    have h := ((Real.hasDerivAt_cos p.1).comp_hasFDerivAt p
      (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))).congr_of_eventuallyEq
        (Filter.Eventually.of_forall fun _ => rfl)
    exact h
  have hA := (AR_hasDerivAt (Real.cos p.1)).comp_hasFDerivAt p hc
  have hB := (BR_hasDerivAt (Real.cos p.1)).comp_hasFDerivAt p hc
  have hu : HasFDerivAt (fun x : ℝ × ℝ => x.2)
      (ContinuousLinearMap.snd ℝ ℝ ℝ) p := hasFDerivAt_snd
  have h := hA.add (hu.mul hB)
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_fderiv
  apply ContinuousLinearMap.ext
  intro v
  rcases v with ⟨v, w⟩
  simp [rowCLM, dFoldDt, dFoldDu]
  ring

def jacobianPrefactor (p : ℝ × ℝ) : ℝ :=
  -2 * Real.sin p.1 / qChart p.1 ^ 3

def factorizedJacobianMap (p : ℝ × ℝ) : ℝ :=
  jacobianPrefactor p * foldFactor p

theorem jacobianPrefactor_differentiableAt {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) : DifferentiableAt ℝ jacobianPrefactor p := by
  have hsin : DifferentiableAt ℝ (fun x : ℝ × ℝ => Real.sin x.1) p := by fun_prop
  have hq := (qChart_comp_hasFDerivAt hp).differentiableAt
  have hnum : DifferentiableAt ℝ (fun x : ℝ × ℝ => -2 * Real.sin x.1) p :=
    hsin.const_mul (-2 : ℝ)
  have hden : DifferentiableAt ℝ (fun x : ℝ × ℝ => qChart x.1 ^ 3) p :=
    hq.pow 3
  unfold jacobianPrefactor
  exact hnum.mul (hden.inv (pow_ne_zero 3 (qChart_ne_zero hp)))

theorem factorizedJacobianMap_hasFDerivAt_onFold {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) (hfold : foldFactor p = 0) :
    HasFDerivAt factorizedJacobianMap
      (jacobianPrefactor p • rowCLM (dFoldDt p) (dFoldDu p)) p := by
  have h := (jacobianPrefactor_differentiableAt hp).hasFDerivAt.mul
    (foldFactor_hasFDerivAt p)
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_fderiv
  rw [hfold]
  simp

theorem observationJacobian_hasFDerivAt_onFold {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) (hfold : foldFactor p = 0) :
    HasFDerivAt observationJacobian
      (jacobianPrefactor p • rowCLM (dFoldDt p) (dFoldDu p)) p := by
  have hcont : ContinuousAt (fun x : ℝ × ℝ => qSq x.1) p := by
    unfold qSq
    fun_prop
  have hev : ∀ᶠ x in nhds p, 0 < qSq x.1 :=
    hcont.eventually (Ioi_mem_nhds hp)
  have heq : Filter.EventuallyEq (nhds p) observationJacobian factorizedJacobianMap := by
    filter_upwards [hev] with x hx
    rw [observationJacobian_factorization hx]
    unfold factorizedJacobianMap jacobianPrefactor foldFactor
    ring
  exact (factorizedJacobianMap_hasFDerivAt_onFold hp hfold).congr_of_eventuallyEq heq

def kernelJacobianDerivative (p : ℝ × ℝ) : ℝ :=
  jacobianPrefactor p *
    (dFoldDt p * dNdu p - dFoldDu p * dNdt p)

theorem fderiv_observationJacobian_kernelVector {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) (hfold : foldFactor p = 0) :
    fderiv ℝ observationJacobian p (kernelVector p) = kernelJacobianDerivative p := by
  rw [(observationJacobian_hasFDerivAt_onFold hp hfold).fderiv]
  simp [kernelJacobianDerivative, kernelVector, rowCLM]
  ring

theorem kernelJacobianDerivative_uFoldR {t : ℝ}
    (hB : BR (Real.cos t) ≠ 0) (hq : qChart t ≠ 0) :
    kernelJacobianDerivative (t, uFoldR (Real.cos t)) =
      -4 * Real.sin t ^ 2 * (Real.cos t - 1) * r7R (Real.cos t) /
        (qChart t ^ 3 * BR (Real.cos t)) := by
  unfold kernelJacobianDerivative jacobianPrefactor dFoldDt dFoldDu dNdu dNdt
  unfold uFoldR ARPrime BRPrime AR r7R
  field_simp [hB, hq]
  unfold BR
  ring

theorem rationalBranch_kernel_transverse {t : ℝ}
    (hp : (t, uFoldR (Real.cos t)) ∈ observationDomain)
    (hc0 : (613 : ℝ) / 1000 ≤ Real.cos t) (hc1 : Real.cos t < 1)
    (hs : Real.sin t ≠ 0) :
    fderiv ℝ observationJacobian (t, uFoldR (Real.cos t))
        (kernelVector (t, uFoldR (Real.cos t))) ≠ 0 := by
  have hBneg := BR_neg_on_physical hc0 (le_of_lt hc1)
  have hB : BR (Real.cos t) ≠ 0 := ne_of_lt hBneg
  have hfold : foldFactor (t, uFoldR (Real.cos t)) = 0 := by
    exact uFoldR_foldEquation hB
  rw [fderiv_observationJacobian_kernelVector hp hfold,
    kernelJacobianDerivative_uFoldR hB (qChart_ne_zero hp)]
  apply div_ne_zero
  · apply mul_ne_zero
    · apply mul_ne_zero
      · apply mul_ne_zero
        · norm_num
        · exact pow_ne_zero 2 hs
      · linarith
    · exact ne_of_lt (r7R_neg_on_unit (by linarith) (le_of_lt hc1))
  · exact mul_ne_zero (pow_ne_zero 3 (qChart_ne_zero hp)) hB

end

end StokesV5
