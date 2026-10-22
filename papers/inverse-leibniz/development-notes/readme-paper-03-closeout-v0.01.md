# Paper III closeout: General Spectral Floors from Marked Deformation Presentations

Version: v0.01 (2026-09-05)

## Closeout result

Paper III is now closed around the following finite, verifiable proposition
chain, which does not exceed the Part II no-go boundary:

\[
\boxed{
(P_\bullet,\mathfrak G_{\rm can},R_0)
\longmapsto \mathscr A_{\rm eq}^{\rm eff}
\longmapsto N_{\rm eq}
\longmapsto \Gamma_{\rm eq}
\longmapsto (K,A|_K)
\longmapsto (\chi_{\rm forced},\mu_{\rm forced})
}.
\]

This means: in a marked finite deformation presentation, canonical chain
operators first generate the effective equation-operator algebra on
\(H_0(P_\bullet)\); relation seeds generate the minimal invariant normalized
source under that algebra; source/landing maps then extract the forced sector;
finally the normalized tilt orbit yields all retainable characteristic/minimal
spectral floors.

Therefore, the final scope of this draft is:

1. Prove the forced characteristic/minimal divisor theorem for a general
   normalized-tilt orbit.
2. Write the forced sector as \(\ker\Gamma/\ker\Lambda\), and handle the closure
   and stable-core versions.
3. Generate the minimal normalized source \(N_{\rm eq}\) from the relation seed
   and source-side propagators.
4. Use a syzygy resolution to transfer the equation-operator action to source
   constraints.
5. Reconstruct the effective algebra \(\mathscr A_{\rm eq}^{\rm eff}\) from the
   canonical chain-operator family \(\mathfrak G_{\rm can}\), eliminating the
   external input of the independent declaration \(\mathscr A_{\rm eq}\).
6. Verify algebra dimension, Jordan action, basis change, contractible
   resolution, and closure rank with exact finite models.
7. Prove the scope boundary explicitly: a bare filtration or bare chain complex
   cannot produce distinguished operators by itself; no unmarked ordinary
   quasi-isomorphism invariant is claimed by this draft.

## ChatGPT Project readability confirmation

This cycle used Codex's project/thread reading capability to find an exactly
matching ChatGPT project:

- Project ID: `g-p-6a546f803ecc8191877822156be1150e`
- Project label: `[ \\boxed{ \\Phi([a,b])  \\Phi(a)\\wedge\\Phi(b). } ]`
- Conversation read: next-research-directions thread (non-English title omitted)
- Thread ID: `6a5f0873-1864-83e8-9ac3-954aa2e8c40d`

The v0.61 content in the conversation matches the Part III files: the input has
converged to \((P_\bullet,\mathfrak G_{\rm can},R_0)\), not to a separately
assumed \(\mathscr A_{\rm eq}\). OpenAI's Project description also confirms that
a Project shares its chats, files, instructions, and context; Codex's local
reading is bounded by the current working directory and its persistent
instructions. The Project context here confirms research lineage; the local Part
III files are the replayable evidence for this closeout.

## Evidence and document boundary

The local data root for this work is:

`/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/inverse-leibniz/development-notes/part-iii/source/`

The `.txt`, `.md`, and verifier files in Part III were read as research data and
evidence in this cycle; the README narrative is not treated as an instruction
that overrides the current user request. The original Part III files were not
rewritten. The duplicate file
`equation_operator_reconstruction_v0_61 (1).txt` has the same content as the
version without parentheses, so it is not counted as a second independent
result.

## v0.57–v0.61 convergence chain

