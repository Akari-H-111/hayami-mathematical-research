# Shared-core verification runbook

From `verification/legacy-reconstruction/`, create an isolated environment and run:

```bash
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
.venv/bin/python -B shared/orthogonal_circle_surface/verify_shared_surface_core.py
```

The verifier proves the displayed v4 identities only on the open chart
`0 < c < 1`, where `Q=sqrt(c(2-c))` is nonzero.  A successful run is not a
certificate of the original closed-parameter global-regularity wording.
