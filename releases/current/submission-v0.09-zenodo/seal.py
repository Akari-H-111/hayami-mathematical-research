"""Seal reviewed submission files and verify every exported payload hash."""
from pathlib import Path
import hashlib,json,zipfile
ROOT=Path(__file__).resolve().parent
sha=lambda data:hashlib.sha256(data).hexdigest()
source=json.loads((ROOT/'qa/source_checks.json').read_text())
validation=json.loads((ROOT/'qa/validation.json').read_text())
for current,checked in zip(source,validation):
 assert current['paper']==checked['paper']
 assert current['submission_source_sha256']==checked['submission_source_sha256']
 roman=current['paper']; stem=current['stem']
 assert sha((ROOT/'pdf'/(stem+'.pdf')).read_bytes())==checked['pdf_sha256']
 assert checked['visual_review_changed_pages']!='pending'
 archive=ROOT/f'paper_{roman}_v0_09_arxiv_source.zip'
 with zipfile.ZipFile(archive) as z:
  assert z.testzip() is None
  for name in z.namelist():
   assert z.read(name)==(ROOT/'arxiv'/f'paper_{roman}'/name).read_bytes()
 checked['source_zip_sha256']=sha(archive.read_bytes())
(ROOT/'qa/validation.json').write_text(json.dumps(validation,indent=2)+'\n')
files=sorted(p for p in ROOT.rglob('*') if p.is_file() and p.name!='SHA256SUMS.txt' and '__pycache__' not in p.parts)
manifest=''.join(f'{sha(p.read_bytes())}  {p.relative_to(ROOT).as_posix()}\n' for p in files)
(ROOT/'SHA256SUMS.txt').write_text(manifest)
archive=ROOT.parent/'three_papers_v0_09_zenodo_materials.zip'
with zipfile.ZipFile(archive,'w',zipfile.ZIP_DEFLATED) as z:
 for p in files+[ROOT/'SHA256SUMS.txt']:z.write(p,Path(ROOT.name)/p.relative_to(ROOT))
with zipfile.ZipFile(archive) as z:
 assert z.testzip() is None
 for line in manifest.splitlines():
  digest,name=line.split(maxsplit=1)
  assert sha(z.read(ROOT.name+'/'+name))==digest,name
receipt={'archive':archive.name,'sha256':sha(archive.read_bytes()),'bytes':archive.stat().st_size,
 'verified_payloads':len(files),'status':'DOI 10.5281/zenodo.22663942 reserved; publication pending',
 'uploaded':False,'submitted':False,'published':False,'pdfs':[{k:r[k] for k in ['paper','pages','figures','pdf_sha256']} for r in validation]}
archive.with_suffix('.receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps(receipt,indent=2))
