#!/usr/bin/env python3
"""Render four compact, fixed-width body figures from the saved companion data."""
from __future__ import annotations

import json
import math
from datetime import datetime, timezone
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.text import Text
from matplotlib import patches
from matplotlib.colors import LinearSegmentedColormap
import mpmath as mp
import numpy as np

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "body"
for directory in ("pdf", "svg", "png"):
    (OUT / directory).mkdir(parents=True, exist_ok=True)

WHITE = "#ffffff"; NAVY = "#12233f"; GOLD = "#c99618"; TEAL = "#008c95"
VIOLET = "#7354a8"; BLUE = "#2878b5"; CORAL = "#c85c45"; GRAY = "#657082"
plt.rcParams.update({
    "figure.facecolor": WHITE, "axes.facecolor": WHITE, "savefig.facecolor": WHITE,
    "text.color": NAVY, "axes.labelcolor": NAVY, "axes.edgecolor": NAVY,
    "xtick.color": NAVY, "ytick.color": NAVY, "font.family": "DejaVu Sans",
    "font.size": 9.5, "axes.titlesize": 10.5, "axes.labelsize": 9.5,
    "xtick.labelsize": 8.7, "ytick.labelsize": 8.7, "legend.fontsize": 8.5,
    "pdf.fonttype": 42, "ps.fonttype": 42, "svg.fonttype": "path",
    "svg.hashsalt": "heegner-golden-body-20261020", "mathtext.fontset": "dejavusans",
    "axes.unicode_minus": False,
})
PDF_META = {
    "Title": "Golden-coordinate body figure", "Author": "Akari Hayami (Jian-Yu Huang)",
    "Creator": "Matplotlib deterministic renderer", "CreationDate": datetime(2026, 10, 20, tzinfo=timezone.utc),
    "ModDate": datetime(2026, 10, 20, tzinfo=timezone.utc),
}

values = json.loads((ROOT / "data" / "figure_values.json").read_text())
arrays = np.load(ROOT / "data" / "figure_arrays.npz")
mp.mp.dps = 180
constant = {name: mp.mpf(value) for name, value in values["constants"].items()}
c0, u0, kappa = (float(constant[name]) for name in ("c0", "u0", "kappa"))
gamma = float(constant["gamma"])
t0 = float(constant["t_lateral"])
M = np.array(values["matrices"]["M"]); J = np.array(values["matrices"]["J"]); A = np.array(values["matrices"]["A"])
reflection = {key: np.array(item) for key, item in values["reflection_samples"].items()}

def surface(t, u):
    c = np.cos(t); s = np.sin(t); q = np.sqrt(np.maximum(c * (2 - c), 0))
    return np.array([c + 2 * u * (1 - c), (1 - u) * s, u * q])

def cross_norm(c, u):
    s = np.sqrt(np.maximum(1 - c * c, 0)); q = np.sqrt(c * (2 - c))
    st = np.array([s * (2 * u - 1), (1 - u) * c, -u * s * (1 - c) / q])
    su = np.array([2 * (1 - c), -s, q])
    return np.linalg.norm(np.cross(st, su, axis=0), axis=0)

LAYOUT_AUDIT=[]

def save(fig, number):
    """Preserve the specified 6.4-inch canvas; body placement is precomputed."""
    fig.canvas.draw()
    renderer=fig.canvas.get_renderer(); bounds=fig.bbox
    records=[]; outside=[]; undrawn_tick_text=set()
    for axes in fig.axes:
        axis_list=[axes.xaxis,axes.yaxis]
        if hasattr(axes,'zaxis'): axis_list.append(axes.zaxis)
        for axis in axis_list:
            lo,hi=sorted(axis.get_view_interval())
            for tick in axis.get_major_ticks()+axis.get_minor_ticks():
                if not lo<=tick.get_loc()<=hi:
                    undrawn_tick_text.update((id(tick.label1),id(tick.label2)))
    for artist in fig.findobj(match=Text):
        if id(artist) in undrawn_tick_text or not artist.get_visible() or not artist.get_text().strip(): continue
        box=artist.get_window_extent(renderer)
        records.append(float(artist.get_fontsize()))
        if box.x0 < -1 or box.y0 < -1 or box.x1 > bounds.width+1 or box.y1 > bounds.height+1:
            outside.append({'text':artist.get_text(),'bbox_pixels':list(box.bounds)})
    LAYOUT_AUDIT.append({'number':number,'canvas_inches':fig.get_size_inches().tolist(),
        'minimum_base_text_points':min(records),'outside_canvas':outside})
    for extension, dpi in (("pdf", None), ("svg", None), ("png", 300)):
        options = {"bbox_inches": None}
        if dpi:
            options["dpi"] = dpi
        if extension == "pdf":
            options["metadata"] = PDF_META
        fig.savefig(OUT / extension / f"body_{number:02d}.{extension}", **options)
    plt.close(fig)

