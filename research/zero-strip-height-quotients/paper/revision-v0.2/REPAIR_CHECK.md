- Source-provenance blocker: resolved. GZ is explicitly confined to abstract/metadata-level historical context; the prescribed-zero, retained-divisor/poles, and functional-equation comparison—and the table row—are explicitly GX-scoped.

- Endpoint suggestion: resolved. `secondary_closed_endpoint` records \(H=2^{20}=1{,}048{,}576\), \(M=40\), and \(2M/H=5/65536\). Figure generation uses this exact checked endpoint for the filled \(k=20\) marker, rather than deriving it ad hoc from the left-limit rows.

- Verification: `python3 -B verification/verify_figures.py` passed with 683 exact rows. The environment emitted harmless temporary-cache permission warnings before the successful result.

No remaining defect specific to these two repairs.