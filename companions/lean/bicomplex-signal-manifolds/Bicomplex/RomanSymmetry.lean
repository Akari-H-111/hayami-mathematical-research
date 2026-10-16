import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Data.Fintype.Perm
import Mathlib.Tactic

namespace Bicomplex
noncomputable section
open scoped Matrix
open Module
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000

/-- Missing coordinate and sign of the product of the two nonzero coordinates. -/
abbrev RomanCap := Fin 3 × Bool

def romanCapRepresentative (p : RomanCap) : Fin 3 → ℤ :=
  if p.1 = 0 then ![0,1,if p.2 then -1 else 1]
  else if p.1 = 1 then ![1,0,if p.2 then -1 else 1]
  else ![1,if p.2 then -1 else 1,0]

def romanSignMask (ε : Fin 3 → Bool) (i : Fin 3) : Bool :=
  if i = 0 then xor (ε 1) (ε 2)
  else if i = 1 then xor (ε 0) (ε 2)
  else xor (ε 0) (ε 1)

def romanCapAction (σ : Equiv.Perm (Fin 3)) (ε : Fin 3 → Bool) : Equiv.Perm RomanCap where
  toFun p := (σ p.1, xor p.2 (romanSignMask ε p.1))
  invFun p := (σ.symm p.1, xor p.2 (romanSignMask ε (σ.symm p.1)))
  left_inv p := by rcases p with ⟨i,b⟩; simp [Bool.xor_assoc]
  right_inv p := by rcases p with ⟨i,b⟩; simp [Bool.xor_assoc]

-- The permutation is induced by the actual signed coordinate permutation on RP².
set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem roman_action_on_representatives :
    ∀ (σ : Equiv.Perm (Fin 3)) (ε : Fin 3 → Bool) (p : RomanCap),
      (fun j => (if ε (σ.symm j) then -1 else 1) * romanCapRepresentative p (σ.symm j)) =
        romanCapRepresentative (romanCapAction σ ε p) ∨
      (fun j => (if ε (σ.symm j) then -1 else 1) * romanCapRepresentative p (σ.symm j)) =
        -romanCapRepresentative (romanCapAction σ ε p) := by decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem roman_action_transitive : ∀ i j : RomanCap,
    ∃ (σ : Equiv.Perm (Fin 3)) (ε : Fin 3 → Bool), romanCapAction σ ε i = j := by decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem roman_ordered_pair_orbits : ∀ i j : RomanCap, i ≠ j →
    (i.1 = j.1 → ∃ (σ : Equiv.Perm (Fin 3)) (ε : Fin 3 → Bool),
      romanCapAction σ ε (0,false) = i ∧ romanCapAction σ ε (0,true) = j) ∧
    (i.1 ≠ j.1 → ∃ (σ : Equiv.Perm (Fin 3)) (ε : Fin 3 → Bool),
      romanCapAction σ ε (0,false) = i ∧ romanCapAction σ ε (1,false) = j) := by
  intro i j hij
  constructor <;> intro hpair <;> revert hpair hij <;> fin_cases i <;> fin_cases j <;> decide

theorem roman_ordered_pair_counts :
    (Finset.univ.filter (fun p : RomanCap × RomanCap => p.1 ≠ p.2 ∧ p.1.1 = p.2.1)).card = 6 ∧
    (Finset.univ.filter (fun p : RomanCap × RomanCap => p.1.1 ≠ p.2.1)).card = 24 := by decide

/-- Dot products of the actual homogeneous representatives: 0 or absolute cosine 1/2. -/
theorem roman_pair_angles : ∀ i j : RomanCap, i ≠ j →
    (i.1 = j.1 → (∑ k, romanCapRepresentative i k * romanCapRepresentative j k) = 0) ∧
    (i.1 ≠ j.1 → (∑ k, romanCapRepresentative i k * romanCapRepresentative j k)^2 = 1) := by
  decide

theorem roman_representatives_squared_length : ∀ i : RomanCap,
    (∑ k, romanCapRepresentative i k ^ 2) = 2 := by decide

