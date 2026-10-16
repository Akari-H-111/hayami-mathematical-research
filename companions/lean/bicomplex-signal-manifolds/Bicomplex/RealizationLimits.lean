import StokesV5.PaperGeometry
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.Calculus.TangentCone.Real
import Mathlib.Analysis.SpecialFunctions.Complex.Arg
import Mathlib.Analysis.Matrix.Order

namespace Bicomplex
noncomputable section
open scoped Topology ComplexOrder Matrix

/-- Paper 1, `prop:twoobs` (1), including one-sided derivatives. -/
theorem norm_sq_derivative_at_zero {w : ℝ → ℂ} {s : Set ℝ} {x : ℝ}
    (hw : DifferentiableWithinAt ℝ w s x) (hz : w x = 0) :
    HasDerivWithinAt (fun u => ‖w u‖ ^ 2) 0 s x := by
  simpa [hz] using hw.hasDerivWithinAt.norm_sq

theorem norm_sq_derivative_at_zero_two_sided {w : ℝ → ℂ} {x : ℝ}
    (hw : DifferentiableAt ℝ w x) (hz : w x = 0) :
    HasDerivAt (fun u => ‖w u‖ ^ 2) 0 x := by
  simpa [hz] using hw.hasDerivAt.norm_sq

theorem no_differentiable_power_endpoint {w : ℝ → ℂ} {ε : ℝ} (hε : 0 < ε)
    (hp : ∀ u ∈ Set.Ico 0 ε, ‖w u‖ ^ 2 = u) :
    ¬ DifferentiableWithinAt ℝ w (Set.Ici 0) 0 := by
  intro hw
  have hz : w 0 = 0 := norm_eq_zero.mp (by
    have := hp 0 ⟨le_rfl, hε⟩
    nlinarith [norm_nonneg (w 0)])
  have hd := norm_sq_derivative_at_zero hw hz
  have he : (fun u => u) =ᶠ[𝓝[Set.Ici 0] 0] (fun u => ‖w u‖ ^ 2) := by
    filter_upwards [self_mem_nhdsWithin, mem_nhdsWithin_of_mem_nhds (Iio_mem_nhds hε)]
      with u hu huε
    exact (hp u ⟨hu, huε⟩).symm
  have hd' : HasDerivWithinAt (fun u : ℝ => u) 0 (Set.Ici 0) 0 :=
    hd.congr_of_eventuallyEq he (by simp [hz])
  have h := hd'.derivWithin (uniqueDiffWithinAt_Ici 0)
  have h' := (hasDerivAt_id (0 : ℝ)).hasDerivWithinAt.derivWithin
    (uniqueDiffWithinAt_Ici 0)
  change derivWithin (fun u : ℝ => u) (Set.Ici 0) 0 = 1 at h'
  linarith

theorem no_differentiable_power_endpoint_one {w : ℝ → ℂ} {ε : ℝ} (hε : 0 < ε)
    (hp : ∀ u ∈ Set.Ioc (1-ε) 1, ‖w u‖ ^ 2 = 1-u) :
    ¬ DifferentiableWithinAt ℝ w (Set.Iic 1) 1 := by
  intro hw
  have hz : w 1 = 0 := norm_eq_zero.mp (by
    have := hp 1 ⟨by linarith, le_rfl⟩
    nlinarith [norm_nonneg (w 1)])
  have hd := norm_sq_derivative_at_zero hw hz
  have he : (fun u => 1-u) =ᶠ[𝓝[Set.Iic 1] 1] (fun u => ‖w u‖ ^ 2) := by
    filter_upwards [self_mem_nhdsWithin,
      mem_nhdsWithin_of_mem_nhds (Ioi_mem_nhds (show 1-ε < 1 by linarith))]
      with u hu huε
    exact (hp u ⟨huε, hu⟩).symm
  have hd' : HasDerivWithinAt (fun u : ℝ => 1-u) 0 (Set.Iic 1) 1 :=
    hd.congr_of_eventuallyEq he (by simp [hz])
  have h := hd'.derivWithin (uniqueDiffWithinAt_Iic 1)
  have h' := ((hasDerivAt_const (1 : ℝ) (1 : ℝ)).sub
    (hasDerivAt_id (1 : ℝ))).hasDerivWithinAt.derivWithin (uniqueDiffWithinAt_Iic 1)
  norm_num at h'
  change derivWithin (fun u : ℝ => 1-u) (Set.Iic 1) 1 = -1 at h'
  linarith

