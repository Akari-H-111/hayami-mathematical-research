"""Build the native vector figures and manuscript with the existing TeX tools."""
from pathlib import Path
import argparse
import subprocess

ROOT = Path(__file__).resolve().parent
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--figures', action='store_true', help='Rebuild the ten vector masters and exports')
parser.add_argument('--paper', action='store_true', help='Compile the illustrated manuscript')
parser.add_argument('--render', action='store_true', help='Render manuscript pages into qa/pages/')
args = parser.parse_args()
if not any(vars(args).values()):
    parser.error('Choose --figures, --paper and/or --render.')
if args.figures:
    sources = sorted((ROOT / 'figures').glob('fig*.tex'))
    assert len(sources) == 10
    for source in sources:
        subprocess.run(['tectonic', '--keep-logs', source.name], cwd=source.parent, check=True)
        pdf = source.with_suffix('.pdf')
        subprocess.run(['qpdf', '--check', str(pdf)], check=True, capture_output=True)
        subprocess.run(['pdftocairo', '-svg', str(pdf), str(source.with_suffix('.svg'))], check=True)
        subprocess.run(['pdftoppm', '-singlefile', '-r', '200', '-png', str(pdf), str(source.with_suffix(''))], check=True)
        print('BUILT', source.stem, flush=True)
if args.paper:
    subprocess.run(['tectonic', '--keep-logs', 'paper_III_spectral_floor_v0_09.tex'], cwd=ROOT, check=True)
if args.render:
    destination = ROOT / 'qa/pages'
    destination.mkdir(parents=True, exist_ok=True)
    for preview in destination.glob('page-*.png'):
        preview.unlink()  # Only disposable previews produced by this command.
    subprocess.run(['pdftoppm', '-r', '120', '-png', str(ROOT / 'paper_III_spectral_floor_v0_09.pdf'), str(destination / 'page')], check=True)
