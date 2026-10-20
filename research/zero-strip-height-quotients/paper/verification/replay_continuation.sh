#!/bin/sh
# Continuation-only reproducibility check; no dependency installation or mutation.
set -eu
task_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
lean_root=${ZERO_STRIP_LEAN_ROOT:-/Users/akari_hayami_64/Documents/prime-spherical-fold}
test "$(cat "$lean_root/lean-toolchain")" = 'leanprover/lean4:v4.33.1'
test "$(git -C "$lean_root/.lake/packages/mathlib" rev-parse HEAD)" = '0df444a360eaa60ab8c11dca51a86af692955474'
git -C "$lean_root/.lake/packages/mathlib" diff --quiet HEAD --
python3 -B "$task_root/verification/verify_canonical_product.py"
python3 -B "$task_root/verification/verify_complex_factors.py"
python3 -B "$task_root/verification/test_assertion_guard.py"
(
  cd "$lean_root"
  lake env lean -DwarningAsError=true "$task_root/Lean/EmpiricalStability.lean"
)
printf '%s\n' 'continuation replay: PASS'
