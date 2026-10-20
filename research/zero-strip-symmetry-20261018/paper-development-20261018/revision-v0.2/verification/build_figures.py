"""Reproducible formula-based manuscript figures; no empirical zeta dataset."""
from fractions import Fraction as F
from pathlib import Path
import hashlib
import json
import sys

if not __debug__:
    raise RuntimeError('Assertions must be enabled for verification')

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.patches import Rectangle, FancyArrowPatch

ROOT = Path(__file__).resolve().parents[1]
BLUE, GOLD, INK = '#245780', '#b16b16', '#292929'
plt.rcParams.update({'font.family': 'serif', 'mathtext.fontset': 'cm',
                     'font.size': 10, 'axes.titlesize': 11, 'axes.labelsize': 10,
                     'axes.linewidth': .7, 'lines.linewidth': 1.5,
                     'pdf.fonttype': 42, 'svg.fonttype': 'none',
                     'svg.hashsalt': 'height-quotients-v02', 'savefig.dpi': 300})


def build_data():
    roots = [{'n': n, 'x': str(sign * F(1, 4)), 'height': str(2**n)}
             for n in range(1, 9) for sign in (-1, 1)]
    counts = [{'H': str(F(h)), 'M': 2 * sum(2**n <= h for n in range(1, 21))}
              for k in range(1, 10) for h in (F(2**k) - F(1, 2), F(2**k), F(2**k) + F(1, 2))]
    secondary = []
    for k in range(1, 20):
        for j in range(33):
            h = F(2**k) * (1 + F(j, 32))
            # The last point represents the left limit at the next jump.
            secondary.append({'k': k, 'H': str(h), 'M_within_interval': 2*k,
                              'bound': str(F(4*k, 1)/h), 'left_limit': j == 32})
    tails = []
    for n in range(1, 13):
        b = F(18, 3*4**n) + F(81, 15*16**n)
        tails.append({'N': n, 'R': 3, 'B': str(b),
                      'tail_bound': str(b/(1-b)) if b < 1 else None})
    return {'classification': 'Schematics and exact formula evaluations; no zeta measurements',
            'eta': '1/4', 'roots_positive_height': roots, 'count_endpoints': counts,
            'secondary_bound_K1': secondary,
            'secondary_closed_endpoint': {'H': str(2**20), 'M': 40, 'bound': str(F(80, 2**20))},
            'compact_tail': tails}


def save(fig, name, out):
    fig.savefig(out/f'{name}.pdf', bbox_inches='tight', metadata={'CreationDate': None, 'ModDate': None})
    fig.savefig(out/f'{name}.svg', bbox_inches='tight', metadata={'Date': None})
    fig.savefig(out/f'{name}.png', bbox_inches='tight')
    plt.close(fig)


def geometry(out):
    fig, axes = plt.subplots(1, 2, figsize=(7.2, 3.35))
    for ax, sign, title in zip(axes, (1, -1), ('(a) Cylinder', '(b) Mobius band')):
        ax.add_patch(Rectangle((-.5, 0), 1, 1, fill=False, lw=.9, edgecolor=INK))
        ax.plot([0, 0], [0, 1], ls='--', lw=1.1, color=INK)
        for y, direction in ((1, 1), (0, sign)):
            ax.add_patch(FancyArrowPatch((-.44*direction, y), (.44*direction, y),
                                        arrowstyle='-|>', mutation_scale=13, lw=1.6, color=BLUE))
        ax.plot(.25, 1, 'o', color=GOLD, ms=6, clip_on=False, zorder=4)
        ax.plot(sign*.25, 0, 'o', color=GOLD, ms=6, clip_on=False, zorder=4)
        ax.annotate(r'$(x,L)$', (.25, 1), xytext=(6, 8), textcoords='offset points', fontsize=10)
        ax.annotate(r'$(ex,0)$', (sign*.25, 0), xytext=(5, -17), textcoords='offset points', fontsize=10)
        ax.plot(.32, .57, 's', ms=5, markerfacecolor='white', markeredgecolor=INK)
        ax.plot(0, .57, 's', color=INK, ms=5)
        ax.add_patch(FancyArrowPatch((.30, .57), (.025, .57), arrowstyle='->', mutation_scale=12, color=INK))
        ax.text(.10, .66, r'$r_e$', fontsize=12)
        ax.text(-.42, .48, r'$x=0$', fontsize=10)
        ax.set_xticks([-.5, 0, .5], [r'$-A$', '0', r'$A$'])
        ax.set_yticks([0, 1], ['0', r'$L$'])
        ax.set_xlim(-.65, .67); ax.set_ylim(-.29, 1.2)
        ax.set_xlabel(r'Transverse coordinate $x$'); ax.set_ylabel(r'Height $t$')
        ax.set_title(title + (r' ($e=+1$)' if sign == 1 else r' ($e=-1$)'), loc='left')
        for spine in ax.spines.values(): spine.set_visible(False)
        ax.tick_params(length=0)
    fig.tight_layout(w_pad=3)
    save(fig, 'figure-01-quotient-seams', out)


