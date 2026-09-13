# Lessons

- 2026-09-12 — Resolve cache moves from the project root or use absolute paths; a command run inside a companion directory must not assume root-relative paths.
- 2026-09-12 — Use the registered virtual-environment interpreter or `python3`; this macOS environment has no `python` alias.
- 2026-09-12 — Ruby `YAML.safe_load` treats unquoted ISO dates as `Date`; permit `Date` explicitly when syntax-checking CFF metadata.
- 2026-09-12 — Zenodo browser automation could not start because its Node runtime was unavailable; verify UI runtime before relying on it for publication.
- 2026-09-12 — Zenodo's public record API uses a legacy flattened response without `pids`; inspect response keys before parsing DOI fields.
- 2026-09-13 — Direct Zenodo page opening can be blocked by URL safety; use the official records API for read-only publication verification.
- 2026-09-13 — System `python3` lacks the project dependencies; use the interpreter registered for that verifier instead of assuming one environment covers every replay.
- 2026-09-13 — Run evidence-log regeneration before, not concurrently with, integrated frozen-hash checks; parallel execution creates a transient hash race.
- 2026-09-13 — Paper I's integrated verifier rewrites its tracked QA JSON and omits `author`; restore that preserved metadata after a read-only audit run.
- 2026-09-13 — Run pre-commit checks in a fail-fast shell; a newline-separated command list continued into `git commit` after `git diff --check` reported whitespace.
