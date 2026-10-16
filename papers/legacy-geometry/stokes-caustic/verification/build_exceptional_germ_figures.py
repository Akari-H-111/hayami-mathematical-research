"""Build numerical illustrations of EXCEPTIONAL_GERM.md, with vector PDF masters.

Run using /Users/akari_hayami_64/TAGD_Master_Paper/.agent-venv/bin/python -B.
The imported exact verifier supplies the formulas; plots are numerical evidence.
"""
from pathlib import Path
import hashlib
import json
import os
import platform
import sys

ROOT = Path(__file__).resolve().parents[4]
OUT = Path(__file__).resolve().parents[1] / "notes/figures"
REGISTERED = "/Users/akari_hayami_64/TAGD_Master_Paper/.agent-venv/bin/python"
# Keep Matplotlib's writable font cache inside this worktree.
os.environ["MPLCONFIGDIR"] = str(ROOT / "local/cache/exceptional-germ-matplotlib")
if not __debug__:
    raise SystemExit("FAIL assertions must be enabled; run without -O")

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
from matplotlib.patches import FancyArrowPatch, FancyBboxPatch, Patch
from matplotlib.ticker import MaxNLocator
import numpy as np
import sympy as sp

import verify_exceptional_germ as germ

NAVY, ORANGE, TEAL, PURPLE = "#355C7D", "#B55F36", "#68958F", "#9984A0"
INK, GREY = "#28323C", "#7A8085"
plt.rcParams.update({
    "font.family": "DejaVu Sans", "font.size": 11, "mathtext.fontset": "dejavusans",
    "axes.labelsize": 12, "axes.linewidth": 0.7, "axes.unicode_minus": False,
    "axes.edgecolor": GREY, "text.color": INK, "axes.labelcolor": INK,
    "xtick.color": INK, "ytick.color": INK, "legend.fontsize": 10,
    "pdf.fonttype": 42, "savefig.dpi": 200, "path.simplify": False,
})

U = sp.lambdify(germ.c, germ.U(germ.c), "numpy", cse=True)
N = sp.lambdify((germ.c, germ.u), germ.N(germ.c, germ.u), "numpy", cse=True)
M = sp.lambdify((germ.c, germ.u), germ.M(germ.c, germ.u), "numpy", cse=True)
m = sp.lambdify(germ.a, germ.m(germ.a), "numpy", cse=True)
dm = sp.lambdify(germ.a, sp.diff(germ.m(germ.a), germ.a), "numpy", cse=True)
SUBS = {germ.qc: germ.q(germ.c), germ.qa: germ.q(germ.a)}
K = sp.lambdify((germ.c, germ.a), germ.K.subs(SUBS), "numpy", cse=True)
L = sp.lambdify((germ.c, germ.a), germ.L.subs(SUBS), "numpy", cse=True)
NAMES = ("exceptional_source", "exceptional_quotient", "exceptional_discriminants",
         "exceptional_factorization", "exceptional_perturbations")


def critical_inverse(value):
    """Fixed-step local Newton inverse; residual and domain checks fail closed."""
    a = 1 + (np.asarray(value) - 1) / 3
    for _ in range(9):
        assert np.all((0.9 < a) & (a < 1.1))
        derivative = dm(a)
        assert np.all(derivative > 2)
        a = a - (m(a) - value) / derivative
    assert np.max(np.abs(m(a) - value)) < 4e-15
    return a


def axis(a):
    k1 = K(1, a)
    assert np.all(k1 > 0)
    return -2 * (1 - a) * np.sqrt(k1)


def chart(t, u):
    c = np.cos(t)
    a = critical_inverse(M(c, u))
    k, k1 = K(c, a), K(1, a)
    assert np.all((k > 0) & (k1 > 0))
    rho = np.sqrt(k) + (1 - a) * L(c, a) / (np.sqrt(k1) + np.sqrt(k))
    assert np.all(rho > 0)
    X, y = axis(a), np.sqrt(2 * rho) * np.sin(t / 2)
    assert np.all(np.isfinite(X)) and np.all(np.isfinite(y))
    assert np.max(np.abs(N(c, u) - X * y**2 - y**4)) < 2e-13
    return X, y


