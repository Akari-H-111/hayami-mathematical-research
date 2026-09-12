from pathlib import Path
import subprocess
import sys


ROOT = Path(__file__).resolve().parent
VERIFIERS = (
    "verify_y17_frozen_prediction_v0_32.py",
    "verify_residual_modules_all_orders_v0_34.py",
    "verify_residual_landing_map_v0_36.py",
    "verify_complete_landing_operators_v0_37.py",
    "verify_spectral_landing_stratification_v0_38.py",
    "verify_two_axis_stratification_v0_39.py",
    "verify_three_level_extension_stratification_v0_40.py",
)


for verifier_name in VERIFIERS:
    verifier = ROOT / verifier_name
    print(f"=== {verifier_name} ===", flush=True)
    result = subprocess.run([sys.executable, str(verifier)], cwd=ROOT)
    if result.returncode:
        raise SystemExit(f"{verifier_name} failed with exit code {result.returncode}")

print("fixed-case v0.41 verifier suite: PASS")
