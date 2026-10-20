#!/usr/bin/env python3
"""Build the vector figure companion using ReportLab text and merged figure PDFs."""
from __future__ import annotations

from io import BytesIO
from pathlib import Path

from pypdf import PdfReader, PdfWriter, Transformation
from pypdf._page import PageObject
from reportlab.lib.colors import HexColor
from reportlab.lib.pagesizes import landscape, TABLOID
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.pdfgen import canvas
import reportlab

ROOT=Path(__file__).resolve().parent
OUT=ROOT/"output"/"pdf"/"heegner_golden_figure_atlas.pdf"
W,H=landscape(TABLOID)  # 16 by 11 inches
FONTDIR=Path(reportlab.__file__).resolve().parent/"fonts"
pdfmetrics.registerFont(TTFont("Vera",str(FONTDIR/"Vera.ttf")))
pdfmetrics.registerFont(TTFont("VeraBd",str(FONTDIR/"VeraBd.ttf")))
NAVY=HexColor("#12233f"); GRAY=HexColor("#657082"); GOLD=HexColor("#c99618")

TITLES=[
"Connection map", "Orthogonal-circle ruled surface", "Rank loss in (c,u)",
"Pentagonal coordinate", "Coordinate exchange of reflections", "Why r(i)=kappa",
"Odd five-periodic Fourier eigenvector", "Theta self-duality", "Mellin and functional equation",
"Two CM arguments", "Hermite near-integer", "Icosahedral chord context"]
CAPTIONS=[
"A navigation map: the golden surface coordinate determines an explicit reflection; coordinate exchange leads to the odd Fourier eigenline and its functional equation. The i and tau_163 CM roles remain distinct.",
"The actual ruled patch S(t,u), with its reflected lateral rank-loss pair. The right panel is a local view of the positive-t point, using equal coordinate spans.",
"On the positive-sine branch, the norm of the actual cross product vanishes at the lateral condition; the adjacent polynomial isolates its interior root c0.",
"A unit pentagon placed at angles 0, 72, 144, ... degrees. Its horizontal projection is cos(72 degrees)=u0, while the side/diagonal ratio separately gives phi^-1.",
"M and JMJ are coordinate-exchanged plane reflections. The paired inputs v and Jv and their actual images make the exchange visible; the two slope conventions are labelled separately.",
"The left panel gives the positive fixed point of the inversion map. The two curves on the right are independently evaluated product values r(iy) and r(i/y).",
"Input and output are both recorded in residue order 1,2,3,4,5 (with 5 representing 0). The small imaginary residual and matching coefficients are plotted explicitly.",
"Both sides of the compensated theta relation are evaluated from the Gaussian sum, including positive and negative indices, rather than constructed by reflection.",
"The plate places the Gaussian-to-Mellin construction next to numerical paired completed-function values. It illustrates the stated symmetry and is not a zero search.",
"The inversion fixed point i and tau_163 have separate jobs: r(i) selects kappa, while tau_163 supplies the integral j-value and tiny negative nome.",
"At 180 decimal digits, N-R is fixed and positive. The logarithmic ladder uses the independently expanded j-series corrections 196884/R, -21493760/R^2, and onward.",
"The marked unit icosahedron supplies a Euclidean context for c0: among all 66 pairs there are 30 short, 30 long, and 6 antipodal pairs."]
PLACEMENTS=[
"Opening orientation after the scalar definitions.", "Section 1, after the ruled-surface parametrization.", "Section 1, beside the rank-loss elimination.", "Section 1, after c0 and u0 are identified.",
"Section 2, alongside M, J, and A=JMJ.", "Section 2, after the inversion fixed-point argument.", "Section 2, with the finite DFT eigenvector.", "Section 3, after the theta construction.",
"Section 3, with the Mellin completion.", "Transition to the CM comparison.", "Hermite comparison passage.", "Geometry-context companion, not a CM point plot."]

