"""Generate the figures of the two successor papers (deterministic PDF output).

Run with an interpreter providing numpy and matplotlib, for example
/Users/akari_hayami_64/TAGD_Master_Paper/.agent-venv/bin/python (numpy 2.5.2,
matplotlib 3.11.1). Every figure is computed from the explicit formulas stated
in the papers. Numerical figures are illustrations; the theorems they
illustrate are proved in the text.
"""
from pathlib import Path
import hashlib
import json
import logging
import math
import sys

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.colors import LightSource, ListedColormap, hsv_to_rgb
from matplotlib.patches import FancyArrowPatch, Patch, Rectangle
from matplotlib.ticker import MaxNLocator

logging.getLogger("fontTools").setLevel(logging.ERROR)

OUT = Path(__file__).resolve().parents[1] / "successor/figures"
plt.rcParams.update({"font.size": 9, "mathtext.fontset": "cm", "font.family": "serif",
                     "axes.linewidth": 0.6, "savefig.dpi": 300, "pdf.fonttype": 42})
TEAL, PURPLE, ORANGE, RED, GREY = "#1b7f79", "#6a3d9a", "#e07b16", "#c0392b", "#555555"
C0 = (3 - np.sqrt(5)) / 2
T0, U0 = np.arccos(C0), (1 - C0) / 2
HALF = np.pi / 2
TICKS = ([-HALF, 0, HALF], [r"$-\frac{\pi}{2}$", "0", r"$\frac{\pi}{2}$"])
LATERAL = (r"$P_+$", r"$P_-$")
LIGHT = LightSource(315, 45)


def sparse_ticks(ax, n=4):
    for axis in (ax.xaxis, ax.yaxis, ax.zaxis):
        axis.set_major_locator(MaxNLocator(n))


def save(fig, name):
    path = OUT / f"{name}.pdf"
    fig.savefig(path, bbox_inches="tight", metadata={"CreationDate": None, "ModDate": None})
    plt.close(fig)
    return path


def S(t, u):
    c, s = np.cos(t), np.sin(t)
    return c + 2 * u * (1 - c), (1 - u) * s, u * np.sqrt(np.clip(c * (2 - c), 0, None))


def NM(t, u):
    c = np.cos(t)
    Q = np.sqrt(c * (2 - c))
    return (1 - c) * (1 - c - 2 * u), (c ** 2 * (2 - c) - u * (1 - c + c ** 2)) / Q


