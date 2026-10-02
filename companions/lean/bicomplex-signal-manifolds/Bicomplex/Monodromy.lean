import RuledV5.DegreeApplication
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

namespace Bicomplex
noncomputable section
open RuledV5 unitInterval
open scoped Topology

def squareRootLift (γ : C(I,NonzeroComplex)) (z : ℂ)
    (hz : γ 0=nonzeroExp z) : C(I,ℂ) :=
  ⟨fun t => Complex.exp (windingLift γ z hz t/2),by fun_prop⟩

theorem square_root_lift (γ : C(I,NonzeroComplex)) (z : ℂ)
    (hz : γ 0=nonzeroExp z) :
    Continuous (squareRootLift γ z hz) ∧
      (∀ t, (squareRootLift γ z hz t)^2=(γ t).val) ∧
      squareRootLift γ z hz 0=Complex.exp (z/2) := by
  refine ⟨(squareRootLift γ z hz).continuous,?_,?_⟩
  · intro t
    change (Complex.exp (windingLift γ z hz t/2))^2=(γ t).val
    rw [pow_two,← Complex.exp_add,show windingLift γ z hz t/2+
      windingLift γ z hz t/2=windingLift γ z hz t by ring]
    exact congrArg Subtype.val (congr_fun (winding_lift_actual γ z hz).2.1 t)
  · change Complex.exp (windingLift γ z hz 0/2)=Complex.exp (z/2)
    rw [(winding_lift_actual γ z hz).2.2]

theorem log_lift_endpoint (γ : C(I,NonzeroComplex)) (z : ℂ)
    (hz : γ 0=nonzeroExp z) (hclosed : γ 1=γ 0) :
    ∃ n : ℤ, windingLift γ z hz 1=z+n*(2*Real.pi*Complex.I) ∧
      windingValue γ z hz=n := by
  have he : Complex.exp (windingLift γ z hz 1)=Complex.exp z := by
    exact congrArg Subtype.val ((congr_fun (winding_lift_actual γ z hz).2.1 (1:I)).trans
      (hclosed.trans hz))
  obtain ⟨n,hn⟩ := Complex.exp_eq_exp_iff_exists_int.mp he
  refine ⟨n,hn,?_⟩
  unfold windingValue
  rw [hn]
  simp [Complex.mul_im,Complex.ofReal_im,Complex.ofReal_re]

theorem unit_winding_sign_change (γ : C(I,NonzeroComplex)) (z : ℂ)
    (hz : γ 0=nonzeroExp z) (hclosed : γ 1=γ 0)
    (hw : windingValue γ z hz=1 ∨ windingValue γ z hz= -1) :
    squareRootLift γ z hz 1= -squareRootLift γ z hz 0 := by
  obtain ⟨n,hn,hwinding⟩ := log_lift_endpoint γ z hz hclosed
  change Complex.exp (windingLift γ z hz 1/2)= -Complex.exp (windingLift γ z hz 0/2)
  rw [hn,(winding_lift_actual γ z hz).2.2]
  rcases hw with hw | hw
  · have hnc : (n:ℂ)=1 := by exact_mod_cast (hwinding.symm.trans hw)
    rw [hnc]
    rw [show (z+1*(2*Real.pi*Complex.I))/2=z/2+Real.pi*Complex.I by ring,
      Complex.exp_add,Complex.exp_pi_mul_I]
    ring
  · have hnc : (n:ℂ)= -1 := by exact_mod_cast (hwinding.symm.trans hw)
    rw [hnc]
    rw [show (z+(-1)*(2*Real.pi*Complex.I))/2=z/2+ -(Real.pi*Complex.I) by ring,
      Complex.exp_add,Complex.exp_neg,Complex.exp_pi_mul_I]
    simp

-- Direct application to the normalized actual observation loops.
theorem local_observation_root_sign {p : ℝ × ℝ} {n : ℤ}
    (hindex : HasLocalObservationIndex p n) (hn : n=1 ∨ n= -1) :
    ∃ δ : ℝ, 0 < δ ∧ ∀ r : ℝ, r ∈ Set.Ioo 0 δ →
      ∃ γ : C(I,NonzeroComplex),
        (∀ t : I, (γ t).val=complexObservation (circleParameter p r t)) ∧
        (∀ t : I, (squareRootLift (normalizedLoop γ) 0 (normalized_loop_start γ) t)^2=
          (γ t).val/(γ 0).val) ∧
        squareRootLift (normalizedLoop γ) 0 (normalized_loop_start γ) 1=
          -squareRootLift (normalizedLoop γ) 0 (normalized_loop_start γ) 0 := by
  obtain ⟨δ,hδ,hγ⟩ := hindex
  refine ⟨δ,hδ,?_⟩
  intro r hr
  obtain ⟨γ,hg,hw⟩ := hγ r hr
  have hclosed : γ 1=γ 0 := by
    apply Subtype.ext
    rw [(hg 1).2,(hg 0).2]
    congr 1
    simp [circleParameter]
  have hnormclosed : normalizedLoop γ 1=normalizedLoop γ 0 := by
    apply Subtype.ext
    change (γ 1).val/(γ 0).val=(γ 0).val/(γ 0).val
    rw [hclosed]
  refine ⟨γ,fun t => (hg t).2,?_,?_⟩
  · exact (square_root_lift (normalizedLoop γ) 0 (normalized_loop_start γ)).2.1
  · apply unit_winding_sign_change _ _ _ hnormclosed
    change loopWinding γ=1 ∨ loopWinding γ= -1
    rcases hn with hn | hn <;> simp [hw,hn]

end
end Bicomplex
