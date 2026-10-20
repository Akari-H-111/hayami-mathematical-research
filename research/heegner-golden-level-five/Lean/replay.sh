#!/bin/sh
# Reprocess the bounded level-five algebraic core against the prepared Mathlib pin.
set -eu

task_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
lean_root=/Users/akari_hayami_64/Documents/prime-spherical-fold

test -d "$lean_root"
test -f "$lean_root/lakefile.toml"
test "$(cat "$lean_root/lean-toolchain")" = 'leanprover/lean4:v4.33.1'
test "$(git -C "$lean_root/.lake/packages/mathlib" rev-parse HEAD)" = '0df444a360eaa60ab8c11dca51a86af692955474'
(
  cd "$lean_root"
  lake env lean "$task_root/Lean/GoldenCore.lean"
)
printf '%s\n' 'GoldenCore replay: PASS'
