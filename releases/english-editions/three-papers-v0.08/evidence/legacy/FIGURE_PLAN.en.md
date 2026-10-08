# Assessment of visualization needs for the three papers

Date: 2026-09-05. v0.03's plan is retained in v0.04. **Six research illustrations have not yet been made.**
v0.04 separately generated temporary page previews of existing PDFs for QA with user permission; those are not the research illustrations planned here.

## Suggested count

Suggest **6 figures: Paper I 3, Paper II 1 with two panels, Paper III 2**.
This is editorial judgment based on the current argument structure, not a journal requirement or a prerequisite for completing proofs.
A minimal preprint could start with 3 core figures (I-2,II-1,III-1); the current three papers without figures remain fully readable.

| Paper | Suggested figure count | Retained non-image views | Main purpose of new figures |
|---|---:|---|---|
| Paper I | 3 | 2 existing tables, 1 mathematical commutative diagram | Distinguish reconstruction levels and explain low-rail recurrence and three-level stratification |
| Paper II | 1 (2 panels) | Formulas and direct proofs | Compare marks-preserving comparison with the marks-removing counterexample |
| Paper III | 2 | 1 verification-results table | Show complete input dependencies and landed/stable sector differences |

Future figures are numbered independently per paper. Tables, commutative diagrams, and panels do not count as separate figures.
Existing tables and mathematical commutative diagrams retain TeX typesetting, without raster conversion.

## I-1: reconstruction, tangent spaces, and obstructions

- Suggested location: between Paper I's “Strict tangent observability and rigidity” and “Second-order obstruction theory.”
- Structural diagram linking fixed data \((A,V,B)\), weak affine fiber, strict quadratic equations,
  strict tangent space, and second/cubic obstruction, each accompanied by a text label from an existing model.
- Mathematical labels: four rigid strict points; dual-number germ \(\mathbb C[[t]]/(t^2)\);
  cubic germ \(\mathbb C[[u,v]]/(v^3)\)。
- Reader conclusion: nonunique global solutions, zero tangent spaces, and higher-order-obstructed nonzero tangent directions are distinct phenomena.
- Sources: sec:finite-example,sec:false-tangent,thm:cubic-kuranishi.
- Draft caption:
  “Reconstruction and obstruction levels for fixed \((A,V,B)\). The examples distinguish
  global ambiguity, infinitesimal rigidity, and higher-order failure of a tangent lift.”
- Acceptance: do not depict full scheme structure as an ordinary curve or solid plane;
  \(v^3=0\) is nonreduced structure, not three separate geometric branches.
- Priority: medium. The introduction is already condensed into five main lines, improving navigation.

### v0.03 reinforcement of the I-1 inset

The same fixed weak-fiber scheme is proved a rank-three finite flat family over C[u].
An I-1 inset may compare C[v]/(v^3) when q=1+2u is nonzero
with C[e,v]/(e,v)^2 at u=-1/2. Both have length 3,
but fiber embedding dimensions are 1 and 2 respectively.
This is not three geometric branches or moving the original base point to the special fiber; no extra figure counted.

## I-2: dependencies and terminal control of four low rails

- Suggested location: after eq:x2-rec through eq:x5-rec in Paper I's “Autonomous low rails.”
- Suggested form: four-level directed dependency diagram, nodes \(x_2,x_3,x_4,x_5\), each labeled with the common homogeneous action.
- Exact connections:
  - \(x_2\to x_3\)：\(-h[\xi,x_2]\)；
  - \(x_3\to x_4\)：\(-h[\xi,x_3]\)；
  - \((x_2,x_2)\to x_4\)：Cauchy convolution；
  - \(x_4\to x_5\)：\(-h[\xi,x_4]\)；
  - \((x_2,x_3)\to x_5\): symmetric Cauchy convolution.
- Controller branch label: current \(E/K/P\) corrections have zero observability for future distinguished \(v^6\) forcing;
  do not depict all controllers as irrelevant to every future quantity.
- Sources: eq:low-rails,eq:x2-rec through eq:x5-rec,sec:low-rail; v0.33 certificate.
- Draft caption:
  “The autonomous low-rail recurrence at the fixed contraction. Bracket and Cauchy
  forcing feed higher rails, while the terminal controller correction is invisible
  to the specified future forcing observable.”
- Acceptance: mark convolution's two inputs; not a purely linear four-stage chain; finite time points do not replace an all-orders proof.
- Priority: high.

## I-3: truncation relationships in three-level gcd stratification

- Suggested location: after Paper I's “Three-level extension stratification” theorem.
- Three-level comparison: canonical higher lift \(g_X\) → forcing memory \(g_F\) →
  homogeneous landing \(g_H\)。
- Each level specifies multiplicity caps relative to \(E=S+2\) and the five \(Q_i\):
  \(X=(4,2)\)、\(F=(3,1)\)、\(H=(1,1)\)。
- Exact relationships:
  \(g_F=\gcd(p_4,g_X)\)、\(g_H=\gcd(m_A,g_X)\)。
- An inset uses the nonzero contact-label condition \(a+\sum b_i\le7\) for the feasible region,
  listing 64,128,708+1 in text rather than expanding 709 nodes.
- Finite counts require reverification, not hand-drawn guesses; over \(\mathbb Q\), 8 nonzero strata plus zero.
- Sources: thm:spectral-stratification,thm:two-axis,thm:three-level;
  v0.38 through v0.40 verifiers.
- Draft caption:
  “Three spectral-contact resolutions of the canonical degree-bounded datum.
  Lower layers truncate the contact orders retained by the higher lift.”
