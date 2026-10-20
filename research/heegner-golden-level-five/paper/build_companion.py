"""Assemble the full vector companion with explicit numerical methods."""
from io import BytesIO
from pathlib import Path
import textwrap
from pypdf import PdfReader, PdfWriter, Transformation
from pypdf._page import PageObject
from reportlab.pdfgen import canvas
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib.colors import HexColor
import reportlab

ROOT=Path(__file__).resolve().parent
OUT=ROOT/'output/pdf/golden_coordinates_level_five_v0_2_supplement.pdf'
OUT.parent.mkdir(parents=True,exist_ok=True)
W,H=1152,792
FONT=Path(reportlab.__file__).resolve().parent/'fonts'
for name,file in [('Vera','Vera.ttf'),('VeraBd','VeraBd.ttf')]:
    pdfmetrics.registerFont(TTFont(name,str(FONT/file)))
INK=HexColor('#182b3d');GRAY=HexColor('#536577');ACCENT=HexColor('#2878b5')
AUTHOR='Akari Hayami (Jian-Yu Huang)'
EMAIL='akari.h.1.9984@gmail.com'
TITLES=['Connection map','Orthogonal-circle surface','Two conditions for rank loss',
'Pentagonal coordinate','Coordinate exchange of reflections','Rogers–Ramanujan fixed point',
'Odd five-periodic Fourier vector','Theta self-duality','Mellin completion',
'Two CM arguments','The fixed near-integer gap','Icosahedral chord ratio']
CAPTIONS=[
'The arithmetic branch v=r(tau163)^5 recovers sqrt(5) and c0. The independent fixed point i selects kappa=r(i). Coordinate exchange relates modular inversion to the odd period-five Fourier action, whose positive eigenline gives the scalar functional equation.',
'The actual patch S(t,u), with rank-loss points at t=+/-arccos(c0), u=u0. The local panel uses positive t and equal coordinate-unit spans. The displayed patch uses t in [-1.42,1.42], u in [0,1]; the local view uses t0 +/-0.22 and u0 +/-0.20.',
'The positive-sine branch uses c in [0.03,0.97] and u in [0.02,0.98]. The dashed necessary locus u=(1-c)/2 gives rank loss only where P(c)=c^2-3c+1 also vanishes. The heatmap is log10(norm(S_t cross S_u)+1e-8), on a 260-by-250 grid. The point (c0,u0) is the admissible zero.',
'A unit pentagon at angles 0,72,144,216,288 degrees. The horizontal projection is u0=cos(72 degrees); side/diagonal=gamma and its square is c0. Projection and squared length ratio are distinct geometric quantities.',
'The reflections M and A=JMJ use paired inputs z and Jz, with A(Jz)=J(Mz). Their positive eigendirections are (kappa,1) and (1,kappa). Dashed axes have eigenvalue -1. The two coordinate ratios are labelled separately; the circles have equal coordinate scales.',
'Direct Rogers–Ramanujan products r(iy) and r(i/y), evaluated independently with 180 product factors for each of 101 y values in [0.5,2], at 180 decimal digits before float conversion. They meet at y=1, where the positive fixed point is kappa.',
'The normalized positive vector a=(1,kappa,-kappa,-1,0) is displayed in residue order 1,2,3,4,5=0. The output is the actually computed -i times the positive-exponential normalized DFT; real output and imaginary residual are both saved. This is a finite numerical diagnostic of the exact eigenvector identity.',
'For a=(1,kappa,-kappa,-1,0), the scalar identity is Theta_a(x)=x^(-3/2)Theta_a(1/x). Both sums are evaluated independently over -90<=n<=90 at 161 logarithmically spaced x values in [0.1,10], with 180-digit arithmetic. The compensated profile x^(3/4)Theta_a(x) is even in log(x).',
'The same positive vector a is used for the completed function. Its Hurwitz-zeta expression is evaluated at 180 digits on 49 points s=sigma+1.15i, sigma in [-0.35,1.35], away from apparent singularities. The real/imaginary parity about sigma=1/2 uses both the functional equation and real-coefficient conjugation.',
'The point i supplies the fixed point of inversion, q=exp(-2pi), j=1728. The point tau163=(1+i*sqrt(163))/2 supplies q=-exp(-pi*sqrt(163)) and j=-640320^3. The plotted horizontal and vertical units have different physical scales; this panel locates arguments rather than Euclidean lengths.',
'Let R=exp(pi*sqrt(163)) and N=640320^3+744. At 180 digits, N-R is approximately 7.499274028018143e-13. Term n is (-1)^(n+1)c_n/R^n, starting with c1=196884. Six terms and their absolute post-correction residuals are shown. Coefficients come from exact expansion of E4^3/Delta.',
'The unit-radius vertices are (0,+/-1,+/-phi), (+/-1,+/-phi,0), (+/-phi,0,+/-1), divided by sqrt(1+phi^2). All 66 pairs comprise 30 short chords, 30 long chords and 6 antipodal pairs. The squared short/long ratio is (2-2/sqrt(5))/(2+2/sqrt(5))=c0.'
]
assert len(TITLES)==len(CAPTIONS)==12

