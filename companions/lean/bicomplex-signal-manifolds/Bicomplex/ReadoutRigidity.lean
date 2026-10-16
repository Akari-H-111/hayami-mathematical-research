import Bicomplex.AnalyticCurves

namespace Bicomplex
noncomputable section

/-- Paper 1, `thm:rigidity` (1), with circle analyticity expressed by its periodic lift. -/
theorem no_analytic_moment_readout (P : ℂ × ℂ → Fin 3 → ℝ)
    (z : (ℝ × ℝ) → ℂ × ℂ)
    (hm : ∀ p ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2) ×ˢ Set.Icc 0 1,
      MomentCompatible (z p) p.1)
    (hr : ∀ p ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2) ×ˢ Set.Icc 0 1,
      P (z p) = actualSurfaceVector p)
    (hP : AnalyticOnNhd ℝ (fun θ : ℝ => P (0,Complex.exp (θ*Complex.I))) Set.univ) : False := by
  apply analytic_curve_cannot_cover_actual_edges hP
  intro t ht u hu
  have hp : (t,u) ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2) ×ˢ Set.Icc 0 1 := by
    refine ⟨?_,hu⟩
    rcases ht with rfl | rfl <;> constructor <;> linarith [Real.pi_pos]
  obtain ⟨hz,hn⟩ := moment_edge_circle ht (hm (t,u) hp)
  have he : Complex.exp ((z (t,u)).2.arg * Complex.I) = (z (t,u)).2 := by
    simpa [hn] using Complex.norm_mul_exp_arg_mul_I (z (t,u)).2
  refine ⟨(z (t,u)).2.arg, ?_⟩
  change P (0,Complex.exp ((z (t,u)).2.arg * Complex.I)) = _
  rw [he, ← hz]
  exact hr (t,u) hp

/-- The connected-arc version, stated through an actual real phase parametrization. -/
theorem no_analytic_readout_on_connected_phase_interval
    (P : ℂ × ℂ → Fin 3 → ℝ) (z : (ℝ × ℝ) → ℂ × ℂ)
    {J : Set ℝ} (hJ : IsPreconnected J)
    (hP : AnalyticOnNhd ℝ (fun θ : ℝ => P (0,Complex.exp (θ*Complex.I))) J)
    (hstates : ∀ (t : ℝ), t = Real.pi/2 ∨ t = -(Real.pi/2) →
      ∀ u ∈ Set.Icc (0 : ℝ) 1, ∃ θ ∈ J, z (t,u) = (0,Complex.exp (θ*Complex.I)))
    (hr : ∀ (t : ℝ), t = Real.pi/2 ∨ t = -(Real.pi/2) →
      ∀ u ∈ Set.Icc (0 : ℝ) 1, P (z (t,u)) = actualSurfaceVector (t,u)) : False := by
  apply analytic_curve_cannot_cover_actual_edges_on hJ hP
  intro t ht u hu
  obtain ⟨θ,hθ,hz⟩ := hstates t ht u hu
  exact ⟨θ,hθ,by dsimp only; rw [← hz]; exact hr t ht u hu⟩

end
end Bicomplex
