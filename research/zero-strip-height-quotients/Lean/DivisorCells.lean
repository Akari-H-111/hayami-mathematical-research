import Mathlib.Data.Real.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-!
# Half-open height cells and the superlinear-count obstruction

This module formalizes the combinatorial core of the zero-strip no-go
argument:

* translation by `T` maps the half-open cell `[h+nT, h+(n+1)T)` onto the
  next cell;
* a nonnegative cell-mass sequence with a uniform bound has a linear prefix
  count;
* therefore a prefix count that is superlinear along every tail cannot have
  uniformly bounded cell masses.

The module deliberately does not construct the xi divisor or prove
Riemann--von Mangoldt.  A caller supplies the prefix-count comparison and the
superlinear growth hypothesis; those are the named analytic inputs of the
written argument.
-/

namespace ZeroStripCells

open Set
open scoped BigOperators

abbrev Point := ℝ × ℝ

/-- Vertical translation by `T`. -/
def translate (T : ℝ) (p : Point) : Point :=
  (p.1, p.2 + T)

/-- The half-open height cell `[h+nT, h+(n+1)T)`. -/
def cell (h T : ℝ) (n : ℕ) : Set Point :=
  {p | h + (n : ℝ) * T ≤ p.2 ∧ p.2 < h + ((n + 1 : ℕ) : ℝ) * T}

/-- Translation sends a point of cell `n` to cell `n+1`. -/
theorem translate_mem_cell_succ {h T : ℝ} {n : ℕ} {p : Point}
    (hp : p ∈ cell h T n) : translate T p ∈ cell h T (n + 1) := by
  rcases hp with ⟨hlo, hhi⟩
  constructor
  · dsimp [translate, cell] at *
    have hcast : ((n + 1 : ℕ) : ℝ) * T = (n : ℝ) * T + T := by
      rw [Nat.cast_add, Nat.cast_one, add_mul, one_mul]
    rw [hcast]
    linarith
  · dsimp [translate, cell] at *
    have hcast₁ : ((n + 1 : ℕ) : ℝ) * T = (n : ℝ) * T + T := by
      rw [Nat.cast_add, Nat.cast_one, add_mul, one_mul]
    have hcast₂ : ((n + 1 + 1 : ℕ) : ℝ) * T = (n : ℝ) * T + T + T := by
      rw [Nat.cast_add, Nat.cast_add, Nat.cast_one, add_mul, one_mul]
      ring
    rw [hcast₁] at hhi
    rw [hcast₂]
    linarith

/-- Distinct half-open cells in the same height ladder are disjoint. -/
theorem cell_disjoint {h T : ℝ} (hT : 0 < T) {m n : ℕ} (hmn : m < n) :
    Disjoint (cell h T m) (cell h T n) := by
  rw [Set.disjoint_left]
  intro p hpm hpn
  rcases hpm with ⟨hm_lo, hm_hi⟩
  rcases hpn with ⟨hn_lo, hn_hi⟩
  have hmn' : ((m + 1 : ℕ) : ℝ) ≤ (n : ℝ) := by
    exact_mod_cast Nat.succ_le_of_lt hmn
  have hmul : ((m + 1 : ℕ) : ℝ) * T ≤ (n : ℝ) * T :=
    mul_le_mul_of_nonneg_right hmn' (le_of_lt hT)
  linarith

/-- The image of a half-open cell under translation is exactly the next cell. -/
theorem translate_image_cell {h T : ℝ} (n : ℕ) :
    translate T '' cell h T n = cell h T (n + 1) := by
  ext p
  constructor
  · rintro ⟨q, hq, rfl⟩
    exact translate_mem_cell_succ hq
  · intro hp
    refine ⟨(p.1, p.2 - T), ?_, ?_⟩
    · rcases hp with ⟨hlo, hhi⟩
      constructor
      · dsimp [cell] at *
        have hcast : ((n + 1 : ℕ) : ℝ) * T = (n : ℝ) * T + T := by
          rw [Nat.cast_add, Nat.cast_one, add_mul, one_mul]
        rw [hcast] at hlo
        linarith
      · dsimp [cell] at *
        have hcast₁ : ((n + 1 : ℕ) : ℝ) * T = (n : ℝ) * T + T := by
          rw [Nat.cast_add, Nat.cast_one, add_mul, one_mul]
        have hcast₂ : ((n + 1 + 1 : ℕ) : ℝ) * T = (n : ℝ) * T + T + T := by
          rw [Nat.cast_add, Nat.cast_add, Nat.cast_one, add_mul, one_mul]
          ring
        rw [hcast₂] at hhi
        rw [hcast₁]
        linarith
    · dsimp [translate]
      exact Prod.ext rfl (by ring)

