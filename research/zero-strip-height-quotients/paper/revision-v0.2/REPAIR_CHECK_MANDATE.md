# Focused repair check

Use exact model gpt-5.6-terra. Ordinary read-only shell commands are authorized.
Do not invoke additional model/agent sessions or modify project files.
Read COLD_REVIEW_V02.md, then inspect manuscript/main.tex lines 70-130 and
verification/build_figures.py plus verification/verify_figures.py and the final
secondary_closed_endpoint in figures/figure-data.json. This is a focused
check of the prior review's two findings, not another full manuscript review.

Confirm that GZ is now only an abstract/metadata-level historical comparison,
while the prescribed-zero/retained-divisor theorem and table row are explicitly
GX-scoped. Confirm H=2^20 has M=40, bound=5/65536, and plotted filled endpoint
uses the checked row. Verify the final figure checker if useful. It needs no
temporary writes. The supervisor ran the mutation regressions successfully in
its normal local environment; do not retry those inside a read-only sandbox.

Return whether the prior source-provenance blocker is resolved, whether the
endpoint suggestion is resolved, and any remaining defect specific to these
repairs. Do not require external human review or universal priority, which
are explicitly not claimed.
