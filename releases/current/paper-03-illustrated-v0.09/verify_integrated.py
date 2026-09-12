"""Validate preserved mathematics, figure integration, vector PDFs and evidence records."""
from pathlib import Path
import hashlib
import json
import re
import runpy
import subprocess
import sys
import xml.etree.ElementTree as ET
import pdfplumber
from pypdf import PdfReader
from PIL import Image

ROOT = Path(__file__).resolve().parent
STEM = 'paper_III_spectral_floor_v0_09'
if sys.flags.optimize:
    raise SystemExit('Assertions must be enabled.')
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
text = (ROOT / (STEM + '.tex')).read_text()
original = (ROOT / 'provenance/paper_III_spectral_floor_v0_08.tex').read_text()
restored = re.sub(r'\n% BEGIN ILLUSTRATION \d+\n.*?% END ILLUSTRATION \d+\n\n', '', text, flags=re.S)
restored = re.sub(r'\n% BEGIN ILLUSTRATION PREAMBLE\n.*?% END ILLUSTRATION PREAMBLE\n', '', restored, flags=re.S)
restored = re.sub(r'\n% BEGIN ILLUSTRATION EVIDENCE NOTE\n.*?% END ILLUSTRATION EVIDENCE NOTE\n\n', '', restored, flags=re.S)
restored = restored.replace('Paper III, illustrated edition v0.09', 'Paper III, manuscript closeout v0.08')
restored = restored.replace('Akari Hayami (Jian-Yu Huang)', 'Akari H.')
assert restored == original, 'Original mathematical body changed outside authorized additions.'
assert 'Akari H.' not in text
assert text.count('Akari Hayami (Jian-Yu Huang)') == original.count('Akari H.')
assert text.count(r'\begin{figure}') == text.count(r'\end{figure}') == 10
assert text.count(r'\includegraphics') == 10
check = runpy.run_path(str(ROOT / 'evidence/verify_pdf_outputs.py'))['check_paper']
check.__globals__['BASE'] = ROOT
qa = check(STEM)
assert qa['structural_and_text_qa_passed'], qa['checks']
reader = PdfReader(ROOT / (STEM + '.pdf'))
assert reader.metadata.author == 'Akari Hayami (Jian-Yu Huang)'
destinations = {int(k.split('.')[1]): reader.get_destination_page_number(v)+1
                for k, v in reader.named_destinations.items() if re.fullmatch(r'figure\.\d+', k)}
assert sorted(destinations) == list(range(1, 11))
assert [destinations[n] for n in sorted(destinations)] == sorted(destinations.values())
captions = {}
with pdfplumber.open(ROOT / (STEM + '.pdf')) as document:
    for n, page in enumerate(document.pages, 1):
        for number in re.findall(r'^Figure[ \t]+(\d+)\.[ \t]+\S', page.extract_text() or '', re.M):
            assert int(number) not in captions
            captions[int(number)] = n
assert captions == destinations, (captions, destinations)
figure_checks = []
for pdf in sorted((ROOT / 'figures').glob('fig*.pdf')):
    subprocess.run(['qpdf', '--check', str(pdf)], check=True, capture_output=True)
    log = pdf.with_suffix('.log').read_text()
    assert not re.search(r'Overfull|Underfull|undefined|Missing character|! ', log)
    with pdfplumber.open(pdf) as document:
        assert len(document.pages) == 1
        page = document.pages[0]
        assert 200 < page.height < 600, (pdf.name, page.height)
        assert 430 < page.width < 470, (pdf.name, page.width)
        assert not page.images
        assert all(-.5 <= c['x0'] <= c['x1'] <= page.width+.5 and
                   -.5 <= c['top'] <= c['bottom'] <= page.height+.5 for c in page.chars)
        # Main labels use 9pt type; check their actual scale at manuscript width.
        factor = 446.4 / page.width
        assert factor * 9 >= 8.5, (pdf.name, factor*9)
        svg = ET.parse(pdf.with_suffix('.svg')).getroot()
        assert not any(node.tag.endswith('}image') for node in svg.iter())
        for node in svg.iter():
            for key, value in node.attrib.items():
                if key.endswith('href'):
                    assert value.startswith('#'), (pdf.name, value)
        with Image.open(pdf.with_suffix('.png')) as preview:
            assert abs(preview.width-page.width*200/72) < 2
            assert abs(preview.height-page.height*200/72) < 2
        figure_checks.append({'file': pdf.name, 'sha256': sha(pdf),
                              'width_pt': page.width, 'height_pt': page.height,
                              'main_label_pt_at_manuscript_width': round(factor*9, 2),
                              'vector': True})
assert len(figure_checks) == 10
evidence = json.loads((ROOT / 'qa/EVIDENCE_REPLAY.json').read_text())
assert len(evidence['runs']) == 6
for run in evidence['runs']:
    assert run['exit_code'] == 0
    script = ROOT / run['script']
    assert sha(script) == run['script_sha256']
    assert sha(ROOT / 'qa/evidence' / (script.stem + '.txt')) == run['log_sha256']
preserved = json.loads((ROOT / 'qa/ORIGINALS_SHA256.json').read_text())
for path, expected in preserved.items():
    if Path(path).is_file():
        assert sha(Path(path)) == expected, path
for path, expected in preserved.items():
    source = Path(path)
    inside = ROOT / 'provenance' / ('original_figures/' + source.name if 'paperIII_figures_final_round6' in source.parts else source.name)
    assert sha(inside) == expected, str(inside)
qa.update({'body_preserved_except_author_edition_and_marked_editorial_additions': True,
           'author': reader.metadata.author, 'figure_pages': destinations,
           'figure_checks': figure_checks, 'evidence_records_valid': True,
           'known_figure_build_notice': 'Standalone reports shell escape disabled; no figure requires shell escape.'})
visual = ROOT / 'qa/VISUAL_REVIEW.json'
if visual.exists():
    record = json.loads(visual.read_text())
    assert record['pdf_sha256'] == qa['sha256'], 'Visual review is stale.'
    assert record['pages_reviewed'] == list(range(1, qa['pages']+1))
    assert record['figure_sha256'] == {f['file']: f['sha256'] for f in figure_checks}
    assert record['layout_review_passed'] is True
    assert record['figure_exports_sha256'] == {
        p.name: sha(p) for p in sorted((ROOT / 'figures').glob('fig*'))
        if p.suffix in {'.pdf', '.svg', '.png', '.tex'}}
    qa['visual_record_validated'] = True
else:
    qa['visual_record_validated'] = False
(ROOT / 'qa/verification.json').write_text(json.dumps(qa, indent=2) + '\n')
print(f"PASS: {qa['pages']} pages, ten vector figures, seven bibliography entries, exact mathematical body preservation, author, citations, destinations, clean manuscript log, bounds and evidence hashes.")
print('Visual record validated:', qa['visual_record_validated'])
