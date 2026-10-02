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
- 2026-10-02 — Zenodo's web buttons (reserve DOI, resource type) may not register in a hidden Chrome tab; create the draft and reserve the DOI through the official REST API with the signed-in session's CSRF token. A publish also needs `metadata.publisher` ("Zenodo"), and `rights` must be sent as `[{id}]` only.
- 2026-10-02 — ResearchGate drops an uploaded figure that has no caption, auto-extracts figures with garbled captions (rewrite them), and refuses publication edits with "Edit limit reached" after a burst of edits; plan old-page wording changes before the new-entry edits and do not retry in a loop.
- 2026-10-03 — `open(path, 'w').write(f())` truncates the file before `f()` can read it. Compute the new text first, and copy shared multi-window files to scratch before scripted edits. This truncated `SOURCE_REGISTRY.md` once; it was rebuilt from the publish-branch copy plus the diff hunk shown earlier, and its first paragraph matched the sealed Ruled v0.03 payload copy byte for byte.
- 2026-10-03 — Plumbing commits on an isolated branch (temporary `GIT_INDEX_FILE`, `git commit-tree`, `git update-ref`) protect other windows' uncommitted work, but local `main` then diverges from `origin/main`; the author syncs it after committing that work (see `EXTERNAL_ACTIONS.md`).
