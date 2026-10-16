import Bicomplex.RealizationLimits
import Mathlib.Analysis.Analytic.IsolatedZeros
import Mathlib.Analysis.Real.Cardinality
import Mathlib.Topology.Compactness.Lindelof

namespace Bicomplex
noncomputable section
open Set Filter
open scoped Topology

theorem analytic_zero_set_countable_or_identically_zero
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {J : Set ℝ} (hJ : IsPreconnected J) {f : ℝ → E} (hf : AnalyticOnNhd ℝ f J) :
    EqOn f 0 J ∨ ({x | f x = 0} ∩ J).Countable := by
  rcases hf.eqOn_zero_or_eventually_ne_zero_of_preconnected hJ with h | h
  · exact Or.inl h
  · right
    have hd : IsDiscrete ({x | f x = 0} ∩ J) :=
      isDiscrete_of_codiscreteWithin (show {x | f x = 0}ᶜ ∈ codiscreteWithin J from h)
    exact (HereditarilyLindelofSpace.isLindelof _).countable_of_isDiscrete hd

def realLine3 (a d : Fin 3 → ℝ) : Set (Fin 3 → ℝ) :=
  Set.range (fun t : ℝ => a + t • d)

private lemma real_line_subset_of_two_shared {a d b e x y : Fin 3 → ℝ}
    (hxy : x ≠ y) (hx : x ∈ realLine3 a d ∩ realLine3 b e)
    (hy : y ∈ realLine3 a d ∩ realLine3 b e) : realLine3 a d ⊆ realLine3 b e := by
  obtain ⟨s,hs⟩ := hx.1
  obtain ⟨t,ht⟩ := hy.1
  obtain ⟨u,hu⟩ := hx.2
  obtain ⟨v,hv⟩ := hy.2
  have hst : t-s ≠ 0 := by
    intro h
    have he := sub_eq_zero.mp h
    exact hxy (hs.symm.trans (he ▸ ht))
  rintro z ⟨w,rfl⟩
  refine ⟨u+(w-s)/(t-s)*(v-u), ?_⟩
  ext i
  have hxi := congrFun (hs.trans hu.symm) i
  have hyi := congrFun (ht.trans hv.symm) i
  simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul] at hxi hyi ⊢
  field_simp [hst]
  linear_combination (w-t)*hxi + (s-w)*hyi

theorem distinct_real_lines_intersection_countable (a d b e : Fin 3 → ℝ)
    (hne : realLine3 a d ≠ realLine3 b e) : (realLine3 a d ∩ realLine3 b e).Countable := by
  apply Set.Subsingleton.countable
  intro x hx y hy
  by_contra hxy
  exact hne (Set.Subset.antisymm (real_line_subset_of_two_shared hxy hx hy)
    (real_line_subset_of_two_shared hxy ⟨hx.2,hx.1⟩ ⟨hy.2,hy.1⟩))

