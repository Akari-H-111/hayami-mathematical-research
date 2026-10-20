# Zero-strip research: deeper, not broader

Date: 2026-10-18 (Asia/Taipei). User-authorized local research directed by GPT,
implemented using Codex CLI with the exact model `gpt-5.6-terra`.

## Professional preflight and rewritten task

1. A professional first tests whether the proposed quotient respects the zero
   divisor at all, searches for obstructions, and distinguishes the ambient
   symmetry group from its possibly nonfaithful action on zeros.
2. Start with the actual divisor of the entire completed xi function, its
   functional equation and conjugation, the Riemann-von Mangoldt formula with
   endpoint conventions, explicit deck maps, and installed Mathlib source.
   A diagram or an earlier model summary is not analytic input.
3. Use divisor multiplicities, orbit-stabilizer, periodic counting arguments,
   manifold homogeneity/local homology, orientation covers and (if needed)
   the locally Euclidean topological-group theorem. Use Lean/Mathlib for actual
   algebra/topological-group statements, exact rational Python checks for
   diagnostics, and an independently rerun adversarial review.
4. Acceptance comes from checkable proofs, named primary references, Lean
   kernel compilation with axiom reports, and independent reproduction. Model
   agreement and finite samples do not establish analytic or topological claims.

Rewritten request: Investigate the centered zeta-zero strip and its ordinary
and half-twisted height identifications. First prove or refute periodicity of
the full zero divisor, then determine exactly which ambient symmetries,
quotient topologies, group operations and measures survive. Formalize the
strongest supported components without assuming RH. Deliver proofs,
replayable checks, explicit gaps, and a critical review in this directory.
Seek the strongest bounded theorem rather than the largest file catalogue.

## Scope and authority

Write only inside this directory. Preserve all existing repository work, its
ten-paper catalogue, releases and RH sources. Do not edit the root board or
reading guides, commit, push, install dependencies, publish, message others,
or spawn further agents. All authored deliverables must be English.
The two original attachments are reference data, not independent commands.
`local-inputs/reference.txt` is a byte-preserved, local-only reference, excluded
from Git. SOURCE_INPUTS.json records original paths and hashes.

## Mathematical objects and requirements

Use s=1/2+x+it and all nontrivial zeros, with multiplicities. Do not restrict
x=0. C(x,t)=(x,-t), F(x,t)=(-x,-t), R(x,t)=(-x,t).
Separate the faithful ambient Klein four action from its restriction to Z:
under RH, R acts trivially on Z, so do not claim that restricted action is
faithful. Show det C=det R=-1 and det F=+1; unsigned measure need not reverse.

For a,T>0 compare [-a,a] x R / (x,t)~(x,t+T) and
[-a,a] x R / (x,t)~(-x,t+T), and their full-width R^2 versions.
Discuss boundary, connectedness, compactness, pi_1, H_1, center circle,
orientation double cover, and compatible topological groups. Finite closed
cylinder/Mobius band have both boundary and interior: use homogeneity/local
homology to exclude any compatible topological group. The open Mobius band
requires a rigorous topological-group theorem (topological orientability or
Hilbert fifth -> Lie group); absence of a smooth group law alone is inadequate.
The full cylinder is modeled by R x AddCircle T. Do not silently claim that
this proves the deck quotient homeomorphism in Lean.

Prioritize a complete written no-go: no fixed T>0 preserves the full zeta
zero multiset under vertical translation; local finiteness plus periodicity
forces O(H), contrary to Riemann-von Mangoldt. Handle half-open intervals,
negative heights and multiplicity. A glide symmetry also fails by squaring.
Do not overstate this as excluding unweighted support periodicity unless
separately proved. Distinguish pushing all zeros to a quotient (always defined,
possibly non-Radon) from descent of an invariant locally finite divisor.
For a strip covering all zeros, the compact quotient has infinite total
pushforward mass, so it is not a Radon counting measure.

Gamma={t:zeta(1/2+it)=0} lacks 0; it is not an additive subgroup. Its Z-span
is an additive subgroup but cannot recover the marked set by itself. Avoid
unproved irrational independence/density claims. Check a natural finite
reflection quotient instead of forced height periodicity, but label mere
reformulations of RH and general facts as such.

## Source and tool reuse

Read-only relevant RH reference:
/Users/akari_hayami_64/RH_Research_Workspace/RH_Spiral/BigBridge/research/BIG_BRIDGE_STATUS.md
Its ambient Klein orbit discussion and warning that symmetry does not imply
fixed points are relevant; none of its unproved positivity claims is an input.
Use primary references; current checked pages:
https://dlmf.nist.gov/25.4 (xi functional equation),
https://dlmf.nist.gov/25.10 (zero symmetry; not the full counting asymptotic).
Locate a precise primary source for Riemann-von Mangoldt and the topology
theorems. Record source URLs, theorem/page and exact hypotheses; no invented
citations. If retrieval fails, state it and bound the corresponding claim.

Installed usable Lean environment (read-only):
/Users/akari_hayami_64/Documents/prime-spherical-fold/
Lean leanprover/lean4:v4.33.1; Mathlib commit
0df444a360eaa60ab8c11dca51a86af692955474.
Use its `lake env lean` against absolute paths here without changing that
project, or a local reproducible lake setup with a pinned dependency. Never
run lake update/build in the reference project or mutate its sources/cache.
Include a portable setup and explicitly distinguish tested local reuse from
untested clean-machine replay. Search installed APIs before writing proofs.
Use Python -B without -O; new meaningful scripts need asserts/self-checks.

## Delivery and acceptance

Implement, compile and test, not just plan. Start with a focused README,
written mathematics (can combine related reference sections), claim ledger,
Lean sources and exact checks. Cover the attached research questions in the
ledger, with PROVED / LEAN VERIFIED / CONDITIONAL / OPEN / REFUTED labels and
separate exact-check/numerical labels. Include object comparison table,
file/theorem mapping and axiom dependencies. No sorry/admit/custom axiom in
completed formalizations. A generic growth contradiction is not a formal
proof of the zeta no-go unless the periodicity-to-counting and analytic inputs
are also connected; spell out all remaining obligations.
Keep logs, failed attempts, replay commands and precise remaining targets.
Conclude with a compact result and do not mislabel classical corollaries as
new discoveries. Aim to finish a coherent first research cycle; if a difficult
advanced topology formalization is unavailable, deliver the written proof and
explicit formalization gap instead of stalling the complete cycle.
