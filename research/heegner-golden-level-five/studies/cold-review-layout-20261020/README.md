# Independent cold review of manuscript proportions — 20 October 2026

**Outcome: substantial editorial restructuring recommended.** Two fresh CLI
sessions independently read the same nineteen-page manuscript and all nineteen
rendered pages. Both describe an article interrupted by an atlas: twelve
landscape figure sheets dominate the sequence, related arguments are separated,
and figure labels remain small despite the large page allocation.

Start with [the director's synthesis and corrected revision proposal](DIRECTOR_SYNTHESIS.md).
It distinguishes consensus, measured facts, reviewer errors and editorial choice.
The proposed first trial uses a portrait article with four compact figure groups,
keeps the CM/Hermite-to-c0 strand visible, and preserves every original plate in
the separate atlas. It is a proposal; no revised manuscript is delivered here.

## Independent reports

| Reviewer | First read before TeX | Full audit | Layout proposal | Actual checks and limits |
| --- | --- | --- | --- | --- |
| Codex CLI GPT-6.1 Sol, high | [FIRST_READ](sol61/FIRST_READ.md) | [REPORT](sol61/REPORT.md) | [LAYOUT_PLAN](sol61/LAYOUT_PLAN.md) | [LIMITS](sol61/LIMITS.md) |
| OpenCode DeepSeek V4.1 Flash Free, max | [FIRST_READ](deepseek/FIRST_READ.md) | [REPORT](deepseek/REPORT.md) | [LAYOUT_PLAN](deepseek/LAYOUT_PLAN.md) | [LIMITS](deepseek/LIMITS.md) |

Raw reports remain unedited. They are local AI cold reviews, not human peer
review or journal decisions. Limited mathematical spot checks are separately
identified in their limits files; this is not a complete theorem certification.

## Snapshot and method

- [Method and isolation](REVIEW_METHOD.md): PDF first; first impressions written before source inspection; no earlier reviews or author conversation supplied.
- [Frozen manuscript](input/paper.pdf), [TeX](input/main.tex), and [page inventory](input/PAGE_INVENTORY.csv).
- [Client model selections](provenance/CLI_SELECTIONS.json), [access-order audit](provenance/COLD_READ_ORDER_AUDIT.json), and [preservation record](provenance/PRESERVATION_CHECK.json).

Exact geometry: 19 Letter pages; 12 landscape figure sheets in four blocks;
7 portrait pages; 8 orientation changes. Page allocation is not a score of
mathematical merit. Graphic boxes occupy approximately 37.6–43.5% of the landscape
sheets; necessary figure text needs final-size recomposition rather than a simple
reduction into portrait width.

The original paper, atlas and source archive remain unchanged. Author information
is preserved as Akari Hayami (Jian-Yu Huang), akari.h.1.9984@gmail.com. The next
local action is an editorial layout revision with renewed page-level QA and
hashes; an external subject-expert mathematical reading remains a separate task.
