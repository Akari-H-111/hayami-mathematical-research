"""Create the illustrated edition without changing the v0.08 source or figures."""
from pathlib import Path
import importlib.util,json,re,hashlib
from matplotlib.transforms import Bbox
ROOT=Path(__file__).resolve().parent
BASE=ROOT.parent/'three_papers_v0_08/paper_I_fixed_cubic_v0_08.tex'
ASSETS=ROOT.parents[1]/'figures/paper_I_v0_08'
placements=json.loads((ASSETS/'placement.json').read_text())
manifest=json.loads((ASSETS/'manifest.json').read_text())
spec=importlib.util.spec_from_file_location('art',ASSETS/'build_figures.py')
art=importlib.util.module_from_spec(spec);spec.loader.exec_module(art)
art.plt.rcParams['pdf.fonttype']=42

def save_pdf(self):
    # Keep the approved diagram geometry; omit duplicate editorial furniture.
    for t,_ in self.texts:
        x,y=t.get_position()
        if y>.0 and (y>6.8 or y<.4): t.remove()
    self.fig.savefig(ROOT/'figures'/(self.slug+'.pdf'),format='pdf',
        bbox_inches=Bbox.from_extents(.35,.48,11.65,6.83),
        metadata={'Title':self.title,'Creator':'Paper I vector illustration export'})
    art.plt.close(self.fig)
art.Figure.save=save_pdf
art.make_figures()

