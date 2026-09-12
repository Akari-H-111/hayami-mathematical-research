"""Prepare minimal submission sources without changing sealed illustrated editions."""
from pathlib import Path
import hashlib, json, re, shutil, zipfile, difflib
ROOT = Path(__file__).resolve().parent
PDF = ROOT.parent
ARCHIVE = ROOT.parent.parent / 'archive' / 'three-papers'
PAPERS = [('I','paper_I_fixed_cubic',63,14), ('II','paper_II_marked_naturality',14,7), ('III','paper_III_spectral_floor',22,10)]
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
records = []
for roman, stem, pages, count in PAPERS:
    original = PDF / ({'I': 'paper-01', 'II': 'paper-02', 'III': 'paper-03'}[roman] + '-illustrated-v0.09')
    source = original / f'{stem}_v0_09.tex'
    before = source.read_text()
    body, bibliography = before.split(r'\begin{thebibliography}', 1)
    replacements = []
    for companion in ['I','II','III']:
        old = f'Paper {companion}, manuscript closeout v0.08'
        new = f'Paper {companion}, illustrated edition v0.09'
        if old in bibliography:
            assert companion != roman and bibliography.count(old) == 1
            bibliography = bibliography.replace(old,new)
            replacements.append([old,new])
    after = body + r'\begin{thebibliography}' + bibliography
    restored = after
    for old,new in replacements: restored = restored.replace(new,old)
    assert restored == before
    assert len(replacements) == (0 if roman == 'I' else 2)
    dest = ROOT / 'arxiv' / f'paper_{roman}'
    dest.mkdir(parents=True,exist_ok=True)
    (dest / source.name).write_text(after)
    figures = re.findall(r'\\includegraphics(?:\[[^\]]*\])?\{([^}]+)\}',after)
    assert len(figures) == count
    for name in figures:
        target = dest / name
        target.parent.mkdir(parents=True,exist_ok=True)
        shutil.copyfile(original / name,target)
        assert sha(original/name) == sha(target)
    archive = ROOT / f'paper_{roman}_v0_09_arxiv_source.zip'
    with zipfile.ZipFile(archive,'w',zipfile.ZIP_DEFLATED) as z:
        for file in [dest/source.name] + [dest/name for name in figures]:
            z.write(file,file.relative_to(dest))
    with zipfile.ZipFile(archive) as z:
        assert z.testzip() is None
        assert len(z.namelist()) == count+1
    title = re.search(r'\\title(?:\[[^\]]*\])?\{(.*?)\}\s*\\author',after,re.S).group(1)
    title = ' '.join(title.replace('\\\\',' ').split())
    abstract = re.search(r'\\begin\{abstract\}(.*?)\\end\{abstract\}',after,re.S).group(1).strip()
    abstract = re.sub(r'\\C\b', lambda m: r'\mathbb{C}', abstract)
    metadata = ROOT/'metadata'
    metadata.mkdir(exist_ok=True)
    (metadata/f'paper_{roman}_abstract.txt').write_text(abstract+'\n')
    (metadata/f'paper_{roman}.json').write_text(json.dumps({
        'title':title,'authors':'Akari Hayami (Jian-Yu Huang)',
        'abstract':abstract,'comments':f'Paper {roman}; illustrated edition v0.09; {pages} pages, {count} figures.',
        'primary_category_proposal':'math.RA','category_status':'proposal, not selected on platform',
        'license':None,'doi':None,'arxiv_id':None,'journal_reference':None,
        'status':'local preparation; not uploaded or submitted'
    },indent=2)+'\n')
    (ROOT/'qa'/f'paper_{roman}_editorial.diff').write_text(''.join(difflib.unified_diff(before.splitlines(True),after.splitlines(True),fromfile='sealed_v0_09',tofile='submission_v0_09')))
    records.append({'paper':roman,'stem':stem+'_v0_09','pages':pages,'figures':count,
        'original_source_sha256':sha(source),'original_pdf_sha256':sha(source.with_suffix('.pdf')),
        'submission_source_sha256':sha(dest/source.name),'source_zip_sha256':sha(archive),
        'body_before_bibliography_byte_identical':True,'bibliography_replacements':replacements})
(ROOT/'qa/source_checks.json').write_text(json.dumps(records,indent=2)+'\n')
materials = ROOT/'materials'
materials.mkdir(exist_ok=True)
for roman,_,_,_ in PAPERS:
    for suffix in ['_source.zip','_receipt.json']:
        file=PDF/f'paper_{roman}_illustrated_v0_09{suffix}'
        shutil.copyfile(file,materials/file.name)
        assert sha(file)==sha(materials/file.name)
for name in ['three_papers_v0_08_bundle.zip','three_papers_v0_08_bundle.receipt.json']:
    shutil.copyfile(ARCHIVE/name,materials/name)
print('PASS: four bibliography updates; mathematical bodies and all 31 figures unchanged; three minimal source ZIPs; preserved evidence archives.')
