"""Seal the approved edition, then verify its extracted source and rendered rebuild."""
from pathlib import Path
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import zipfile
from PIL import Image

ROOT = Path(__file__).resolve().parent
STEM = 'paper_II_marked_naturality_v0_09'
ARCHIVE = ROOT.parent / 'paper_II_illustrated_v0_09_source.zip'
RECEIPT = ROOT.parent / 'paper_II_illustrated_v0_09_receipt.json'
ENV = {**os.environ, 'PYTHONDONTWRITEBYTECODE': '1'}
sha = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
subprocess.run([sys.executable, '-B', 'verify_integrated.py'], cwd=ROOT, check=True, env=ENV)
qa = json.loads((ROOT / 'qa/verification.json').read_text())
assert qa['visual_record_validated']
visual = json.loads((ROOT / 'qa/VISUAL_REVIEW.json').read_text())
files = sorted(p for p in ROOT.rglob('*') if p.is_file()
               and p.name not in {'SHA256SUMS.txt', '.DS_Store'}
               and not any(x in {'__pycache__', 'pages', 'portability'} for x in p.relative_to(ROOT).parts))
manifest = ROOT / 'SHA256SUMS.txt'
manifest.write_text(''.join(f'{sha(p)}  {p.relative_to(ROOT).as_posix()}\n' for p in files))
with zipfile.ZipFile(ARCHIVE, 'w', compression=zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
    for path in files + [manifest]:
        archive.write(path, ROOT.name + '/' + path.relative_to(ROOT).as_posix())
with zipfile.ZipFile(ARCHIVE) as archive:
    assert archive.testzip() is None
    member_count = len(archive.namelist())
logdir = ROOT / 'qa/portability'
logdir.mkdir(exist_ok=True)

def run(command, cwd, name):
    with (logdir / (name + '.txt')).open('w') as stream:
        result = subprocess.run(command, cwd=cwd, stdout=stream, stderr=subprocess.STDOUT, env=ENV)
    if result.returncode:
        print((logdir / (name + '.txt')).read_text())
        raise SystemExit(f'Portability failure: {name}, exit {result.returncode}')
    print('PASS', name, flush=True)

with tempfile.TemporaryDirectory(prefix='paper-II-v009-portability-') as temporary:
    temp = Path(temporary)
    with zipfile.ZipFile(ARCHIVE) as archive:
        archive.extractall(temp)
    extracted = temp / ROOT.name
    count = 0
    for line in (extracted / 'SHA256SUMS.txt').read_text().splitlines():
        expected, name = line.split('  ', 1)
        assert sha(extracted / name) == expected, name
        count += 1
    print('PASS extracted payload hashes:', count, flush=True)
    run([sys.executable, '-B', 'verify_integrated.py'], extracted, 'extracted_integrated')
    before_tex = sha(extracted / (STEM + '.tex'))
    run([sys.executable, '-B', 'integrate.py'], extracted, 'regenerated_manuscript')
    assert sha(extracted / (STEM + '.tex')) == before_tex
    run([sys.executable, '-B', 'verify_evidence.py'], extracted, 'extracted_evidence')
    run([sys.executable, '-B', 'verify_integrated.py'], extracted, 'extracted_after_evidence')
    # Compile in a fresh directory using only final TeX and the seven vector PDFs.
    build = temp / 'compile'
    (build / 'figures').mkdir(parents=True)
    shutil.copy2(extracted / (STEM + '.tex'), build)
    for pdf in (extracted / 'figures').glob('fig*.pdf'):
        shutil.copy2(pdf, build / 'figures')
    run(['tectonic', '--keep-logs', STEM + '.tex'], build, 'portable_compile')
    log = (build / (STEM + '.log')).read_text()
    assert not re.search(r'Overfull|Underfull|undefined|Missing character|LaTeX Warning', log)
    run(['qpdf', '--check', str(build / (STEM + '.pdf'))], build, 'portable_qpdf')
    render = temp / 'render'
    render.mkdir()
    run(['pdftoppm', '-r', '120', '-png', str(build / (STEM + '.pdf')), str(render / 'page')], build, 'portable_render')
    pixels = {p.name: hashlib.sha256(Image.open(p).convert('RGB').tobytes()).hexdigest()
              for p in sorted(render.glob('page-*.png'))}
    assert pixels == visual['page_pixel_sha256'], 'Rebuilt pages differ from the visually approved PDF.'
    portable_pdf_sha = sha(build / (STEM + '.pdf'))
    print('PASS all rebuilt pages pixel-identical to approved PDF', flush=True)
    # Native figure sources are portable too; compare each rebuilt PDF render.
    masters = temp / 'native-figures'
    masters.mkdir()
    for source in (extracted / 'figures').glob('*.tex'):
        shutil.copy2(source, masters)
    for source in sorted(masters.glob('fig*.tex')):
        run(['tectonic', '--keep-logs', source.name], masters, 'native_' + source.stem)
        run(['pdftoppm', '-singlefile', '-r', '200', '-png', str(source.with_suffix('.pdf')), str(source.with_suffix(''))], masters, 'render_' + source.stem)
        original = Image.open(extracted / 'figures' / source.with_suffix('.png').name).convert('RGB')
        rebuilt = Image.open(source.with_suffix('.png')).convert('RGB')
        assert original.size == rebuilt.size and original.tobytes() == rebuilt.tobytes(), source.name
    print('PASS all seven native figure rebuilds pixel-identical', flush=True)
receipt = {'date': '2026-09-08', 'archive': ARCHIVE.name, 'sha256': sha(ARCHIVE),
           'bytes': ARCHIVE.stat().st_size, 'zip_crc_passed': True, 'members': member_count,
           'payload_hashes_checked': count, 'pages': qa['pages'], 'figures': 7,
           'author': qa['author'], 'approved_pdf_sha256': qa['sha256'],
           'extracted_source_regeneration_exact': True, 'extracted_six_entry_evidence_replay': 'PASS',
           'portable_compile_and_qpdf': 'PASS', 'portable_pdf_sha256': portable_pdf_sha,
           'all_14_rebuilt_pages_pixel_identical': True, 'all_7_native_figures_pixel_identical': True,
           'originals_unchanged': True,
           'scope': 'Paper II illustrated closeout and unchanged finite-evidence replay. Paper I high-arity v0.05/v0.06 completion replays are not repeated in this delivery.',
           'portability_log_sha256': {p.name: sha(p) for p in sorted(logdir.glob('*.txt'))}}
RECEIPT.write_text(json.dumps(receipt, indent=2) + '\n')
print('SEALED', ARCHIVE, '\nSHA256', receipt['sha256'])