def page():
    stream=BytesIO();c=canvas.Canvas(stream,pagesize=(W,H),invariant=1,pageCompression=1)
    c.setTitle('Golden Coordinates at Level Five — visual companion 0.2')
    c.setAuthor(AUTHOR)
    return stream,c

def wrap(c,text,x,y,width,size=11,leading=15,font='Vera'):
    c.setFont(font,size);line=''
    for word in text.split():
        trial=(line+' '+word).strip()
        if c.stringWidth(trial,font,size)>width and line:
            c.drawString(x,y,line);y-=leading;line=word
        else:line=trial
    if line:c.drawString(x,y,line);y-=leading
    return y

def close(stream,c):
    c.showPage();c.save();stream.seek(0);return PdfReader(stream).pages[0]

writer=PdfWriter()
stream,c=page();c.setFillColor(INK);c.setFont('VeraBd',31)
c.drawString(60,680,'Golden Coordinates at Level Five')
c.setFillColor(ACCENT);c.setFont('VeraBd',20)
c.drawString(62,635,'Visual companion to portrait revision 0.2')
c.setFillColor(INK);c.setFont('Vera',15);c.drawString(62,580,AUTHOR)
c.setFont('Vera',12);c.drawString(62,553,EMAIL)
c.linkURL('mailto:'+EMAIL,(62,549,310,567),relative=0)
c.drawString(62,518,'20 October 2026')
y=440
for text in [
'Twelve complete native-vector plates preserve the geometric and numerical detail behind the four compact article figures. Each plate has a local caption describing its mathematical object, normalization and numerical method.',
'Notation: phi=(1+sqrt(5))/2; c0=phi^(-2); gamma=1-c0; u0=gamma/2; kappa=r(i). The positive five-periodic coefficient vector is a=(1,kappa,-kappa,-1,0). Surface angle t and positive theta scale x are kept separate.',
'Article figure mapping: 1 uses S01; 2 selects S02–S03; 3 selects S11 with the roles in S10; 4 selects S05 and S07. Plates S04, S06, S08–S09 and S12 retain further geometric context and analytic diagnostics.',
'Exact arithmetic certificates, written analytic proofs and finite numerical diagnostics retain their separate evidence records in the source bundle. The final page gives the replay route and precision settings.'
]:
    y=wrap(c,text,64,y,W-132,size=13,leading=19)-24
c.setFillColor(GRAY);c.setFont('Vera',10);c.drawString(64,55,'Companion plates S01–S12 | source, data and verification included in the accompanying bundle')
writer.add_page(close(stream,c))
for n,(title,caption) in enumerate(zip(TITLES,CAPTIONS),1):
    source=PdfReader(ROOT/f'companion/output/pdf/figure_{n:02}.pdf').pages[0]
    sw,sh=float(source.mediabox.width),float(source.mediabox.height)
    scale=min((W-100)/sw,(H-210)/sh)
    sheet=PageObject.create_blank_page(width=W,height=H)
    sheet.merge_transformed_page(source,Transformation().scale(scale).translate((W-sw*scale)/2,145))
    stream,c=page();c.setFillColor(INK);c.setFont('VeraBd',17)
    c.drawString(50,H-39,f'S{n:02}  {title}');c.setStrokeColor(ACCENT);c.line(50,H-51,W-50,H-51)
    c.setFillColor(INK);bottom=wrap(c,caption,53,119,W-106,size=11,leading=15)
    assert bottom>=31,(n,bottom)
    c.setFillColor(GRAY);c.setFont('Vera',9);c.drawString(53,25,f'Visual companion 0.2 | Plate S{n:02} | {n+1}/14')
    sheet.merge_page(close(stream,c));writer.add_page(sheet)
