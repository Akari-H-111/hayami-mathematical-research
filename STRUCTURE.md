# Canonical structure

This file records the public-facing directory contract. It is intentionally small: release artifacts remain self-contained, while source, evidence, and history are separated by authority.

| Area | Authority | Contents |
|---|---|---|
| `papers/` | manuscript-level | current papers and PDF-authoritative reconstructions |
| `companions/` | formal-source | reusable Lean source outside sealed ZIP packages |
| `verification/` | executable evidence | replay scripts, shared algebra, and reconstruction harness |
| `releases/current/` | immutable delivery | current PDFs, source archives, receipts, and manifests |
| `releases/archive/` | historical delivery | superseded but preserved releases |
| `archive/` | local-only provenance | supplied drafts, incomplete recovery, and historical records; ignored by public Git |
| `local/` | machine-local | caches, generated builds, and previews; excluded from publication |
