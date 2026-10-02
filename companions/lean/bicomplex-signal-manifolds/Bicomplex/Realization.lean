import Bicomplex.Geometry
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

namespace Bicomplex
noncomputable section

-- Real and imaginary component quadratures, with retained phase reference.
def quadratureLift (t θ v : ℝ) : ℝ × ℝ × ℝ × ℝ :=
  (Real.cos v * Real.cos (t/2), Real.cos v * Real.sin (t/2),
   Real.sin v * Real.cos (θ/2), Real.sin v * Real.sin (θ/2))

def quadratureReadout (z : ℝ × ℝ × ℝ × ℝ) : ℝ × ℝ × ℝ :=
  (z.1^2-z.2.1^2+2*z.2.2.1^2, 2*z.1*z.2.1, 2*z.2.2.1*z.2.2.2)

theorem quadrature_unit_power (t θ v : ℝ) :
    let z := quadratureLift t θ v
    z.1^2+z.2.1^2+z.2.2.1^2+z.2.2.2^2=1 := by
  dsimp [quadratureLift]
  calc
    _ = Real.cos v^2*(Real.cos (t/2)^2+Real.sin (t/2)^2) +
          Real.sin v^2*(Real.cos (θ/2)^2+Real.sin (θ/2)^2) := by ring
    _ = Real.cos v^2+Real.sin v^2 := by
      rw [Real.cos_sq_add_sin_sq,Real.cos_sq_add_sin_sq]; ring
    _ = 1 := Real.cos_sq_add_sin_sq v

theorem quadrature_readout (t θ v : ℝ) :
    quadratureReadout (quadratureLift t θ v) =
      (Real.cos v^2*Real.cos t+Real.sin v^2*(1+Real.cos θ),
       Real.cos v^2*Real.sin t,Real.sin v^2*Real.sin θ) := by
  have ht : Real.cos (t/2)^2-Real.sin (t/2)^2=Real.cos t := by
    have h := Real.cos_two_mul (t/2)
    rw [show 2*(t/2)=t by ring] at h
    nlinarith [Real.cos_sq_add_sin_sq (t/2)]
  have hθ : 2*Real.cos (θ/2)^2=1+Real.cos θ := by
    have h := Real.cos_two_mul (θ/2)
    rw [show 2*(θ/2)=θ by ring] at h
    linarith
  have hst : 2*Real.cos (t/2)*Real.sin (t/2)=Real.sin t := by
    have h := Real.sin_two_mul (t/2)
    rw [show 2*(t/2)=t by ring] at h
    nlinarith
  have hsθ : 2*Real.cos (θ/2)*Real.sin (θ/2)=Real.sin θ := by
    have h := Real.sin_two_mul (θ/2)
    rw [show 2*(θ/2)=θ by ring] at h
    nlinarith
  dsimp [quadratureReadout,quadratureLift]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · calc
      _ = Real.cos v^2*(Real.cos (t/2)^2-Real.sin (t/2)^2) +
            Real.sin v^2*(2*Real.cos (θ/2)^2) := by ring
      _ = _ := by rw [ht,hθ]
  · calc
      _ = Real.cos v^2*(2*Real.cos (t/2)*Real.sin (t/2)) := by ring
      _ = _ := by rw [hst]
  · calc
      _ = Real.sin v^2*(2*Real.cos (θ/2)*Real.sin (θ/2)) := by ring
      _ = _ := by rw [hsθ]

-- The phase coupling is an explicit hypothesis, not derived from unit power.
theorem quadrature_actual_surface (t θ v : ℝ)
    (hc : Real.cos θ=1-Real.cos t) (hs : Real.sin θ=StokesV5.qChart t) :
    quadratureReadout (quadratureLift t θ v)=StokesV5.ruledSurface (t,Real.sin v^2) := by
  rw [quadrature_readout,hc,hs]
  have hv : Real.cos v^2=1-Real.sin v^2 := by
    nlinarith [Real.cos_sq_add_sin_sq v]
  rw [hv]
  ext <;> simp [StokesV5.ruledSurface] <;> ring

theorem pure_state_bloch_norm (a b d e : ℝ) :
    (2*(a*d+b*e))^2+(2*(a*e-b*d))^2+(a^2+b^2-d^2-e^2)^2 =
      (a^2+b^2+d^2+e^2)^2 := by ring

def crosscapEnergy (x y ξ η : ℝ) : ℝ := ξ^2+(y*ξ+x*η)^2+4*y^2*η^2

theorem actual_crosscap_energy_lower (x y ξ η : ℝ) (hy : y^2 ≤ 1/2) :
    (ξ^2+(x^2+y^2)*η^2)/2 ≤ crosscapEnergy x y ξ η := by
  have hp := mul_nonneg (show 0 ≤ (1/2:ℝ)-y^2 by linarith) (sq_nonneg ξ)
  have hs := sq_nonneg (2*y*ξ+x*η)
  have he := sq_nonneg (y*η)
  dsimp [crosscapEnergy]
  nlinarith

theorem actual_crosscap_energy_upper (x y ξ η : ℝ) (hy : y^2 ≤ 1/2) :
    crosscapEnergy x y ξ η ≤ 4*(ξ^2+(x^2+y^2)*η^2) := by
  have hp := mul_nonneg (show 0 ≤ (3:ℝ)-2*y^2 by linarith) (sq_nonneg ξ)
  have hs := sq_nonneg (y*ξ-x*η)
  have he := sq_nonneg (x*η)
  dsimp [crosscapEnergy]
  nlinarith

end
end Bicomplex
