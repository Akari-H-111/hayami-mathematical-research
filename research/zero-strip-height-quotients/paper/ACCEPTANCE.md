# Completion audit: thematic manuscript v0.1

Date: 2026-10-18. Scope is the user's requested continued local research through
Codex CLI gpt-5.6-terra until it can be consolidated into a thematic paper.
The governing RESEARCH_MANDATE.md preserves that objective and its delivery
gates. This audit evaluates current files and executed checks, not intent.
Completion means a substantive, reviewable working manuscript, not acceptance
by a journal, proof of RH, or completion of every open research question.

## Requirement-by-requirement evidence

| Requirement | Current authoritative evidence | Disposition |
|---|---|---|
| Direct the exact requested CLI model | Both research and fresh read-only review session turn_context metadata show gpt-5.6-terra; both exited 0. PROVENANCE.json retains the observed identifiers; raw evidence remains in logs/ | PROVED operationally; no model substitution |
| Use attachments as reference data and isolate work | Parent TASK.md records the reference treatment and rewritten professional preflight. This continuation lives only in paper-development-20261018. Both original attachment SHA-256 values match the parent register | PASS; no attachment instruction promoted to user authority |
| Pursue substantial connected research and useful extensions | Final TeX contains complete theorem/proof chains for support periods, quotient metric/limit/rate, raw mass, critical-line residue/closure bounds, stability, infinite sparse product, retained asymptotic classes, and the Dirichlet-series obstruction | PASS at written-proof level, with named external inputs |
| Coherent English manuscript | Nine-page final PDF has title, abstract, definitions, precise hypotheses, written proofs, related work, limitations and concrete open questions. The TeX is authoritative over earlier Markdown drafts | PASS |
| Stronger rather than merely larger research | The new chain advances the former support gap, derives an actual quantitative quotient limit, and constructs an infinite controlled obstruction model with an arithmetic boundary | PASS; a connected synthesis rather than RH claim |
| Raw inputs, methods, tools and independent acceptance criteria | Parent TASK.md and continuation LITERATURE_POSITION.md explicitly identify xi divisor/source inputs, quotient/product methods, exact arithmetic, Lean kernel, cold review and reproduction criteria | PASS |
| Precise analytic source scopes | SOURCE_AUDIT.md and six final bibliography links; FZ smooth class and all-zero multiplicities; BCY simple-zero proportion; exact KMP context. Original Hlawka/Fujii texts were not separately retrieved, explicitly disclosed | PASS within the cited-source scope |
| Serious originality/overlap assessment | ORIGINALITY_AND_SCOPE.md and LITERATURE_POSITION.md acknowledge prior circle statistics and functional-equation constructions. Final abstract makes no priority claim | PASS for synthesis framing; exhaustive priority remains untested |
| Claim/dependency separation | CLAIMS.md maps every substantive analytic assertion to TeX labels, external inputs, or written proof and isolates two scalar Lean inequalities and finite checks | PASS; no whole-paper formalization claim |
| Relevant prior baseline | Parent logs/continuation-baseline-20261018.log ends replay: PASS, including three earlier Lean modules and guard checks | PASS; earlier 23 named theorems retain their limited scope |
| Meaningful new exact/formal checks | logs/final-replay.log passes rational tail checks, 1827 complex finite cases, both guards at optimized compile levels 1/2, and two Lean scalar inequalities under warningAsError. Lean reports only propext, Classical.choice, Quot.sound | PASS; not an analytic zeta proof |
| Actual pinned dependencies | Lean v4.33.1 and Mathlib 0df444a360eaa60ab8c11dca51a86af692955474 are checked in replay; tracked Mathlib state is clean | PASS for existing local environment |
| Independent-context mathematical cold review | COLD_REVIEW.md is verbatim fresh read-only CLI output. It read the complete mathematics and primary sources, found no blocking gap, and proposed five clarifications | PASS for fresh model review, not external human peer review |
| Resolve review actions against final source | REVIEW_RESOLUTION.md maps all five actions to the final TeX. Supervisor inspected multiplicity, endpoint, closed-set, Landau-error and Hamburger-hypothesis repairs | PASS; no unresolved blocker |
| Compile final PDF | Clean Tectonic 0.17.0 log; qpdf reports no syntax/stream errors; desktop editor compiler also reports success for current source | PASS |
| Inspect final rendered artifact | All nine final pages rendered at 110 dpi and visually inspected. No clipping, overlap, missing glyphs or unresolved references observed; text checks find no out-of-page characters, replacement glyphs or ??; all fonts embedded; six bibliography URI targets match | PASS; QA binds to final PDF hash in ACCEPTANCE.json |
| Reproduce copied computational sources | logs/copy-replay.json and copy-replay.log show PASS from an isolated temporary copy. Copied source hashes match final scripts and Lean file | PASS using same pinned environment; clean-machine installation untested |
| Preserve unrelated work and earlier evidence | Current SHA-256 comparison matches all 962 baseline tracked files, all 27 prior-workstream authored files and both original reference attachments | PASS; no root/old-paper mutation by this continuation |
| Keep existing ten papers separate | Root navigation check passes 13 guides, 103 local links, ten current papers, 35 source hashes/TeX inputs. No new catalogue entry or release was made | PASS |
| Preserve failed attempts and provenance | Ignored logs/ retains failed TeX attempts, clean final build, dispatch/results, baseline hashes and QA records. Earlier research notes remain labeled intermediate | PASS |
| No unauthorized external action | Work was local; no commit, push, publication or messaging tool action was taken | PASS |

## Acceptance and limits

The research-to-working-paper objective is achieved by the evidence above.
The delivered interpretation is narrower than an RH result but does not shrink
the requested research objective: it answers the proposed geometric question
with a complete connected theorem chain and identifies exactly what the
observations fail to determine.

Explicitly unverified or open: exhaustive novelty and journal suitability;
external human review; a fresh dependency installation on another machine;
full Lean formalization of analytic inputs/product/quotient results; RH;
critical-line-only equidistribution; interval secondary asymptotics; and
fine-scale tests that recover a sparse off-line divisor. No gate above uses
finite checks to establish any of those claims.

The final PDF and TeX must not be silently replaced. A revision requires a new
version plus renewed relevant review, build, page inspection and hashes.
