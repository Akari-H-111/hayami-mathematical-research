import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.Prod
import Mathlib.LinearAlgebra.Matrix.ToLin

namespace Bicomplex
noncomputable section
open scoped ComplexConjugate InnerProductSpace Matrix

/-- The reference-length identity requires positive distance and length. -/
theorem reference_length_identity (ℓ b : ℂ) {d lam : ℝ} (hd : 0 < d) (hlam : 0 < lam) :
    ℓ * (Real.log d : ℂ) + b =
      ℓ * (Real.log (d/lam) : ℂ) + (b + ℓ * (Real.log lam : ℂ)) := by
  rw [Real.log_div hd.ne' hlam.ne', Complex.ofReal_sub]
  ring

theorem reference_length_vector_identity {ι : Type*} [Fintype ι] [DecidableEq ι]
    (ℓ b : ι → ℂ) (d lam : ι → ℝ) (hd : ∀ i, 0 < d i) (hlam : ∀ i, 0 < lam i) :
    (fun i => ℓ i * (Real.log (d i) : ℂ) + b i) =
      (fun i => ℓ i * (Real.log (d i/lam i) : ℂ) +
        (b + Matrix.diagonal (fun j => (Real.log (lam j) : ℂ)) *ᵥ ℓ) i) := by
  ext i
  simpa [Matrix.mulVec_diagonal,mul_comm] using
    reference_length_identity (ℓ i) (b i) (hd i) (hlam i)

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]

def boundaryPairing (v w : E × E) : ℂ := ⟪v.1,w.2⟫_ℂ - ⟪v.2,w.1⟫_ℂ

def commonBoundaryShift (t : ℝ) (v : E × E) : E × E :=
  (v.1, v.2 + (t : ℂ) • v.1)

def BoundaryIsotropic (W : Submodule ℂ (E × E)) : Prop :=
  ∀ v ∈ W, ∀ w ∈ W, boundaryPairing v w = 0

def friedrichsPlane : Submodule ℂ (E × E) := LinearMap.ker (LinearMap.fst ℂ E E)

theorem invariant_isotropic_has_zero_log (W : Submodule ℂ (E × E))
    (hiso : BoundaryIsotropic W)
    (hinv : ∀ (t : ℝ) v, v ∈ W → commonBoundaryShift t v ∈ W)
    {v : E × E} (hv : v ∈ W) : v.1 = 0 := by
  have hshift : (0,v.1) ∈ W := by
    have h := W.sub_mem (hinv 1 v hv) hv
    convert h using 1 <;> ext <;> simp [commonBoundaryShift]
  have h := hiso v hv (0,v.1) hshift
  simpa [boundaryPairing, inner_self_eq_zero] using h

theorem friedrichs_plane_isotropic : BoundaryIsotropic (friedrichsPlane (E := E)) := by
  intro v hv w hw
  have hv' : v.1 = 0 := hv
  have hw' : w.1 = 0 := hw
  simp [boundaryPairing, hv', hw']

theorem friedrichs_plane_shift_invariant (t : ℝ) {v : E × E}
    (hv : v ∈ friedrichsPlane) : commonBoundaryShift t v ∈ friedrichsPlane := hv

/-- Maximal isotropy, without an operator-domain assertion. -/
theorem friedrichs_plane_maximal (W : Submodule ℂ (E × E))
    (hiso : BoundaryIsotropic W) (hW : friedrichsPlane ≤ W) : W = friedrichsPlane := by
  apply le_antisymm _ hW
  intro v hv
  have hz : (0,v.1) ∈ W := hW (by simp [friedrichsPlane])
  have h := hiso v hv (0,v.1) hz
  change v.1 = 0
  simpa [boundaryPairing, inner_self_eq_zero] using h

theorem invariant_lagrangian_is_friedrichs (W : Submodule ℂ (E × E))
    (hiso : BoundaryIsotropic W)
    (hmax : ∀ V : Submodule ℂ (E × E), BoundaryIsotropic V → W ≤ V → V = W)
    (hinv : ∀ (t : ℝ) v, v ∈ W → commonBoundaryShift t v ∈ W) : W = friedrichsPlane := by
  apply (hmax _ friedrichs_plane_isotropic _).symm
  intro v hv
  exact invariant_isotropic_has_zero_log W hiso hinv hv

theorem friedrichs_plane_dimension (k : ℕ) :
    Module.finrank ℂ (friedrichsPlane (E := EuclideanSpace ℂ (Fin k))) = k := by
  unfold friedrichsPlane
  rw [LinearMap.ker_fst, LinearMap.finrank_range_of_inj LinearMap.inr_injective]
  simp

end
end Bicomplex
