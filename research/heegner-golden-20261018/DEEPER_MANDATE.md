# Deeper continuation mandate

The human explicitly requests restoring progress and continuing direction of GPT-5.6-terra CLI to seek a major overlooked structural relation. The attached Felix Rieseberg heuristic requests depth, not wider scope. The supervisor has answered its four questions and rewrites the task as follows.

Seek an independently verifiable structural mechanism connecting Heegner numbers, Ramanujan's constant and the golden ratio. Start from original HMR/RH definitions, current uncommitted research, q-series and CM class polynomials. Construct explicit maps, then advance the strongest candidate to a proved proposition or falsifiable conjecture. Explain what it adds to existing theory. Use preset controls to distinguish arithmetic specificity from universal modular behavior or fitted expressions.

Read MANDATE.md for the full original scope and preservation constraints, then SUPERVISOR_LEADS.md and logs/supervisor-degree-probe.json and logs/supervisor-golden-field-probe.json. The previous exact-model run did broad initial inventory but stopped at its usage limit before writing a report. Logs/cli-events.jsonl contains its read-only research commands/results; reuse compactly. Do not repeat a huge unfiltered scan or dump memory files. The reset has now occurred. Your model is explicitly gpt-5.6-terra; no other agents or models.

## Deepest active candidate

Let tau=(1+i sqrt(163))/2, q=exp(2*pi*i*tau), r=q^(1/5)prod((1-q^(5n-4))(1-q^(5n-1))/((1-q^(5n-3))(1-q^(5n-2)))) with q^(1/5)=exp(2*pi*i*tau/5), and t=r^5. For j=-640320^3, the classical icosahedral equation gives the degree-12 polynomial
P(t)=(t^4-228t^3+494t^2+228t+1)^3+j*t*(t^2+11t-1)^5.

Supervisor exact SymPy found P irreducible over Q and P=A^2-5B^2 with coprime A,B in Z[t]. A and B are in logs/supervisor-golden-field-probe.json. Therefore at a root t, (A(t)/B(t))^2=5, so sqrt(5) is IN Q(t), not merely an arbitrary externally adjoined coefficient. Correct analytic branch/sign still needs a proof/certified isolation. Can this become a short exact reconstruction formula phi=(1 plus or minus A(t)/B(t))/2, and thereby recover HMR's actual c0=phi^-2? Which Heegner and non-Heegner controls share or fail this field inclusion? Is this a known CM/ray-class genus consequence? This field-inclusion mechanism is stronger than generic numerical fitting, but is not automatically novel or geometry-specific.

The real branch s=exp(-pi sqrt(163)/5) times the negative-q real product satisfies a degree-12 factor with coefficients much smaller than P; actual complex r has a degree-24 factor. The branch conventions matter. Class-number-one does NOT mean level-5 special values are degree1. Duke's Theorem3 already excludes real degree2 CM r values; do not rediscover it.

Investigate whether a universal degree6 reciprocal polynomial factorization controls ALL rational j. If yes, phi extraction may be generic for algebraic t and should be explicitly demonstrated with a non-CM rational-j control (e.g. j=1), not mistaken for a 163 phenomenon. If it only factors at CM, analyze the Galois/level5 condition causing this. If phi is not generally in Q(t), identify the exact boundary/counterexample and state it.

Also compare the direct classical discriminant-15 identity j((-1+i sqrt(15))/2)=-52515-85995 phi. Its affine expression in c0=phi^-2 is exact but not an intrinsic geometric map. Distinguish this from 163's near-integer mechanism. A meaningful new HMR-facing result may be a precise field/marking obstruction or construction; do not manufacture a bridge by defining it to fit a target.

## Evidence and delivery

Continue the deliverables from MANDATE.md. Prioritize a substantive written proof and small reproducible exact verifier over ornamental breadth. No dependency installs; RH .venv/bin/python exists with SymPy/mpmath. Run finite controls and 100/200-digit independent checks. Label numerical checks versus certified bounds. Primary sources are supplied in SUPERVISOR_LEADS.md; retrieve and compare the relevant full text before claiming a literature result. Record exact coverage of HMR including unfinished/uncommitted streams and precise omissions; the goal is an informed archive survey, not claiming to have read every cache file. All other project files are read-only. Only write within this research package. Preserve logs and previous probes. Do not modify RESEARCH_BOARD.md. Finish with a useful bounded result and precise next target even if a major new discovery remains open.