# ---------------------------------------------------------------- paper 1
def fig_surface():
    fig = plt.figure(figsize=(7.2, 3.5))
    grid = fig.add_gridspec(1, 2, width_ratios=[1.2, 1])
    ax = fig.add_subplot(grid[0], projection="3d")
    ax.computed_zorder = False
    t, u = np.meshgrid(np.linspace(-HALF, HALF, 91), np.linspace(0, 1, 31))
    cols = plt.cm.viridis((t + HALF) / np.pi)
    ax.plot_surface(*S(t, u), facecolors=cols, rstride=1, cstride=1, linewidth=0.1,
                    edgecolor=(1, 1, 1, 0.2), alpha=0.85, shade=True, lightsource=LIGHT, rasterized=True, zorder=1)
    uu = np.linspace(0, 1, 50)
    ax.plot(*S(HALF + 0 * uu, uu), color=TEAL, lw=2.2, zorder=5)
    ax.plot(*S(-HALF + 0 * uu, uu), color=PURPLE, lw=2.2, zorder=5)
    ax.plot(*S(0 * uu, uu), color=ORANGE, lw=2.2, zorder=5)
    pts = {r"$P_+$": (T0, U0), r"$P_-$": (-T0, U0), r"$P_0$": (0, 1), r"$E_+$": (HALF, 0), r"$E_-$": (-HALF, 0)}
    shift = {r"$P_+$": (0.05, 0.1, 0.1), r"$P_-$": (-0.32, -0.05, 0.1), r"$P_0$": (0.06, 0, 0.08),
             r"$E_+$": (-0.12, 0.12, 0.06), r"$E_-$": (-0.05, -0.22, 0.05)}
    for lab, (tt, u0) in pts.items():
        p = S(tt, u0)
        ax.scatter(*p, color=RED if lab in LATERAL else "k", s=22, zorder=10)
        d = shift[lab]
        ax.text(p[0] + d[0], p[1] + d[1], p[2] + d[2], lab, zorder=11, fontsize=9.5)
    ax.text(2.0, 0.05, -0.12, "apex", fontsize=7.5, zorder=11)
    ax.set_xlabel("$x$", labelpad=-4); ax.set_ylabel("$y$", labelpad=-4); ax.set_zlabel("$z$", labelpad=-6)
    ax.tick_params(labelsize=6.5, pad=-1)
    sparse_ticks(ax)
    ax.view_init(elev=27, azim=-62)
    ax.set_box_aspect((2, 2, 1.1))
    ax.set_title(r"(a) the ruled surface $S(D)\subset\mathbb{R}^3$", fontsize=9)
    ax2 = fig.add_subplot(grid[1])
    tt, uu2 = np.meshgrid(np.linspace(-HALF, HALF, 300), np.linspace(0, 1, 2))
    ax2.pcolormesh(tt, uu2, tt, cmap="viridis", alpha=0.35, shading="auto", rasterized=True)
    ax2.plot([HALF, HALF], [0, 1], color=TEAL, lw=3)
    ax2.plot([-HALF, -HALF], [0, 1], color=PURPLE, lw=3)
    ax2.plot([0, 0], [0, 1], color=ORANGE, lw=2.2)
    for lab, (x, y) in pts.items():
        ax2.plot(x, y, "o", color=RED if lab in LATERAL else "k", ms=6, clip_on=False, zorder=5)
        off = {r"$P_0$": (6, 4), r"$E_+$": (-18, 6), r"$E_-$": (5, 6)}.get(lab, (6, 5))
        ax2.annotate(lab, (x, y), textcoords="offset points", xytext=off, fontsize=9)
    ax2.text(HALF - 0.08, 0.55, "edge\n" + r"$t=\frac{\pi}{2}$", ha="right", fontsize=7.5, color=TEAL)
    ax2.text(-HALF + 0.08, 0.55, "edge\n" + r"$t=-\frac{\pi}{2}$", ha="left", fontsize=7.5, color=PURPLE)
    ax2.text(0.05, 0.12, "polar\nruling", fontsize=7.5, color=ORANGE)
    ax2.set_xticks(*TICKS); ax2.set_xlabel("$t$"); ax2.set_ylabel("$u$")
    ax2.set_xlim(-HALF - 0.05, HALF + 0.05); ax2.set_ylim(-0.03, 1.03)
    ax2.set_title(r"(b) source $D$ and the five rank labels", fontsize=9)
    fig.tight_layout()
    return save(fig, "surface_overview")


