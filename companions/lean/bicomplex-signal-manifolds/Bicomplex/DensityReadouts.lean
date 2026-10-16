import Bicomplex.RealizationLimits

namespace Bicomplex
noncomputable section

/-- The actual rank-one matrix zz*, in the two original complex components. -/
def rankOneDensity (z : ℂ × ℂ) : Matrix (Fin 2) (Fin 2) ℂ :=
  fun i j => ![z.1,z.2] i * star (![z.1,z.2] j)

theorem rank_one_density_phase_invariant {E : Type*}
    (F : Matrix (Fin 2) (Fin 2) ℂ → E) : PhaseInvariant (fun z => F (rankOneDensity z)) := by
  intro γ z
  let c := Complex.exp (γ*Complex.I)
  have hc : ‖c‖ = 1 := by simp [c, Complex.norm_exp, Complex.mul_re, Complex.mul_im]
  have hcs : c * star c = 1 := by
    simpa [hc] using Complex.mul_conj' c
  have hmul (x y : ℂ) : (c*x)*star (c*y) = x*star y := by
    rw [star_mul]
    calc
      _ = (c*star c)*(x*star y) := by ring
      _ = _ := by rw [hcs,one_mul]
  apply congrArg F
  ext i j
  fin_cases i <;> fin_cases j <;> exact hmul _ _

theorem rank_one_density_edge_obstruction
    (F : Matrix (Fin 2) (Fin 2) ℂ → ℝ × ℝ × ℝ)
    {t u v : ℝ} (ht : t = Real.pi/2 ∨ t = -(Real.pi/2)) (huv : u ≠ v)
    {zu zv : ℂ × ℂ} (hu : MomentCompatible zu t) (hv : MomentCompatible zv t)
    (hru : F (rankOneDensity zu) = StokesV5.ruledSurface (t,u))
    (hrv : F (rankOneDensity zv) = StokesV5.ruledSurface (t,v)) : False :=
  phase_invariant_edge_obstruction (fun z => F (rankOneDensity z))
    (rank_one_density_phase_invariant F) ht huv hu hv hru hrv

end
end Bicomplex
