# Paper III closeout: General Spectral Floors from Marked Deformation Presentations

Version: v0.01 (2026-09-05)

## Closeout conclusion

Paper III now closes at the following finite, verifiable proposition chain within Part II's no-go boundary:

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

In a marked finite deformation presentation, canonical chain operators first generate the effective equation-operator algebra on
\(H_0(P_\bullet)\); relation seeds generate its minimal
invariant normalized source; source/landing maps extract the forced sector; finally, the normalized tilt
orbit yields every retainable characteristic/minimal spectral floor.

The manuscript's final scope is therefore:

1. Prove the forced characteristic/minimal divisor theorem for a general normalized-tilt orbit.
2. Express the forced sector as \(\ker\Gamma/\ker\Lambda\), treating closure and stable-core versions.
3. Generate minimal normalized source \(N_{\rm eq}\) from relation seeds and source-side propagators.
4. Transfer equation-operator action to source constraints through a syzygy resolution.
5. Reconstruct effective algebra from canonical chain-operator family \(\mathfrak G_{\rm can}\),
   \(\mathscr A_{\rm eq}^{\rm eff}\), eliminating separately declared external input \(\mathscr A_{\rm eq}\).
6. Verify algebra dimension, Jordan action, basis changes, contractible
   resolution and closure rank through exact finite models.
7. Prove the scope boundary explicitly: bare filtration or chain complex cannot generate distinguished
   operators itself; no ordinary unmarked quasi-isomorphism invariant is claimed here.

## ChatGPT Project readability confirmed

This round used Codex project/thread reading to find the exactly matching ChatGPT project:

- Project ID：`g-p-6a546f803ecc8191877822156be1150e`
- Project label：`[ \\boxed{ \\Phi([a,b])  \\Phi(a)\\wedge\\Phi(b). } ]`
- Conversation read: `Next research directions`
- Thread ID：`6a5f0873-1864-83e8-9ac3-954aa2e8c40d`

The conversation's v0.61 content agrees with Part III files: inputs have converged to
\((P_\bullet,\mathfrak G_{\rm can},R_0)\), rather than separately assumed
\(\mathscr A_{\rm eq}\). OpenAI's Project explanation also confirms sharing of chats, files,
instructions and context; Codex local reading is bounded by the current working directory and its persistent instructions. Here,
Project context establishes research continuity; local Part III files supply rerunnable evidence for this closeout.

## Evidence and document boundaries

The local data root for this work is:

`/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/inverse-leibniz/development-notes/part-iii/source/`

Part III `.txt`, `.md`, and verifier files were read as research material and evidence; README
statements do not override this round's user request as operational instructions. Original Part III files were not rewritten. Duplicate
`equation_operator_reconstruction_v0_61 (1).txt` matches the unparenthesized file, so is not a second independent result.

## v0.57--v0.61 convergence chain

| Version | Convergence role | Result retained here |
|---|---|---|
| v0.57 | normalized tilt quotient | \(\gcd_\tau\chi(A_\tau)=\chi(A|_K)\), plus minimal-divisor version for nonzero \(K\) |
| v0.58 | landing/source extraction | \(K\simeq\ker\Gamma/\ker\Lambda\), closure conditions and stable-core version |
| v0.59 | normalized source generation | \(N_{\rm eq}=k\langle C_i\rangle\operatorname{im}R_0\), minimal invariant source |
| v0.60 | syzygy-to-propagator bridge | Equation action on syzygy quotient induces \(\mathscr C_{\rm syz}\) and source propagators |
| v0.61 | equation-operator reconstruction | \(\mathscr A_{\rm eq}^{\rm eff}=k\langle\bar G:G\in\mathfrak G_{\rm can}\rangle\subseteq\operatorname{End}(H_0)\) |

All five verifiers were rerun this round and PASS:

| Verifier | Exact output summary |
|---|---|
| `verify_general_spectral_floor_tilt_quotient_v0_57.py` | \(\chi_{\rm forced}=\mu_{\rm forced}=(S+2)^2(S-3)\)，tilt dimension \(18\) |
| `verify_forced_sector_extraction_v0_58.py` | forced sector dimension \(3\)，forced characteristic \((S-3)(S+2)^2\)，cyclic forced polynomial \((S+2)^2\) |
| `verify_normalized_source_generation_v0_59.py` | closure ranks \([2,4,5,5]\)，\(\dim N_{\rm eq}=5\)，forced \((S+2)^2(S-3)^2(S-5)\) |
| `verify_syzygy_to_constraint_propagator_v0_60.py` | syzygy rank \(4\)，quotient dimension \(4\)，propagator characteristic \(\lambda^4\)，reachability rank \(4\) |
| `verify_equation_operator_reconstruction_v0_61.py` | effective algebra dimension \(10\)，shift-only dimension \(4\)，\(S^4=0\)、\([W,S]=S\)，basis-change/contractible checks PASS |

These are finite-dimensional exact rational/matrix checks, not infinite-dimensional theorems, physical realizations, or
general formal-moduli reconstruction. Dependencies used SymPy 1.14.0 at a temporary location; no dependency was installed
in the research folder, nor were original data modified for this.

## Assumptions that Paper III must explicitly retain

- \(P_\bullet\) is a finite filtered relation resolution with specified canonical chain maps.
- Normalized-tilt floor theorem uses an infinite base field (this round's exact models use rational matrices).
- Each \(G\in\mathfrak G_{\rm can}\) is a chain map, hence descends to \(H_0(P_\bullet)\).
- \(R_0\) is an explicitly marked relation-seed map, not automatically derived from bare filtration.
- Finite dimensionality and closure conditions for normalized source, landing map, and recurrent operator are used
  under each theorem's assumptions.
- Spectral floor is the forced divisor of characteristic/minimal polynomials over the allowed normalized tilt orbit,
  not the complete spectrum of any particular gauge representative.

## Claims excluded from Paper III

The following must not appear as proved theorems in this manuscript:

- Automatic unique reconstruction of \(\mathfrak G_{\rm can}\) from bare filtration or chain complex.
- Promotion to an ordinary unmarked quasi-isomorphism invariant.
- Completed arbitrary infinite-dimensional resolutions, full contraction spectrum, or general
  \(q(S)\) theory.
- Treating the next Natural-Operator Characterization Theorem as this paper's result.
- Splitting off Paper IV without a new independent question and main theorem.

A final usable scope statement is:

> Paper III proves a finite spectral-floor pipeline for marked deformation presentations. Its
> canonical operators are canonical relative to the marked presentation, not manufactured by
> filtration alone; the resulting floor is a forced divisor under normalized tilts, not an
> unmarked full-spectrum invariant.

## Closeout status

Paper III's mathematical main line stopped expanding at v0.61 and completed internal convergence; manuscript and PDF are this closeout's readable
deliverables. A natural later continuation is a separate Natural-Operator Characterization study within the marked category;
that is outside this Paper III and cannot bypass Part II's no-go boundary.