def fig_rigidity():
    fig, axs = plt.subplots(1, 3, figsize=(7.2, 2.6), gridspec_kw={"width_ratios": [1.25, 1, 1.25]})
    ax = axs[0]
    ax.add_patch(Rectangle((-HALF, 0), np.pi, 1, fill=False, lw=0.8))
    ax.plot([HALF, HALF], [0, 1], color=TEAL, lw=3)
    ax.plot([-HALF, -HALF], [0, 1], color=PURPLE, lw=3)
    ax.plot([0, 0], [0, 1], color=ORANGE, lw=2.2)
    ax.text(HALF - 0.1, 0.5, r"$z_1=0$", ha="right", color=TEAL)
    ax.text(-HALF + 0.1, 0.5, r"$z_1=0$", ha="left", color=PURPLE)
    ax.text(0.08, 0.82, r"$z_2=0$", color=ORANGE)
    for sg in (1, -1):
        ax.plot(sg * T0, U0, "o", color=RED, ms=4)
    ax.set_xticks(*TICKS); ax.set_yticks([0, 1]); ax.set_xlabel("$t$"); ax.set_ylabel("$u$")
    ax.set_xlim(-HALF - 0.1, HALF + 0.1); ax.set_ylim(-0.05, 1.05)
    ax.set_title(r"(a) $|z_1|^2=\cos t$ on $D$", fontsize=9)
    ax = axs[1]
    b = np.linspace(0, 2 * np.pi, 400)
    ax.plot(np.cos(b), np.sin(b), color=GREY, lw=0.8)
    th = np.pi / 8
    arc = np.linspace(th, 2 * th, 60)
    ax.plot(np.cos(arc), np.sin(arc), color=TEAL, lw=4, solid_capstyle="butt")
    ax.plot(np.cos(arc + np.pi), np.sin(arc + np.pi), color=PURPLE, lw=4, solid_capstyle="butt")
    ax.text(0.98, 0.62, r"$t=\frac{\pi}{2}$", color=TEAL, fontsize=8)
    ax.text(-1.45, -1.12, r"$t=-\frac{\pi}{2}$", color=PURPLE, fontsize=8)
    ax.text(0, 0, r"$C_0=\{(0,e^{i\beta})\}$", ha="center", va="center", fontsize=8)
    ax.set_aspect("equal"); ax.axis("off")
    ax.set_xlim(-1.45, 1.45); ax.set_ylim(-1.3, 1.3)
    ax.set_title("(b) one circle of edge states", fontsize=9)
    ax = axs[2]
    ax.plot([0, 2], [1, 0], color=TEAL, lw=3)
    ax.plot([0, 2], [-1, 0], color=PURPLE, lw=3)
    ax.plot(1, 0, "o", mfc="white", mec=ORANGE, mew=2, ms=7)
    ax.plot(2, 0, "o", color="k", ms=4)
    ax.annotate(r"ruling $(1,0,u)$", (1, 0), textcoords="offset points", xytext=(-30, 10), fontsize=7.5, color=ORANGE)
    ax.annotate("apex", (2, 0), textcoords="offset points", xytext=(-8, -12), fontsize=7.5)
    ax.set_aspect("equal"); ax.set_xlim(-0.15, 2.25); ax.set_ylim(-1.15, 1.15)
    ax.set_xlabel("$x$"); ax.set_ylabel("$y$")
    ax.set_title(r"(c) two lines in the plane $z=0$", fontsize=9)
    fig.tight_layout()
    for (x0, x1, y) in ((0.385, 0.415, 0.5), (0.635, 0.665, 0.5)):
        fig.patches.append(FancyArrowPatch((x0, y), (x1, y), transform=fig.transFigure,
                                           arrowstyle="-|>", mutation_scale=12, color=GREY))
    return save(fig, "edge_rigidity")


def smooth_step(x, a, b):
    h = lambda y: np.where(y > 0, np.exp(-1 / np.where(y > 0, y, 1)), 0.0)
    p, q = h(x - a), h(b - x)
    return p / (p + q)


def fig_readout():
    th = np.pi / 8
    c = np.linspace(0, 1, 801)
    fig, axs = plt.subplots(1, 3, figsize=(7.2, 2.4), gridspec_kw={"width_ratios": [1.3, 1, 1]})
    ax = axs[0]
    for f, lab, col in ((smooth_step(c, .25, .75), r"$\Lambda$", "k"), (smooth_step(c, 1 / 3, 2 / 3), r"$\psi$", TEAL),
                        (smooth_step(c, .75, .875), r"$\varrho$", ORANGE), (1 - smooth_step(c, .125, .25), r"$\kappa$", RED)):
        ax.plot(c, f, color=col, lw=1.3, label=lab)
    ax.axvspan(0, 1 / 3, color=TEAL, alpha=0.07)
    ax.axvspan(2 / 3, 1, color=ORANGE, alpha=0.07)
    ax.text(0.03, 0.5, "read $u$ from\nphase of $z_2$", fontsize=7)
    ax.text(0.69, 0.5, "read $u$ from\nphase of $z_1$", fontsize=7)
    ax.set_xlabel(r"$c=|z_1|^2=\cos t$"); ax.set_title("(a) cutoffs", fontsize=9)
    ax.legend(loc="lower right", fontsize=7, frameon=False, ncol=2)
    t, u = np.meshgrid(np.linspace(-HALF, HALF, 401), np.linspace(0, 1, 201))
    L = smooth_step(np.cos(t), .25, .75)
    for ax, val, title in ((axs[1], th * L * u, r"(b) $\arg z_1=\theta\Lambda(c)\,u$"),
                           (axs[2], th * (1 - L) * (1 + u), r"(c) $\arg z_2-\nu\pi=\theta(1-\Lambda)(1+u)$")):
        im = ax.pcolormesh(t, u, val, cmap="magma", shading="auto", rasterized=True)
        ax.set_xticks(*TICKS); ax.set_xlabel("$t$"); ax.set_title(title, fontsize=8)
        fig.colorbar(im, ax=ax, fraction=0.05, pad=0.02)
    axs[1].set_ylabel("$u$")
    fig.tight_layout()
    return save(fig, "smooth_readout")


