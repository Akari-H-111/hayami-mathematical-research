# 2026-10-07 Environment, document and Git preservation

The research record of this round is in
[cross-workstream-renewal-20261007](../cross-workstream-renewal-20261007/README.md).
Its receipt and manifest were re-issued once, only to bind its English edition
(see "Language correction" below); this page supplies the updated preservation
method and the environment correction.

## Verified environment

| Workstream | Actual versions | Local interpreter |
| --- | --- | --- |
| AHR | Python 3.12.14, NumPy 2.3.5, SciPy 1.18.1, SymPy 1.14.0 | `Documents/hayami-mathematical-research/the-Self-Adjoint-Arithmetic-Mellin-Transform/post_s11_discovery/.venv/bin/python` |
| RH / GIR | Python 3.14.6, NumPy 2.5.2, SymPy 1.14.0, mpmath 1.3.0 | `tagd-gir-research/.agent-venv/bin/python` |

Paths are relative to the local user directory. The old TAGD_Master_Paper path
is a compatibility link. The central research record's statement that every
environment was 3.12.14 was a textual slip; the runtime fields of RESULTS.json
were correct from the start. This page corrects that sentence without
rewriting any sealed archive. The runs used -B, assertions and single-threaded
BLAS; no package was installed or changed in version, no venv was moved, and no
other window's processes or caches were deleted.

## Preservation and push scope

The complete new AHR prototypes, the two batches of 3,136 cases, the failure
records and the new handoff documents are preserved in the
[AHR private repository](https://github.com/Akari-H-111/adaptive-harmonic-reconstruction).
The original RH-SPIRAL folder has no Git; the two new research packages and
their base sources are preserved as byte-for-byte copies in that private
repository under `references/checkpoints/research-renewal-20261007/`, except
that the Traditional Chinese documents among them were later replaced by
English editions (see "Language correction"). The original folder and the old
PDF / sealed ZIP files all remain. The complete verification entry point is the
private repository's `tools/verify_research_save_2026_10_07.py`, which rebinds
the relative paths of the preserved copies without modifying any historical
receipt. The claims, data consumption and numerical replay scope are in its
current docs/HANDOFF.md, docs/ENVIRONMENT.md and
docs/CHECKPOINT_2026_10_07.md.

The shared public repository holds only this round's navigation, the central
summary and the receipt; it does not contain private algorithms, the new RH
manuscripts or the private V7 historical material. The existing local main and
origin/main have diverged and hold other windows' uncommitted work, so this
round created the branch `codex/research-renewal-20261007` from origin/main for
the commit / push. Other windows' index, working tree and local main are not
reset, rebased or merged by pushing that branch. This round changed no
ResearchGate / Zenodo record, released PDF or release.

## Replay boundaries and continuation

Source / archive hashes, seed separation and the historical development
bindings are integrity checks. The full-row and bootstrap re-aggregation of the
two AHR batches and the replays of the nine cases / 36 and 45 method outputs are
recorded separately from the numerical recomputation of the 147 RH heat-moment
samples and the 114 finite GIR checks. The general sign criterion, the two-sign
result for higher-order heat moments and the geometric bracketing theorem rest
on the written proofs; no new Lean or RH proof was added. Replays from a new
clone still use the existing runtimes of the same machine, so they cannot be
taken as verifying installation on a fresh machine.

The latest continuable work is the AHR soft-root weights and drift leakage, the
RH error bounds for higher-order moments, and the uniform heat bound on the full
punctured GIR locus. All the newly confirmed data are now consumed.

## Language correction

This checkpoint was first published with Traditional Chinese prose, both in this
repository and in the private AHR repository, contrary to the project rule that
all externally published or shared content, including content pushed to private
repositories, is written in English (the commit messages themselves were already
English). It was corrected the same day; no mathematical content, number or claim
changed. The history of this branch and of the private repository's main branch
was then rewritten once (force-push) so that the first publication, which
contained the Chinese text, is no longer part of either history.

- In this repository, the renewal README was replaced by a faithful English
  edition, the two RESEARCH_BOARD.md entries were rewritten in English, and this
  note was translated.
- The receipt binds the renewal README by SHA-256, so the receipt and the
  manifest were re-issued. The only change inside `RECEIPT.json` is the SHA-256
  recorded for `README.md`; every other recorded hash is untouched. The
  table below identifies the replaced files by their hashes; the earlier bytes
  are not kept in this repository.

| File in `research/cross-workstream-renewal-20261007/` | SHA-256 in the first publication | SHA-256 now |
| --- | --- | --- |
| `README.md` | `9305d9adfa361ccc2e5ba693b199e40a2662c17d23661ee2f99690a6b39e8f41` | `8330085679e855bc47af52fc4a6ae27d41ec17ad82928bef1ce577a589d73f37` |
| `RECEIPT.json` | `9882b610d0194b1b0c0838e5f51f3ae468a0aaa578790ae987a04896df679863` | `1f4c667afb9428fcdbb49e0c7115b8363a6e1ade8508e0fd8f9778fbd3e5e43d` |
| `MANIFEST.sha256` | `6ce694d4aa421e07dd3482f40b1a478d328ef1b41190a965c9c9f832ba31ddd7` | `bb3671a484becd100678b19f0c2470fedec407b5f62a89aa2367decc0c717d3b` |

`CHECK.json` and `verify_receipt.py` are unchanged.

In the private repository the same correction was applied to the documents added
by its first checkpoint commit and to the Traditional Chinese source documents in
the checkpoint, which were replaced by English editions with the original SHA-256
recorded in `SOURCE_MAP.json`; see `verification/language_correction_2026_10_07.json`
there. The historical replay files preserved in that checkpoint keep the hashes
they originally recorded.