def style(ax):
    ax.spines[["top", "right"]].set_visible(False)
    ax.grid(color="#E6E8E9", linewidth=0.55, zorder=0)
    ax.xaxis.set_major_locator(MaxNLocator(5))
    ax.yaxis.set_major_locator(MaxNLocator(5))
    ax.tick_params(length=3)


def source_figure():
    fig, ax = plt.subplots(figsize=(7.6, 5.2))
    fig.subplots_adjust(left=0.12, right=0.97, bottom=0.13, top=0.83)
    t = np.arange(-240, 241) / 1000
    u = np.linspace(-0.025, 0.09, 381)
    tt, uu = np.meshgrid(t, u)
    X, y = chart(tt, uu)
    assert np.max(np.abs(X - X[:, ::-1])) < 1e-14
    assert np.max(np.abs(y + y[:, ::-1])) < 1e-14
    cx = ax.contour(tt, uu, X, levels=[-0.12, -0.09, -0.06, -0.03, 0],
                    colors=TEAL, linewidths=0.85, linestyles="solid")
    cy = ax.contour(tt, uu, y, levels=[-0.16, -0.08, 0.08, 0.16],
                    colors=PURPLE, linestyles="dashed", linewidths=0.9)
    for level, position in zip(cx.levels, [-0.2, -0.14, -0.08, -0.06, -0.125]):
        col = np.argmin(np.abs(t - position))
        height = np.interp(level, X[::-1, col], u[::-1])
        assert u[0] < height < u[-1]
        ax.clabel(cx, levels=[level], manual=[(t[col], height)],
                  fmt=lambda v: f"X={v:g}", fontsize=9, inline_spacing=5)
    for level in cy.levels:
        row = np.argmin(np.abs(u + (0.005 if abs(level) > 0.1 else 0.017)))
        position = np.interp(level, y[row], t)
        labels = ax.clabel(cy, levels=[level], manual=[(position, u[row])],
                           fmt=lambda v: f"y={v:g}", fontsize=9, inline_spacing=5)
        for label in labels:
            label.set_rotation(0)
    ax.axvline(0, color=NAVY, lw=2.1)
    ax.plot(t, U(np.cos(t)), color=ORANGE, lw=2.2)
    ax.scatter([0], [0], s=23, color=INK, zorder=5)
    ax.annotate("0", (0, 0), xytext=(6, -13), textcoords="offset points")
    ax.annotate("", (-0.15, 0.077), (0.15, 0.077),
                arrowprops={"arrowstyle": "<->", "color": INK, "lw": 1.1})
    ax.text(0, 0.081, r"$t\leftrightarrow -t$", ha="center",
            bbox={"facecolor": "white", "edgecolor": "none", "pad": 1})
    ax.set(xlim=(-0.24, 0.24), ylim=(-0.025, 0.09), xlabel=r"$t$ (radians)", ylabel=r"$u$")
    handles = [Line2D([], [], color=NAVY, lw=2.1, label=r"$t=0$"),
               Line2D([], [], color=ORANGE, lw=2.2, label=r"$u=U(\cos t)$"),
               Line2D([], [], color=TEAL, label=r"$X$ levels"),
               Line2D([], [], color=PURPLE, ls="--", label=r"$y$ levels")]
    fig.legend(handles=handles, loc="upper center", bbox_to_anchor=(0.54, 0.97), ncol=4,
               frameon=False, columnspacing=1.4, handlelength=2)
    style(ax)
    return fig


