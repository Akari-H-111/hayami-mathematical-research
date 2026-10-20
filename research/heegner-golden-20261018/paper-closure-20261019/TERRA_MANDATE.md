# HMR/RH source-based paper closure

The user explicitly redirects away from practical cryptography and requests
careful reading of HMR and RH, including uncommitted research, to find an
obvious but overlooked connection that gives the golden/Heegner paper a strong,
honest ending. You are the requested Codex CLI gpt-5.6-terra. READ ONLY; no
edits, no commits, no publication, no running legacy writers. Return an English
mathematical report, not another broad novelty audit or a crypto proposal.

Canonical HMR root /Users/akari_hayami_64/Documents/hayami-mathematical-research.
Read its RESEARCH_BOARD.md and the relevant source passages in
papers/legacy-geometry/orthogonal-circle-ruled-surface/revision_v5/Orthogonal_Circle_Ruled_Surface_v5.tex
(definitions, rank-loss elimination),
papers/legacy-geometry/bicomplex-signal-manifolds/successor/Realization_Limits_Bicomplex_Signal_Surface.tex
(monodromy and distinctions between polynomial derivative and actual Jacobian),
papers/information-topology/Arithmetic_Local_System_Filling_Spectra.tex
(golden Diophantine example), and recent
research/zero-strip-symmetry-20261018/paper-development-20261018/RESEARCH_CORE.md
for comparison only. Keep their actual hypotheses and statuses.

Canonical RH root /Users/akari_hayami_64/RH_Research_Workspace.
Read AGENTS.md and README.md there. Mainline is READ-ONLY INPUT, not a new RH
proof task. Relevant sources:
RH_Spiral/research/parameter-free-observation-bridge-20261005/verify_bridge.py;
RH_Spiral/research/gir-covering-arithmetic-20261007/README.md;
RH_Spiral/BigBridge/verify/dh_zeros.py;
Prime_Dimensionality_Reconstruction/papers/prime-dimensionality-reconstruction/Prime_Dimensionality_Reconstructed.tex
(phase-sensitive Mellin readouts). Do not modify or import private RH claims
into this paper. RH remains open. No need to execute the BigBridge program.

Director lead already checked symbolically, now independently scrutinize:
c=(3-sqrt5)/2, phi=(1+sqrt5)/2, gamma=phi^-1=1-c, u0=gamma/2.
HMR c=cos(t0), rank loss forces u=u0 and c^2-3c+1=0, so
u0=cos(2pi/5). The DH constant in dh_zeros.py is
k=(sqrt(10-2sqrt5)-2)/(sqrt5-1).
It equals r(i)=sqrt((5+sqrt5)/2)-phi=gamma/(1+sqrt(1+c)).
Its monic polynomial is X^4+2X^3-6X^2-2X+1.

Stronger structural lead: the real sine-Fourier involution on odd periodic
5-coefficient vectors a=(x,y,-y,-x,0) is
A=(2/sqrt5)[[sin(2pi/5),sin(pi/5)],[sin(pi/5),-sin(2pi/5)]].
The normalized RR inversion matrix is
M=[[-1,gamma],[gamma,1]]/sqrt(1+c).
For J=[[0,1],[1,0]], A=J M J. The positive +1 eigenline of A is (1,k),
selecting exactly the DH coefficient vector (1,k,-k,-1,0).
Thus the same projective involution determines RR r(i) and the DH symmetric
functional equation. Check signs, normalizations, Fourier conventions and
actual analytic hypotheses. Duke's primary PDF/text is cached locally.
Parent is obtaining Bombieri-Ghosh2011 and/or Balanzario-SanchezOrtiz2007.

Deliver a bounded closure theorem with proof, source-level adoption map,
and English final-section wording. Choose at most two substantive additions;
identify tempting extras to omit. A dramatic ending must follow actual exact
maps. DH is not a counterexample to RH, only to symmetry-only reasoning.
It has nonmultiplicative coefficients (a6=1 while a2*a3=-k^2), and its known
off-line zeros do not invalidate zeta RH. Existence uses external literature;
any newly computed zero remains a numerical diagnostic unless certified.
Do not claim historical novelty or that a surface is globally a modular curve.

Runtime: /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B,
SymPy1.14,mpmath1.3. No -O. For exact checks use bounded in-memory calculations.