def fig_field():
    t, u = np.meshgrid(np.linspace(-1.45, 1.45, 701), np.linspace(0, 1, 351))
    N, M = NM(t, u)
    F = N + 1j * M
    hue = (np.angle(F) / (2 * np.pi)) % 1.0
    val = 0.35 + 0.65 * (np.abs(F) / (0.08 + np.abs(F))) ** 0.6
    rgb = hsv_to_rgb(np.stack([hue, 0.85 * np.ones_like(hue), val], axis=-1))
    fig, axs = plt.subplots(1, 2, figsize=(7.2, 2.8), gridspec_kw={"width_ratios": [1.9, 1]})
    ax = axs[0]
    ax.imshow(rgb, origin="lower", extent=(-1.45, 1.45, 0, 1), aspect="auto", rasterized=True)
    for sgn, lab, dx in ((1, r"$P_+$, index $-1$", -0.62), (-1, r"$P_-$, index $+1$", 0.12)):
        ax.plot(sgn * T0, U0, "o", color="white", ms=5, mec="k", mew=0.6)
        ax.text(sgn * T0 + dx, U0 + 0.17, lab, color="white", fontsize=8)
    ax.plot(0, 1, "D", color="white", ms=4, mec="k", mew=0.6, clip_on=False)
    ax.text(0.05, 0.9, r"$(0,1)$", color="white", fontsize=8)
    s = np.linspace(0, 2 * np.pi, 400)
    r = 0.13
    ax.plot(T0 + r * np.cos(s), U0 + r * np.sin(s), color="white", lw=1.0, ls="--")
    ax.set_xlabel("$t$"); ax.set_ylabel("$u$")
    ax.set_title(r"(a) phase of $F=N+iM$ (hue) on $D_\circ$", fontsize=9)
    s2 = np.linspace(0, 4 * np.pi, 1600)
    FF = (lambda nm: nm[0] + 1j * nm[1])(NM(T0 + r * np.cos(s2), U0 + r * np.sin(s2)))
    chi = np.exp((np.log(np.abs(FF)) + 1j * np.unwrap(np.angle(FF))) / 2)
    half = len(s2) // 2
    assert abs(chi[half] + chi[0]) < 1e-2 * abs(chi[0])  # one traversal flips the root
    ax = axs[1]
    ax.plot(chi.real[:half], chi.imag[:half], color=TEAL, lw=1.4, label="first loop")
    ax.plot(chi.real[half:], chi.imag[half:], color=ORANGE, lw=1.4, ls="--", label="second loop")
    ax.plot(chi.real[0], chi.imag[0], "o", color="k", ms=4)
    ax.plot(chi.real[half], chi.imag[half], "s", color=RED, ms=4)
    ax.annotate(r"$\chi(0)$", (chi.real[0], chi.imag[0]), textcoords="offset points", xytext=(4, 4), fontsize=8)
    ax.annotate(r"$-\chi(0)$", (chi.real[half], chi.imag[half]), textcoords="offset points", xytext=(4, -10), fontsize=8)
    ax.set_aspect("equal"); ax.axhline(0, color=GREY, lw=0.4); ax.axvline(0, color=GREY, lw=0.4)
    ax.set_title(r"(b) $\chi=\sqrt{F}$ along the dashed loop", fontsize=9)
    ax.legend(fontsize=7, frameon=False, loc="lower left")
    fig.tight_layout()
    return save(fig, "observation_field")