def overlay(title, caption, placement):
    stream=BytesIO(); c=canvas.Canvas(stream,pagesize=(W,H),invariant=1,pageCompression=1)
    c.setTitle("Heegner-Golden Figure Atlas"); c.setAuthor("Research figure packet")
    c.setFillColor(NAVY); c.setFont("VeraBd",16); c.drawString(48,755,title)
    c.setStrokeColor(GOLD); c.setLineWidth(1.2); c.line(48,746,W-48,746)
    c.setFillColor(NAVY); c.setFont("Vera",10.5)
    text=c.beginText(52,72); text.setLeading(14)
    words=caption.split(); line=""
    for word in words:
        if c.stringWidth((line+" "+word).strip(),"Vera",10.5)>W-104:
            text.textLine(line); line=word
        else: line=(line+" "+word).strip()
    text.textLine(line); c.drawText(text)
    c.setFillColor(GRAY); c.setFont("Vera",9); c.drawString(52,35,"Placement cue: "+placement)
    c.showPage(); c.save(); stream.seek(0)
    return PdfReader(stream).pages[0]

writer=PdfWriter()
cover=BytesIO(); c=canvas.Canvas(cover,pagesize=(W,H),invariant=1,pageCompression=1); c.setTitle("Heegner-Golden Figure Atlas"); c.setAuthor("Research figure packet")
c.setFillColor(NAVY); c.setFont("VeraBd",34); c.drawString(68,620,"Heegner-Golden Figure Atlas")
c.setFillColor(GOLD); c.setFont("VeraBd",18); c.drawString(70,575,"Twelve reproducible mathematical figure plates")
c.setFillColor(NAVY); c.setFont("Vera",14); c.drawString(70,510,"Native vector artwork; numerical arrays and high-precision diagnostics are saved with the packet.")
c.setFillColor(GRAY); c.setFont("Vera",11); c.drawString(70,455,"Colour key: gold geometry | teal Fourier/theta | violet modular map | blue CM/Hermite")
c.drawString(70,420,"Ruled-surface geometry, Rogers-Ramanujan inversion, and Fourier self-duality.")
c.showPage(); c.save(); cover.seek(0); writer.add_page(PdfReader(cover).pages[0])

for number,(title,caption,placement) in enumerate(zip(TITLES,CAPTIONS,PLACEMENTS),1):
    page=PageObject.create_blank_page(width=W,height=H)
    source=PdfReader(OUT.parent/f"figure_{number:02d}.pdf").pages[0]
    sw,sh=float(source.mediabox.width),float(source.mediabox.height)
    scale=min((W-84)/sw,(H-175)/sh)
    page.merge_transformed_page(source,Transformation().scale(scale).translate((W-sw*scale)/2,105))
    page.merge_page(overlay(f"Figure {number:02d}. {title}",caption,placement))
    writer.add_page(page)

notes=BytesIO(); c=canvas.Canvas(notes,pagesize=(W,H),invariant=1,pageCompression=1); c.setTitle("Heegner-Golden Figure Atlas")
c.setFillColor(NAVY); c.setFont("VeraBd",20); c.drawString(54,740,"Sources, notation, and replay notes")
c.setFont("Vera",11); c.setFillColor(NAVY)
lines=["Canonical source: input/MANUSCRIPT_ENDING.md sections 1-4. Context-only icosahedral source: input/GEOMETRY_CONTEXT.md section 2.","Notation: phi=(1+sqrt(5))/2; c0=phi^-2; gamma=1-c0; u0=gamma/2; kappa=r(i).",
"Figure 02 uses S(t,u) as written in the canonical source. Figures 06, 08, 09, and 11 are numerical renderings with saved inputs and precision settings.","The j-series coefficients used by Figure 11 are independently expanded from E4^3/Delta; the decimal gap is evaluated at 180 digits.","Replay: run build_figures.py with the arithscope Python runtime, check_figure_data.py, then build_atlas.py with the bundled ReportLab/pypdf runtime.","All figure PDFs are vector; standalone artwork is merged here rather than rasterized."]
y=680
for line in lines: c.drawString(60,y,line); y-=48
c.setFillColor(GRAY); c.setFont("Vera",10); c.drawString(60,120,"Primary references named in the canonical section remain the authoritative conventional references for the formulas shown.")
c.showPage(); c.save(); notes.seek(0); writer.add_page(PdfReader(notes).pages[0])
writer.add_metadata({"/Title":"Heegner-Golden Figure Atlas","/Author":"Research figure packet","/Creator":"ReportLab + pypdf deterministic atlas","/CreationDate":"D:20261019000000Z","/ModDate":"D:20261019000000Z"})
with OUT.open("wb") as handle: writer.write(handle)
print(f"Wrote {OUT} with {len(writer.pages)} pages")
