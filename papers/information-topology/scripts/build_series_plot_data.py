import argparse
from pathlib import Path

import numpy as np


def render_table(name, columns, values):
    rows = [" ".join(columns) + r" \\"]
    for row in values:
        rows.append(" ".join(format(value, ".12g") for value in row) + r" \\")
    return "\\pgfplotstableread[row sep=\\\\]{\n" + "\n".join(rows) + "\n}\\" + name + "\n"


def build_tables():
    scales = np.arange(1, 121, dtype=np.int64)
    parameter = (np.sqrt(5.0) - 1.0) / 2.0
    discrepancies = np.remainder(scales * parameter + 0.5, 1.0) - 0.5
    boundary_norms = 2.0 * np.abs(np.sin(np.pi * discrepancies))
    costs = 1.0 / boundary_norms
    boundary_thresholds = 6.0 * scales.astype(float) ** (-1.2)
    cost_thresholds = scales.astype(float) ** 1.2 / 6.0
    assert np.all(boundary_norms > 0)
    assert np.allclose(boundary_norms * costs, 1.0)
    assert np.array_equal(boundary_norms < boundary_thresholds, costs > cost_thresholds)
    profile = np.column_stack((scales, boundary_norms, costs, boundary_thresholds, cost_thresholds))
    hits = np.column_stack((scales, boundary_norms, costs))[boundary_norms < boundary_thresholds]
    signature_scales = np.arange(1, 25, dtype=np.int64)
    components = np.abs(
        np.exp(2j * np.pi * signature_scales * 0.17)
        - np.exp(2j * np.pi * signature_scales * 0.43)
    ) / signature_scales
    assert np.all(components <= components[0] + 1e-12)
    signature = np.column_stack((signature_scales, components, np.full(24, components[0])))
    return "\n".join((
        render_table("ArithmeticProfileData", ("q", "boundary", "cost", "boundary_threshold", "cost_threshold"), profile),
        render_table("ArithmeticHitData", ("q", "boundary", "cost"), hits),
        render_table("ArithmeticSignatureData", ("q", "component", "first_component"), signature),
    ))


def main():
    parser = argparse.ArgumentParser(description="Regenerate or verify the self-contained LaTeX plot tables.")
    parser.add_argument("--check", action="store_true", help="Check the saved tables without modifying them.")
    arguments = parser.parse_args()
    output = Path("figures/arithmetic_plot_tables.tex")
    content = build_tables()
    if arguments.check:
        if not output.is_file() or output.read_text(encoding="utf-8").rstrip("\n") != content.rstrip("\n"):
            raise SystemExit("Saved LaTeX tables are missing or stale; run this script without --check.")
        print("Saved LaTeX tables match all three deterministic datasets.")
    else:
        output.write_text(content, encoding="utf-8")
        print("Wrote self-contained LaTeX plot tables; no external .dat files are required.")
    print("Reciprocal, threshold, and first-component metric checks passed.")
    print("Finite plots do not certify infinitely-often membership or dimension.")


if __name__ == "__main__":
    main()