def fig_folds():
    tl = 1.3
    t, u = np.meshgrid(np.linspace(-tl, tl, 521), np.linspace(0, 1, 261))
    N, M = NM(t, u)
    dt, du = t[0, 1] - t[0, 0], u[1, 0] - u[0, 0]
    Nu, Nt = np.gradient(N, du, dt)
    Mu, Mt = np.gradient(M, du, dt)
    J = Nt * Mu - Nu * Mt
    fig, axs = plt.subplots(1, 2, figsize=(7.2, 2.9), gridspec_kw={"width_ratios": [1.45, 1]})
    cmap = ListedColormap(["#f4c27a", "#9fd3cf"])
    ax = axs[0]
    ax.pcolormesh(t, u, (J > 0).astype(float), cmap=cmap, shading="auto", rasterized=True)
    cs = ax.contour(t, u, J, levels=[0], colors="k", linewidths=1.1)
    for sgn in (1, -1):
        ax.plot(sgn * T0, U0, "o", color=RED, ms=5)
    ax.plot(0, 1, "D", color="k", ms=4, clip_on=False)
    ax.annotate(r"$P_0$: fold, degree $0$", (0, 1), textcoords="offset points", xytext=(8, -12), fontsize=8)
    ax.set_xlabel("$t$"); ax.set_ylabel("$u$")
    ax.set_title(r"(a) sign of $\det D\Psi$ and critical locus on $D_\circ$", fontsize=9)
    ax = axs[1]
    ax.pcolormesh(N[::4, ::4], M[::4, ::4], (J[::4, ::4] > 0)[:-1, :-1].astype(float), cmap=cmap,
                  alpha=0.45, shading="flat", rasterized=True, edgecolors="none")  # overlaps: two preimages
    for seg in cs.allsegs[0]:
        if len(seg) > 5:
            ax.plot(*NM(seg[:, 0], seg[:, 1]), color="k", lw=1.0)
    ax.plot(0, 0, "o", color=RED, ms=5)
    ax.annotate(r"$\Psi(P_\pm)=0$", (0, 0), textcoords="offset points", xytext=(6, -12), fontsize=8)
    ax.set_xticks([-0.5, 0, 0.5]); ax.set_xlabel("$N$"); ax.set_ylabel("$M$")
    ax.set_title(r"(b) image $\Psi(D_\circ)$ and fold curves", fontsize=9)
    fig.tight_layout()
    return save(fig, "observation_folds")


def fig_sublevel():
    fig, axs = plt.subplots(1, 2, figsize=(7.2, 2.7))
    ax = axs[0]
    x, y = np.meshgrid(np.linspace(-0.4, 0.4, 801), np.linspace(-0.75, 0.75, 801))
    K = x ** 2 * (1 + y ** 2) + y ** 4
    handles = []
    for eps, col in ((1e-1, TEAL), (1e-2, ORANGE), (1e-3, RED)):
        ax.contourf(x, y, K, levels=[0, eps], colors=[col], alpha=0.25)
        ax.contour(x, y, K, levels=[eps], colors=[col], linewidths=1.0)
        handles.append(Patch(color=col, alpha=0.5, label=rf"$\varepsilon=10^{{{int(np.log10(eps))}}}$"))
    ax.legend(handles=handles, fontsize=7, frameon=False, loc="center left", bbox_to_anchor=(1.0, 0.5))
    ax.set_aspect("equal"); ax.set_xlabel("$x$"); ax.set_ylabel("$y$")
    ax.set_title(r"(a) $\{K_\times\leq\varepsilon\}$: width $\sqrt{\varepsilon}$, height $\varepsilon^{1/4}$", fontsize=8.5)
    B = math.gamma(0.25) * math.gamma(1.5) / math.gamma(1.75)
    eps = np.logspace(-8, 0, 33)
    Vx = []
    for e in eps:
        yy = np.linspace(0, e ** 0.25, 20001)
        integrand = np.sqrt(np.clip((e - yy ** 4) / (1 + yy ** 2), 0, None))
        Vx.append(4 * np.sum((integrand[1:] + integrand[:-1]) / 2 * np.diff(yy)))
    Vx = np.array(Vx)
    lower = B * eps ** 0.75 / np.sqrt(1 + np.sqrt(eps))
    assert np.all(Vx <= B * eps ** 0.75 * (1 + 1e-6)) and np.all(Vx >= lower * (1 - 1e-4))
    ax = axs[1]
    ax.loglog(eps, B * eps ** 0.75, color="k", lw=1.0, label=r"$V_f=B\varepsilon^{3/4}$")
    ax.loglog(eps, Vx, "o", color=ORANGE, ms=3, label=r"$V_\times$ (quadrature)")
    ax.loglog(eps, lower, color=GREY, lw=0.8, ls="--", label=r"$B\varepsilon^{3/4}(1+\sqrt{\varepsilon})^{-1/2}$")
    ax.set_xlabel(r"$\varepsilon$"); ax.legend(fontsize=7, frameon=False)
    ax.set_title(r"(b) sublevel area, slope $3/4$", fontsize=9)
    fig.tight_layout()
    return save(fig, "sublevel_law")