/-- The actual surface, including the four values in the affine no-go proof. -/
theorem actual_surface_four_values :
    StokesV5.ruledSurface (0,0) = (1,0,0) ∧
    StokesV5.ruledSurface (Real.pi/2,0) = (0,1,0) ∧
    StokesV5.ruledSurface (-(Real.pi/2),0) = (0,-1,0) ∧
    StokesV5.ruledSurface (0,1) = (1,0,1) := by
  norm_num [StokesV5.ruledSurface, StokesV5.qChart, StokesV5.qSq]

theorem actual_polar_segment (u : ℝ) : StokesV5.ruledSurface (0,u) = (1,0,u) := by
  norm_num [StokesV5.ruledSurface, StokesV5.qChart, StokesV5.qSq]

theorem actual_edge_values (u : ℝ) :
    StokesV5.ruledSurface (Real.pi/2,u) = (2*u,1-u,0) ∧
    StokesV5.ruledSurface (-(Real.pi/2),u) = (2*u,u-1,0) := by
  norm_num [StokesV5.ruledSurface, StokesV5.qChart, StokesV5.qSq]

theorem actual_edge_injective {t : ℝ} (ht : t = Real.pi/2 ∨ t = -(Real.pi/2)) :
    Function.Injective (fun u => StokesV5.ruledSurface (t,u)) := by
  intro u v h
  dsimp only at h
  rcases ht with rfl | rfl
  · rw [(actual_edge_values u).1, (actual_edge_values v).1] at h
    have := congrArg Prod.fst h
    dsimp at this
    linarith
  · rw [(actual_edge_values u).2, (actual_edge_values v).2] at h
    have := congrArg Prod.fst h
    dsimp at this
    linarith

def PhaseInvariant {E : Type*} (P : ℂ × ℂ → E) : Prop :=
  ∀ (γ : ℝ) (z : ℂ × ℂ),
    P (Complex.exp (γ * Complex.I) * z.1, Complex.exp (γ * Complex.I) * z.2) = P z

theorem phase_invariant_constant_on_circle {E : Type*} {P : ℂ × ℂ → E}
    (hP : PhaseInvariant P) {w : ℂ} (hw : ‖w‖ = 1) : P (0,w) = P (0,1) := by
  have he : Complex.exp (w.arg * Complex.I) = w := by
    simpa [hw] using Complex.norm_mul_exp_arg_mul_I w
  simpa [he] using hP w.arg (0,1)

def MomentCompatible (z : ℂ × ℂ) (t : ℝ) : Prop :=
  ‖z.1‖ ^ 2 = Real.cos t ∧ ‖z.2‖ ^ 2 = 1-Real.cos t

theorem moment_edge_circle {z : ℂ × ℂ} {t : ℝ}
    (ht : t = Real.pi/2 ∨ t = -(Real.pi/2)) (hz : MomentCompatible z t) :
    z.1 = 0 ∧ ‖z.2‖ = 1 := by
  have hc : Real.cos t = 0 := by rcases ht with rfl | rfl <;> simp
  obtain ⟨h1,h2⟩ := hz
  rw [hc] at h1 h2
  exact ⟨norm_eq_zero.mp (by nlinarith [norm_nonneg z.1]),
    by nlinarith [norm_nonneg z.2]⟩

/-- No regularity or continuity of the state family is assumed. -/
theorem phase_invariant_edge_obstruction (P : ℂ × ℂ → ℝ × ℝ × ℝ)
    (hP : PhaseInvariant P) {t u v : ℝ}
    (ht : t = Real.pi/2 ∨ t = -(Real.pi/2)) (huv : u ≠ v)
    {zu zv : ℂ × ℂ} (hu : MomentCompatible zu t) (hv : MomentCompatible zv t)
    (hru : P zu = StokesV5.ruledSurface (t,u))
    (hrv : P zv = StokesV5.ruledSurface (t,v)) : False := by
  obtain ⟨hu0,hu1⟩ := moment_edge_circle ht hu
  obtain ⟨hv0,hv1⟩ := moment_edge_circle ht hv
  have heu : P zu = P (0,1) := by
    change P (zu.1,zu.2) = P (0,1)
    rw [hu0]
    exact phase_invariant_constant_on_circle hP hu1
  have hev : P zv = P (0,1) := by
    change P (zv.1,zv.2) = P (0,1)
    rw [hv0]
    exact phase_invariant_constant_on_circle hP hv1
  exact huv (actual_edge_injective ht (hru.symm.trans (heu.trans (hev.symm.trans hrv))))

