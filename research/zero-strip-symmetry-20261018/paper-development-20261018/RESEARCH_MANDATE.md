# Research mandate: a coherent thematic manuscript

Date: 2026-10-18 (Asia/Taipei). The user requests continued research, directed
through Codex CLI's exact model `gpt-5.6-terra`, until it can be assembled into
a substantive thematic paper. Intellectual exploration and useful extensions
are authorized. This is not permission to publish, commit, push, overwrite
earlier evidence, or assert RH. Do not replace the objective with a small set
of easy checks. Produce a connected argument with honest contribution status.

Write only in this continuation directory. The parent workstream is historical
first-cycle evidence; read it but do not rewrite it. The ten-paper catalogue,
other research, releases, source manifests and receipts remain untouched.
All authored files must be English. Do not install dependencies or launch
additional agents/CLI sessions. The supervisor handles independent review,
PDF assembly/visual QA, and final acceptance against this mandate.

## End state and acceptance requirements

- A coherent English manuscript with title, abstract, definitions, theorem
  statements, complete written proofs, classical inputs with precise primary
  citations, limitations, related work and concrete open questions.
- An actual connected mathematical contribution or clearly identified
  synthesis, with a serious originality/overlap assessment. Do not call an
  obvious corollary a new number-theoretic breakthrough. Do not silently weaken
  an intended theorem to make the manuscript appear complete.
- A claim/dependency ledger separating classical external input, our derived
  theorem, Lean kernel proof, exact finite diagnostic, numerical evidence,
  countermodel and OPEN statement. Every substantive claim must map to a proof.
- Reproducible checks of meaningful computational/formal components. Existing
  parent Lean source pins remain usable read-only. Do not inflate the formal
  scope. In particular, Mathlib's completedRiemannZeta0 is not Riemann's xi.
- A compiled, visually checked manuscript PDF, an independent cold review
  covering the final mathematics, resolutions of blocking findings, and a
  current-state acceptance audit. The supervisor completes these delivery gates
  after research; do not falsely report them as already done.
- Preserve failed attempts and superseded candidates in local-only logs or
  dated research notes. A live goal remains active if research or manuscript
  gates remain incomplete.

## Promising core: investigate and prove, do not presume

The provisional theme is height quotients of the Riemann zero divisor:
equidistribution, failure of local finiteness, and asymptotic blindness to
sparse off-critical perturbations. Prefer a theorem chain that explains what
the original cylinder/Mobius intuition can and cannot detect.

1. **Strengthen the support result.** The first-cycle no-go only used
   multiplicity counts and left support periodicity undecided. Primary sources
   below provide unconditional uniform distribution of gamma/L mod 1 for any
   fixed L>0. Together with bounded-slab local finiteness, this should exclude
   full and eventual translation or glide invariance of the *unweighted*
   complete zero support. It also gives infinitely many projected ordinates,
   density on every height circle, and infinite pushforward mass on each
   nonempty open arc. Prove quantifiers and distinguish all zero ordinates
   from the critical-line-only set Gamma.
2. **Actual quotient measure theorem.** For centered zeros rho=1/2+x+i gamma,
   define the normalized positive-height empirical measure on a closed strip
   quotient (width a>=1/2), ordinary or half-twisted. Hlawka equidistribution
   plus the unconditional zero-density estimate imply that almost all weighted
   zeros lie within any fixed epsilon of x=0. Investigate the weak limit on the
   compact cylinder/Mobius band: is it Haar measure on the central circle?
   Supply a rigorous quotient topology/metric or continuous-test-function
   proof for the twist, endpoint conventions and multiplicities. Do not assume
   equidistribution for the critical-line-only zeros if the source proves it
   only for all zeros. Establish exactly where raw pushforward fails local
   finiteness. Explain that a central-circle probability limit would not by
   itself prove RH.
3. **Quantitative critical-line residue complexity.** A positive proportion
   of simple critical-line zeros is known unconditionally. With distinct
   positive critical heights up to H, each single residue mod L contains at
   most floor(H/L)+1 such heights. This suggests a lower bound of order log H
   on their number of distinct residues, and excludes fixed/eventual support
   periods of Gamma without assuming RH. Check the exact source constant;
   use a conservative c such as 0.4 only if the retrieved theorem supports it.
   Do not confuse simple-zero counts, counts with multiplicity, and distinct
   ordinates of zeros off the line.