- Acceptance: 64/128 stratification counts include their deepest corresponding levels; 708 must be labeled separately from the additional zero-data stratum;
  \(\deg r_d<8\) is a canonical-representative condition and cannot be omitted.
- Priority: medium-high. If a figure cannot improve on current formulas, use a small table.

## II-1: marks-preserving naturality and elimination of a contractible pair

- Suggested location: before or after Paper II's “Ordinary quasi-isomorphism no-go.”
- One figure, two panels:
  - (a) Two rows comparing \(\mathcal P_{\rm res}\xrightarrow{\bar d}\mathcal L_{\rm res}\),
    marking \(\Phi_P,\Phi_L,\bar D\) and
    \(\Theta'=\Phi_L\Theta\Phi_L^{-1}\)；
  - (b) Eliminate the acyclic pair \(E\mapsto\beta\) in \(\mathfrak g\to\mathfrak h\),
    retaining \(\alpha,\xi\), with \(\mathcal L_{\rm res}\) dropping from one dimension to zero.
- Must label \(T_{\rm resp}=\mathbb C\alpha\subsetneq T_{\rm red}\).
  This correction proved \([\xi,\xi]\ne0\); do not depict \(\rho_{\rm res}\) on the entire two-dimensional tangent space.
- Sources: Paper II naturality proof, contractible-pair theorem; new verify_revision_claims.py.
- Draft caption:
  “Marked comparison preserves the boundary response on its descent domain.
  Forgetting the marking permits cancellation of the contractible resonant pair,
  although the two-parameter Maurer--Cartan functor remains unchanged.”
- Acceptance: distinct arrow styles for isomorphism, quasi-isomorphism, quotient;
  do not imply the marked object survives in the right panel.
- Priority: high. No separate \(q\)-spectrum figure needed; formulas for two diagonal representatives are already clear.

## III-1: spectral-floor pipeline with complete inputs

- Suggested location: after eq:pipeline in Paper III's introduction; may replace repeated visualization of long formulas.
- Main line: marked operator action on \(H_0(P_\bullet)\) → \(\mathscr A_{\rm eq}^{\rm eff}\)
  → \(N_{\rm eq}=\mathscr A_{\rm eq}^{\rm eff}\operatorname{im}R_0\)
  → \(\Gamma_{\rm eq}\) → kernel quotient → \((\chi_{\rm forced},\mu_{\rm forced})\)。
- Three external-input groups, each with explicit destination:
  - \(P_\bullet,\mathfrak G_{\rm can}\) → effective algebra；
  - \(R_0,\iota\) → normalized source；
  - \(D,\Lambda,T\) → quotient and induced action.
- Retain landing-descent conditions before quotient → spectrum; nonclosed normalization passes through the observability kernel to the stable quotient. The new spectral-floor theorem needs no second kernel-invariance condition.
- Sources: eq:pipeline,thm:assembly,thm:stable-floor. v0.57 through v0.61 verifiers remain finite models of separate stages; the new v0.03 supplement has a shared end-to-end marked model with nonzero syzygy, nonscalar mark, and nonclosed normalization. Distinguish the two evidence groups.
- Draft caption:
  “Input dependencies of the finite marked assembly. The operator algebra and
  normalized source are generated; the canonical marks and the state, landing,
  and source maps remain supplied data.”
- Acceptance: \((P_\bullet,\mathfrak G_{\rm can},R_0)\) alone must not be depicted as sufficient to produce \(D,\Lambda,T\);
  source embedding \(\iota\) and \(R_\Lambda=\operatorname{im}\Lambda\) must be visible.
- Priority: highest.

## III-2: static sector and maximal invariant core in the same tilt orbit

- Suggested location: after Paper III prop:stable.
- Diagram: kernel/subquotient relationships, main frame \(M\) containing \(\ker\Gamma\),
  \(M_\infty=\ker\mathcal O\), mapped by \(\Lambda\) to \(R_\Lambda\).
- When landing descent holds, label
  \(K_\Lambda\simeq\ker\Gamma/\ker\Lambda\) and
  \(K_\infty\simeq M_\infty/\ker\Lambda\)。
- Demonstrate with the shared v0.03 model's 3-dimensional matrices and two exact tilt witnesses, \(\Gamma=(0,0,1)\),
  \(M_\infty=\mathbb Q e_2\)、\(Te_2=2e_2\)。
- Sources: prop:static,prop:closure,prop:stable; v0.58 verifier;
  [Stanford observability notes](https://ee263.stanford.edu/lectures/observ.pdf)。
- Draft caption:
  “The stable normalization core is the largest invariant subspace inside
  the static kernel. The quotient formula requires landing descent.”
- Acceptance: do not imply \(\ker\Lambda\subseteq M_\infty\) in arbitrary cases;
  when descent fails, denominator is \(M_\infty\cap\ker\Lambda\).
- v0.03 supplement: label two characteristic polynomials in the original orbit,
  (S-2)S^2 and (S-2)(S^2+1), whose gcd is the stable core's S-2.
  Computing on the stable core must not be depicted as relaxing original tilt constraints.
- Priority: high.

## Unneeded figures and later production specifications

These papers have no experimental statistical error or continuous-parameter sampling results, so no decorative spectral plots,
3D formal-germ surfaces, smooth fits of finite models, or full-page version timelines are needed.
All six figures should be structural diagrams arranged from exact definitions, not generative images presenting mathematical evidence.

Future production may use version-controlled vector figures; connections remain distinguishable in monochrome,
with text at least approximately 9 pt at final column width. Symbols match main text; captions explicitly state fixed/marked assumptions.
Specifications are recorded only here; research-illustration production was not performed. Temporary PDF previews excluded from delivery.
