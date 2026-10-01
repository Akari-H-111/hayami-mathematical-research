import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
import Mathlib.Analysis.Calculus.FDeriv.Prod
import StokesV5.Polynomials

/-!
# Real observation map on the positive-Q chart

This module defines the two-variable map used in the v5 manuscript and proves
the analytic chart facts needed before computing its Jacobian.  It does not
yet invoke a Whitney-fold recognition theorem.
-/

namespace StokesV5

noncomputable section

def qSq (t : ℝ) : ℝ := Real.cos t * (2 - Real.cos t)

def qChart (t : ℝ) : ℝ := Real.sqrt (qSq t)

def observationDomain : Set (ℝ × ℝ) := {p | 0 < qSq p.1}

def observationN (p : ℝ × ℝ) : ℝ :=
  (1 - Real.cos p.1) * (1 - Real.cos p.1 - 2 * p.2)

def observationNumerator (p : ℝ × ℝ) : ℝ :=
  (1 - p.2) * Real.cos p.1 ^ 2 * (2 - Real.cos p.1) -
    p.2 * (1 - Real.cos p.1) ^ 2 * (1 + Real.cos p.1)

def observationM (p : ℝ × ℝ) : ℝ :=
  observationNumerator p / qChart p.1

def observationMap (p : ℝ × ℝ) : ℝ × ℝ :=
  (observationN p, observationM p)

theorem qChart_pos {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    0 < qChart p.1 := by
  exact Real.sqrt_pos.2 hp

theorem qChart_ne_zero {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    qChart p.1 ≠ 0 := ne_of_gt (qChart_pos hp)

theorem qChart_sq {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    qChart p.1 ^ 2 = qSq p.1 := by
  exact Real.sq_sqrt (le_of_lt hp)

def rowCLM (a b : ℝ) : (ℝ × ℝ) →L[ℝ] ℝ :=
  a • ContinuousLinearMap.fst ℝ ℝ ℝ + b • ContinuousLinearMap.snd ℝ ℝ ℝ

@[simp] theorem rowCLM_apply (a b : ℝ) (v : ℝ × ℝ) :
    rowCLM a b v = a * v.1 + b * v.2 := by
  simp [rowCLM]

def dNdt (p : ℝ × ℝ) : ℝ :=
  2 * Real.sin p.1 * (1 - Real.cos p.1 - p.2)

def dNdu (p : ℝ × ℝ) : ℝ := -2 * (1 - Real.cos p.1)

theorem observationN_hasFDerivAt (p : ℝ × ℝ) :
    HasFDerivAt observationN (rowCLM (dNdt p) (dNdu p)) p := by
  have hc : HasFDerivAt (fun x : ℝ × ℝ => Real.cos x.1)
      ((-Real.sin p.1) • ContinuousLinearMap.fst ℝ ℝ ℝ) p := by
    have h := ((Real.hasDerivAt_cos p.1).comp_hasFDerivAt p
      (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))).congr_of_eventuallyEq
        (Filter.Eventually.of_forall fun _ => rfl)
    exact h
  have hu : HasFDerivAt (fun x : ℝ × ℝ => x.2)
      (ContinuousLinearMap.snd ℝ ℝ ℝ) p := hasFDerivAt_snd
  have hOneSubC := (hasFDerivAt_const (1 : ℝ) p).sub hc
  have hTwoU := hu.const_mul (2 : ℝ)
  have hSecond := hOneSubC.sub hTwoU
  have h := hOneSubC.mul hSecond
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_fderiv
  apply ContinuousLinearMap.ext
  intro v
  rcases v with ⟨v, w⟩
  simp [rowCLM, dNdt, dNdu]
  ring

def dQdt (p : ℝ × ℝ) : ℝ :=
  -Real.sin p.1 * (1 - Real.cos p.1) / qChart p.1

theorem qChart_comp_hasFDerivAt {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    HasFDerivAt (fun x : ℝ × ℝ => qChart x.1) (rowCLM (dQdt p) 0) p := by
  have hc : HasFDerivAt (fun x : ℝ × ℝ => Real.cos x.1)
      ((-Real.sin p.1) • ContinuousLinearMap.fst ℝ ℝ ℝ) p := by
    have h := ((Real.hasDerivAt_cos p.1).comp_hasFDerivAt p
      (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))).congr_of_eventuallyEq
        (Filter.Eventually.of_forall fun _ => rfl)
    exact h
  have hTwoSubC := (hasFDerivAt_const (2 : ℝ) p).sub hc
  have hSq := hc.mul hTwoSubC
  have h := hSq.sqrt (ne_of_gt hp)
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_fderiv
  apply ContinuousLinearMap.ext
  intro v
  rcases v with ⟨v, w⟩
  simp [rowCLM, dQdt, qChart, qSq]
  field_simp [qChart_ne_zero hp]
  ring

def dNumeratorDt (p : ℝ × ℝ) : ℝ :=
  -Real.sin p.1 *
    (4 * Real.cos p.1 - 3 * Real.cos p.1 ^ 2 + p.2 * (1 - 2 * Real.cos p.1))

def dNumeratorDu (p : ℝ × ℝ) : ℝ :=
  -(1 - Real.cos p.1 + Real.cos p.1 ^ 2)

theorem observationNumerator_hasFDerivAt (p : ℝ × ℝ) :
    HasFDerivAt observationNumerator
      (rowCLM (dNumeratorDt p) (dNumeratorDu p)) p := by
  have hc : HasFDerivAt (fun x : ℝ × ℝ => Real.cos x.1)
      ((-Real.sin p.1) • ContinuousLinearMap.fst ℝ ℝ ℝ) p := by
    have h := ((Real.hasDerivAt_cos p.1).comp_hasFDerivAt p
      (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))).congr_of_eventuallyEq
        (Filter.Eventually.of_forall fun _ => rfl)
    exact h
  have hu : HasFDerivAt (fun x : ℝ × ℝ => x.2)
      (ContinuousLinearMap.snd ℝ ℝ ℝ) p := hasFDerivAt_snd
  have hOneSubU := (hasFDerivAt_const (1 : ℝ) p).sub hu
  have hTwoSubC := (hasFDerivAt_const (2 : ℝ) p).sub hc
  have hOneSubC := (hasFDerivAt_const (1 : ℝ) p).sub hc
  have hOneAddC := (hasFDerivAt_const (1 : ℝ) p).add hc
  have hLeft := (hOneSubU.mul (hc.pow 2)).mul hTwoSubC
  have hRight := (hu.mul (hOneSubC.pow 2)).mul hOneAddC
  have h := hLeft.sub hRight
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun _ => rfl)).congr_fderiv
  apply ContinuousLinearMap.ext
  intro v
  rcases v with ⟨v, w⟩
  simp [rowCLM, dNumeratorDt, dNumeratorDu]
  ring

