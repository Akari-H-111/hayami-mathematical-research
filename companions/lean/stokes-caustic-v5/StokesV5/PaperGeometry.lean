import StokesV5.ExceptionalJet
import StokesV5.JacobianExpansion
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Inverse

namespace StokesV5
noncomputable section
open Filter
open scoped Topology

theorem observationN_slice_hasDerivAt (t u : ℝ) :
    HasDerivAt (fun t : ℝ => observationN (t, u)) (dNdt (t, u)) t := by
  have hd := (hasDerivAt_const t (1 : ℝ)).sub (Real.hasDerivAt_cos t)
  have h := hd.mul (hd.sub (hasDerivAt_const t (2 * u)))
  apply (h.congr_of_eventuallyEq (Eventually.of_forall fun _ => rfl)).congr_deriv
  dsimp [dNdt]; ring

theorem observationN_second_deriv_symmetry (u : ℝ) :
    deriv (deriv (fun t : ℝ => observationN (t, u))) 0 = -2 * u := by
  have he : deriv (fun t : ℝ => observationN (t, u)) = fun t => dNdt (t, u) :=
    funext fun t => (observationN_slice_hasDerivAt t u).deriv
  rw [he]
  have h := ((Real.hasDerivAt_sin 0).const_mul 2).mul
    (((hasDerivAt_const 0 (1 : ℝ)).sub (Real.hasDerivAt_cos 0)).sub
      (hasDerivAt_const 0 u))
  have hd : HasDerivAt (fun t : ℝ => dNdt (t, u)) (-2 * u) 0 := by
    convert! h using 1 <;> simp [dNdt] <;> ring
  exact hd.deriv

theorem symmetry_second_order_fold_determinant (u mtt : ℝ) :
    (observationDerivative (0, u) (0, 1)).1 * mtt -
      (observationDerivative (0, u) (0, 1)).2 *
        deriv (deriv (fun t : ℝ => observationN (t, u))) 0 = -2 * u := by
  rw [observationDerivative_symmetry_apply, observationN_second_deriv_symmetry]
  norm_num

theorem radialThird_deriv_neg {c : ℝ} (hc : c ∈ Set.Ioo physicalBoundary 1) :
    deriv radialThird c < 0 := by
  have hc0 := le_trans physicalBoundary_spec.1 (le_of_lt hc.1)
  have hR := radialRPoly_pos hc0 (le_of_lt hc.2)
  have hA := AR_pos_on_open_unit (by linarith [physicalBoundary_spec.1]) hc.2
  have hq := q17R_pos_on_three_fifths (by linarith) (le_of_lt hc.2)
  have hpos : 0 < radialThirdSquared c := by
    unfold radialThirdSquared radialPPoly
    simp only [Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_X,
      Polynomial.eval_sub, Polynomial.eval_ofNat, radialNPoly_eval]
    exact div_pos (mul_pos (mul_pos (sq_pos_of_ne_zero (ne_of_lt (neg_neg_of_pos hA)))
      (by linarith [hc0])) (by linarith [hc.2])) hR
  have hd := (radialThirdSquared_hasDerivAt (ne_of_gt hR)).sqrt (ne_of_gt hpos)
  change HasDerivAt radialThird _ c at hd
  rw [hd.deriv]
  apply div_neg_of_neg_of_pos
  · exact div_neg_of_neg_of_pos (mul_neg_of_neg_of_pos (neg_neg_of_pos hA) hq)
      (sq_pos_of_ne_zero (ne_of_gt hR))
  · exact mul_pos (by norm_num) (Real.sqrt_pos.mpr hpos)

theorem radialThird_no_interior_critical {c : ℝ} (hc : c ∈ Set.Ioo physicalBoundary 1) :
    deriv radialThird c ≠ 0 := ne_of_lt (radialThird_deriv_neg hc)

def physicalStrip : Set (ℝ × ℝ) :=
  {p | p.1 ∈ Set.Ioo (-(Real.pi / 2)) (Real.pi / 2) ∧ p.2 ∈ Set.Icc 0 1}
def physicalCriticalLocus : Set (ℝ × ℝ) :=
  {p | p ∈ physicalStrip ∧ mapJacobian observationMap p = 0}
def physicalDiscriminant : Set (ℝ × ℝ) := observationMap '' physicalCriticalLocus

