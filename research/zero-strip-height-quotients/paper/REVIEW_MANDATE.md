# Independent final-mathematics review

You ARE the independent reviewer being invoked in a fresh read-only Codex CLI
session with the exact model gpt-5.6-terra. Do not launch another CLI or agent.
Your final output is saved only after your turn finishes; its absence while
you are running is not a missing-review defect. Inspect actual mathematics,
not self-guessed model identity. Do not modify files, install, publish or commit.

The authoritative proposed paper is `manuscript/main.tex` (about 600 lines).
Read it completely. The other MD proof documents are earlier intermediate
research records, and `DIRECTOR_DERIVATIONS.md` records the supervising
derivations. Check `SOURCE_AUDIT.md`, `ORIGINALITY_AND_SCOPE.md`, `CLAIMS.md`,
and new `Lean/EmpiricalStability.lean` and the verification scripts for exact
scope. Do NOT dump all logs or attached historical documents. You may rerun
the normal Python -B checks but need not recompile Lean or render the PDF;
the supervisor performs those checks. Primary sources are linked in the TeX.

Review the entire new theorem chain:

1. Hlawka all-zero equidistribution and Selberg's stated density bound are
   unconditional and count multiplicities. No critical-line-only
   equidistribution, all-zero simplicity, or interval secondary conjecture
   may be smuggled into a theorem.
2. Dense projected support, eventual equivalence (not just upward injection),
   finite fundamental slabs and glide squaring.
3. Quotient metric, its topology, central retraction and Lipschitz estimates
   for both deck signs. Layer cake gives sum m|beta-1/2|=O(H); verify the
   rate and CDF endpoint integration. Every central-point neighborhood has
   infinite raw mass; no such claim is made for all off-center points.
4. Simple critical-line residue bound and liminf constant, plus Haar measure
   >=0.4 for closure of critical-line residues. Verify the closed-set
   weak-limit inequality has the correct direction.
5. Infinite product: normal convergence, no hidden zeros, simple added roots,
   positive axes, explicit compact tail bound, maximum-modulus order-zero
   estimate, and closed-endpoint extra count 2 floor(log_2 H).
6. Normalize finite-height probabilities correctly after adding zeros.
   For the 1/H secondary functional use N_X(H), not N_xi(H), in the centering.
   The FZ limit is for C^2 smooth tests; all bounded-test *stability* does
   not imply all bounded-test limits exist.
7. Check the new Landau-asymptotic and zero-density error-class preservation
   claims, and ensure they are not confused with an exact explicit formula.
8. New arithmetic-boundary proposition: zeta(s)P(s-1/2)/P(1/2) retains the
   gamma-factor functional equation, trivial zeros and residue, but real-axis
   growth excludes an ordinary absolutely convergent Dirichlet series.
   Confirm its relation to Hamburger's theorem is correctly limited.
9. Citation accuracy and overlap: this is a theorem-led synthesis/obstruction
   study, not an asserted new RH breakthrough. Evaluate whether the
   manuscript is coherent enough to be a thematic paper draft and identify
   proof gaps that would block that status. Do not require proof of RH or
   full Lean formalization, which are explicitly outside the manuscript claims.

Return: verdict on mathematical manuscript readiness; prioritized actionable
findings with TeX line numbers; proof corrections if needed; exact checks
actually performed; and any unresolved novelty/claim boundary. Treat a
plausible but unproved step as unverified. Preserve the user's real objective:
a substantive thematic manuscript, not an attractive collection of easy tests.