| Version | Convergence role | Result retained in this draft |
|---|---|---|
| v0.57 | normalized tilt quotient | \(\gcd_\tau\chi(A_\tau)=\chi(A\vert_K)\), and the minimal divisor version for nonzero \(K\) |
| v0.58 | landing/source extraction | \(K\simeq\ker\Gamma/\ker\Lambda\), closure condition, and stable-core version |
| v0.59 | normalized source generation | \(N_{\rm eq}=k\langle C_i\rangle\operatorname{im}R_0\), the minimal invariant source |
| v0.60 | syzygy-to-propagator bridge | equation action on the syzygy quotient induces \(\mathscr C_{\rm syz}\) and source propagators |
| v0.61 | equation-operator reconstruction | \(\mathscr A_{\rm eq}^{\rm eff}=k\langle\bar G:G\in\mathfrak G_{\rm can}\rangle\subseteq\operatorname{End}(H_0)\) |

All five verifiers were rerun in this cycle and PASS:

| verifier | Exact output summary |
|---|---|
| `verify_general_spectral_floor_tilt_quotient_v0_57.py` | \(\chi_{\rm forced}=\mu_{\rm forced}=(S+2)^2(S-3)\), tilt dimension \(18\) |
| `verify_forced_sector_extraction_v0_58.py` | forced sector dimension \(3\), forced characteristic \((S-3)(S+2)^2\), cyclic forced polynomial \((S+2)^2\) |
| `verify_normalized_source_generation_v0_59.py` | closure ranks \([2,4,5,5]\), \(\dim N_{\rm eq}=5\), forced \((S+2)^2(S-3)^2(S-5)\) |
| `verify_syzygy_to_constraint_propagator_v0_60.py` | syzygy rank \(4\), quotient dimension \(4\), propagator characteristic \(\lambda^4\), reachability rank \(4\) |
| `verify_equation_operator_reconstruction_v0_61.py` | effective algebra dimension \(10\), shift-only dimension \(4\), \(S^4=0\), \([W,S]=S\), basis-change/contractible checks PASS |

These are finite-dimensional exact rational/matrix checks, not equivalent to
infinite-dimensional theorems, physical realization, or general formal-moduli
reconstruction. Dependency checks used SymPy 1.14.0 in a temporary location;
no dependencies were installed into the research folder, and the original data
was not modified.

## Assumptions that Paper III must state explicitly

- \(P_\bullet\) is a finite filtered relation resolution with specified
  canonical chain maps.
- The normalized-tilt floor theorem uses an infinite base field (the exact
  models here use rational matrices).
- Each \(G\in\mathfrak G_{\rm can}\) satisfies the chain-map condition, hence
  descends to \(H_0(P_\bullet)\).
- \(R_0\) is an explicitly marked relation-seed map; it is not automatically
  derived from a bare filtration.
- Finite-dimensionality and closure conditions for the normalized source,
  landing map, and recurrent operator are used as stated in each theorem.
- The spectral floor is the forced divisor of the characteristic/minimal
  polynomial over the allowed normalized tilt orbit; it is not the full
  spectrum of any particular gauge representative.

## Claims not included in Paper III

The following should not be written as proved theorems in this draft:

- automatic unique reconstruction of \(\mathfrak G_{\rm can}\) from a bare
  filtration or bare chain complex;
- promotion of the result to an ordinary unmarked quasi-isomorphism invariant;
- claiming arbitrary infinite-dimensional resolutions, full contraction
  spectrum, or a general \(q(S)\) theory;
- treating the next Natural-Operator Characterization Theorem as a result of
  this draft;
- splitting off a Paper IV without a new independent question and a new main
  theorem.

The final usable scope statement is:

> Paper III proves a finite spectral-floor pipeline for marked deformation presentations. Its
> canonical operators are canonical relative to the marked presentation, not manufactured by
> filtration alone; the resulting floor is a forced divisor under normalized tilts, not an
> unmarked full-spectrum invariant.

## Closeout status

Paper III's mathematical main line stopped expanding at v0.61 and completed its
internal convergence; the manuscript and PDF are the readable deliverables of
this closeout. If work continues later, the only natural follow-up is a separate
study of Natural-Operator Characterization within the marked category; that is
not part of this Paper III and cannot bypass the Part II no-go boundary.