theorem full_physical_discriminant :
    physicalDiscriminant = {z : ℝ × ℝ | z.1 = 0 ∧ 0 ≤ z.2 ∧ z.2 ≤ 1} ∪
      (fun c => (foldN c, foldM c)) '' Set.Icc physicalBoundary 1 := by
  ext z
  constructor
  · rintro ⟨⟨t, u⟩, ⟨⟨ht, hu⟩, hJ⟩, rfl⟩
    rcases (physical_critical_locus_iff ht hu.1 hu.2).mp hJ with ht0 | ⟨hb, huf⟩
    · left
      change t = 0 at ht0
      rw [ht0, observationMap_symmetry]
      exact ⟨rfl, by linarith [hu.2], by linarith [hu.1]⟩
    · right
      change u = uFoldR (Real.cos t) at huf
      refine ⟨Real.cos t, ⟨hb, Real.cos_le_one t⟩, ?_⟩
      rw [huf, observationMap_rational_branch]
  · intro hz
    rcases hz with hz | ⟨c, hc, rfl⟩
    · refine ⟨(0, 1 - z.2), ⟨⟨?_, ?_⟩, ?_⟩, ?_⟩
      · constructor <;> linarith [Real.pi_pos]
      · exact ⟨by linarith [hz.2.2], by linarith [hz.2.1]⟩
      · rw [physical_critical_locus_iff (by constructor <;> linarith [Real.pi_pos])
          (by linarith [hz.2.2]) (by linarith [hz.2.1])]
        exact Or.inl rfl
      · rw [observationMap_symmetry]
        ext <;> simp [hz.1]
    · have hcpos : 0 < c := by linarith [physicalBoundary_spec.1, hc.1]
      have ht : Real.arccos c ∈ Set.Ioo (-(Real.pi / 2)) (Real.pi / 2) :=
        ⟨by linarith [Real.arccos_nonneg c, Real.pi_pos],
          Real.arccos_lt_pi_div_two.mpr hcpos⟩
      have hcos := Real.cos_arccos (by linarith : -1 ≤ c) hc.2
      have hB := ne_of_lt (BR_neg_on_physical (le_trans physicalBoundary_spec.1 hc.1) hc.2)
      have hu := (uFoldR_mem_unit_iff hcpos hc.2 hB).mpr hc.1
      refine ⟨(Real.arccos c, uFoldR c), ⟨⟨ht, hu⟩, ?_⟩, ?_⟩
      · rw [physical_critical_locus_iff ht hu.1 hu.2, hcos]
        exact Or.inr ⟨hc.1, rfl⟩
      · simpa only [hcos] using observationMap_rational_branch (Real.arccos c)

def norm3 (v : ℝ × ℝ × ℝ) : ℝ := Real.sqrt (v.1 ^ 2 + v.2.1 ^ 2 + v.2.2 ^ 2)
def normalize3 (v : ℝ × ℝ × ℝ) : ℝ × ℝ × ℝ := (v.1 / norm3 v, v.2.1 / norm3 v, v.2.2 / norm3 v)
def cross3 (v w : ℝ × ℝ × ℝ) : ℝ × ℝ × ℝ :=
  (v.2.1 * w.2.2 - v.2.2 * w.2.1, v.2.2 * w.1 - v.1 * w.2.2,
    v.1 * w.2.1 - v.2.1 * w.1)
def ruledSurface (p : ℝ × ℝ) : ℝ × ℝ × ℝ :=
  (Real.cos p.1 + 2 * p.2 * (1 - Real.cos p.1), (1 - p.2) * Real.sin p.1, p.2 * qChart p.1)
def gaussMap (S : (ℝ × ℝ) → ℝ × ℝ × ℝ) (p : ℝ × ℝ) : ℝ × ℝ × ℝ :=
  normalize3 (cross3 (fderiv ℝ S p (1, 0)) (fderiv ℝ S p (0, 1)))

theorem gauss_translation_invariant (S : (ℝ × ℝ) → ℝ × ℝ × ℝ)
    (a : ℝ × ℝ × ℝ) (p : ℝ × ℝ) :
    gaussMap (fun x => a + S x) p = gaussMap S p := by
  unfold gaussMap
  rw [fderiv_const_add]

theorem radial_translation_changes_map :
    normalize3 ((0, 1, 0) + ruledSurface (0, 0)) ≠ normalize3 (ruledSurface (0, 0)) := by
  intro he
  have hy := congrArg (fun v : ℝ × ℝ × ℝ => v.2.1) he
  norm_num [normalize3, norm3, ruledSurface] at hy

theorem surfaceFold_is_ruledSurface (t : ℝ) :
    surfaceFold t = ruledSurface (t, uFoldR (Real.cos t)) := rfl

end
end StokesV5