def fig_curves():
    fig, axs = plt.subplots(1, 3, figsize=(7.2, 2.4), gridspec_kw={"width_ratios": [1.45, 1, 1]})
    r = 0.5
    y = np.linspace(-np.sqrt(r), np.sqrt(r), 600)
    x = np.sqrt(np.clip((r ** 2 - y ** 4) / (1 + y ** 2), 0, None))
    ax = axs[0]
    for sgn in (1, -1):
        ax.plot(sgn * x, sgn * x * y, color=TEAL, lw=1.4)
    ax.plot(0, 0, "o", color=RED, ms=4)
    ax.set_title(r"(a) link $K_\times=r^2$: a node", fontsize=8.5)
    ax.set_xlabel("$x$"); ax.set_ylabel("$xy$"); ax.set_aspect("equal")
    b = 0.8; a = np.sqrt(1 - b ** 4)
    s = np.linspace(0, 2 * np.pi, 600)
    ax = axs[1]
    ax.plot(b * np.sin(s), a * np.sin(2 * s), color=ORANGE, lw=1.4)
    ax.plot(0, 0, "o", color=RED, ms=4)
    ax.set_title(r"(b) orbit shadow, $2\!:\!1$: a node", fontsize=8.5)
    ax.set_aspect("equal")
    s5 = np.sqrt(5)
    Nn = (-335 + 162 * s5) / 12; M2 = (-520 + 249 * s5) / 27; R = 20 * (140 + 11 * s5) / 11397
    A = -M2 / (2 * Nn ** 1.5); B = np.sqrt(M2 * R) / Nn; C = np.sqrt(2 * R) / Nn ** 0.25
    assert abs(B ** 2 + A * C ** 2) < 1e-12
    ts = -B / C
    tau = np.linspace(ts - 0.6, ts + 0.6, 800)
    num = 2 * (C * tau ** 2 + 2 * B * tau - A * C) / (C ** 2 + 4 * tau ** 2)
    ax = axs[2]
    ax.plot(num * (-C), num * 2 * tau, color="k", lw=1.4)
    ax.plot(0, 0, "o", color=RED, ms=4)
    ax.set_title("(c) curvature trace: a cusp", fontsize=8.5)
    fig.tight_layout()
    return save(fig, "three_curves")


# ---------------------------------------------------------------- paper 2
def V_std(x, y):
    ax_ = np.abs(x)
    with np.errstate(divide="ignore", invalid="ignore"):
        val = y / 2 * np.sqrt(x ** 2 + 4 * y ** 2) + x ** 2 / 4 * np.arcsinh(2 * y / np.where(ax_ > 0, ax_, 1))
    return np.where(ax_ > 0, val, y * np.abs(y))


def fig_umbrella():
    fig = plt.figure(figsize=(7.2, 3.3))
    grid = fig.add_gridspec(1, 2, width_ratios=[1.2, 1])
    ax = fig.add_subplot(grid[0], projection="3d")
    ax.computed_zorder = False
    rr, ph = np.meshgrid(np.linspace(0, 1, 41), np.linspace(0, 2 * np.pi, 121))
    x, y = rr * np.cos(ph), rr * np.sin(ph)
    ax.plot_surface(x, x * y, y ** 2, color="#a1d99b", alpha=0.7, linewidth=0, shade=True,
                    lightsource=LIGHT, rasterized=True, zorder=1)
    for rlev in (0.3, 0.6):
        yy = np.linspace(-np.sqrt(rlev), np.sqrt(rlev), 300)
        xx = np.sqrt(np.clip((rlev ** 2 - yy ** 4) / (1 + yy ** 2), 0, None))
        for sg in (1, -1):
            ax.plot(sg * xx, sg * xx * yy, yy ** 2, color=ORANGE, lw=1.3, zorder=6)
    zz = np.linspace(0, 1, 50)
    ax.plot(0 * zz, 0 * zz, zz, color=RED, lw=1.8, zorder=7)
    ax.scatter([0], [0], [0], color="k", s=16, zorder=8)
    ax.set_title(r"(a) $f=(x,xy,y^2)$, double ray, links $\rho_e=r$", fontsize=9)
    ax.view_init(elev=22, azim=-115)
    ax.tick_params(labelsize=6.5, pad=-1)
    sparse_ticks(ax)
    ax2 = fig.add_subplot(grid[1])
    xs, ys = np.meshgrid(np.linspace(-1, 1, 601), np.linspace(-1, 1, 601))
    V = V_std(xs, ys)
    ax2.contour(xs, ys, V, levels=np.linspace(-1.2, 1.2, 25), colors=TEAL, linewidths=0.6)
    for xv in np.linspace(-1, 1, 11):
        ax2.axvline(xv, color=GREY, lw=0.4)
    rho = np.sqrt(xs ** 2 + V ** 2)
    ax2.contour(xs, ys, rho, levels=[0.1, 0.25, 0.5], colors=ORANGE, linewidths=1.0, linestyles="--")
    ax2.plot([0, 0], [-1, 1], color=RED, lw=1.2)
    ax2.set_aspect("equal"); ax2.set_xlabel("$x$"); ax2.set_ylabel("$y$")
    ax2.set_title(r"(b) levels of $V$ (teal), $X=x$ (grey), $\rho$ (dashed)", fontsize=8.5)
    fig.tight_layout()
    return save(fig, "umbrella_coordinates")