# IDs remain stable in labels and filenames; LaTeX numbers them by appearance.
captions={
1:r'''The five result groups of Paper~I. The rows give a reading order, not additional implication claims. The transfer endpoint uses one compatible contraction; the spectral calculation retains the chosen low-rail homotopy.''',
2:r'''Weak and strict reconstruction for fixed $B$. The nonempty weak fiber is affine, while strictness imposes the unital bimodule equations. The fixed-$B$ stabilizer is trivial when $B(A,A)$ spans $V$; strict tangent observability is described by $\ker\cD_p$. Nested regions are schematic, not dimension estimates.''',
3:r'''The four strict reconstructions of Theorem~\ref{thm:four-points}. Independent swaps of evaluation points preserve $B$. Each point is reduced and infinitesimally rigid, but the fixed-$B$ fiber is not globally unique. The arrows are swaps of the displayed constructions, not gauge identifications.''',
4:r'''The dual-number false tangent of Theorem~\ref{thm:false-tangent}. The halo denotes nilpotent structure at one geometric point; the dashed line denotes the Zariski tangent direction, not a family of geometric points. Every nonzero first-order direction is obstructed at second order.''',
5:r'''The mixed scheme $\Spec\C[u,v]/(uv,v^2)$ and the cubic formal germ $\C[[u,v]]/(v^3)$ have different transverse nilpotent structures. The first has an embedded false direction only at the origin; the second has uniform cubic thickness. Shading is schematic and does not represent additional branches.''',
6:r'''The finite flat family of Proposition~\ref{prop:cubic-flat-family}. Write $q_u=1+2u$, distinct from the later quintic $q(S)$. Every fiber has length three. At $u=-1/2$ its embedding dimension rises from one to two. The arrows depict multiplication on bases, not distinct geometric points.''',
7:r'''The relation DGLA morphism and its induced commuting obstruction square (Proposition~\ref{prop:relation-dgla-morphism} and Corollary~\ref{cor:cohomological-projection}). The map on tangent spaces is the identity; the degree-two map projects intrinsic obstruction classes to presentation relations. No quasi-isomorphism is asserted.''',
8:r'''The effective obstruction comparison chain. The dimension of $(I_\kappa/\mathfrak nI_\kappa)^\vee$ counts minimal formal equations. Its displayed injection into $H^2$ depends on the minimal-model realization, and its composite with $\overline\Pi$ need not be injective. Unused relation directions and the kernel of the composite are different phenomena.''',
9:r'''Arity comparison for two completions of the saved partial homotopy. The frozen completion has a held-out nonzero arity-$23$ coefficient (Proposition~\ref{prop:frozen-23}); a different compatible completion controls arity~$23$ to zero (Theorem~\ref{thm:compatible-23}). Both have the same cubic formal germ. Neither result asserts vanishing at arity~$24$ or above.''',
10:r'''The staged finite-feedback construction. A $35$-dimensional controller changes high-$v$ section coefficients and hence future quadratic sources. The response sector $C_{\mathrm{quad}}$ has dimension two, while full $H^2$ has dimension $42$. The split mixed reservoir (here denoted by $\rho_{\mathrm{mix}}$) supplies lifts; the separate source-history condition makes them compatible with one contraction.''',
11:r'''The four autonomous low rails. Adjacent arrows encode the $[\xi,-]$ forcing; the Cauchy terms $C_{22}$ and $C_{23}$ enter after applying $-h$. Each rail also has the homogeneous update $A=-h\operatorname{ad}_\alpha$. The companion acts on $14$ temporal slots for each cochain coordinate. The frozen predictions of $Y_{17}$ and $Y_{18}$ agree with independent recursions without refitting. Independence modulo $(v^6)$ does not assert future-$v^6$ terminality.''',
12:r'''The triangular spectral extension and residual-module tower. With $E=S+2$ and $m_A=Eq$, the successive multipliers are $E,E,m_A$. The residual modules have dimensions $1,2,8$. The annihilators are exact all-orders conclusions for the fixed autonomous subsystem, not contraction-independent invariants.''',
13:r'''Complete landing operators and spectral selection. The rank-one map $\Lambda_4$ lands in the resonant eigenline; $\Lambda_5$ is onto the six-dimensional homogeneous module and has a two-dimensional kernel. The finite-jet formula assumes $P(S)f=0$. In the fixed cyclic module, the surviving homogeneous annihilator is $m_A/\gcd(m_A,r_d)$.''',
14:r'''Three levels of spectral contact. The left diagram is an eight-vertex slice of the two-axis closure order, with all other quintic roots excluded from $Z$; arrows point toward additional vanishing. The full splitting-field counts are $64$, $128$, and $708$ nonzero fine strata plus the zero datum. The third level uses the specified degree-$<8$ polynomial lift, not an $\C[S]$-linear splitting.'''
}
source=BASE.read_text().replace("Akari H.","Akari Hayami (Jian-Yu Huang)")
preamble=r'''% BEGIN ILLUSTRATION PREAMBLE
\usepackage{graphicx}
\setcounter{topnumber}{2}
\renewcommand{\topfraction}{0.9}
\renewcommand{\textfraction}{0.08}
\renewcommand{\floatpagefraction}{0.65}
% END ILLUSTRATION PREAMBLE
'''
source=source.replace(r'\usepackage{xcolor}',r'\usepackage{xcolor}'+'\n'+preamble)
source=source.replace('manuscript closeout v0.08','illustrated edition v0.09')
for p in placements:
    n=p['figure']; f=manifest['figures'][n-1]; label=p['suggested_label']
    intro={1:'The overall reading map is shown',9:'The two completion endpoints are compared'}.get(n,'The corresponding structures are illustrated')
    block='\n% BEGIN ILLUSTRATION '+str(n)+'\n'+intro+' in Figure~\\ref{'+label+'}.\n'+r'\begin{figure}[tbp]'+'\n'+r'\centering'+'\n'+r'\makebox[\textwidth][c]{\includegraphics[width=7.0in]{figures/'+f['stem']+'.pdf}}\n'+r'\caption{'+captions[n]+'}\n'+r'\label{'+label+'}\n'+r'\end{figure}'+'\n% END ILLUSTRATION '+str(n)+'\n\n'
    assert source.count(p['insert_before_text'])==1
    source=source.replace(p['insert_before_text'],block+p['insert_before_text'])
source=source.replace(r'\appendix',r'\clearpage'+'\n'+r'\appendix')
(ROOT/'paper_I_fixed_cubic_v0_09.tex').write_text(source)
# Verify that original mathematical prose was preserved exactly.
restored=re.sub(r'\n% BEGIN ILLUSTRATION \d+\n.*?% END ILLUSTRATION \d+\n\n','',source,flags=re.S)
restored=re.sub(r'\n% BEGIN ILLUSTRATION PREAMBLE\n.*?% END ILLUSTRATION PREAMBLE\n','',restored,flags=re.S)
restored=restored.replace('illustrated edition v0.09','manuscript closeout v0.08').replace('\\clearpage\n\\appendix',r'\appendix')
restored=restored.replace("Akari Hayami (Jian-Yu Huang)","Akari H.")
assert restored==BASE.read_text(),'Non-illustration content changed'
assert len(list((ROOT/'figures').glob('*.pdf')))==14
(ROOT/'qa/integration.json').write_text(json.dumps({'source_sha256':hashlib.sha256(BASE.read_bytes()).hexdigest(),'mathematical_body_preserved':True,'figures':placements},indent=2))
print('PASS: 14 vector figures, TeX captions and cross-references; original mathematical text preserved.')
