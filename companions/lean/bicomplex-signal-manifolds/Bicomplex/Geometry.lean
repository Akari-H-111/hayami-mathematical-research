import RuledV5

namespace Bicomplex
noncomputable section
open RuledV5 StokesV5

-- The maps and orientation are literally the predecessor maps, not dimension analogies.
theorem actual_source_rank_classification {p : ℝ × ℝ}
    (ht : p.1 ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2)) :
    ¬ Function.Injective (atlasDifferential p) ↔ p ∈ singularParameters :=
  completed_singular_parameters ht

theorem actual_endpoint_rank (ε u : ℝ) :
    Function.Injective (fderiv ℝ (boundarySurface ε) (0,u)) ↔ u ≠ 0 :=
  boundary_regular_iff ε u

theorem actual_polar_fold : HasWhitneyNormalFormAt observationMap (0,1) :=
  symmetry_hasWhitneyNormalFormAt (by norm_num)

theorem actual_dipole :
    HasLocalObservationIndex (lateralAngle,lateralRuling) (-1) ∧
      HasLocalObservationIndex (-lateralAngle,lateralRuling) 1 :=
  lateral_observation_indices

theorem observation_field_even (t u : ℝ) : observationMap (-t,u)=observationMap (t,u) :=
  observation_even t u

theorem normalized_polynomial_derivative : |2*lateralCos-3|=Real.sqrt 5 := by
  have hs := Real.sqrt_nonneg (5:ℝ)
  rw [show 2*lateralCos-3= -Real.sqrt 5 by unfold lateralCos;ring,abs_neg,abs_of_nonneg hs]

def standardCrosscap (p : ℝ × ℝ) : ℝ × ℝ × ℝ := (p.1,p.1*p.2,p.2^2)
def crosscapLift (p : ℝ × ℝ) : ℝ × ℝ × ℝ × ℝ := (p.1,p.1*p.2,p.2^2,p.2)

theorem crosscap_lift_injective : Function.Injective crosscapLift := by
  intro p q h
  exact Prod.ext (congrArg (fun z : ℝ × ℝ × ℝ × ℝ => z.1) h)
    (congrArg (fun z : ℝ × ℝ × ℝ × ℝ => z.2.2.2) h)

theorem crosscap_actual_fibers (p q : ℝ × ℝ) :
    standardCrosscap p=standardCrosscap q ↔
      p=q ∨ (p.1=0 ∧ q.1=0 ∧ q.2= -p.2) := by
  constructor
  · intro h
    have hx := congrArg (fun z : ℝ × ℝ × ℝ => z.1) h
    have hxy := congrArg (fun z : ℝ × ℝ × ℝ => z.2.1) h
    have hy := congrArg (fun z : ℝ × ℝ × ℝ => z.2.2) h
    change p.1=q.1 at hx
    change p.1*p.2=q.1*q.2 at hxy
    change p.2^2=q.2^2 at hy
    rcases (sq_eq_sq_iff_eq_or_eq_neg).mp hy with he | he
    · left;exact Prod.ext hx he
    · by_cases hz : p.2=0
      · left;exact Prod.ext hx (by linarith)
      · right
        have hm : p.1*q.2=0 := by rw [← hx,he] at hxy;nlinarith
        have hq : q.2 ≠ 0 := by intro hq;apply hz;rw [he,hq];simp
        have hp : p.1=0 := (mul_eq_zero.mp hm).resolve_right hq
        exact ⟨hp,hx ▸ hp,by linarith⟩
  · rintro (rfl | ⟨hp,hq,hy⟩)
    · rfl
    · ext <;> simp [standardCrosscap,hp,hq,hy]

theorem crosscap_metric_determinant (x y : ℝ) :
    (1+y^2)*(x^2+4*y^2)-(x*y)^2=x^2+4*y^2+4*y^4 := by ring

theorem crosscap_residual_positive {x y : ℝ} :
    x^2*(1+y^2)+y^4=0 ↔ x=0 ∧ y=0 := by
  constructor
  · intro h
    have hx : x^2=0 := by nlinarith [sq_nonneg x,sq_nonneg y,sq_nonneg (x*y),sq_nonneg (y*y)]
    have hy : (y^2)^2=0 := by nlinarith [sq_nonneg (x*y),sq_nonneg x]
    exact ⟨sq_eq_zero_iff.mp hx,sq_eq_zero_iff.mp (sq_eq_zero_iff.mp hy)⟩
  · rintro ⟨rfl,rfl⟩;norm_num

end
end Bicomplex