/-- Translation as a bijection of the plane. -/
def translateEquiv (T : ℝ) : Point ≃ Point where
  toFun := translate T
  invFun p := (p.1, p.2 - T)
  left_inv p := by
    ext <;> simp [translate]
  right_inv p := by
    ext <;> simp [translate]

theorem translate_injective (T : ℝ) : Function.Injective (translate T) := by
  intro p q h
  ext
  · have hx : p.1 = q.1 := by
      simpa [translate] using congrArg (fun r : Point => r.1) h
    exact hx
  · have hs : p.2 + T = q.2 + T := by
      simpa [translate] using congrArg (fun r : Point => r.2) h
    linarith

/-- Multiplicity mass of a finite set of points. -/
def massOn (m : Point → ℕ) (s : Finset Point) : ℕ :=
  s.sum m

/-- A multiplicity-preserving translation preserves the mass of every finite
cell. -/
theorem massOn_translate (m : Point → ℕ) (T : ℝ) (s : Finset Point)
    (hm : ∀ p, m (translate T p) = m p) :
    massOn m (s.image (translateEquiv T).toEmbedding) = massOn m s := by
  classical
  unfold massOn
  rw [Finset.sum_image]
  · apply Finset.sum_congr rfl
    intro p _hp
    exact hm p
  · intro p _hp q _hq hpq
    exact translate_injective T hpq

/-- A height-divisor model with finite support in each half-open cell.  The
field `support_mem` records the local-finiteness input; `periodic` records
multiplicity preservation under the height translation. -/
structure CellDivisor (h T : ℝ) where
  mass : Point → ℕ
  support : ℕ → Finset Point
  support_mem : ∀ n p, p ∈ support n ↔ p ∈ cell h T n ∧ mass p ≠ 0
  periodic : ∀ p, mass (translate T p) = mass p

namespace CellDivisor

variable {h T : ℝ} (D : CellDivisor h T)

/-- The finite support in the next cell is the translate of the previous
support. -/
theorem support_succ (n : ℕ) :
    D.support (n + 1) =
      (D.support n).image (translateEquiv T).toEmbedding := by
  classical
  ext p
  rw [D.support_mem, Finset.mem_image]
  constructor
  · intro hp
    rcases hp with ⟨hpcell, hpmass⟩
    let q : Point := (p.1, p.2 - T)
    have hqcell : q ∈ cell h T n := by
      rcases hpcell with ⟨hlo, hhi⟩
      constructor
      · dsimp [q, cell] at *
        have hcast : ((n + 1 : ℕ) : ℝ) * T = (n : ℝ) * T + T := by
          rw [Nat.cast_add, Nat.cast_one, add_mul, one_mul]
        rw [hcast] at hlo
        linarith
      · dsimp [q, cell] at *
        have hcast₁ : ((n + 1 : ℕ) : ℝ) * T = (n : ℝ) * T + T := by
          rw [Nat.cast_add, Nat.cast_one, add_mul, one_mul]
        have hcast₂ : ((n + 1 + 1 : ℕ) : ℝ) * T = (n : ℝ) * T + T + T := by
          rw [Nat.cast_add, Nat.cast_add, Nat.cast_one, add_mul, one_mul]
          ring
        rw [hcast₂] at hhi
        rw [hcast₁]
        linarith
    have hqmass : D.mass q ≠ 0 := by
      have hp_eq : D.mass p = D.mass q := by
        simpa [q, translate] using D.periodic q
      rw [← hp_eq]
      exact hpmass
    refine ⟨q, ?_, ?_⟩
    · rw [D.support_mem]
      exact ⟨hqcell, hqmass⟩
    · dsimp [q, translateEquiv]
      exact Prod.ext rfl (by simp [translate])
  · rintro ⟨q, hq, rfl⟩
    have hq' := (D.support_mem n q).mp hq
    constructor
    · simpa [translateEquiv] using translate_mem_cell_succ hq'.1
    · have hper : D.mass ((translateEquiv T).toEmbedding q) = D.mass q := by
        simpa [translateEquiv] using D.periodic q
      rw [hper]
      exact hq'.2