def quotient_figure():
    fig, ax = plt.subplots(figsize=(6.4, 5.2))
    fig.subplots_adjust(left=0.14, right=0.96, bottom=0.13, top=0.81)
    c = np.linspace(0.94, 1.06, 801)
    ax.axvspan(1, 1.06, color="#F0F1F2", zorder=0)
    ax.axvline(1, color=NAVY, lw=2.1)
    ax.plot(c, U(c), color=ORANGE, lw=2.2)
    ax.plot([0.96, 1.04], [-0.04, 0.04], color=PURPLE, ls="--", lw=1.2)
    ax.annotate("", (1.032, 0.032), (1, 0),
                arrowprops={"arrowstyle": "->", "color": INK, "lw": 1.3})
    ax.annotate(r"$k=(1,1)$", (1.028, 0.032), xytext=(0, 12), textcoords="offset points", ha="center")
    ax.scatter([1], [0], s=26, color=INK, zorder=5)
    ax.annotate(r"$(1,0)$", (1, 0), xytext=(-45, -16), textcoords="offset points")
    ax.set(xlim=(0.94, 1.06), ylim=(-0.115, 0.115), xlabel=r"$c$", ylabel=r"$u$")
    ax.set_aspect("equal", adjustable="box")
    handles = [Line2D([], [], color=NAVY, lw=2, label=r"$c=1$"),
               Line2D([], [], color=ORANGE, lw=2, label=r"$u=U(c)$"),
               Line2D([], [], color=PURPLE, ls="--", label="kernel direction"),
               Patch(facecolor="#F0F1F2", label=r"$c>1$ extension")]
    fig.legend(handles=handles, loc="upper center", bbox_to_anchor=(0.53, 0.98), ncol=2,
               frameon=False, columnspacing=2)
    style(ax)
    ax.set_xticks([0.95, 1, 1.05], ["0.95", "1.00", "1.05"])
    return fig


def discriminant_figure():
    fig, axes = plt.subplots(1, 2, figsize=(10.2, 4.7), sharey=True)
    fig.subplots_adjust(left=0.1, right=0.98, bottom=0.16, top=0.8, wspace=0.26)
    t = np.linspace(0, 0.23, 801)
    c = np.cos(t)
    actual_m, actual_n = M(c, U(c)), N(c, U(c))
    normal_x = axis(c)
    assert np.max(np.abs(actual_n + normal_x**2 / 4)) < 1e-14
    star = np.cos(0.16)
    for ax, horizontal, origin, point, label in (
        (axes[0], actual_m, 1, float(m(star)), r"$t=\pm 0.16$"),
        (axes[1], normal_x, 0, float(axis(star)), r"$y=\pm y_*$"),
    ):
        lo, hi = float(horizontal.min()) - 0.006, origin + 0.019
        ax.plot([lo, origin], [0, 0], color=NAVY, lw=2)
        ax.plot([origin, hi], [0, 0], color=NAVY, lw=1.3, ls="--")
        vertical = actual_n if ax is axes[0] else -normal_x**2 / 4
        ax.plot(horizontal, vertical, color=ORANGE, lw=2.2)
        value = float(N(star, U(star)))
        ax.scatter([point], [value], color=ORANGE, s=27, zorder=5)
        ax.annotate(label, (point, value), xytext=(14, -23), textcoords="offset points",
                    ha="left", fontsize=10, bbox={"facecolor": "white", "edgecolor": "none", "pad": 1},
                    arrowprops={"arrowstyle": "-", "color": GREY, "lw": 0.7})
        ax.scatter([origin], [0], color=INK, s=22, zorder=5)
        ax.annotate(r"$F(0,0)$" if ax is axes[0] else r"$0$", (origin, 0),
                    xytext=(4, 7), textcoords="offset points", fontsize=10)
        ax.annotate("", (horizontal[570], vertical[570]), (horizontal[460], vertical[460]),
                    arrowprops={"arrowstyle": "->", "color": ORANGE, "lw": 1.6})
        ax.set_xlim(lo, hi)
        style(ax)
    axes[0].set(xlabel=r"$M$", ylabel=r"$N$")
    axes[1].set(xlabel=r"$X$", ylabel=r"$Y=N$")
    axes[0].set_ylim(float(actual_n.min()) * 1.13, 0.00035)
    for ax in axes:
        ax.ticklabel_format(axis="y", style="sci", scilimits=(-3, -3), useMathText=True)
    handles = [Line2D([], [], color=NAVY, lw=2, label="reflection-axis image"),
               Line2D([], [], color=ORANGE, lw=2.2, label="doubly covered critical arc"),
               Line2D([], [], color=NAVY, ls="--", label="ambient continuation")]
    fig.legend(handles=handles, loc="upper center", bbox_to_anchor=(0.54, 0.99),
               ncol=2, frameon=False, columnspacing=2)
    return fig