def box(ax, xy, text, color, width=.20, height=.26):
    x, y = xy
    ax.add_patch(patches.FancyBboxPatch((x, y), width, height, boxstyle="round,pad=.012,rounding_size=.018", fc=WHITE, ec=color, lw=1.5))
    ax.text(x + width / 2, y + height / 2, text, ha="center", va="center", fontsize=9.5, color=NAVY, linespacing=1.25)

def body01():
    fig, ax = plt.subplots(figsize=(6.4, 1.95)); fig.subplots_adjust(.035, .12, .985, .91)
    ax.set(xlim=(0, 1), ylim=(0, 1)); ax.axis("off")
    items = [
        ((.025, .57), r"$v=r(\tau_{163})^5$" + "\nHermite input", BLUE),
        ((.265, .57), r"recover $\sqrt{5}$" + "\nand $c_0$", GOLD),
        ((.505, .57), r"$M$, $A=JMJ$" + "\nreflection pair", VIOLET),
        ((.745, .57), "positive eigenline" + "\n" + r"$\kappa=r(i)$", TEAL),
        ((.745, .14), "completed" + "\nfunctional equation", TEAL),
    ]
    for xy, text, color in items:
        box(ax, xy, text, color)
    for start, end in [((.225, .70), (.265, .70)), ((.465, .70), (.505, .70)), ((.705, .70), (.745, .70)), ((.845, .57), (.845, .40))]:
        ax.annotate("", end, start, arrowprops={"arrowstyle": "->", "color": NAVY, "lw": 1.45})
    ax.text(.025, .16, r"$\tau_{163}$: arithmetic recovery." + "\n" + r"$i$: inversion fixed point.", color=GRAY, fontsize=9)
    save(fig, 1)

def body02():
    fig = plt.figure(figsize=(6.4, 3.3)); fig.subplots_adjust(.045, .12, .985, .94, wspace=.32)
    ax = fig.add_axes([.025,.14,.43,.77],projection="3d",computed_zorder=False)
    diag = fig.add_axes([.565,.17,.335,.73])
    T, U = np.meshgrid(np.linspace(-1.42, 1.42, 62), np.linspace(0, 1, 32))
    X, Y, Z = surface(T, U)
    ax.plot_surface(X, Y, Z, rstride=2, cstride=2, color=GOLD, alpha=.30, linewidth=.22, edgecolor="#ad8119")
    marked = arrays["surface_reflected_points"]
    ax.scatter(*marked.T, s=38, color=CORAL, edgecolor=NAVY, depthshade=False)
    ax.set_box_aspect(tuple(np.ptp(lim) for lim in (ax.get_xlim3d(),ax.get_ylim3d(),ax.get_zlim3d()))); ax.view_init(25, -58)
    ax.set(xlabel="$x$", ylabel="$y$", zlabel="$z$")
    ax.set_title(r"$S(t,u)$", pad=1)
    cc = np.linspace(.03, .97, 220); uu = np.linspace(.02, .98, 190); C, U2 = np.meshgrid(cc, uu)
    floor = 1e-8; norm = cross_norm(C, U2)
    image = diag.contourf(C, U2, np.log10(norm + floor), levels=24, cmap=LinearSegmentedColormap.from_list("bodywarm", ["#fff9e9", GOLD, "#9c5d10"]))
    diag.plot(cc, (1 - cc) / 2, color=VIOLET, ls="--", lw=1.7, label=r"necessary $u=(1-c)/2$")
    diag.scatter([c0], [u0], s=42, color=CORAL, edgecolor=NAVY, zorder=4, label=r"actual $(c_0,u_0)$")
    diag.set(xlim=(.03, .97), ylim=(.02, .98), xlabel=r"$c=\cos t$", ylabel="$u$", title=r"$\log_{10}(\|S_t\!\times\!S_u\|+10^{-8})$")
    diag.legend(frameon=True, loc="upper right", fontsize=8.7)
    diag.text(.05, .06, r"$P(c_0)=0$", transform=diag.transAxes, color=NAVY, fontsize=9)
    bar=fig.colorbar(image,cax=fig.add_axes([.93,.17,.018,.73]))
    bar.ax.tick_params(labelsize=8.7,pad=2)
    save(fig, 2)

