#!/usr/bin/env python3
"""Counterexample to the unrestricted pseudo-recurrence claim in v4 Thm. 5.3.

For the Whitney normal form W(xi, eta)=(xi, eta^2), the non-periodic,
transverse curve gamma(s)=(s,s) crosses the fold eta=0 at s=0, but W∘gamma
is injective.  Thus a transverse crossing alone does not imply two distinct
times with the same observation.
"""

from __future__ import annotations

import sympy as sp


def main() -> None:
    s1, s2 = sp.symbols("s1 s2", real=True)
    # Equality W(gamma(s1))=W(gamma(s2)) gives both s1=s2 and s1^2=s2^2.
    solutions = sp.solve([s1 - s2, s1**2 - s2**2], [s1, s2], dict=True)
    if solutions != [{s1: s2}]:
        raise AssertionError(f"unexpected equality locus: {solutions}")
    print("PASS transverse curve gamma(s)=(s,s) has injective Whitney observation")
    print("COUNTEREXAMPLE v4 Thm. 5.3(1): a transverse fold crossing alone does not force pseudo-recurrence")
    print("RECONSTRUCTION_REQUIREMENT: add a symmetry/retracing hypothesis and phase-lock the external rotation before any repaired theorem is stated")


if __name__ == "__main__":
    main()
