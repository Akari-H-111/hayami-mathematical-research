#!/usr/bin/env python3
"""Run every presently reconstructed exact verifier with one interpreter."""

from __future__ import annotations

from pathlib import Path
import subprocess
import sys


ROOT = Path(__file__).resolve().parent
VERIFIERS = [
    "verify_artifact_hashes.py",
    "../shared/orthogonal_circle_surface/verify_shared_surface_core.py",
    "../../papers/legacy-geometry/orthogonal-circle-ruled-surface/verification/verify_observation_field.py",
    "../../papers/legacy-geometry/orthogonal-circle-ruled-surface/verification/verify_signal_claim_counterexample.py",
    "../../papers/legacy-geometry/stokes-caustic/verification/verify_sturm_certificate.py",
    "../../papers/legacy-geometry/stokes-caustic/verification/verify_exact_geometry.py",
    "../../papers/legacy-geometry/bicomplex-signal-manifolds/verification/verify_local_algebra.py",
    "../../papers/legacy-geometry/bicomplex-signal-manifolds/verification/verify_spectral_algebra.py",
    "../../papers/legacy-geometry/bicomplex-signal-manifolds/verification/verify_crosscap_models.py",
]


def main() -> None:
    for relative in VERIFIERS:
        print(f"\n== {relative} ==", flush=True)
        subprocess.run([sys.executable, "-B", str(ROOT / relative)], check=True)
    print("\nPASS reconstructed verification baseline", flush=True)


if __name__ == "__main__":
    main()