def body03():
    fig, ax = plt.subplots(figsize=(6.4, 2.65)); fig.subplots_adjust(.15, .20, .98, .88)
    corrections = [abs(float(mp.mpf(x))) for x in values["hermite"]["corrections"]]
    residuals = [abs(float(mp.mpf(x))) for x in values["hermite"]["residuals"]]
    index = np.arange(1, len(corrections) + 1)
    ax.semilogy(index, corrections, "s--", color=GOLD, lw=1.5, ms=4.8, label="successive $j$ correction")
    ax.semilogy(index, residuals, "o-", color=BLUE, lw=2.1, ms=4.8, label="residual after correction")
    ax.set(xticks=index, xlabel="Number of corrections", ylabel="Absolute magnitude", title="Fixed-gap corrections")
    ax.set_ylim(1e-113,1e-10)
    ax.set_yticks([1e-10,1e-30,1e-50,1e-70,1e-90,1e-110])
    ax.grid(axis="y", color="#dfe5ea", lw=.6); ax.legend(frameon=False, loc="upper right")
    ax.text(.025, .09, r"$N-R\approx7.499274028\times10^{-13}$", transform=ax.transAxes, color=NAVY, fontsize=9)
    save(fig, 3)

def reflection_panel(ax, matrix, source, image, eigenline, title, source_label, image_label):
    circle = np.linspace(0, 2 * np.pi, 240)
    ax.plot(np.cos(circle), np.sin(circle), color="#dce3ea", lw=1.3)
    plus = eigenline / np.linalg.norm(eigenline); minus = np.array([-plus[1], plus[0]])
    ax.axline(-plus, plus, color=GOLD, lw=2.0, label="$+1$ eigenline")
    ax.axline(-minus, minus, color=GRAY, lw=1.1, ls="--", label="$-1$ eigenline")
    ax.quiver(0, 0, *source, angles="xy", scale_units="xy", scale=1, color=TEAL, width=.014, label=source_label)
    ax.quiver(0, 0, *image, angles="xy", scale_units="xy", scale=1, color=CORAL, width=.014, label=image_label)
    ax.plot([source[0], image[0]], [source[1], image[1]], color=GRAY, lw=.9, ls=":")
    ax.text(*(source * 1.12), source_label, color=TEAL, fontsize=9)
    ax.text(*(image * 1.12), image_label, color=CORAL, fontsize=9)
    ax.set(aspect="equal", xlim=(-1.28, 1.28), ylim=(-1.28, 1.28), xlabel="$x$", ylabel="$y$", title=title)

def body04():
    fig = plt.figure(figsize=(6.4, 3.25)); fig.subplots_adjust(.095, .14, .985, .93, wspace=.50)
    grid = fig.add_gridspec(1, 3, width_ratios=[.92, .92, .92])
    left = fig.add_subplot(grid[0]); right = fig.add_subplot(grid[1]); strip = fig.add_subplot(grid[2])
    reflection_panel(left, M, reflection["M_input"], reflection["M_output"], np.array([kappa, 1.]), "$M$ reflection", r"$\mathbf{z}$", r"$M\mathbf{z}$")
    reflection_panel(right, A, reflection["A_input"], reflection["A_output"], np.array([1., kappa]), "$A=JMJ$ reflection", r"$J\mathbf{z}$", r"$A(J\mathbf{z})$")
    strip.axis("off"); strip.set(xlim=(0, 1), ylim=(0, 1))
    strip.text(.04, .88, "Residues", color=NAVY, fontsize=10.5, weight="bold")
    strip.text(.04, .79, r"$1,2,3,4,5=0$", color=GRAY, fontsize=8.5)
    labels = ["1", r"$\kappa$", r"$-\kappa$", "-1", "0"]
    for position, label in zip(np.linspace(.12, .88, 5), labels):
        strip.add_patch(patches.Circle((position, .57), .085, fc="#e8f5f4", ec=TEAL, lw=1.3))
        strip.text(position, .57, label, ha="center", va="center", color=NAVY, fontsize=8.8)
    strip.text(.04, .31, r"$J(x,y)=(y,x)$", color=VIOLET, fontsize=8.8)
    save(fig, 4)

for render in (body01, body02, body03, body04):
    render()
print("Rendered 4 fixed-width body figures from saved companion data.")

(ROOT/'data/body_layout_audit.json').write_text(json.dumps(LAYOUT_AUDIT,indent=2)+'\n')
meta=json.loads((ROOT/'data/body_metadata.json').read_text())
meta['minimum_ordinary_artist_font_points']=min(x['minimum_base_text_points'] for x in LAYOUT_AUDIT)
meta['layout_check']='Artist bounds checked against the fixed canvas after drawing; mathematical scripts retain natural smaller glyphs.'
(ROOT/'data/body_metadata.json').write_text(json.dumps(meta,indent=2)+'\n')
assert not any(x['outside_canvas'] for x in LAYOUT_AUDIT), LAYOUT_AUDIT
assert meta['minimum_ordinary_artist_font_points']>=8.5
print('PASS: all body text artists fit the canvas and base font sizes are at least 8.5 pt.')