def fig_euclidean():
    """Sample |G-I| and |rho_e/rho-1| on circles rho=r for the standard cross-cap."""
    def y_of(x, Vt):
        lo, hi = -2.0 * np.ones_like(x), 2.0 * np.ones_like(x)
        for _ in range(80):
            mid = (lo + hi) / 2
            below = V_std(x, mid) < Vt
            lo, hi = np.where(below, mid, lo), np.where(below, hi, mid)
        return (lo + hi) / 2

    rs = np.logspace(-5, -1, 25)
    dev, rad = [], []
    phi = np.linspace(0, 2 * np.pi, 721)[:-1]
    for r in rs:
        X, Vt = r * np.cos(phi), r * np.sin(phi)
        yv = y_of(X, Vt)
        nrm = np.sqrt(X ** 2 + 4 * yv ** 2)
        n1, n2 = X / nrm, 2 * yv / nrm
        Vx = X / 2 * np.arcsinh(2 * yv / np.where(np.abs(X) > 0, np.abs(X), 1))
        q1, q2 = yv - Vx * n1, -Vx * n2
        qq, qn = q1 ** 2 + q2 ** 2, q1 * n1 + q2 * n2
        dev.append((np.abs(qq / 2) + np.sqrt((qq / 2) ** 2 + qn ** 2)).max())  # spectral norm of G-I
        rad.append(np.abs(np.sqrt(X ** 2 + (X * yv) ** 2 + yv ** 4) / r - 1).max())
    dev, rad = np.array(dev), np.array(rad)
    slope_dev = np.polyfit(np.log(rs[:12]), np.log(dev[:12]), 1)[0]
    slope_rad = np.polyfit(np.log(rs[:12]), np.log(rad[:12]), 1)[0]
    assert np.all(dev <= 4 * rs * (1 + np.log(1 / rs)))  # consistent with the standard-germ remark
    fig, ax = plt.subplots(figsize=(4.4, 2.9))
    ax.loglog(rs, dev, "o-", color=TEAL, ms=3, lw=1.1, label=rf"$\max\|G-I\|$ (slope {slope_dev:.2f})")
    ax.loglog(rs, rad, "s-", color=ORANGE, ms=3, lw=1.1, label=rf"$\max|\rho_e/\rho-1|$ (slope {slope_rad:.2f})")
    ax.loglog(rs, 0.8 * np.sqrt(rs), color=GREY, lw=0.8, ls="--", label=r"general bound $\rho^{1/2}$")
    ax.loglog(rs, rs * np.log(1 / rs), color=GREY, lw=0.8, ls=":", label=r"$\rho\log(1/\rho)$")
    ax.set_xlabel(r"$\rho$"); ax.legend(fontsize=7, frameon=False)
    ax.set_title("standard cross-cap in arclength coordinates", fontsize=8.5)
    fig.tight_layout()
    return save(fig, "asymptotically_euclidean"), slope_dev, slope_rad


