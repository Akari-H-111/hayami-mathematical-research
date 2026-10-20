# Formalization status: zero-strip height quotients

**Date:** 20 October 2026.  **Scope:** new bounded Lean layer; sealed paper
bytes are unchanged.

The workstream now has 33 named Lean theorems in four modules.  The new module
[`Lean/DivisorCells.lean`](Lean/DivisorCells.lean) formalizes the half-open cell
bookkeeping that the written no-go proof uses.

## Coverage

| Module | Named theorems | Scope |
| --- | ---: | --- |
| `Lean/ZeroStripCore.lean` | 10 | ambient coordinate maps, matrix determinants, subgroup obstruction |
| `Lean/SupervisorStructures.lean` | 8 | AddCircle cylinder model, glide square, reflection, constant-cell growth lemma |
| `Lean/DivisorCells.lean` | 10 | half-open cells, disjointness, translation, finite cell-mass preservation, bounded-cell/superlinear contradiction |
| `Lean/ZetaCompatibility.lean` | 5 | actual zeta zero-support invariance under conjugation and functional reflection |

The new `DivisorCells` layer proves:

- `translate_mem_cell_succ` and `translate_image_cell`: translation by `T`
  sends `[h+nT,h+(n+1)T)` exactly onto the next half-open cell;
- `cell_disjoint`: distinct cells in the same ladder are disjoint;
- `massOn_translate`: a multiplicity-preserving translation preserves the mass
  of every finite cell;
- `CellDivisor.support_succ`, `CellDivisor.cellMass_succ` and
  `CellDivisor.cellMass_eq_zero`: finite cell supports translate and the
  resulting cell masses are equal;
- `prefixMass_le_mul`: a uniform cell-mass bound gives a linear prefix bound;
- `no_bounded_cells_of_superlinear`: a prefix count that is superlinear on every
  tail cannot have uniformly bounded cell masses.

## Boundary

The following remain outside Lean:

- the xi function and its divisor;
- local finiteness of the zero divisor;
- Riemann–von Mangoldt and the superlinear count;
- the identification of the abstract count with the zeta zero count;
- the quotient homeomorphisms and the manifold local-homology/orientability
  arguments;
- the auxiliary entire-function countermodel.

`CellDivisor` is a model of a locally finite height divisor: it takes finite
cell supports and multiplicity preservation as fields.  It does not construct
those fields from xi.  The analytic no-go remains a written theorem with named
external inputs, not a complete Lean proof.

## Replay

See [`Lean/README.md`](Lean/README.md).  The tested route is the read-only
Mathlib checkout pinned to Lean `v4.33.1` and Mathlib
`0df444a360eaa60ab8c11dca51a86af692955474`.  No declaration uses `sorry`,
`admit`, or a custom axiom.