/-- Paper 1, `lem:analytic`: an actual affine line, with nonzero direction. -/
theorem analytic_curve_line {J : Set ℝ} (hJ : IsPreconnected J)
    {p : ℝ → Fin 3 → ℝ} (hp : AnalyticOnNhd ℝ p J)
    (a d : Fin 3 → ℝ) (hd : d ≠ 0) :
    p '' J ⊆ realLine3 a d ∨ (p '' J ∩ realLine3 a d).Countable := by
  obtain ⟨k,hk⟩ : ∃ k, d k ≠ 0 := by
    by_contra h
    apply hd
    ext k
    simpa using not_exists.mp h k
  let g : ℝ → Fin 3 → ℝ := fun x i => d k * (p x i-a i) - d i * (p x k-a k)
  have hg : AnalyticOnNhd ℝ g J := by
    intro x hx
    apply AnalyticAt.pi
    intro i
    exact (analyticAt_const.mul ((analyticAt_pi_iff.mp (hp x hx) i).sub analyticAt_const)).sub
      (analyticAt_const.mul ((analyticAt_pi_iff.mp (hp x hx) k).sub analyticAt_const))
  have hmem (x : ℝ) : g x = 0 ↔ p x ∈ realLine3 a d := by
    constructor
    · intro h
      refine ⟨(p x k-a k)/d k, ?_⟩
      ext i
      have hi := congrFun h i
      dsimp [g] at hi
      simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul]
      field_simp
      nlinarith
    · rintro ⟨t,ht⟩
      ext i
      have hi := congrFun ht i
      have hk' := congrFun ht k
      dsimp at hi hk' ⊢
      dsimp [g]
      rw [← hi, ← hk']
      ring
  rcases analytic_zero_set_countable_or_identically_zero hJ hg with hz | hz
  · left
    rintro y ⟨x,hx,rfl⟩
    exact (hmem x).mp (hz hx)
  · right
    apply (hz.image p).mono
    rintro y ⟨⟨x,hx,rfl⟩,hy⟩
    exact ⟨x,⟨(hmem x).mpr hy,hx⟩,rfl⟩

theorem analytic_curve_not_two_lines {J : Set ℝ} (hJ : IsPreconnected J)
    {p : ℝ → Fin 3 → ℝ} (hp : AnalyticOnNhd ℝ p J)
    (a d b e : Fin 3 → ℝ) (hd : d ≠ 0) (he : e ≠ 0)
    (hne : realLine3 a d ≠ realLine3 b e) :
    (p '' J ∩ realLine3 a d).Countable ∨ (p '' J ∩ realLine3 b e).Countable := by
  rcases analytic_curve_line hJ hp a d hd with h | h
  · right
    apply (distinct_real_lines_intersection_countable a d b e hne).mono
    exact fun _ hx => ⟨h hx.1,hx.2⟩
  · exact Or.inl h

/-- One actual edge gives uncountably many zeros; the other edge contradicts identity. -/
theorem analytic_curve_cannot_cover_actual_edges_on {J : Set ℝ} (hJ : IsPreconnected J)
    {p : ℝ → Fin 3 → ℝ} (hp : AnalyticOnNhd ℝ p J)
    (hedge : ∀ (t : ℝ), t = Real.pi/2 ∨ t = -(Real.pi/2) →
      ∀ u ∈ Set.Icc (0 : ℝ) 1, actualSurfaceVector (t,u) ∈ p '' J) : False := by
  let g : ℝ → ℝ := fun x => p x 0 + 2*p x 1 - 2
  have hg : AnalyticOnNhd ℝ g J := by
    intro x hx
    exact ((analyticAt_pi_iff.mp (hp x hx) 0).add
      (analyticAt_const.mul (analyticAt_pi_iff.mp (hp x hx) 1))).sub analyticAt_const
  have hz : EqOn g 0 J := by
    rcases analytic_zero_set_countable_or_identically_zero hJ hg with h | h
    · exact h
    · exfalso
      have hc : (Set.Icc (0 : ℝ) 1).Countable := by
        apply Set.countable_of_injective_of_countable_image
          (f := fun u : ℝ => actualSurfaceVector (Real.pi/2,u))
        · intro u _ v _ huv
          have h0 := congrFun huv 0
          simp [actualSurfaceVector, (actual_edge_values u).1, (actual_edge_values v).1] at h0
          linarith
        · apply (h.image p).mono
          rintro y ⟨u,hu,rfl⟩
          obtain ⟨x,hxJ,hx⟩ := hedge (Real.pi/2) (Or.inl rfl) u hu
          refine ⟨x,⟨?_,hxJ⟩,hx⟩
          dsimp [g]
          rw [hx]
          simp [actualSurfaceVector, (actual_edge_values u).1]
          ring
      have := Cardinal.Real.Icc_countable_iff.mp hc
      linarith
  obtain ⟨x,hxJ,hx⟩ := hedge (-(Real.pi/2)) (Or.inr rfl) 0 (by norm_num)
  have h := hz hxJ
  dsimp [g] at h
  rw [hx] at h
  norm_num [actualSurfaceVector, actual_surface_four_values.2.2.1] at h


theorem analytic_curve_cannot_cover_actual_edges {p : ℝ → Fin 3 → ℝ}
    (hp : AnalyticOnNhd ℝ p Set.univ)
    (hedge : ∀ (t : ℝ), t = Real.pi/2 ∨ t = -(Real.pi/2) →
      ∀ u ∈ Set.Icc (0 : ℝ) 1, actualSurfaceVector (t,u) ∈ Set.range p) : False := by
  apply analytic_curve_cannot_cover_actual_edges_on isPreconnected_univ hp
  intro t ht u hu
  simpa using hedge t ht u hu

end
end Bicomplex
