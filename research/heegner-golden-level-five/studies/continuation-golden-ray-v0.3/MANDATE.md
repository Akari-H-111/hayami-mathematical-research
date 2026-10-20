# Golden ray-class continuation — 2026-10-19

The human asks the director to continue directing Codex CLI GPT 5.6 terra, with intellectual freedom, prioritizing c0=phi^-2 and the Heegner/Ramanujan connection. HMR/RH bridges are secondary. Work only inside this new packet. Previous parent and v0.2 packets and unrelated dirty work are read-only. English artifacts; no commit, push or publication.

Read ../continuation-v0.2-ring-class/{MATHEMATICS.md,GENERAL_GENUS_MECHANISM.md,REVIEW_RESOLUTION.md} and ../../heegner-golden-20261018/CUBIC_RESOLVENT.md (correct the relative path if needed). Source cache here: logs/sources/cais-conrad.pdf and .txt. Cais–Conrad, Modular Curves and Ramanujan's Continued Fraction, Eq (4.8), Corollary 5.7: their j5=1/r; for a 5-unit tau with maximal CM order, K(r(tau)) is the conductor-5 ray class field. URL https://virtualmath1.stanford.edu/~conrad/papers/J5final.pdf. Parent can obtain further primary sources if needed; CLI DNS may fail. Hash sources actually used.

Registered Python: /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B (SymPy 1.14, mpmath). No Python -O. Ponytail skill path: /Users/akari_hayami_64/.codex/plugins/cache/ponytail/ponytail/5.3.2/skills/ponytail/SKILL.md.

Target: resolve the previous OPEN ray-class identification, then derive the strongest direct exact c0/163 relation, rather than a larger survey. Parent's conjectural lead, to verify or refute:

tau=(1+i sqrt163)/2, r Rogers–Ramanujan CF with analytic q^(1/5) branch, t=r^5<0, u=t-1/t. K=Q(sqrt(-163)), F=Q(sqrt5), E=Q(u), [E:Q]=6; K(u)=H5, the conductor-5 ring class field. [Q(t):Q]=12. c0=(3-sqrt5)/2.

1. Cor 5.7 applies: tau norm41, maximal order; 5 inert, ray degree12 over K. Prove inclusion then degree identification K(t)=K(r)=K_(5). Do not infer inclusion from matching degrees alone.
2. Establish or refute K_(5)=H5(zeta5), using Artin subgroups or an exact certificate; H5 already contains F. Scalar subgroup has order2 modulo +/-1.
3. Proposed real quadratic extension: Q(t)=E(sqrt(163*(1+c0)))=E(sqrt(163*(4-c0))). Ratio (4-c0)/(1+c0)=phi^2, a square in F. Cyclotomic radicals have squares -(5 +/- sqrt5)/2; combine with sqrt(-163). Seek an explicit rational polynomial w(u) proving
   u^2+4 = 163*(1+c0)*w(u)^2 in E.
   This is conjectural until checked. Do not conceal a failure. If an exact square root is difficult, provide a fully justified field-theoretic proof and an independently checkable certificate target with honest OPEN label.
4. Can this extend uniformly to other Heegner discriminants coprime5, and which part depends on 163? Only pursue after the core, with actual hypotheses and countercontrols. Avoid numerical fit hunting.

Use G(U)=(U^2-228U+496)^3-640320^3*(U+11)^5. Exact old cubic split G=alpha^2-5 beta^2 with
alpha=U^3-131268706320384342 U^2-2896632145572621512 U-15979661797307720544,
beta=-58705150130167150 U^2-1295413276662289800 U-7146322007247306400.
On selected CM embedding sqrt5=-alpha/beta, so c0=(3 beta+alpha)/(2 beta). gcd(beta,G)=1.

Deliver a concise MATHEMATICS.md proof, README.md handoff, SOURCES.md with exact theorem locations and hashes, CLAIM_LEDGER.md, and a minimal assert-based verification/check.py with RESULTS.json. Separate external theorems, written deductions, exact computation, numerical branch diagnostics, and open claims. Do not write parent-owned director_* files. Keep raw failures under logs. No modifications outside this new scope. Run checks and finish with reviewable findings. A fresh independent read-only review will follow.
