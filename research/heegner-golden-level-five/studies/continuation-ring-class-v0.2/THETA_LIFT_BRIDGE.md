# The golden cycle and the -163 CM value occur in one Maass form

Director application of an existing external theorem, 2026-10-19 (Asia/Taipei).
This is a canonical automorphic framework relative to the fixed BFI lattice,
trace and orientation conventions, already present in the literature;
it is not a claim that this project discovered the theory.

Put J=j-744. It is weakly holomorphic of weight0 for PSL2(Z), holomorphic
on the upper half-plane, with zero constant term and principal part q^-1.
Bruinier-Funke-Imamoglu, theorem1.2 with p=1, applies. Its harmonic weak Maass
form H(w,J) of weight1/2 for Gamma0(4) has two relevant kinds of Fourier data.
Here w=u+iv is the OUTPUT variable, q_w=exp(2*pi*i*w); it is distinct from
the input point z used in J(z).

For negative discriminants d, define

    T_d(J)=sum_[Q] J(z_Q)/|PSL2(Z)_Q|.

For positive nonsquare d, define with the paper's compatible orientation

    T_d(J)=(1/(2*pi))*sum_[Q] integral_(C_Q) J(z) dz/Q(z,1).

The positive-index holomorphic coefficient at q_w^d is T_d(J). The
negative-index nonholomorphic term is

    2*sqrt(v)*T_d(J)*beta_(1/2)(4*pi*|d|*v)*q_w^d,
    beta_(1/2)(s)=integral_1^infinity exp(-s*t)*t^(-1/2) dt.

There are additional principal, zero and square-index terms in H; this note
does not omit them from the theorem or redefine H using only these two terms.

## The two specific discriminants

For d=-163 there is one proper positive-definite class, and its stabilizer in
PSL2(Z) is trivial. The classical CM integer therefore gives exactly

    T_(-163)(J)=J((1+i*sqrt(163))/2)=-(640320^3+744).

For d=5 the primitive form Q_5(X,Y)=X^2-X*Y-Y^2 has roots phi and phi'.
Its cycle is precisely the golden closed geodesic, with period L=4*log(phi)
for the norm-one stabilizer. There is one proper indefinite class of
discriminant5: the ordinary ideal class number is1 by the quadratic
Minkowski bound sqrt(5)/2<2, and the norm-minus-one unit phi makes the
narrow class number equal to it. This uses the standard proper-form/ideal
class correspondence.

Let

    A_phi=(1/L)*integral_(golden cycle) j(z) ds,
    ds=|dz|/Im(z).

With the orientation for which sqrt(5)*dz/Q_5(z,1)=ds,

    T_5(J)=L/(2*pi*sqrt(5))*(A_phi-744).

Thus the golden cycle period and the -163 Ramanujan/CM integer occur as
positive and negative Fourier-index data of ONE specified Maass form.
This is stronger than an arbitrary shared numerical parameter, while being
an application of established theory. It does not imply an algebraic
identity between those two coefficients, and does not evaluate j on the
real boundary at phi.

## Numerical benchmark and limits

The director evaluated A_phi using

    z(t)=1/2+(sqrt(5)/2)*tanh(t)
                 +i*(sqrt(5)/2)*sech(t),
    -L/2<=t<=L/2,  ds=|dt|,

where the endpoints are related by [[2,1],[1,1]]. For increasing t,
sqrt(5)*dz/Q_5=-dt; the trace orientation is decreasing t, while the
numerical average uses the unsigned length element |dt|. The normalized quadrature
at45 and65 decimal working digits agrees on

    A_phi=706.32481354081258205596032480346066543...

This is a precision-stable NUMERICAL DIAGNOSTIC, not certified interval
quadrature or evidence of algebraicity. Its code/result are preserved in
logs/cycle_probe.py and logs/CYCLE_EXPLORATORY.json. The theorem application and trace normalizations passed independent read-only
review, with the orientation clarification above. The displayed decimal
is not used to prove the connection.

Primary source: Bruinier, Funke, Imamoglu, *Regularized theta liftings and
periods of modular functions*, author revised manuscript March11,2013,
equations(1.1),(1.5),(1.6), theorem1.2 (printed pages2-5),
https://maths.dur.ac.uk/users/jens.funke/BIFfinal6c-revised.pdf
(cached in logs/sources). See also Bengoechea-Imamoglu,
*Cycle integrals of modular functions, Markov geodesics and a conjecture of
Kaneko*, section2.1, https://arxiv.org/abs/1805.08029 .

The genus-field inclusion, matrix trace identities and this theta-lift
framework are distinct results. None yet gives an intrinsic map to the HMR
ruled surface, an equality of its response form with this lift, or an RH
consequence. A concrete next target is to repeat this theorem's trace
normalization on X0(5) while retaining the quadratic genus character and
checking whether a marked cycle observable preserves the residual cubic.