/-- Actual positive semidefinite trace-one matrices, rather than a scalar proxy. -/
theorem density_matrix_edge_unique (ρ : Matrix (Fin 2) (Fin 2) ℂ)
    (hρ : ρ.PosSemidef) (htr : Matrix.trace ρ = 1) (h00 : ρ 0 0 = 0) :
    ρ = !![0,0;0,1] := by
  have hcol : ρ *ᵥ ![1,0] = 0 :=
    (hρ.dotProduct_mulVec_zero_iff ![1,0]).mp (by simp [Matrix.mulVec, dotProduct, h00])
  have h10 : ρ 1 0 = 0 := by simpa [Matrix.mulVec, dotProduct] using congrFun hcol 1
  have h01 : ρ 0 1 = 0 := by
    have h := congrFun (congrFun hρ.isHermitian 0) 1
    simpa [Matrix.conjTranspose_apply, h10] using h.symm
  have h11 : ρ 1 1 = 1 := by simpa [Matrix.trace, h00, Fin.sum_univ_two] using htr
  ext i j
  fin_cases i <;> fin_cases j <;> simp [h00,h01,h10,h11]

theorem density_matrix_edge_obstruction (P : Matrix (Fin 2) (Fin 2) ℂ → ℝ × ℝ × ℝ)
    {t u v : ℝ} (ht : t = Real.pi/2 ∨ t = -(Real.pi/2)) (huv : u ≠ v)
    (ρ σ : Matrix (Fin 2) (Fin 2) ℂ) (hρ : ρ.PosSemidef) (hσ : σ.PosSemidef)
    (htrρ : Matrix.trace ρ = 1) (htrσ : Matrix.trace σ = 1)
    (hmρ : ρ 0 0 = (Real.cos t : ℂ)) (hmσ : σ 0 0 = (Real.cos t : ℂ))
    (hrρ : P ρ = StokesV5.ruledSurface (t,u))
    (hrσ : P σ = StokesV5.ruledSurface (t,v)) : False := by
  have hc : Real.cos t = 0 := by rcases ht with rfl | rfl <;> simp
  have he : ρ = σ := (density_matrix_edge_unique ρ hρ htrρ (by simpa [hc] using hmρ)).trans
    (density_matrix_edge_unique σ hσ htrσ (by simpa [hc] using hmσ)).symm
  exact huv (actual_edge_injective ht (hrρ.symm.trans (congrArg P he |>.trans hrσ)))

end
end Bicomplex

namespace Bicomplex
noncomputable section
open scoped Matrix

/-- Coordinate conversion of the actual predecessor surface. -/
def actualSurfaceVector (p : ℝ × ℝ) : Fin 3 → ℝ :=
  ![(StokesV5.ruledSurface p).1, (StokesV5.ruledSurface p).2.1,
    (StokesV5.ruledSurface p).2.2]

