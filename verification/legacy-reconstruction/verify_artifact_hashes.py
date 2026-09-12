#!/usr/bin/env python3
"""Fail closed if any authoritative final PDF has changed."""

from __future__ import annotations

import hashlib
from pathlib import Path


ROOT = Path(__file__).resolve().parent
EXPECTED = {
    "The_Orthogonal_Circle_Ruled_Surface_v4.pdf": "c90a8066be4d5e087592de1590eb04930574c7668a4f8e8d0560cfff17b15722",
    "The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.pdf": "4e48c805c1550dbaee9171a56264bf4ff5275ef5ff5b64f9cd116803283c11c0",
    "Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf": "4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a",
}


def main() -> None:
    source_dir = ROOT.parent.parent / "papers" / "legacy-geometry" / "source-registry" / "final_pdfs"
    for name, expected in EXPECTED.items():
        path = source_dir / name
        actual = hashlib.sha256(path.read_bytes()).hexdigest()
        if actual != expected:
            raise AssertionError(f"hash mismatch: {path}: {actual}")
        print(f"PASS final-PDF hash: {name}")


if __name__ == "__main__":
    main()
