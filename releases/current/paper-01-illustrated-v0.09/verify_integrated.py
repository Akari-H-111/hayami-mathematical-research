from pathlib import Path
import re,json,hashlib,subprocess
from pypdf import PdfReader
import pdfplumber
ROOT=Path(__file__).resolve().parent
tex=(ROOT/'paper_I_fixed_cubic_v0_09.tex').read_text()
original=(ROOT/'provenance/paper_I_fixed_cubic_v0_08.tex').read_text()
restored=re.sub(r'\n% BEGIN ILLUSTRATION \d+\n.*?% END ILLUSTRATION \d+\n\n','',tex,flags=re.S)
restored=re.sub(r'\n% BEGIN ILLUSTRATION PREAMBLE\n.*?% END ILLUSTRATION PREAMBLE\n','',restored,flags=re.S)
restored=restored.replace('illustrated edition v0.09','manuscript closeout v0.08').replace('\\clearpage\n\\appendix',r'\appendix')
restored=restored.replace("Akari Hayami (Jian-Yu Huang)","Akari H.")
assert restored==original
assert tex.count("Akari Hayami (Jian-Yu Huang)")==4
assert tex.count(r'\begin{figure}')==tex.count(r'\end{figure}')==14
labels=re.findall(r'\\label\{([^}]+)\}',tex)
refs=re.findall(r'\\(?:ref|eqref|pageref)\{([^}]+)\}',tex)
assert len(labels)==len(set(labels)) and set(refs)<=set(labels)
log=(ROOT/'paper_I_fixed_cubic_v0_09.log').read_text()
for bad in ('Overfull','undefined','Missing character','Float too large','Too many unprocessed floats'):
 assert bad not in log,bad
pdf=ROOT/'paper_I_fixed_cubic_v0_09.pdf'
reader=PdfReader(pdf)
assert len(reader.pages)==63
pages={int(k.split('.')[1]):reader.get_destination_page_number(v)+1
       for k,v in reader.named_destinations.items() if re.fullmatch(r'figure\.\d+',k)}
assert sorted(pages)==list(range(1,15))
assert [pages[i] for i in sorted(pages)]==sorted(pages.values())
captions={}; bounds=[]
with pdfplumber.open(pdf) as doc:
 for n,p in enumerate(doc.pages,1):
  text=p.extract_text() or ''
  for cap in re.findall(r'^Figure\s+(\d+)\.',text,re.M):
   assert int(cap) not in captions
   captions[int(cap)]=n
  for c in p.chars:
   if c['text'].strip() and (c['x0']<0 or c['x1']>612.1 or c['top']<0 or c['bottom']>792.1): bounds.append(n)
assert captions==pages,(captions,pages)
assert not bounds,bounds
# Figures remain vector forms, without raster images in the embedded source PDFs.
for f in (ROOT/'figures').glob('*.pdf'):
 r=PdfReader(f)
 assert len(r.pages)==1 and len(r.pages[0].images)==0
assert len(list((ROOT/'figures').glob('*.pdf')))==14
subprocess.run(['qpdf','--check',str(pdf)],check=True,capture_output=True)
result={'pages':63,'figures':14,'figure_pages':dict(sorted(pages.items())),
 'body_preserved_exactly':True,'all_labels_resolved':True,'caption_destinations_match':True,
 'no_overfull_missing_glyph_or_float_errors':True,'all_character_bounds_valid':True,
 'all_14_illustrations_vector':True,'qpdf':'PASS',
 'source_sha256':hashlib.sha256(original.encode()).hexdigest(),
 'pdf_sha256':hashlib.sha256(pdf.read_bytes()).hexdigest()}
(ROOT/'qa/verification.json').write_text(json.dumps(result,indent=2)+'\n')
print('PASS: 63 pages; 14 vector figures; captions and PDF destinations 1–14 match; exact original body preservation; clean log; QPDF.')
