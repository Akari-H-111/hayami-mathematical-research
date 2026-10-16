import RuledV5.Atlas

namespace RuledV5
noncomputable section
open StokesV5

/-- Physical closed angular label rectangle, including the endpoint charts. -/
def closedLabels (p : ℝ × ℝ) : Prop :=
  p.1 ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2) ∧ p.2 ∈ Set.Icc 0 1

/-- Symmetric quotient equation, expressed without its expanded coefficients. -/
def doublePolynomial (c d : ℝ) : ℝ :=
  let x := 2-c-d
  let y := (1-c)*(1-d)
  16*(1-x)*y^3-4*(3*x^2+4*x-8)*y^2+4*(x+1)*(x-2)^2*y-x^2*(x-2)^2

/-- The sign lost by the final squaring step. -/
def doubleSign (a b : ℝ) : ℝ :=
  -2*(a*b)^2-2*(a+b)*(a*b)-(a+b)^2-2*a*b+2*(a+b)

theorem surface_mirror (t u : ℝ) :
    ruledSurface (-t,u) =
      ((ruledSurface (t,u)).1, -(ruledSurface (t,u)).2.1,
        (ruledSurface (t,u)).2.2) := by
  simp [ruledSurface,qChart,qSq]

theorem seam_image_iff {t t' : ℝ}
    (ht : t ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2))
    (ht' : t' ∈ Set.Icc (-(Real.pi/2)) (Real.pi/2)) :
    ruledSurface (t,1) = ruledSurface (t',1) ↔ t=t' ∨ t= -t' := by
  constructor
  · intro h
    have hx := congrArg Prod.fst h
    have hc : Real.cos t=Real.cos t' := by
      simp only [ruledSurface] at hx
      linarith
    have hc0 := Real.cos_nonneg_of_mem_Icc ht'
    have hc1 := Real.cos_le_one t'
    rcases (physical_cos_labels ht hc0 hc1).mp hc with h1 | h1 <;>
      rcases (physical_cos_labels ht' hc0 hc1).mp rfl with h2 | h2
    all_goals first | left; linarith | right; linarith
  · rintro (rfl | rfl)
    · rfl
    · exact paired_label_image_at_u_one t'

theorem mirror_half_separation {t t' u u' : ℝ}
    (ht : t ∈ Set.Ioc 0 (Real.pi/2))
    (ht' : t' ∈ Set.Ico (-(Real.pi/2)) 0)
    (hu : u < 1) (hu' : u' ≤ 1) :
    ruledSurface (t,u) ≠ ruledSurface (t',u') := by
  have hs := Real.sin_pos_of_pos_of_lt_pi ht.1
    (by linarith [ht.2,Real.pi_pos] : t < Real.pi)
  have hs' := Real.sin_neg_of_neg_of_neg_pi_lt ht'.2
    (by linarith [ht'.1,Real.pi_pos] : -Real.pi < t')
  intro h
  have hy := congrArg (fun p : ℝ × ℝ × ℝ => p.2.1) h
  change (1-u)*Real.sin t=(1-u')*Real.sin t' at hy
  have hp := mul_pos (sub_pos.mpr hu) hs
  have hn := mul_nonpos_of_nonneg_of_nonpos (sub_nonneg.mpr hu') hs'.le
  linarith

theorem exact_boundary_double_point :
    ruledSurface (Real.pi/2,(2:ℝ)/5) = ((4:ℝ)/5,(3:ℝ)/5,0) ∧
    ruledSurface (Real.arccos ((4:ℝ)/5),0) = ((4:ℝ)/5,(3:ℝ)/5,0) ∧
    boundarySurface 1 (0,(2:ℝ)/5) = ((4:ℝ)/5,(3:ℝ)/5,0) := by
  have hs : Real.sqrt (1-((4:ℝ)/5)^2)=(3:ℝ)/5 := by
    have hh := Real.sq_sqrt (by norm_num : (0:ℝ) ≤ 1-((4:ℝ)/5)^2)
    nlinarith [Real.sqrt_nonneg (1-((4:ℝ)/5)^2)]
  norm_num [ruledSurface,qChart,qSq,Real.sin_arccos,hs,
    boundarySurface,boundaryC,boundaryS,Real.cos_arccos (by norm_num : (-1:ℝ) ≤ 4/5) (by norm_num : (4:ℝ)/5 ≤ 1)]

theorem exact_negative_boundary_double_point :
    ruledSurface (-(Real.pi/2),(2:ℝ)/5) = ((4:ℝ)/5,-((3:ℝ)/5),0) ∧
    ruledSurface (-Real.arccos ((4:ℝ)/5),0) = ((4:ℝ)/5,-((3:ℝ)/5),0) := by
  have h := exact_boundary_double_point
  constructor
  · rw [surface_mirror,h.1]
  · rw [surface_mirror,h.2.1]

/-- A small polynomial certificate replaces the much larger quadratic resultant. -/
theorem double_elimination_certificate {a b A B C E : ℝ}
    (hA : A^2=a*(2-a)) (hB : B^2=b*(2-b))
    (hC : C^2=1-b^2) (hE : E^2=1-a^2)
    (h : (a+b)*(A*C+B*E)-2*a*B*C-2*b*A*E=0) :
    a=b ∨ (doublePolynomial (1-a) (1-b)=0 ∧
      doubleSign a b + 2*A*B*C*E=0) := by
  have hid :
      ((a+b)*(A*C+B*E)-2*a*B*C-2*b*A*E)*
      ((a+b)*(A*C+B*E)+2*a*B*C+2*b*A*E) =
      (a-b)^2*(doubleSign a b+2*A*B*C*E) := by
    calc
      _ = (a+b)^2*(A^2*C^2+B^2*E^2)-4*a^2*B^2*C^2-
          4*b^2*A^2*E^2+2*(a-b)^2*A*B*C*E := by ring
      _ = _ := by rw [hA,hB,hC,hE]; unfold doubleSign; ring
  rw [h,zero_mul] at hid
  rcases mul_eq_zero.mp hid.symm with hab | hs
  · left
    exact sub_eq_zero.mp (eq_zero_of_pow_eq_zero hab)
  · right
    refine ⟨?_,hs⟩
    have he : doubleSign a b ^ 2 - 4*(a*(2-a))*(b*(2-b))*(1-b^2)*(1-a^2) =
        -doublePolynomial (1-a) (1-b) := by
      unfold doubleSign doublePolynomial
      ring
    have he' : doubleSign a b ^ 2 - 4*A^2*B^2*C^2*E^2 =
        -doublePolynomial (1-a) (1-b) := by rw [hA,hB,hC,hE]; exact he
    have hsign : doubleSign a b = -2*A*B*C*E := by linarith
    rw [hsign] at he'
    have hz : -doublePolynomial (1-a) (1-b)=0 := by
      calc
        _ = (-2*A*B*C*E)^2-4*A^2*B^2*C^2*E^2 := he'.symm
        _ = 0 := by ring
    linarith

theorem surface_double_elimination {p p' : ℝ × ℝ}
    (hp : closedLabels p) (hp' : closedLabels p')
    (h : ruledSurface p=ruledSurface p') :
    doublePolynomial (Real.cos p.1) (Real.cos p'.1)=0 ∨
      Real.cos p.1=Real.cos p'.1 := by
  let a := 1-Real.cos p.1
  let b := 1-Real.cos p'.1
  let A := Real.sin p.1
  let B := Real.sin p'.1
  let C := qChart p'.1
  let E := qChart p.1
  have hA : A^2=a*(2-a) := by dsimp [A,a]; nlinarith [Real.sin_sq_add_cos_sq p.1]
  have hB : B^2=b*(2-b) := by dsimp [B,b]; nlinarith [Real.sin_sq_add_cos_sq p'.1]
  have hC : C^2=1-b^2 := by
    dsimp [C,qChart,qSq]
    rw [Real.sq_sqrt (mul_nonneg (Real.cos_nonneg_of_mem_Icc hp'.1)
      (by linarith [Real.cos_le_one p'.1] : 0 ≤ 2-Real.cos p'.1))]
    dsimp [qSq,b]; ring
  have hE : E^2=1-a^2 := by
    dsimp [E,qChart,qSq]
    rw [Real.sq_sqrt (mul_nonneg (Real.cos_nonneg_of_mem_Icc hp.1)
      (by linarith [Real.cos_le_one p.1] : 0 ≤ 2-Real.cos p.1))]
    dsimp [qSq,a]; ring
  have hx := congrArg Prod.fst h
  have hy := congrArg (fun v : ℝ × ℝ × ℝ => v.2.1) h
  have hz := congrArg (fun v : ℝ × ℝ × ℝ => v.2.2) h
  change Real.cos p.1+2*p.2*(1-Real.cos p.1)=
    Real.cos p'.1+2*p'.2*(1-Real.cos p'.1) at hx
  change (1-p.2)*A=(1-p'.2)*B at hy
  change p.2*E=p'.2*C at hz
  have hx' : -a+2*a*p.2= -b+2*b*p'.2 := by dsimp [a,b]; linarith
  have hc : (a+b)*(A*C+B*E)-2*a*B*C-2*b*A*E=0 := by
    linear_combination (A*C-B*E)*hx' + 2*(a*C-b*E)*hy + 2*(a*B-b*A)*hz
  rcases double_elimination_certificate hA hB hC hE hc with hab | hd
  · right; dsimp [a,b] at hab; linarith
  · left; simpa [a,b] using hd.1

end
end RuledV5
