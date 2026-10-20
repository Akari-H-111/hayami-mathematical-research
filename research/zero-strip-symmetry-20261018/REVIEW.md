# Adversarial review

This post-proof reread was performed after the proofs and scripts were written,
using the acceptance criteria as hostile questions rather than as evidence.
`REVIEW_TASK.md` is a separate, read-only protocol for a genuinely independent
fresh-session review. That review is now saved verbatim in `COLD_REVIEW.md`;
the supervisor's fixes and provenance correction are in `REVIEW_RESOLUTION.md`.

| Challenge | Finding | Resolution / remaining gap |
|---|---|---|
| Did the argument assume RH by putting every zero at `x=0`? | No. | The divisor is on the full centered critical strip throughout. |
| Does functional symmetry preserve multiplicity or just support? | It preserves order under holomorphic reflection and conjugate real structure. | Stated explicitly in §1. |
| Could `V_4` be called faithful on zeros? | Not safely. | The document says faithful only on the ambient plane and notes RH makes `R|Z` trivial. |
| Does `O(H)` count the same endpoint twice? | It could without a convention. | The proof partitions half-open cells and uses `(0,H]` for `N(H)`; it needs no assertion about height zero. |
| Is the finite fundamental cell actually finite? | Yes only after using the entire xi divisor and a compact rectangle. | This compactness/local-finiteness step is made explicit. |
| Does RvM count multiplicities? | Yes by its standard definition. | Sources and convention are recorded; the proof does not replace it by numerical zero data. |
| Does the proof refute support periodicity? | No. | The ledger labels that question OPEN. |
| Does a glide obstruction require a new analytic theorem? | No. | Squaring gives a vertical period; this is separately Lean checked for the abstract glide map. |
| Does a quotient exist only if zeros descend? | No. | The ambient quotient and extended pushforward always exist; local finite divisor descent requires invariance. |
| Is infinite total mass enough to deny Radon on a compact quotient? | Yes. | Radon measures are finite on compact sets; the whole compact quotient is such a set. |
| Is “no smooth group law found” a proof for the open Mobius band? | No. | Replaced by locally Euclidean topological group ⇒ Lie group ⇒ orientable. |
| Are the closed bands excluded merely by a drawing? | No. | Homogeneity versus local homology at boundary/interior is the stated proof. |
| Does Lean prove the analytic no-go? | No. | The formalization map says exactly which elementary lemmas compile and names the unformalized analytic obligations. |
| Are finite calculations being passed off as evidence for zeta? | No. | The only diagnostic uses exact rationals and is labeled finite-model only. |
| Are citations invented or DLMF overused for RvM? | No. | DLMF is used only for xi/symmetry; Titchmarsh is named for RvM, while the original von Mangoldt source is historical provenance. |

**Verdict.** The bounded theorem is supported: the full multiplicity divisor
has neither ordinary nor glide height periodicity.  The remaining advanced
formalization targets are clear, but their absence does not invalidate the
written classical argument.  No RH claim, new discovery claim, support
periodicity claim, or quotient-measure finiteness claim survives review.

**Strongest next bounded target.** Formalize an abstract locally finite
integer divisor on a height-indexed discrete cell decomposition: period (or
eventual period) implies a linear upper bound on its cumulative mass.  This
would subsume the current real-sequence lemma while still honestly leaving the
analytic bridge—an axiom-free Mathlib formalization of xi zeros and an RvM
lower bound—as a separately named target.  The next topology target, lower
priority, is a formal quotient/homeomorphism theorem for the ordinary deck
action; it must not be inferred merely from the `AddCircle` group model.
