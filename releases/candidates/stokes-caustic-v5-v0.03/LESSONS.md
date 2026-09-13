# Lessons

- 2026-09-11 - The first replay used macOS system Python, which lacks SymPy; pin and check the verifier dependency before mathematical replay.
- 2026-09-11 - The first venv invocation backed out four directory levels instead of three; resolve the interpreter path from the release directory before replay.
- 2026-09-11 - A clean `lake build` began compiling Mathlib from source; fetch Mathlib's official cache before building the companion modules.
- 2026-09-11 - Earlier background Lean commands lost their exit status and falsely suggested `RootBarriers.lean` passed; require a foreground checked build before claiming compilation.
- 2026-09-12 - The clean checked build exposed and guided repairs to the derivative, positivity, continuity, and equality-direction goals; only the subsequent full foreground build is authoritative.
- 2026-09-12 - A final shell check looked for `SHA256SUMS` although the package contract names it `SHA256SUMS.txt`; read the package entrypoint before checking generated artifact names.
- 2026-09-12 - Repackaging initially verified the stale manifest before regenerating it; rebuild the manifest first so an intentional payload update can be sealed and then checked fail-closed.