def factorization_figure():
    fig, ax = plt.subplots(figsize=(9.4, 3.6))
    ax.set(xlim=(0, 10), ylim=(0, 4))
    ax.axis("off")
    centers = [(1.1, 3), (5, 3), (8.9, 3), (1.1, 0.8), (8.9, 0.8)]
    labels = [r"$(t,u)$", r"$(c,u)$", r"$(N,M)$", r"$(X,y)$", r"$(X,Y)$"]
    basepoints = [r"$(0,0)$", r"$(1,0)$", r"$(0,1)$", r"$(0,0)$", r"$(0,0)$"]
    for (xx, yy), label, base in zip(centers, labels, basepoints):
        ax.add_patch(FancyBboxPatch((xx-0.86, yy-0.42), 1.72, 0.84,
                                   boxstyle="round,pad=0.07", facecolor="#F7F8F9",
                                   edgecolor="#B3BAC0", linewidth=0.8))
        ax.text(xx, yy+0.12, label, ha="center", va="center", fontsize=14)
        ax.text(xx, yy-0.2, base, ha="center", va="center", fontsize=10, color=GREY)
    arrows = [((2.08, 3), (4.02, 3), NAVY), ((5.98, 3), (7.92, 3), ORANGE),
              ((1.1, 2.5), (1.1, 1.32), TEAL), ((8.9, 2.5), (8.9, 1.32), TEAL),
              ((2.08, 0.8), (7.92, 0.8), INK)]
    for start, end, color in arrows:
        ax.add_patch(FancyArrowPatch(start, end, arrowstyle="->", mutation_scale=13,
                                    color=color, linewidth=1.2))
    ax.text(3.05, 3.4, r"$\sigma(t,u)=(\cos t,u)$", ha="center", fontsize=12)
    ax.text(3.05, 2.62, "ramified fold", ha="center", fontsize=10, color=NAVY)
    ax.text(6.95, 3.4, r"$G$", ha="center", fontsize=13)
    ax.text(6.95, 2.62, "ordinary fold", ha="center", fontsize=10, color=ORANGE)
    ax.text(1.3, 1.88, r"$s_F$", va="center", fontsize=13, color=TEAL)
    ax.text(8.38, 1.88, r"$h_F$", va="center", fontsize=13, color=TEAL)
    ax.text(5, 1.09, r"$f_\infty(X,y)=(X,Xy^2+y^4)$", ha="center", fontsize=13)
    fig.subplots_adjust(left=0.01, right=0.99, top=0.99, bottom=0.01)
    return fig