/-- The mass of cell `n`. -/
def cellMass (n : ℕ) : ℕ :=
  massOn D.mass (D.support n)

/-- A multiplicity-preserving translation gives equal masses in consecutive
half-open cells. -/
theorem cellMass_succ (n : ℕ) : D.cellMass (n + 1) = D.cellMass n := by
  unfold cellMass
  rw [D.support_succ n]
  exact massOn_translate D.mass T (D.support n) D.periodic

/-- Consequently every cell has the same mass as cell zero. -/
theorem cellMass_eq_zero : ∀ n, D.cellMass n = D.cellMass 0
  | 0 => rfl
  | n + 1 => by
      rw [D.cellMass_succ n]
      exact CellDivisor.cellMass_eq_zero n

end CellDivisor

/-- Sum of the first `n` cell masses, with cell `0` first. -/
def prefixMass (A : ℕ → ℕ) : ℕ → ℕ
  | 0 => 0
  | n + 1 => prefixMass A n + A n

theorem prefixMass_succ (A : ℕ → ℕ) (n : ℕ) :
    prefixMass A (n + 1) = prefixMass A n + A n := rfl

/-- A uniform cell-mass bound gives a linear bound for every prefix. -/
theorem prefixMass_le_mul (A : ℕ → ℕ) (M : ℕ) (hA : ∀ n, A n ≤ M) :
    ∀ n, prefixMass A n ≤ n * M
  | 0 => by simp [prefixMass]
  | n + 1 => by
      rw [prefixMass_succ]
      have ih := prefixMass_le_mul A M hA n
      have hn := hA n
      calc
        prefixMass A n + A n ≤ n * M + M := Nat.add_le_add ih hn
        _ = (n + 1) * M := by ring

/-- The abstract no-go: a prefix count that is superlinear on every tail cannot
have uniformly bounded cell masses.

`N n` is the count below the `n`-th cell boundary and `A n` is the mass of the
`n`-th half-open cell.  The hypothesis `hN` is the half-open partition bound;
`hgrowth` is the named superlinear analytic input (for xi, Riemann--von
Mangoldt supplies it). -/
theorem no_bounded_cells_of_superlinear
    (N A : ℕ → ℕ) (K M : ℕ)
    (hN : ∀ n, N n ≤ K + prefixMass A n)
    (hA : ∀ n, A n ≤ M)
    (hgrowth : ∀ B n₀ : ℕ, ∃ n, n₀ ≤ n ∧ B * n < N n) : False := by
  obtain ⟨n, hn₀, hng⟩ := hgrowth (M + 1) (K + 1)
  have hprefix := prefixMass_le_mul A M hA n
  have hNn := hN n
  have hK : K < n := by omega
  have hle : K + prefixMass A n ≤ K + n * M :=
    Nat.add_le_add_left hprefix K
  have hNle : N n ≤ K + n * M := le_trans hNn hle
  have hlt : K + n * M < (M + 1) * n := by
    calc
      K + n * M < n + n * M := Nat.add_lt_add_right hK (n * M)
      _ = (M + 1) * n := by
        rw [Nat.add_comm n (n * M), Nat.mul_comm n M, ← Nat.succ_mul]
  exact (not_lt_of_ge hNle) (lt_trans hlt hng)

end ZeroStripCells

#print axioms ZeroStripCells.translate_mem_cell_succ
#print axioms ZeroStripCells.cell_disjoint
#print axioms ZeroStripCells.translate_image_cell
#print axioms ZeroStripCells.massOn_translate
#print axioms ZeroStripCells.CellDivisor.support_succ
#print axioms ZeroStripCells.CellDivisor.cellMass_succ
#print axioms ZeroStripCells.CellDivisor.cellMass_eq_zero
#print axioms ZeroStripCells.prefixMass_succ
#print axioms ZeroStripCells.prefixMass_le_mul
#print axioms ZeroStripCells.no_bounded_cells_of_superlinear
