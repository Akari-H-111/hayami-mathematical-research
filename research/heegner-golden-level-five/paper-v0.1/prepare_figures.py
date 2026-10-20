"""Import vector plates, removing standalone titles for manuscript numbering."""
import hashlib
import json
from pathlib import Path
from pypdf import PdfReader, PdfWriter
from pypdf.generic import RectangleObject

root = Path(__file__).resolve().parent
source = root.parent / 'figures-terra56-20261019' / 'output' / 'pdf'
target = root / 'figures'
target.mkdir(exist_ok=True)
records = []
for number in range(1, 13):
    name = f'figure_{number:02d}.pdf'
    original = source / name
    reader = PdfReader(original)
    assert len(reader.pages) == 1, original
    page = reader.pages[0]
    left, bottom, right, top = map(float, page.mediabox)
    assert top - bottom > 100
    # Captions supply the paper's sequential numbering; source titles use atlas indices.
    box = [left, bottom, right, top - 34]
    page.mediabox = RectangleObject(box)
    page.cropbox = RectangleObject(box)
    writer = PdfWriter()
    writer.add_page(page)
    destination = target / name
    with destination.open('wb') as handle:
        writer.write(handle)
    assert len(PdfReader(destination).pages) == 1
    records.append({'name': name, 'top_crop_points': 34,
                    'source_sha256': hashlib.sha256(original.read_bytes()).hexdigest(),
                    'paper_sha256': hashlib.sha256(destination.read_bytes()).hexdigest()})
(root / 'logs' / 'FIGURE_IMPORT.json').write_text(json.dumps(records, indent=2) + '\n')
print('Imported 12 vector plates; standalone title bands cropped for paper captions.')
