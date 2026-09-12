from pathlib import Path
import json,re,hashlib,zipfile,difflib
root=Path(__file__).resolve().parent;base=root.parent/'submission_v0_09'
records=json.loads((base/'qa/source_checks.json').read_text())
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
link=r'\href{https://doi.org/10.5281/zenodo.22663942}{doi:10.5281/zenodo.22663942}'
for r in records:
 roman=r['paper'];p=root/'arxiv'/f'paper_{roman}'/(r['stem']+'.tex')
 old=(base/'arxiv'/f'paper_{roman}'/p.name).read_text()
 changes=[('Unpublished companion manuscript.','Companion manuscript in the accompanying collection.')]
 match=re.search(r'No public archive identifier has yet been assigned\.' if roman=='I' else r'No public archive\s+identifier\s+has been assigned in this local version\.',old)
 assert match is not None
 changes.append((match.group(), 'Accompanying collection: '+link+'.'))
 new=old
 for before,after in changes:new=new.replace(before,after)
 restored=new
 for before,after in reversed(changes):restored=restored.replace(after,before)
 assert restored==old
 p.write_text(new)
 (root/'qa'/f'paper_{roman}_doi.diff').write_text(''.join(difflib.unified_diff(old.splitlines(True),new.splitlines(True),fromfile='preparation',tofile='doi_release')))
 r.update(submission_source_sha256=sha(p),body_before_bibliography_byte_identical=roman!='I',mathematical_body_preserved=True,doi='10.5281/zenodo.22663942',doi_status='reserved; publication pending')
 with zipfile.ZipFile(root/f'paper_{roman}_v0_09_arxiv_source.zip','w',zipfile.ZIP_DEFLATED) as z:
  for f in sorted(p.parent.rglob('*')):
   if f.is_file():z.write(f,f.relative_to(p.parent))
 meta=root/'metadata'/f'paper_{roman}.json';d=json.loads(meta.read_text());d['related_materials_doi']=r['doi'];meta.write_text(json.dumps(d,indent=2)+'\n')
(root/'qa/source_checks.json').write_text(json.dumps(records,indent=2)+'\n')
print('PASS: exact reversal of all DOI and companion-status edits restores the prior manuscripts.')
