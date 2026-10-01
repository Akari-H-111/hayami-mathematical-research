import RuledV5.Corner
import Mathlib.Analysis.Calculus.TangentCone.Prod
import Mathlib.Analysis.Calculus.TangentCone.Real

namespace RuledV5
noncomputable section
open StokesV5
open scoped Topology

def dualVector (L : (ℝ × ℝ × ℝ) →L[ℝ] ℝ) : ℝ × ℝ × ℝ :=
  (L (1,0,0),L (0,1,0),L (0,0,1))

theorem dual_vector_apply (L : (ℝ × ℝ × ℝ) →L[ℝ] ℝ) (v : ℝ × ℝ × ℝ) :
    dot3 (dualVector L) v=L v := by
  have hv : v=v.1 • (1,0,0)+v.2.1 • (0,1,0)+v.2.2 • (0,0,1) := by
    ext <;> simp
  have hl := congrArg L hv
  rw [map_add,map_add,map_smul,map_smul,map_smul] at hl
  simpa [dualVector,dot3,mul_comm] using hl.symm

-- A C1 regular defining function for a containing surface would have a
-- nonzero derivative. The actual physical corner forces that derivative to zero.
theorem no_regular_corner_level_set {ε δ : ℝ} (he : ε ≠ 0) (hδ : 0 < δ) (hδ1 : δ ≤ 1/2)
    (g : (ℝ × ℝ × ℝ) → ℝ)
    (hg : ContDiffAt ℝ 1 g (boundarySurface ε (0,0)))
    (hgd : ∀ p : ℝ × ℝ, p.1 ∈ Set.Ioo 0 δ → p.2 ∈ Set.Icc 0 δ →
      DifferentiableAt ℝ g (boundarySurface ε p))
    (hz : ∀ p : ℝ × ℝ, p.1 ∈ Set.Ioo 0 δ → p.2 ∈ Set.Icc 0 δ →
      g (boundarySurface ε p)=0) :
    fderiv ℝ g (boundarySurface ε (0,0))=0 := by
  let n : (ℝ × ℝ) → ℝ × ℝ × ℝ :=
    fun p => dualVector (fderiv ℝ g (boundarySurface ε p))
  have hS : ContinuousAt (boundarySurface ε) (0,0) :=
    (boundary_surface_contDiffAt ε (by norm_num)).continuousAt
  have hf : ContinuousAt (fun p => fderiv ℝ g (boundarySurface ε p)) (0,0) :=
    (hg.continuousAt_fderiv (by norm_num)).comp hS
  have hn : ContinuousAt n (0,0) := by
    exact (hf.clm_apply continuousAt_const).prodMk
      ((hf.clm_apply continuousAt_const).prodMk (hf.clm_apply continuousAt_const))
  have ho : ∀ p : ℝ × ℝ, p.1 ∈ Set.Ioo 0 δ → p.2 ∈ Set.Icc 0 δ →
      dot3 (n p) (fderiv ℝ (boundarySurface ε) p (1,0))=0 ∧
      dot3 (n p) (fderiv ℝ (boundarySurface ε) p (0,1))=0 := by
    intro p hr hu
    let A : Set (ℝ × ℝ) := Set.Ioo 0 δ ×ˢ Set.Icc 0 δ
    have hp : p ∈ A := ⟨hr,hu⟩
    have hud : UniqueDiffWithinAt ℝ A p :=
      (isOpen_Ioo.uniqueDiffWithinAt hr).prod ((uniqueDiffOn_Icc hδ) p.2 hu)
    have hc : HasFDerivAt (fun x => g (boundarySurface ε x))
        ((fderiv ℝ g (boundarySurface ε p)).comp (fderiv ℝ (boundarySurface ε) p)) p :=
      (hgd p hr hu).hasFDerivAt.comp p
        ((boundary_surface_contDiffAt ε (show p.1 ∈ Set.Ioo (-1) 1 by
          constructor <;> linarith [hr.1,hr.2,hδ1])).differentiableAt (by norm_num)).hasFDerivAt
    have hzero : fderivWithin ℝ (fun x => g (boundarySurface ε x)) A p=0 := by
      rw [fderivWithin_congr' (f := fun _ => (0:ℝ))
        (fun x hx => hz x hx.1 hx.2) hp]
      exact (hasFDerivWithinAt_const (0:ℝ) p A).fderivWithin hud
    rw [hc.hasFDerivWithinAt.fderivWithin hud] at hzero
    have ha := congrArg (fun L : (ℝ × ℝ) →L[ℝ] ℝ => L (1,0)) hzero
    have hb := congrArg (fun L : (ℝ × ℝ) →L[ℝ] ℝ => L (0,1)) hzero
    exact ⟨by simpa [n,dual_vector_apply] using ha,
      by simpa [n,dual_vector_apply] using hb⟩
  have hn0 := no_continuous_corner_normal_local he hδ n hn ho
  have hd : dualVector (fderiv ℝ g (boundarySurface ε (0,0)))=0 := hn0
  apply ContinuousLinearMap.ext
  intro v
  change fderiv ℝ g (boundarySurface ε (0,0)) v=0
  rw [← dual_vector_apply,hd]
  simp [dot3]

theorem no_corner_flattening_chart {ε δ : ℝ} (he : ε ≠ 0) (hδ : 0 < δ) (hδ1 : δ ≤ 1/2)
    (χ : (ℝ × ℝ × ℝ) → ℝ × ℝ × ℝ)
    (hc : ContDiffAt ℝ 1 χ (boundarySurface ε (0,0)))
    (hd : ∀ p : ℝ × ℝ, p.1 ∈ Set.Ioo 0 δ → p.2 ∈ Set.Icc 0 δ →
      DifferentiableAt ℝ χ (boundarySurface ε p))
    (hz : ∀ p : ℝ × ℝ, p.1 ∈ Set.Ioo 0 δ → p.2 ∈ Set.Icc 0 δ →
      (χ (boundarySurface ε p)).2.2=0) :
    ¬ Function.Surjective (fderiv ℝ χ (boundarySurface ε (0,0))) := by
  have hg : ContDiffAt ℝ 1 (fun x => (χ x).2.2) (boundarySurface ε (0,0)) := hc.snd.snd
  have hgd : ∀ p : ℝ × ℝ, p.1 ∈ Set.Ioo 0 δ → p.2 ∈ Set.Icc 0 δ →
      DifferentiableAt ℝ (fun x => (χ x).2.2) (boundarySurface ε p) := by
    intro p hr hu
    exact (hd p hr hu).snd.snd
  have hzero := no_regular_corner_level_set he hδ hδ1 (fun x => (χ x).2.2) hg hgd hz
  have hder := (hc.differentiableAt (by norm_num)).hasFDerivAt.snd.snd
  intro hsurj
  rcases hsurj (0,0,1) with ⟨v,hv⟩
  have hh := congrArg (fun L : (ℝ × ℝ × ℝ) →L[ℝ] ℝ => L v) hzero
  rw [hder.fderiv] at hh
  change (fderiv ℝ χ (boundarySurface ε (0,0)) v).2.2=0 at hh
  rw [hv] at hh
  norm_num at hh

end
end RuledV5