stream,c=page();c.setFillColor(INK);c.setFont('VeraBd',23);c.drawString(54,735,'Methods, data and reproducibility')
left=[
('Arithmetic and modular samples','Calculations use mpmath at 180 decimal digits. The fixed N-R and its first six corrections are saved as decimal strings before float plotting. Exact integer coefficients of q*j(q) are expanded through order 10 from E4^3/Delta. The array checker verifies the correct leading term 196884/R and all displayed correction powers.'),
('Products and Gaussian sums','Rogers–Ramanujan products use 180 factors at each direct and reciprocal argument. Theta sums use both signs -90<=n<=90, independently at x and 1/x. These are finite numerical evaluations; the written Poisson–Mellin argument establishes the transformation law.'),
('Completed-function diagnostic','The sum 5^(-s) sum(a_j*zeta(s,j/5), j=1..4), multiplied by (5/pi)^((s+1)/2)*Gamma((s+1)/2), is evaluated on a nonreal slice. The article proves the analytic continuation; no singular real point is sampled. Saved point pairs record Lambda(s), Lambda(1-s) and their difference.'),
('Finite geometry and Fourier action','The surface and cross product use the displayed formulas. Geometric circle and reflection axes preserve equal units. The DFT uses the positive exponential and residues 1,2,3,4,5=0. The icosahedron is normalized to unit radius before pair classification.')]
y=683
for title,text in left:
    c.setFillColor(ACCENT);c.setFont('VeraBd',12);c.drawString(56,y,title);y-=22;c.setFillColor(INK)
    y=wrap(c,text,57,y,490,size=11,leading=15)-25
assert y>75,y
c.setFillColor(ACCENT);c.setFont('VeraBd',12);c.drawString(603,683,'Replay from the source bundle')
c.setFillColor(INK);y=650
for text in [
'1. Run companion/build_figures.py with the recorded plotting environment.',
'2. Run companion/build_body_figures.py and both companion/verification checkers.',
'3. Run build_companion.py using the recorded ReportLab/pypdf environment.',
'4. Compile main.tex twice with pdflatex. README.md supplies tested interpreter paths and commands.',
'5. Replay verification/replay_cm.py, baseline_square_certificate.py and director_check_lemmas.py for the exact arithmetic and separate numerical checks.',
'Data: companion/data/figure_values.json and figure_arrays.npz. Body selections and canvas/font choices are described in body_metadata.json. PDF/PNG/SVG exports are supplied.',
'Provenance: the portrait revision retains the previously reviewed arithmetic and scientific data. The earlier paper and atlas remain unchanged. The surface source is pinned to published v5; conventional inputs are cited in the article.',
'Checks, page renders and final hashes are recorded in verification/ and the package manifest. Rebuilding on a new machine may require equivalent dependencies; the source bundle does not install them.'
]:y=wrap(c,text,605,y,490,size=11,leading=15)-18
assert y>55,y
c.setFillColor(GRAY);c.setFont('Vera',9);c.drawString(56,28,'Visual companion 0.2 | Methods | 14/14')
writer.add_page(close(stream,c))
writer.add_metadata({'/Title':'Golden Coordinates at Level Five — visual companion 0.2','/Author':AUTHOR,'/CreationDate':'D:20261020000000Z','/ModDate':'D:20261020000000Z'})
with OUT.open('wb') as f:writer.write(f)
assert len(writer.pages)==14
print('Wrote',OUT,'with 14 pages')
