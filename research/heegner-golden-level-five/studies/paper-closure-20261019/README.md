# Paper closure from HMR and RH

2026-10-19. The user redirects the research away from practical cryptography
and asks what the existing HMR/RH work contains that can give the golden-
Heegner paper an unexpected, mathematically complete ending.

## Result

The HMR lateral ruling parameter is u0=cos(2pi/5). The mixing constant
already used in RH's Davenport-Heilbronn control is exactly the RR special
value kappa=r(i). More strongly, the odd period-five sine-Fourier involution
is the normalized RR inversion matrix after exchanging its two coordinates.
The surface parameters can be recovered from kappa by rational formulas.

The [proposed final section](MANUSCRIPT_ENDING.md) includes the theorem,
proof, a complete theta/Mellin derivation of the symmetric functional equation
from classical Poisson summation, and a return to the two distinct CM points
i and tau163. This is ready for mathematical/editorial integration as a draft;
it is not a compiled or published manuscript.

The ending is an exact scalar-and-operator dictionary. It does not identify
the entire ruled surface with a modular curve, or turn the DH function into
a counterexample to zeta RH. SOURCE_MAP.md records which actual repository
results are adopted and which tempting additions are omitted.

## Recommended final paper arc

1. Start with Hermite's 1859 near-integer observation and the original question
   about c0, keeping integral modular values distinct from the exponential.
2. Derive the HMR singularity parameter and its pentagonal coordinate.
3. Present the established RR/Heegner-163 field and its explicit golden
   subfield, with classical CM inputs credited.
4. Explain the marked icosahedral chord ratio and conjugate metrics.
5. End with kappa_DH=r(i), prove equality of the two involutions, and return
   to the different roles of the CM evaluations i and tau163.

Two substantive additions suffice: the HMR pentagonal identification and
the common-involution closure theorem. Functional-equation symmetry and
coefficient multiplicativity are separated in the ending. No claim that
Euler products alone force positivity or critical-line zeros is required.

## Verification and preservation

```sh
/Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/check_closure.py
```

The checker uses the installed SymPy/mpmath runtime, derives the surface
cross product, checks the exact radical/matrix/round-trip identities, and
separately records 80/120-digit diagnostics. It writes only this packet's
RESULTS.json. The numerical root is a diagnostic, not a new certified result
or a proposed contribution to the paper. No dependency installation occurred.

Old source files, manuscripts, releases and checkpoint manifests are read-only
inputs. The 73 authored files bound by the five earlier manifests remain
unchanged. The RH workspace is not edited. CLI reports, source hashes, access
limitations and failed attempts are preserved under ignored logs/. No commit,
push, public action, new Lean proof or PDF release is included.