/-- Paper 1, `prop:twoobs` (2): no affine image of the unit sphere contains S(D). -/
theorem no_affine_sphere_realization (a : Fin 3 → ℝ) (M : Matrix (Fin 3) (Fin 3) ℝ)
    (r : (ℝ × ℝ) → Fin 3 → ℝ)
    (hunit : ∀ p ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2) ×ˢ Set.Icc 0 1,
      ∑ i, r p i ^ 2 = 1)
    (hreal : ∀ p ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2) ×ˢ Set.Icc 0 1,
      a + M *ᵥ r p = actualSurfaceVector p) : False := by
  let L := M.mulVecLin
  have h0 := hreal (0,0) ⟨⟨by linarith [Real.pi_pos], by positivity⟩, by norm_num⟩
  have hp := hreal (Real.pi/2,0) ⟨⟨by linarith [Real.pi_pos], le_rfl⟩, by norm_num⟩
  have hn := hreal (-(Real.pi/2),0) ⟨⟨le_rfl, by linarith [Real.pi_pos]⟩, by norm_num⟩
  have h1 := hreal (0,1) ⟨⟨by linarith [Real.pi_pos], by positivity⟩, by norm_num⟩
  have hm := hreal (0,1/2) ⟨⟨by linarith [Real.pi_pos], by positivity⟩, by norm_num⟩
  have h0' : L (r (0,0)) = ![1,0,0] - a := by
    apply eq_sub_iff_add_eq.mpr
    simpa [L, actualSurfaceVector, actual_surface_four_values.1, add_comm] using h0
  have hp' : L (r (Real.pi/2,0)) = ![0,1,0] - a := by
    apply eq_sub_iff_add_eq.mpr
    simpa [L, actualSurfaceVector, actual_surface_four_values.2.1, add_comm] using hp
  have hn' : L (r (-(Real.pi/2),0)) = ![0,-1,0] - a := by
    apply eq_sub_iff_add_eq.mpr
    simpa [L, actualSurfaceVector, actual_surface_four_values.2.2.1, add_comm] using hn
  have h1' : L (r (0,1)) = ![1,0,1] - a := by
    apply eq_sub_iff_add_eq.mpr
    simpa [L, actualSurfaceVector, actual_surface_four_values.2.2.2, add_comm] using h1
  have hm' : L (r (0,1/2)) = ![1,0,1/2] - a := by
    apply eq_sub_iff_add_eq.mpr
    simpa [L, actualSurfaceVector, actual_polar_segment, add_comm] using hm
  -- The four values force surjectivity; this also excludes every lower-rank matrix.
  have hsurj : Function.Surjective L := by
    intro v
    refine ⟨v 0 • (r (0,0) - r (-(Real.pi/2),0)) +
      ((v 1-v 0)/2) • (r (Real.pi/2,0) - r (-(Real.pi/2),0)) +
      v 2 • (r (0,1) - r (0,0)), ?_⟩
    simp only [map_add, map_smul, map_sub, h0', hp', hn', h1']
    ext i
    fin_cases i <;> simp <;> ring
  have hinj := Module.End.injective_of_surjective ℝ (Fin 3 → ℝ) hsurj
  have hmid : r (0,1/2) = (1/2 : ℝ) • (r (0,0) + r (0,1)) := by
    apply hinj
    rw [map_smul, map_add, hm', h0', h1']
    ext i
    fin_cases i <;> simp [Matrix.vecHead, Matrix.vecTail] <;> ring
  have hu0 := hunit (0,0) ⟨⟨by linarith [Real.pi_pos], by positivity⟩, by norm_num⟩
  have hu1 := hunit (0,1) ⟨⟨by linarith [Real.pi_pos], by positivity⟩, by norm_num⟩
  have hum := hunit (0,1/2) ⟨⟨by linarith [Real.pi_pos], by positivity⟩, by norm_num⟩
  rw [hmid] at hum
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero,
    add_zero, Pi.smul_apply, Pi.add_apply, smul_eq_mul] at hu0 hu1 hum
  change r (0,0) 0^2 + (r (0,0) 1^2 + r (0,0) 2^2) = 1 at hu0
  change r (0,1) 0^2 + (r (0,1) 1^2 + r (0,1) 2^2) = 1 at hu1
  change (1/2*(r (0,0) 0+r (0,1) 0))^2 +
    ((1/2*(r (0,0) 1+r (0,1) 1))^2 + (1/2*(r (0,0) 2+r (0,1) 2))^2) = 1 at hum
  have heq : r (0,0) = r (0,1) := by
    have hsum : (r (0,0) 0-r (0,1) 0)^2 + (r (0,0) 1-r (0,1) 1)^2 +
        (r (0,0) 2-r (0,1) 2)^2 = 0 := by nlinarith
    have he (i : Fin 3) : r (0,0) i = r (0,1) i := by
      apply sub_eq_zero.mp
      apply sq_eq_zero_iff.mp
      have hi : i = 0 ∨ i = 1 ∨ i = 2 := by fin_cases i <;> simp
      rcases hi with rfl | rfl | rfl <;>
        nlinarith only [hsum, sq_nonneg (r (0,0) 0-r (0,1) 0),
          sq_nonneg (r (0,0) 1-r (0,1) 1), sq_nonneg (r (0,0) 2-r (0,1) 2)]
    exact funext he
  have hout : ![1,0,0] - a = ![1,0,1] - a := h0'.symm.trans (congrArg L heq |>.trans h1')
  have := congrFun hout 2
  simp at this
  linarith

end
end Bicomplex
