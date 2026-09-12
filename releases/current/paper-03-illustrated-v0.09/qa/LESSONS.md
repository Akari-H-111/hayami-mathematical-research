# Build lessons

- 2026-09-08 — Paper I has no shared build.py at the assumed location; verified and reused the existing Paper II toolchain instead.
- 2026-09-08 — Finite recovery dependencies live under part_II; verified imports before copying the portable evidence tree.
- 2026-09-08 — TikZ use-as-bounding-box fixed the height to zero and clipped the first renders; use an ordinary invisible path for minimum width and verify rendered dimensions.
- 2026-09-08 — AMS mathbb does not supply the intended lowercase field glyph; reuse the manuscript's Bbbk command and inspect the rendered glyph.
- 2026-09-08 — Figure destinations must be checked in numeric order once figure 10 exists, not PDF name-tree order.
- 2026-09-08 — A verification process handle was unavailable after a new user message; rerun the final check and capture its complete output.
- 2026-09-08 — Caption detection mistook a wrapped callout ending in Figure 2. for a caption; require caption text on the same line and validate PDF destinations separately.
- 2026-09-08 — Regex whitespace also matches newlines; use horizontal whitespace to enforce same-line caption detection.
- 2026-09-08 — Unbounded floats placed the overview inside a later theorem; add a barrier after every figure and inspect all resulting pages.
