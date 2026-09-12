"""Reproduce the illustrated edition from the preserved v0.08 manuscript."""
from pathlib import Path

ROOT = Path(__file__).resolve().parent
text = (ROOT / 'provenance/paper_II_marked_naturality_v0_08.tex').read_text()
text = text.replace('Paper II, manuscript closeout v0.08', 'Paper II, illustrated edition v0.09')
text = text.replace('Akari H.', 'Akari Hayami (Jian-Yu Huang)')
preamble = r'''
% BEGIN ILLUSTRATION PREAMBLE
\usepackage{graphicx}
\raggedbottom
\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}
\setlength{\intextsep}{12pt plus 2pt minus 2pt}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\textfraction}{0.08}
\renewcommand{\floatpagefraction}{0.7}
% END ILLUSTRATION PREAMBLE
'''
text = text.replace(r'\begin{document}', preamble + r'\begin{document}', 1)
figures = [
    (r'\section{The fixed cubic recurrent envelope}', 'fig01_roadmap',
     r'Figure~\ref{fig:roadmap} summarizes the two kinds of data and the comparison statements that separate them.',
     r'Contraction-dependent and marked data. The common divisor \mbox{$S+2$} concerns normalized internal tilts in the fixed envelope. Naturality of the primitive-free response additionally requires a resonance-faithful comparison; ordinary quasi-isomorphism need not retain the marked boundary line.', 'roadmap'),
    (r'\begin{proposition}[Boundary-compatible completion of the finite source data]', 'fig02_fixed_envelope',
     r'The selected envelope and its source image are displayed in Figure~\ref{fig:envelope}.',
     r'The fixed seven-dimensional recurrent envelope. The ordered basis is $(E,g_3(0),Ag_3(0),\ldots,A^5g_3(0))$. The restriction of $D_\alpha$ is injective, and its closed source intersection is exactly the normalized boundary line. This figure does not assert invariance of the envelope under arbitrary changes of contraction.', 'envelope'),
    'PLACEHOLDER',
    (r'\section{Dependence of the cyclic source on the splitting}', 'fig04_surviving_rail',
     r'Figure~\ref{fig:rail} displays the all-order response forced by the normalized eigenrelation.',
     r'The surviving normalized $E$-rail. The lower row lists boundary-valued outputs of $D_\alpha$, not an assertion that $A$ acts on $C^2$. The formulas hold for every $n\geq0$ by the eigenrelation and persist throughout the normalized internal tilt orbit.', 'rail'),
    (r'\section{Strict resonance-faithful naturality}', 'fig05_response_descent',
     r'Figure~\ref{fig:descent} summarizes the primitive quotient, maximal descent domain and transverse obstruction.',
     r'Primitive-independent response in the cubic model. The full Zariski tangent space is two-dimensional, whereas the exact response domain is $\C\alpha$. An output quotient can permit descent in a transverse direction only by killing the marked line; it cannot retain a nonzero image of that same line.', 'descent'),
    (r'\section{Ordinary quasi-isomorphism no-go}', 'fig06_naturality',
     r'The two compatibility identities and their consequence are displayed in Figure~\ref{fig:naturality}.',
     r'Resonance-faithful naturality. All three comparison maps are isomorphisms on the specified marked data. The two commuting squares imply conjugacy of the response operators. On the one-dimensional resonant line, this is the stated covector transformation law.', 'naturality'),
    (r'\section{Computational evidence and scope}', 'fig07_cancellation',
     r'Figure~\ref{fig:cancellation} depicts the independent four-generator example in the preceding proof. Its convention $dE=\beta$ belongs to this example; the earlier cubic cochain satisfies $dE=-\xi\smile\xi$. The smooth germ here is not the nonreduced cubic germ of Paper~I.',
     r'Contractible-pair cancellation in an independent DGLA model. Over local Artin algebras, $1+2u$ is invertible, so projection identifies the two Maurer--Cartan functors. It simultaneously kills the entire marked resonant line. This is a counterexample to ordinary quasi-isomorphism invariance, not a quasi-isomorphism from the original cubic model to an abelian DGLA.', 'cancellation'),
]
figures[2] = (
    'The surviving temporal response is therefore', 'fig03_tilt_orbit',
    r'Figure~\ref{fig:orbit} makes the full internal orbit explicit. Relative to any chosen vector-space complement $W$ of $\C E$, the off-diagonal component $W\to\C E$ and the quotient operator are both arbitrary; the complement need not be invariant.',
    r'The full normalized internal tilt orbit in the fixed envelope. The identification $W\cong\mathcal R/\C E$ uses a chosen complement and is not canonical. The six entries of $\ell$ and the $36$ entries of $C$ give $42$ parameters. The contrasting representatives leave precisely $S+2$ as the common characteristic and minimal polynomial divisor.', 'orbit')
for number, (anchor, stem, callout, caption, label) in enumerate(figures, 1):
    assert text.count(anchor) == 1, anchor
    block = ('\n% BEGIN ILLUSTRATION ' + str(number) + '\n' + callout + '\n'
             + '\\begin{figure}[htbp]\n\\centering\n'
             + '\\includegraphics[width=\\linewidth]{figures/' + stem + '.pdf}\n'
             + '\\caption{' + caption + '}\n\\label{fig:' + label + '}\n'
             + '\\end{figure}\n% END ILLUSTRATION ' + str(number) + '\n\n')
    text = text.replace(anchor, block + anchor, 1)
anchor = '\\clearpage\n\\begin{thebibliography}'
assert text.count(anchor) == 1
note = r'''
% BEGIN ILLUSTRATION EVIDENCE NOTE
\paragraph{Illustrated-edition supplement.}
The portable source package for this edition includes the seven native vector
figure masters and unchanged copies of the five Paper~II verification scripts
in \path{evidence/verification/part_II/}, together with the v0.02/v0.03
replacement checks. Run \path{verify_evidence.py} for the finite mathematical
replay and \path{verify_integrated.py} for source-preservation and PDF checks.
The original v0.08 three-paper bundle remains the broader companion archive.
The illustrations summarize the manuscript proofs and do not replace them.
% END ILLUSTRATION EVIDENCE NOTE

'''
text = text.replace(anchor, note + anchor, 1)
(ROOT / 'paper_II_marked_naturality_v0_09.tex').write_text(text)
print('Integrated seven figures; original mathematical body retained.')
