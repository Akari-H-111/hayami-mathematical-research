"""Extract each submission ZIP, compile, inspect structure, compare page rasters."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import hashlib,json,re,subprocess,tempfile,shutil
from pypdf import PdfReader
ROOT=Path(__file__).resolve().parent
RECORDS=json.loads((ROOT/'qa/source_checks.json').read_text())
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def run(args,cwd=None):
    result=subprocess.run(args,cwd=cwd,capture_output=True,text=True)
    if result.returncode: raise RuntimeError(result.stdout+'\n'+result.stderr)
    return result.stdout+result.stderr

def check(record):
    roman=record['paper']; stem=record['stem']
    qa=ROOT/'qa'/f'paper_{roman}';qa.mkdir(exist_ok=True)
    with tempfile.TemporaryDirectory(prefix=f'paper_{roman}_submission_') as temp:
        work=Path(temp)
        shutil.unpack_archive(ROOT/f'paper_{roman}_v0_09_arxiv_source.zip',work)
        log=run(['tectonic','--keep-logs',stem+'.tex'],work)
        (qa/'compile.txt').write_text(log)
        texlog=(work/(stem+'.log')).read_text()
        assert not re.search(r'Overfull|undefined references|undefined citations|Missing character|LaTeX Error',texlog),texlog[-3000:]
        pdf=work/(stem+'.pdf')
        (qa/'qpdf.txt').write_text(run(['qpdf','--check',str(pdf)]))
        reader=PdfReader(pdf)
        assert record['pages'] <= len(reader.pages) <= record['pages']+1
        assert reader.metadata.author=='Akari Hayami (Jian-Yu Huang)'
        names=[n for n in reader.named_destinations if re.fullmatch(r'figure\.\d+',n)]
        assert len(names)==record['figures']
        assert not re.search(r'Paper (?:I|II|III), manuscript closeout v0.08',(work/(stem+'.tex')).read_text())
        # Inline figures unchanged; detect any pagination or glyph change on every page.
        old=ROOT.parent/'pdf'/f'paper_{roman}_illustrated_v0_09'/(stem+'.pdf')
        for tag,input_pdf in [('old',old),('new',pdf)]:
            out=work/tag;out.mkdir()
            run(['pdftoppm','-r','90','-png',str(input_pdf),str(out/'page')])
        changed=[]
        for current in sorted((work/'new').glob('*.png')):
            previous=work/'old'/current.name
            if not previous.exists() or sha(previous)!=sha(current):
                n=int(current.stem.split('-')[-1]);changed.append(n)
                run(['pdftoppm','-f',str(n),'-l',str(n),'-r','120','-singlefile','-png',str(pdf),str(qa/f'changed_page_{n}')])
        # Four bibliography strings may only affect final reference pages.
        assert all(n >= (50 if roman=='I' else record['pages']-1) for n in changed),changed
        out=ROOT/'pdf';out.mkdir(exist_ok=True)
        shutil.copyfile(pdf,out/pdf.name)
        record.update({'pages':len(reader.pages),'pdf_sha256':sha(pdf),'extracted_compile':'PASS (Tectonic)',
            'qpdf':'PASS','figure_destinations':'PASS','changed_rendered_pages':changed,
            'unchanged_rendered_pages':len(reader.pages)-len(changed),
            'visual_review_changed_pages':'pending' if changed else 'inherited by full-page raster equality',
            'arxiv_platform_compile':'not run'})
        print(f'Paper {roman}: PASS, {len(reader.pages)} pages, changed pages {changed}',flush=True)
    return record
with ThreadPoolExecutor(max_workers=3) as pool: results=list(pool.map(check,RECORDS))
(ROOT/'qa/validation.json').write_text(json.dumps(results,indent=2)+'\n')