def dMdt (p : ℝ × ℝ) : ℝ :=
  dNumeratorDt p / qChart p.1 -
    observationNumerator p * dQdt p / qChart p.1 ^ 2

def dMdu (p : ℝ × ℝ) : ℝ :=
  dNumeratorDu p / qChart p.1

theorem observationM_hasFDerivAt {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    HasFDerivAt observationM (rowCLM (dMdt p) (dMdu p)) p := by
  have hNumerator := observationNumerator_hasFDerivAt p
  have hQ := qChart_comp_hasFDerivAt hp
  have hQInv := (hasFDerivAt_inv' (qChart_ne_zero hp)).comp p hQ
  have h := hNumerator.mul hQInv
  have hfun : Filter.EventuallyEq (nhds p) observationM
      (fun x : ℝ × ℝ => observationNumerator x * (qChart x.1)⁻¹) := by
    exact Filter.Eventually.of_forall fun x => by simp [observationM, div_eq_mul_inv]
  apply (h.congr_of_eventuallyEq hfun).congr_fderiv
  apply ContinuousLinearMap.ext
  intro v
  rcases v with ⟨v, w⟩
  simp [rowCLM, dMdt, dMdu]
  field_simp [qChart_ne_zero hp]
  ring

def observationDerivative (p : ℝ × ℝ) : (ℝ × ℝ) →L[ℝ] (ℝ × ℝ) :=
  (rowCLM (dNdt p) (dNdu p)).prod (rowCLM (dMdt p) (dMdu p))

theorem observationMap_hasExplicitFDerivAt {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) :
    HasFDerivAt observationMap (observationDerivative p) p := by
  exact (observationN_hasFDerivAt p).prodMk (observationM_hasFDerivAt hp)

theorem observationMap_fderiv_eq {p : ℝ × ℝ} (hp : p ∈ observationDomain) :
    fderiv ℝ observationMap p = observationDerivative p :=
  (observationMap_hasExplicitFDerivAt hp).fderiv

def observationJacobian (p : ℝ × ℝ) : ℝ :=
  dNdt p * dMdu p - dNdu p * dMdt p

theorem observationJacobian_factorization {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) :
    observationJacobian p =
      -2 * Real.sin p.1 * (AR (Real.cos p.1) + p.2 * BR (Real.cos p.1)) /
        qChart p.1 ^ 3 := by
  have hq := qChart_sq hp
  have hq0 := qChart_ne_zero hp
  unfold observationJacobian dNdt dNdu dMdt dMdu dNumeratorDt dNumeratorDu dQdt
  unfold qSq at hq
  unfold observationNumerator AR BR
  field_simp [hq0]
  rw [hq]
  ring

theorem observationDerivative_symmetry_apply (u : ℝ) (v : ℝ × ℝ) :
    observationDerivative (0, u) v = (0, -v.2) := by
  rcases v with ⟨v, w⟩
  norm_num [observationDerivative, dNdt, dNdu, dMdt, dMdu, dNumeratorDt,
    dNumeratorDu, dQdt, observationNumerator, qChart, qSq, rowCLM]

theorem observationDerivative_symmetry_kernel (u : ℝ) (v : ℝ × ℝ) :
    observationDerivative (0, u) v = 0 ↔ v.2 = 0 := by
  rw [observationDerivative_symmetry_apply]
  simp

theorem observationDerivative_symmetry_nonzero (u : ℝ) :
    observationDerivative (0, u) ≠ 0 := by
  intro h
  have hv := congrArg (fun L : (ℝ × ℝ) →L[ℝ] (ℝ × ℝ) => L (0, 1)) h
  simp [observationDerivative_symmetry_apply] at hv

def factorizedJacobianAtU (u t : ℝ) : ℝ :=
  -2 * Real.sin t * (AR (Real.cos t) + u * BR (Real.cos t)) / qChart t ^ 3

theorem factorizedJacobianAtU_hasDerivAt (u : ℝ) :
    HasDerivAt (factorizedJacobianAtU u) (2 * u) 0 := by
  have hq0 : qChart 0 ≠ 0 := by norm_num [qChart, qSq]
  have hH : DifferentiableAt ℝ
      (fun t : ℝ => (AR (Real.cos t) + u * BR (Real.cos t)) / qChart t ^ 3) 0 := by
    apply DifferentiableAt.div
    · unfold AR BR
      fun_prop
    · have hqDiff : DifferentiableAt ℝ qChart 0 := by
        unfold qChart
        apply DifferentiableAt.sqrt
        · unfold qSq
          fun_prop
        · norm_num [qSq]
      exact hqDiff.pow 3
    · exact pow_ne_zero 3 hq0
  have h := ((Real.hasDerivAt_sin 0).const_mul (-2 : ℝ)).mul hH.hasDerivAt
  apply (h.congr_of_eventuallyEq (Filter.Eventually.of_forall fun t => by
    simp [factorizedJacobianAtU]
    ring)).congr_deriv
  norm_num [factorizedJacobianAtU, AR, BR, qChart, qSq]

theorem observationJacobian_symmetry_hasDerivAt (u : ℝ) :
    HasDerivAt (fun t : ℝ => observationJacobian (t, u)) (2 * u) 0 := by
  have hcont : ContinuousAt qSq 0 := by
    unfold qSq
    fun_prop
  have hev : ∀ᶠ t in nhds 0, 0 < qSq t :=
    hcont.eventually (show {x : ℝ | 0 < x} ∈ nhds (qSq 0) by
      rw [show qSq 0 = 1 by norm_num [qSq]]
      exact Ioi_mem_nhds (show (0 : ℝ) < 1 by norm_num))
  have heq : Filter.EventuallyEq (nhds 0)
      (fun t : ℝ => observationJacobian (t, u)) (factorizedJacobianAtU u) := by
    filter_upwards [hev] with t ht
    exact observationJacobian_factorization (p := (t, u)) ht
  exact (factorizedJacobianAtU_hasDerivAt u).congr_of_eventuallyEq heq

theorem symmetry_kernel_transverse {u : ℝ} (hu : 0 < u) :
    deriv (fun t : ℝ => observationJacobian (t, u)) 0 ≠ 0 := by
  rw [(observationJacobian_symmetry_hasDerivAt u).deriv]
  positivity

theorem exceptional_kernel_transversality_fails :
    deriv (fun t : ℝ => observationJacobian (t, 0)) 0 = 0 := by
  rw [(observationJacobian_symmetry_hasDerivAt 0).deriv]
  ring

def kernelVector (p : ℝ × ℝ) : ℝ × ℝ := (dNdu p, -dNdt p)

theorem observationDerivative_kernelVector {p : ℝ × ℝ}
    (hJ : observationJacobian p = 0) :
    observationDerivative p (kernelVector p) = 0 := by
  apply Prod.ext
  · simp [observationDerivative, kernelVector, rowCLM]
    ring
  · simp [observationDerivative, kernelVector, rowCLM]
    unfold observationJacobian at hJ
    linarith

theorem kernelVector_ne_zero_of_cos_lt {p : ℝ × ℝ}
    (hc : Real.cos p.1 < 1) : kernelVector p ≠ 0 := by
  intro h
  have hfirst := congrArg Prod.fst h
  simp [kernelVector, dNdu] at hfirst
  linarith

theorem observationDerivative_kernel_exact {p v : ℝ × ℝ}
    (hcos : Real.cos p.1 < 1) (hv : observationDerivative p v = 0) :
    ∃ a : ℝ, v = a • kernelVector p := by
  have hdu : dNdu p ≠ 0 := by
    unfold dNdu
    linarith
  refine ⟨v.1 / dNdu p, ?_⟩
  apply Prod.ext
  · simp [kernelVector, hdu]
  · have hfirst := congrArg Prod.fst hv
    simp [observationDerivative, rowCLM] at hfirst
    simp [kernelVector, Prod.smul_mk]
    field_simp [hdu]
    linarith

theorem observationDerivative_nonzero_of_cos_lt {p : ℝ × ℝ}
    (hcos : Real.cos p.1 < 1) : observationDerivative p ≠ 0 := by
  intro h
  have hv := congrArg (fun L : (ℝ × ℝ) →L[ℝ] (ℝ × ℝ) => (L (0, 1)).1) h
  simp [observationDerivative, rowCLM, dNdu] at hv
  linarith

theorem observationJacobian_zero_of_foldEquation {p : ℝ × ℝ}
    (hp : p ∈ observationDomain)
    (hfold : AR (Real.cos p.1) + p.2 * BR (Real.cos p.1) = 0) :
    observationJacobian p = 0 := by
  rw [observationJacobian_factorization hp, hfold]
  ring

def uFoldR (c : ℝ) : ℝ := -AR c / BR c

theorem uFoldR_foldEquation {c : ℝ} (hB : BR c ≠ 0) :
    AR c + uFoldR c * BR c = 0 := by
  unfold uFoldR
  field_simp [hB]
  ring

theorem rationalBranch_kernel_and_nonzero {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) (hcos : Real.cos p.1 < 1)
    (hfold : AR (Real.cos p.1) + p.2 * BR (Real.cos p.1) = 0) :
    observationDerivative p (kernelVector p) = 0 ∧
      kernelVector p ≠ 0 ∧ observationDerivative p ≠ 0 := by
  have hJ := observationJacobian_zero_of_foldEquation hp hfold
  exact ⟨observationDerivative_kernelVector hJ, kernelVector_ne_zero_of_cos_lt hcos,
    observationDerivative_nonzero_of_cos_lt hcos⟩

theorem observationMap_differentiableAt {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) :
    DifferentiableAt ℝ observationMap p := by
  have hq : qChart p.1 ≠ 0 := qChart_ne_zero hp
  have hqDiff : DifferentiableAt ℝ (fun x : ℝ × ℝ => qChart x.1) p := by
    unfold qChart
    apply DifferentiableAt.sqrt
    · unfold qSq
      fun_prop
    · exact ne_of_gt hp
  have hN : DifferentiableAt ℝ observationN p := by
    unfold observationN
    fun_prop
  have hNumerator : DifferentiableAt ℝ observationNumerator p := by
    unfold observationNumerator
    fun_prop
  have hM : DifferentiableAt ℝ observationM p := by
    unfold observationM
    convert hNumerator.mul (hqDiff.inv hq) using 1 <;> rfl
  exact hN.prodMk hM

theorem observationMap_hasFDerivAt {p : ℝ × ℝ}
    (hp : p ∈ observationDomain) :
    HasFDerivAt observationMap (fderiv ℝ observationMap p) p :=
  (observationMap_differentiableAt hp).hasFDerivAt

end

end StokesV5