def fig_roman():
    fig = plt.figure(figsize=(7.2, 3.2))
    ax = fig.add_subplot(1, 2, 1, projection="3d")
    ax.computed_zorder = False
    th, ph = np.meshgrid(np.linspace(0, np.pi, 121), np.linspace(0, np.pi, 121))
    X, Y, Z = np.sin(th) * np.cos(ph), np.sin(th) * np.sin(ph), np.cos(th)
    ax.plot_surface(Y * Z, X * Z, X * Y, color="#9ecae1", alpha=0.55, linewidth=0, shade=True,
                    lightsource=LIGHT, rasterized=True, zorder=1)
    for k in range(3):
        seg = np.zeros((2, 3)); seg[0, k], seg[1, k] = -0.5, 0.5
        ax.plot(*seg.T, color="#7f1d1d", lw=1.8, zorder=5)
    V = 0.5 * np.array([[1, 0, 0], [-1, 0, 0], [0, 1, 0], [0, -1, 0], [0, 0, 1], [0, 0, -1]])
    ax.scatter(*V.T, color=RED, s=26, zorder=10)
    ax.set_title("(a) Roman surface: double segments, six cross-caps", fontsize=8.5)
    ax.view_init(elev=25, azim=35)
    ax.set_box_aspect((1, 1, 1))
    ax.tick_params(labelsize=6.5, pad=-1)
    sparse_ticks(ax, 3)
    ax2 = fig.add_subplot(1, 2, 2)
    pos = {0: (1, 0), 1: (-1, 0), 2: (0.5, 0.87), 3: (-0.5, -0.87), 4: (-0.5, 0.87), 5: (0.5, -0.87)}
    labels = [r"$+\frac{1}{2}e_1$", r"$-\frac{1}{2}e_1$", r"$+\frac{1}{2}e_2$", r"$-\frac{1}{2}e_2$", r"$+\frac{1}{2}e_3$", r"$-\frac{1}{2}e_3$"]
    n_circ = n_perp = 0
    for i in range(6):
        for j in range(i + 1, 6):
            if abs(V[i] @ V[j]) < 1e-12:  # images on different axes: source lines at 60 degrees
                ax2.plot(*zip(pos[i], pos[j]), color=TEAL, lw=1.2); n_circ += 1
            else:  # ends of one double segment: orthogonal source lines
                ax2.plot(*zip(pos[i], pos[j]), color=ORANGE, lw=1.4, ls="--"); n_perp += 1
    assert (n_circ, n_perp) == (12, 3)  # 24 and 6 ordered pairs
    for i in range(6):
        ax2.plot(*pos[i], "o", color=RED, ms=7)
        ax2.annotate(labels[i], pos[i], textcoords="offset points", ha="center", va="center",
                     xytext=(18 * pos[i][0], 16 * pos[i][1]), fontsize=8)
    ax2.set_aspect("equal"); ax2.axis("off"); ax2.set_xlim(-1.3, 1.3); ax2.set_ylim(-1.15, 1.15)
    ax2.set_title(r"(b) $P_\circ$ (solid, octahedron) and $P_\perp$ (dashed)", fontsize=9)
    fig.tight_layout()
    return save(fig, "roman_surface")


def main():
    assert not sys.flags.optimize
    OUT.mkdir(parents=True, exist_ok=True)
    paths = [fig_surface(), fig_rigidity(), fig_readout(), fig_field(), fig_folds(), fig_sublevel(),
             fig_curves(), fig_umbrella()]
    p, sd, sr = fig_euclidean()
    paths += [p, fig_roman()]
    assert 0.75 < sd < 1.05 and 0.75 < sr < 1.05, (sd, sr)  # standard germ: O(rho log 1/rho)
    manifest = {"generator": "verification/build_successor_figures.py",
                "numpy": np.__version__, "matplotlib": matplotlib.__version__,
                "numerical_slopes_standard_germ": {"G_minus_I": round(float(sd), 3), "radius_ratio": round(float(sr), 3)},
                "figures": {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}}
    (OUT / "FIGURES_MANIFEST.json").write_text(json.dumps(manifest, indent=2) + "\n")
    print(f"PASS {len(paths)} figures; standard-germ slopes |G-I| {sd:.3f}, |rho_e/rho-1| {sr:.3f}")


if __name__ == "__main__":
    main()
