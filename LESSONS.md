# Lessons

- 2026-09-12 — Resolve cache moves from the project root or use absolute paths; a command run inside a companion directory must not assume root-relative paths.
- 2026-09-12 — Use the registered virtual-environment interpreter or `python3`; this macOS environment has no `python` alias.
- 2026-09-12 — Ruby `YAML.safe_load` treats unquoted ISO dates as `Date`; permit `Date` explicitly when syntax-checking CFF metadata.
- 2026-09-12 — Zenodo browser automation could not start because its Node runtime was unavailable; verify UI runtime before relying on it for publication.
- 2026-09-12 — Zenodo's public record API uses a legacy flattened response without `pids`; inspect response keys before parsing DOI fields.