4. **Infinite sparse countermodel, stronger than a finite polynomial.**
   Investigate the even real entire canonical product, with 0<a<1/2,
   z_n=a+i b_n and b_n>=2^n,

       P(w)=product_n (1-w^2/z_n^2)(1-w^2/conj(z_n)^2),
       X(s)=xi(s) P(s-1/2).

   Prove normal convergence, the precise zero divisor and multiplicities,
   positivity/nonvanishing on real and imaginary axes, and infinitely many
   prescribed off-line zeros. For b_n=2^n, the added positive-height count is
   O(log H), so the full RvM main terms and O(log H) remainder class should
   survive. Critical-line zeros and real sign pattern should be preserved;
   exact critical-line *values* are not preserved. Determine which quotient
   weak limits and prime-resonant second-order smooth height statistics are
   unchanged. Never assert an Euler product for X or call X a zeta/RH
   counterexample. Include only conclusions with proved growth/tail controls.

   A possible exact compact tail majorant for |w|<=R after factors 1..N is
       B_N=(2 R^2/3)4^(-N)+(R^4/15)16^(-N).
   Verify it from sum |factor_n-1|. When B_N<1, derive a valid tail-error bound
   (for example B_N/(1-B_N)) before treating truncation numerics as certified.
5. **Novelty and arithmetic content.** Hlawka/Ford-Zaharescu already study
   quotient equidistribution and prime-resonant secondary measures. Identify
   what our cylinder/Mobius formulation and sparse-perturbation theorem add,
   what is a direct classical corollary, and whether anything is only a new
   presentation. If appropriate, incorporate their *proved smooth-test*
   second-order theorem (not a conjectural interval version). Since sparse
   extra zeros contribute O(log H), a 1/H-scaled smooth-statistic perturbation
   vanishes; prove this carefully with the modified N_X(H) subtraction.

The supervisor has not certified these candidate theorems. Refute or repair
them if needed, and report defects precisely. Useful additional exploration
is welcome when it strengthens this thematic chain; do not dilute it with
unconnected RH analogies or speculative physics claims.

## Primary sources already retrieved by the supervisor

- Ford and Zaharescu, *On the distribution of imaginary parts of zeros of the
  Riemann zeta function*, arXiv:math/0405459v2:
  https://arxiv.org/pdf/math/0405459 . Introduction p. 2 explicitly states
  Hlawka's unconditional uniform distribution and Fujii's unconditional
  discrepancy O(log log H/log H). Definition (1.3) uses all zeros with
  multiplicity. Theorem 1 and Corollary 2 give smooth secondary statistics;
  Conjecture A is NOT an established interval theorem. Lemma 2, p. 7, records
  Selberg's unconditional density bound N(sigma,H) <<
  H^(1-(sigma-1/2)/4) log H, uniformly 1/2<=sigma<=1.
- Ford, Soundararajan and Zaharescu, Part II, arXiv:0805.2745v3:
  https://arxiv.org/pdf/0805.2745 . Inspect if needed for stronger inputs or
  qualifications; do not infer conditional claims are unconditional.
- Bui, Conrey, Young, *More than 41% of the zeros of the zeta function are on
  the critical line*, arXiv:1002.4127:
  https://arxiv.org/pdf/1002.4127 . Inspect the main theorem and exact definition
  of the simple critical-line zero count, rather than relying on its title.
- Parent SOURCES.md pins xi, eta, RvM, topology and earlier related work.

Use primary papers and installed source APIs. Record retrieval versions,
theorem/page, assumptions, and whether a statement is our corollary or theirs.
Avoid unbounded searches and unverified literature claims.

## Reuse and verification

The parent `verification/replay.sh` is being freshly replayed by the supervisor.
Read-only Lean environment:
/Users/akari_hayami_64/Documents/prime-spherical-fold
Lean 4.33.1; Mathlib commit 0df444a360eaa60ab8c11dca51a86af692955474.
Use `lake env lean` against files here; do not update/build that reference
project or mutate its cache. Inspect actual APIs first. Prefer targeted imports
over `import Mathlib`. Never use sorry/admit/custom conclusion axioms in
completed proofs. No theorem-count padding.

Use Python -B, never -O. Every assert-based verifier must guard with
`if not __debug__: raise RuntimeError(...)`, not `assert __debug__`.
Use standard-library exact arithmetic or installed libraries. Each new
meaningful script needs a small regression/self-check. Tests must independently
check the displayed claim; do not self-compare constants.

## Immediate deliverables

Work until the analytical core is developed enough for a manuscript, not just
an outline. Write `RESEARCH_CORE.md`, `SOURCE_AUDIT.md`, `CLAIMS.md`,
`ORIGINALITY_AND_SCOPE.md`, and a self-contained `MANUSCRIPT_DRAFT.md` (or
LaTeX source if preferable). Add reproducible exact verification/formal sources
where they support substantive lemmas. State what remains for the supervisor's
paper compilation, independent cold review, and final completion audit.
Do not describe the goal as complete until those remaining gates are actually
met. Your final response should be a concise handoff with strongest theorem,
actual checks, any failed candidate and next concrete delivery action.
