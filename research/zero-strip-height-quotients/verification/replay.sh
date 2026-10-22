#!/bin/sh
# Reproducible local replay; it reads but does not mutate the supplied Lean project.
set -eu

task_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
lean_root=${ZERO_STRIP_LEAN_ROOT:-/Users/akari_hayami_64/Documents/prime-spherical-fold}

test -d "$lean_root"
test -f "$lean_root/lakefile.toml"
test "$(cat "$lean_root/lean-toolchain")" = 'leanprover/lean4:v4.33.1'
test "$(git -C "$lean_root/.lake/packages/mathlib" rev-parse HEAD)" = '0df444a360eaa60ab8c11dca51a86af692955474'
python3 -B "$task_root/verification/check_exact.py"
python3 -B "$task_root/verification/supervisor_countermodel.py"
python3 -B "$task_root/verification/test_assertion_guard.py"
lean_output=$(
  cd "$lean_root"
  lake env lean "$task_root/Lean/ZeroStripCore.lean"
  lake env lean "$task_root/Lean/SupervisorStructures.lean"
  lake env lean "$task_root/Lean/DivisorCells.lean"
  lake env lean "$task_root/Lean/ZetaCompatibility.lean"
)
printf '%s\n' "$lean_output"
test "$(printf '%s\n' "$lean_output" | grep -c "^'ZeroStrip")" -eq 34
printf '%s\n' 'replay: PASS'
