# Supervisor leads, not established new results

The initial mandate's suggested U(x)=(phi-x)/(1+phi*x) was an intentionally unchecked starting lead. The correct classical modular inversion for the standard Rogers--Ramanujan R is

    U(x) = (1-phi*x)/(phi+x),
    R(exp(-2*pi/t)) = U(R(exp(-2*pi*t))), t>0.

Kohli arXiv:1806.05739v7, equation (29), directly states this. The positive fixed value is sqrt(phi^2+1)-phi. Check independently.

Primary full texts retrieved by supervisor:
- Duke, Continued fractions and modular functions, author PDF: https://www.math.ucla.edu/~wdduke/preprints/bams4.pdf (31-page author preprint; published Bull. AMS 42 (2005), 137-162). AMS PDF gave HTTP 403; use author version and keep page/section references clear.
- Kohli, https://arxiv.org/html/1806.05739v7, especially Table 1 and equations (29)-(30). This already treats generalized quadratic units and golden-ratio reciprocity, so those observations alone are not novel.
- Berndt and Rebak, https://arxiv.org/html/2512.19952v1 (2025 survey).
- Campbell, https://arxiv.org/html/2402.02546v1 (2024 explicit evaluations proved using the icosahedral equation).

Local observations needing critical review:
- Historical ruled source has c0=(3-sqrt(5))/2=phi^-2; check current v5's actual mathematical role, not the ancestor alone.
- Current Information Topology has exact quadratic-norm recurrence lower bounds for phi; its source and verifier already include this. Ask if CM R-values introduce any NEW marked data, rather than merely being algebraic irrational parameters with the same qualitative recurrence exponent.
- A possible useful bounded theorem is a rigidity/obstruction statement: a quadratic-field-only golden-ratio expression cannot encode the genuinely larger CM level-5 field. Prove minimal degrees or irreducibility if you pursue it.
- For an actual arithmetic bridge, the discriminant -15/class-number-two control and Q(sqrt(5)) singular moduli may be MORE direct than -163. Test this instead of assuming the largest Heegner number is the unique golden-ratio carrier. Class-number-one is about j being rational; level-5 structure introduces sqrt(5) universally.

Registered RH runtime exists at /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python. HMR .agent-venv/bin/python is currently absent. Do not install dependencies.

Further primary-source check: Duke author PDF Proposition 2 / equation (3.2) gives the exact transformation; Theorem 3 says that for algebraic tau in the upper half-plane the ONLY degree-at-most-two r(tau) values over Q are plus/minus i. Thus a proposed new quadratic-field obstruction is already classical in a stronger form. Please do not claim it as new. Equation (2.5) supplies the level-5 polynomial; Theorem 2 gives algebraic-unit and radical solvability at CM tau.

A worthwhile HMR-specific test is whether the Information Topology Boolean recurrence observable collapses all real irrational algebraic CM parameters for alpha>1 (via Roth), whereas a quantitative/marked observable might retain field-specific data. This is a lead, not a claim already established.

A particularly direct exact classical control: Duke, Modular functions and the uniform distribution of CM points, author PDF https://math.ucla.edu/~wdduke/preprints/modud.pdf, p.1, gives j((-1+i sqrt(15))/2)=(-191025-85995 sqrt(5))/2 = -52515-85995 phi. If current ruled c0=phi^-2=2-phi, this equals 85995*c0-224505. This is a precise shared quadratic-field identity, but NOT yet an intrinsic map from HMR geometry to CM. Verify before using. The same page gives discriminant -20 as another sqrt(5) control.

Supervisor independently evaluated r(i)=0.28407904384041229602829183239312616909108808844574 at 100 digits via q-products; it agrees with sqrt(phi^2+1)-phi to about 1e-101. Its minimal polynomial is x^4+2x^3-6x^2-2x+1, already explicitly in Duke p.4.

Supervisor exact exploratory SymPy factorization: the t=r^5 level-5 degree-12 polynomial for j=-640320^3 is irreducible over Q; substituting t=x^5 gives factor degrees 12,24,24. A separate probe is checking the correct branch and extension by sqrt(5). Do not treat branch degrees as proved solely from approximate root selection.
