from pathlib import Path
import argparse
import json
import re


CERTIFICATE_NAME = "Y17_frozen_prediction_and_arity22_actual_v0_32.json"
parser = argparse.ArgumentParser(description="Audit the v0.32 Y17 OOS certificate.")
parser.add_argument(
    "--certificate",
    type=Path,
    default=Path(__file__).resolve().with_name(CERTIFICATE_NAME),
    help=f"path to {CERTIFICATE_NAME}",
)
args = parser.parse_args()
if not args.certificate.is_file():
    raise FileNotFoundError(
        f"certificate not found: {args.certificate}; "
        f"place {CERTIFICATE_NAME} beside this verifier or pass --certificate"
    )

data = json.loads(args.certificate.read_text(encoding="utf-8"))
assert data["version"] == "v0.32"
assert set(data["prediction"]) == {"2", "3", "4", "5"}
assert set(data["actual"]) == {"2", "3", "4", "5"}
assert set(data["exact_match"]) == {"2", "3", "4", "5"}

for rail in ("2", "3", "4", "5"):
    assert data["prediction"][rail] == data["actual"][rail]
    assert data["exact_match"][rail] is True
    assert data["prediction"][rail]

arity22 = data["arity22"]
assert arity22["feedback_shape"] == [34, 560]
assert arity22["feedback_rank"] == arity22["augmented_rank"] == 34
assert arity22["minimal_controller_shape"][0] == 34
assert arity22["history_rank_Q"] == 174
assert len(arity22["recycled_monomials"]) == 3
assert isinstance(arity22["c22"]["numerator"], int)
assert isinstance(arity22["c22"]["denominator"], int)

digest = data["frozen_prediction_sha256"]
assert re.fullmatch(r"[0-9a-f]{64}", digest)
assert len(data["recurrence_coefficients"]) == 14

print("v0.32 Y17 frozen prediction: PASS")
print("railwise prediction == independent arity-22 actual for rails 2,3,4,5")
print("stored prediction SHA256 =", digest)
print("arity-22 feedback shape/rank =", arity22["feedback_shape"], arity22["feedback_rank"])
print("arity-22 history rank Q =", arity22["history_rank_Q"])