def perturbation_figure():
    fig, axes = plt.subplots(1, 2, figsize=(10.2, 4.7))
    fig.subplots_adjust(left=0.1, right=0.98, bottom=0.16, top=0.79, wspace=0.29)
    b = np.linspace(-0.28, 0.28, 801)
    eps = 0.04
    ax = axes[0]
    ax.axhline(0, color=NAVY, lw=1.8)
    ax.plot(-2*b**2, b, color=GREY, ls="--", lw=1.6)
    ax.plot(-eps-2*b**2, b, color=ORANGE, lw=2)
    ax.scatter([0, -eps], [0, 0], c=[GREY, ORANGE], s=28, zorder=5)
    ax.annotate(r"$0$", (0, 0), xytext=(4, 6), textcoords="offset points")
    ax.annotate(r"$(-\epsilon,0)$", (-eps, 0), xytext=(-80, 15), textcoords="offset points", ha="center",
                bbox={"facecolor": "white", "edgecolor": "none", "pad": 1},
                arrowprops={"arrowstyle": "-", "color": GREY, "lw": 0.7})
    ax.set(xlim=(-0.21, 0.035), ylim=(-0.31, 0.31), xlabel=r"$x$", ylabel=r"$y$")
    ax.legend([Line2D([], [], color=GREY, ls="--"), Line2D([], [], color=ORANGE)],
              [r"$\epsilon=0$", r"$\epsilon=0.04$"], loc="upper center",
              bbox_to_anchor=(0.5, 1.23), ncol=2, frameon=False)
    ax = axes[1]
    b = np.linspace(0, 0.27, 601)
    ax.plot(-2*b**2, -b**4, color=GREY, ls="--", lw=1.5)
    for sign, color in [(1, ORANGE), (-1, PURPLE)]:
        yy = sign * b
        xx, YY = -2*yy**2-2.5*yy**3, -yy**4-1.5*yy**5
        ax.plot(xx, YY, color=color, lw=2)
        assert np.max(np.abs(xx*yy**2+yy**4+yy**5-YY)) < 1e-16
    ax.axhline(0, color=NAVY, lw=1.8)
    ax.scatter([0], [0], color=INK, s=22, zorder=5)
    ax.set(xlim=(-0.21, 0.025), ylim=(-0.0082, 0.00065), xlabel=r"$x$", ylabel=r"$Y$")
    ax.ticklabel_format(axis="y", style="sci", scilimits=(-3, -3), useMathText=True)
    ax.legend([Line2D([], [], color=ORANGE), Line2D([], [], color=PURPLE),
               Line2D([], [], color=GREY, ls="--")],
              [r"$y>0$", r"$y<0$", r"$f_\infty$"], loc="upper center",
              bbox_to_anchor=(0.5, 1.23), ncol=3, frameon=False, columnspacing=1.3)
    for ax in axes:
        style(ax)
    return fig


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    assert Path(sys.executable).resolve() == Path(REGISTERED).resolve(), "Use the registered interpreter"
    assert (platform.python_version(), np.__version__, matplotlib.__version__) == (
        "3.14.6", "2.5.2", "3.11.1"), "Unexpected figure runtime"
    OUT.mkdir(parents=True, exist_ok=True)
    paths = []
    builders = [source_figure, quotient_figure, discriminant_figure,
                factorization_figure, perturbation_figure]
    for name, build in zip(NAMES, builders):
        fig = build()
        pdf, png = OUT / f"{name}.pdf", OUT / f"{name}.png"
        fig.savefig(pdf, metadata={"CreationDate": None, "ModDate": None})
        fig.savefig(png, dpi=200, metadata={"Software": "exceptional-germ-figures-v1"})
        plt.close(fig)
        paths.extend([pdf, png])
    inputs = [Path(__file__).resolve(), Path(germ.__file__).resolve()]
    manifest = {
        "schema": "stokes-exceptional-germ-figures-v1",
        "registered_interpreter": REGISTERED, "runtime_executable": sys.executable,
        "python": platform.python_version(), "numpy": np.__version__,
        "matplotlib": matplotlib.__version__, "sympy": sp.__version__,
        "preview_dpi": 200, "pdf_metadata": {"CreationDate": None, "ModDate": None},
        "evidence_status": "sampled numerical illustrations and one exact-map schematic; not proof",
        "inputs": {str(p.relative_to(ROOT)): sha(p) for p in inputs},
        "files": {p.name: sha(p) for p in paths},
    }
    (OUT / "FIGURES_MANIFEST.json").write_text(json.dumps(manifest, indent=2) + "\n")
    print("Python", platform.python_version(), "NumPy", np.__version__, "Matplotlib", matplotlib.__version__)
    print("PASS figure numerics: local inverse residuals, positive chart factors, normal-form and reflection identities")
    print("PASS 5 vector PDFs and 5 PNG previews at 200 dpi; SHA-256 manifest written")


if __name__ == "__main__":
    main()