def sparse_divisor(data, out):
    fig, (ax, bx) = plt.subplots(1, 2, figsize=(7.2, 3.2))
    for sign, marker, label in ((-1, 'o', r'$x=-1/4$'), (1, 's', r'$x=+1/4$')):
        rows = [r for r in data['roots_positive_height'] if float(F(r['x']))*sign > 0]
        ax.scatter([float(F(r['x'])) for r in rows], [r['n'] for r in rows],
                   marker=marker, s=27, color=BLUE, label=label)
    ax.axvline(0, ls='--', lw=1, color=INK)
    ax.set_xlim(-.52, .52); ax.set_xticks([-.5, -.25, 0, .25, .5])
    ax.set_ylim(.4, 8.6); ax.set_yticks(range(1, 9), [rf'$2^{{{n}}}$' for n in range(1, 9)])
    ax.set_xlabel(r'Centered real part $x$'); ax.set_ylabel(r'Height $\gamma$ (base-2 log scale)')
    ax.set_title('(a) Prescribed positive-height roots', loc='left')
    u = np.arange(0, 9.0001, 1/64)
    h = 2**u
    count = np.array([2*sum(2**n <= hh for n in range(1, 10)) for hh in h])
    bx.step(u, count, where='post', color=BLUE)
    bx.scatter(range(1, 10), range(2, 20, 2), s=18, color=BLUE, zorder=3)
    bx.scatter(range(1, 10), range(0, 18, 2), s=18, facecolors='white', edgecolors=BLUE, zorder=3)
    bx.set_xlim(0, 9.3); bx.set_ylim(-.4, 19.4)
    bx.set_xticks([0, 2, 4, 6, 8]); bx.set_yticks([0, 4, 8, 12, 16])
    bx.set_xlabel(r'Height cutoff $\log_2 H$'); bx.set_ylabel(r'Added count $M(H)$')
    bx.set_title('(b) Closed-endpoint count', loc='left')
    bx.text(.35, 16.0, r'$M(H)=2\lfloor\log_2 H\rfloor$', fontsize=12)
    for a in (ax, bx): a.spines[['top', 'right']].set_visible(False)
    fig.tight_layout(w_pad=2.5)
    save(fig, 'figure-02-sparse-divisor', out)


def bounds(data, out):
    fig, (ax, bx) = plt.subplots(1, 2, figsize=(7.2, 3.2))
    for k in range(1, 20):
        rows = [r for r in data['secondary_bound_K1'] if r['k'] == k]
        x = [np.log2(float(F(r['H']))) for r in rows]
        y = [float(F(r['bound'])) for r in rows]
        ax.plot(x, y, color=BLUE)
    for k in (1, 5, 10, 15, 20):
        closed = (next(r for r in data['secondary_bound_K1'] if r['k'] == k)
                  if k < 20 else data['secondary_closed_endpoint'])
        ax.plot(k, float(F(closed['bound'])), 'o', ms=4, color=BLUE)
        if k > 1:
            left = next(r for r in data['secondary_bound_K1'] if r['k'] == k-1 and r['left_limit'])
            ax.plot(k, float(F(left['bound'])), 'o', ms=4, markerfacecolor='white', markeredgecolor=BLUE)
    ax.set_yscale('log'); ax.set_xlim(1, 20.4); ax.set_ylim(4e-5, 3)
    ax.set_xticks([1, 5, 10, 15, 20]); ax.set_xlabel(r'Height cutoff $\log_2 H$')
    ax.set_ylabel('Upper bound on secondary difference')
    ax.set_title(r'(a) $2M(H)/H$, for $\|h\|_\infty=1$', loc='left')
    rows = [r for r in data['compact_tail'] if r['tail_bound'] is not None]
    bx.semilogy([r['N'] for r in rows], [float(F(r['tail_bound'])) for r in rows], '-s', color=GOLD, ms=4)
    bx.set_xlim(1, 12.4); bx.set_xticks([2, 4, 6, 8, 10, 12])
    bx.set_xlabel(r'Product cutoff $N$'); bx.set_ylabel('Uniform tail-factor error bound')
    bx.set_title(r'(b) $B_N(3)/(1-B_N(3))$, $|w|\leq3$', loc='left')
    bx.text(.04, .07, r'Only $B_N(3)<1$ is plotted.', transform=bx.transAxes, fontsize=9)
    for a in (ax, bx):
        a.spines[['top', 'right']].set_visible(False)
        a.grid(axis='y', color='.90', linewidth=.5)
    fig.tight_layout(w_pad=2.5)
    save(fig, 'figure-03-certified-bounds', out)


def main():
    out = ROOT/'figures'
    if len(sys.argv) == 3 and sys.argv[1] == '--output-dir': out = Path(sys.argv[2]).resolve()
    elif len(sys.argv) != 1: raise SystemExit('Usage: build_figures.py [--output-dir PATH]')
    out.mkdir(parents=True, exist_ok=True)
    data = build_data()
    (out/'figure-data.json').write_text(json.dumps(data, indent=2)+'\n')
    geometry(out); sparse_divisor(data, out); bounds(data, out)
    info = {'python': sys.version.split()[0], 'numpy': np.__version__, 'matplotlib': matplotlib.__version__,
            'classification': data['classification'],
            'sha256': {f.name: hashlib.sha256(f.read_bytes()).hexdigest() for f in sorted(out.iterdir()) if f.suffix in ('.pdf', '.svg', '.png', '.json') and f.name != 'MANIFEST.json'}}
    (out/'MANIFEST.json').write_text(json.dumps(info, indent=2)+'\n')
    print('Generated three formula-based figures: PDF, SVG, PNG, exact source data and manifest.')


if __name__ == '__main__': main()