theorem roman_action_preserves_pair_type (σ : Equiv.Perm (Fin 3)) (ε : Fin 3 → Bool)
    (i j : RomanCap) :
    (romanCapAction σ ε i).1 = (romanCapAction σ ε j).1 ↔ i.1 = j.1 := by
  exact σ.injective.eq_iff

def romanPerp : Matrix RomanCap RomanCap ℝ := fun i j =>
  if i.1 = j.1 ∧ i ≠ j then 1 else 0

def romanCircle : Matrix RomanCap RomanCap ℝ := fun i j => if i.1 ≠ j.1 then 1 else 0

/-- The finite implication from invariance; no Green operator is postulated here. -/
theorem roman_invariant_matrix (B : Matrix RomanCap RomanCap ℝ)
    (hB : ∀ (σ : Equiv.Perm (Fin 3)) (ε : Fin 3 → Bool) i j,
      B (romanCapAction σ ε i) (romanCapAction σ ε j) = B i j) :
    ∃ r γp γc : ℝ, B = r • (1 : Matrix RomanCap RomanCap ℝ) + γp • romanPerp + γc • romanCircle := by
  classical
  refine ⟨B (0,false) (0,false), B (0,false) (0,true), B (0,false) (1,false), ?_⟩
  ext i j
  by_cases hij : i = j
  · subst j
    obtain ⟨σ,ε,h⟩ := roman_action_transitive (0,false) i
    have hb := hB σ ε (0,false) (0,false)
    simpa [h, romanPerp, romanCircle, Matrix.one_apply] using hb
  · by_cases hpair : i.1 = j.1
    · obtain ⟨σ,ε,hi,hj⟩ := (roman_ordered_pair_orbits i j hij).1 hpair
      have hb := hB σ ε (0,false) (0,true)
      simpa [hi,hj,romanPerp,romanCircle,Matrix.one_apply,hij,hpair] using hb

    · obtain ⟨σ,ε,hi,hj⟩ := (roman_ordered_pair_orbits i j hij).2 hpair
      have hb := hB σ ε (0,false) (1,false)
      simpa [hi,hj,romanPerp,romanCircle,Matrix.one_apply,hij,hpair] using hb

def romanEigenvector (k : Fin 6) (i : RomanCap) : ℝ :=
  if k = 0 then 1
  else if k = 1 then (if i.1 = 0 then 1 else if i.1 = 1 then -1 else 0)
  else if k = 2 then (if i.1 = 0 then 1 else if i.1 = 2 then -1 else 0)
  else if k = 3 then (if i.1 = 0 then (if i.2 then -1 else 1) else 0)
  else if k = 4 then (if i.1 = 1 then (if i.2 then -1 else 1) else 0)
  else (if i.1 = 2 then (if i.2 then -1 else 1) else 0)

def romanEigenvalue (r γp γc : ℝ) (k : Fin 6) : ℝ :=
  if k = 0 then r+γp+4*γc else if k = 1 ∨ k = 2 then r+γp-2*γc else r-γp

private lemma sum_roman_caps (f : RomanCap → ℝ) :
    ∑ i, f i = f (0,false)+f (0,true)+f (1,false)+f (1,true)+f (2,false)+f (2,true) := by
  rw [show (Finset.univ : Finset RomanCap) =
    {(0,false),(0,true),(1,false),(1,true),(2,false),(2,true)} by decide]
  simp +decide [add_assoc]

private lemma sum_fin_six (f : Fin 6 → ℝ) :
    ∑ i, f i = f 0+f 1+f 2+f 3+f 4+f 5 := by
  rw [show (Finset.univ : Finset (Fin 6)) = {0,1,2,3,4,5} by decide]
  simp +decide [add_assoc]

theorem roman_eigenvector_actions (r γp γc : ℝ) (k : Fin 6) :
    (r • (1 : Matrix RomanCap RomanCap ℝ) + γp • romanPerp + γc • romanCircle) *ᵥ
      romanEigenvector k = romanEigenvalue r γp γc k • romanEigenvector k := by
  ext i
  rcases i with ⟨i,b⟩
  fin_cases k <;> fin_cases i <;> cases b <;>
    simp +decide [Matrix.mulVec, dotProduct, sum_roman_caps,
      romanEigenvector, romanEigenvalue, romanPerp, romanCircle, Matrix.one_apply] <;> ring

