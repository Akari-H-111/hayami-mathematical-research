# Rebuilt-source visual QA

Date: 2026-09-11

All three candidate/ancestor sources were rebuilt with Tectonic 0.17.0. `qpdf --check` found no syntax or stream errors.

| rebuild | sampled PDF pages | result |
| --- | --- | --- |
| v4 ancestor, 13-page A4 | 1, 7, 13 | pass: title/contents, parameter-space figure, summary table, and references are visible without clipping or broken assets |
| v5 content-aligned candidate, 10-page letter | 1, 5, 10 | pass: equations, two-panel plots, exact-certificate table, and references are visible without clipping |
| v12 ancestor, 26-page letter | 1, 13, 26 | pass: dense abstract, spectral figure/equations, and final bibliography page are visible without clipping or missing figures |

The logs contain only underfull-box warnings in a small number of paragraphs. These do not indicate missing content. This visual pass certifies rebuild usability only; it does not change the v4/v12 `ancestor` classifications.
