# Fresh v0.2 novelty and figure review

You are a fresh read-only reviewer using the user's exact requested model
 gpt-5.6-terra. Ordinary read-only shell commands are expressly authorized and necessary:
cat, sed, rg, python3 -B verifiers, and image inspection are allowed. The
only subprocess restriction is: do not invoke another Codex/model/agent
session. This restriction does NOT prohibit shell tools for reading files
or running the requested Python checks. Do not modify project files,
install, commit, publish or send messages. Your final response is saved as
COLD_REVIEW_V02.md only after you finish; its absence while running is normal.

Read manuscript/main.tex in full. New material is the abstract/introduction,
prior-work table, three figures/captions and the related-work corrections.
The analytic theorem chain was already cold-reviewed in the parent v0.1.
Read NOVELTY_VERDICT.md (controlling supervisor verdict), NOVELTY_AUDIT.md,
SEARCH_LOG.md, SUPERVISOR_LEADS.md, and the figure generator/checker/tests.
Do not dump all logs. The first audit missed Gauthier-Xarles and misidentified
Fujii's discrepancy bibliography; the final verdict corrects these issues.

Check primary sources as necessary, especially Gauthier-Xarles
https://arxiv.org/pdf/0911.5135 Proposition 1 and Theorem 2 pp. 6-8, FZ
https://arxiv.org/pdf/math/0405459 p. 2 and references [3]/[4] on p. 13, and
the Gauthier-Zeron publisher abstract (2004 issue, 2013 online posting is not
the original year). Do not infer unavailable original texts were read.

Does the new wording accurately concede that prescribed symmetric zero
insertion is prior art and the individual quotient/packing/transfer steps are
standard corollaries? Is the remaining presentation qualified as an explicit
worked synthesis without a verified first theorem or exhaustive priority?
Does Gauthier-Xarles actually give the precise order-zero dyadic tail/growth
constraints? Do not either overclaim or silently equate different hypotheses.

Figure checks: (1) top/bottom seam (x,L)~(e x,0), ordinary/reversed arrows,
central retraction, ambient points not zeta zeros; (2) eta=1/4 roots of the
constructed product, 16 positive-height points n=1..8, negative conjugates
omitted, dyadic count includes endpoints; (3) secondary bound 2M(H)/H for
norm(h)=1 and tail-factor bound B_N(3)/(1-B_N(3)) only when B<1; source rows
mark left limits. No empirical zeta sample, RH proof or interval-secondary
limit is established by a graph. Inspect the three figures via image tool if
available; otherwise explicitly leave visual QA to the supervisor.

Run python3 -B verification/verify_figures.py and
python3 -B verification/test_figure_checks.py if useful. No need for a new
Lean compilation: the formal sources are unchanged and this revision claims
no additional formal scope. Supervisor handles final all-page PDF QA.

Return prioritized blocking/nonblocking findings, exact fixes if needed,
novelty-verdict assessment, figure-caption correctness, and actual checks.
Do not promise certainty a bounded literature search cannot establish.