/-- Coordinates in the six displayed eigenvectors; this proves completeness and independence. -/
def romanSpectralEquiv : (Fin 6 → ℝ) ≃ₗ[ℝ] (RomanCap → ℝ) where
  toFun c i := ∑ k, c k * romanEigenvector k i
  map_add' c d := by ext i; simp [add_mul, Finset.sum_add_distrib]
  map_smul' a c := by ext i; simp [Finset.mul_sum, mul_assoc]
  invFun v :=
    let m0 := (v (0,false)+v (0,true))/2
    let m1 := (v (1,false)+v (1,true))/2
    let m2 := (v (2,false)+v (2,true))/2
    ![(m0+m1+m2)/3, (m0+m1+m2)/3-m1, (m0+m1+m2)/3-m2,
      (v (0,false)-v (0,true))/2, (v (1,false)-v (1,true))/2,
      (v (2,false)-v (2,true))/2]
  left_inv c := by
    ext k
    fin_cases k <;> simp +decide [romanEigenvector, sum_fin_six] <;> ring
  right_inv v := by
    ext i
    rcases i with ⟨i,b⟩
    fin_cases i <;> cases b <;> simp +decide [romanEigenvector, sum_fin_six] <;> ring

/-- Block dimensions are 1,2,3, including parameter values where eigenvalues coincide. -/
theorem roman_eigenbasis : ∃ b : Basis (Fin 6) ℝ (RomanCap → ℝ),
    ∀ k, b k = romanEigenvector k := by
  refine ⟨(Pi.basisFun ℝ (Fin 6)).map romanSpectralEquiv, ?_⟩
  intro k
  ext i
  simp [Basis.map_apply, Pi.basisFun_apply, romanSpectralEquiv, Pi.single_apply, ite_mul]

theorem roman_block_dimensions :
    Module.finrank ℝ (Submodule.span ℝ (Set.range (fun _ : Fin 1 => romanEigenvector 0))) = 1 ∧
    Module.finrank ℝ (Submodule.span ℝ (Set.range (fun i : Fin 2 => romanEigenvector (![1,2] i)))) = 2 ∧
    Module.finrank ℝ (Submodule.span ℝ (Set.range (fun i : Fin 3 => romanEigenvector (![3,4,5] i)))) = 3 := by
  obtain ⟨b,hb⟩ := roman_eigenbasis
  have hlin : LinearIndependent ℝ romanEigenvector := by
    have he : (fun k => b k) = romanEigenvector := funext hb
    exact he ▸ b.linearIndependent
  refine ⟨?_,?_,?_⟩
  · simpa [Function.comp_def] using finrank_span_eq_card (hlin.comp (fun _ : Fin 1 => (0 : Fin 6)) (by decide))
  · simpa [Function.comp_def] using finrank_span_eq_card (hlin.comp (fun i : Fin 2 => (![1,2] : Fin 2 → Fin 6) i) (by decide))
  · simpa [Function.comp_def] using finrank_span_eq_card (hlin.comp (fun i : Fin 3 => (![3,4,5] : Fin 3 → Fin 6) i) (by decide))

theorem roman_invariant_spectral_basis (B : Matrix RomanCap RomanCap ℝ)
    (hB : ∀ (σ : Equiv.Perm (Fin 3)) (ε : Fin 3 → Bool) i j,
      B (romanCapAction σ ε i) (romanCapAction σ ε j) = B i j) :
    ∃ (r γp γc : ℝ) (b : Basis (Fin 6) ℝ (RomanCap → ℝ)),
      ∀ k, B *ᵥ b k = romanEigenvalue r γp γc k • b k := by
  obtain ⟨r,γp,γc,hform⟩ := roman_invariant_matrix B hB
  obtain ⟨b,hb⟩ := roman_eigenbasis
  refine ⟨r,γp,γc,b,?_⟩
  intro k
  rw [hb k,hform]
  exact roman_eigenvector_actions r γp γc k

end
end Bicomplex
