import StokesV5.Polynomials

namespace StokesV5

/-- Increasing-degree coefficients. Exact finite computation, no root-count axiom. -/
def certificatePB : List ℚ := [-1, 1, -1, 6, -5, 1]
def certificateR7 : List ℚ := [-1, -6, 30, -69, 60, -12, -8, 3]
def certificateQ17 : List ℚ :=
  [0, -12, 14, 64, -346, 856, -810, 798, -4868, 14160, -21630,
    20432, -12800, 5462, -1588, 306, -36, 2]

def coefficientEval (p : List ℚ) (x : ℚ) : ℚ := p.foldr (fun a b => a + x * b) 0
def coefficientTrim (p : List ℚ) : List ℚ := (p.reverse.dropWhile (· == 0)).reverse
def coefficientDerivative (p : List ℚ) : List ℚ :=
  p.zipIdx |>.drop 1 |>.map (fun (a, i) => a * i)

def coefficientRemainder : ℕ → List ℚ → List ℚ → List ℚ
  | 0, p, _ => coefficientTrim p
  | k + 1, p, q =>
    let p := coefficientTrim p
    let q := coefficientTrim q
    if q.isEmpty || p.length < q.length then p else
    let d := p.length - q.length
    let a := p.getLast! / q.getLast!
    let shifted := List.replicate d 0 ++ q.map (a * ·)
    coefficientRemainder k
      ((List.range p.length).map (fun i => p[i]! - shifted[i]!)) q

/-- Positive rescaling controls coefficient growth and preserves Sturm signs. -/
def coefficientNormalize (p : List ℚ) : List ℚ :=
  p.map (· / |p.getLast!|)

def sturmTail : ℕ → List ℚ → List ℚ → List (List ℚ)
  | 0, _, _ => []
  | k + 1, p, q =>
    let r := coefficientNormalize ((coefficientRemainder p.length p q).map (- ·))
    if r.isEmpty then [] else r :: sturmTail k q r

def exactSturmSequence (p : List ℚ) : List (List ℚ) :=
  p :: coefficientDerivative p :: sturmTail p.length p (coefficientDerivative p)
def sturmSigns (p : List ℚ) (x : ℚ) : List Bool :=
  ((exactSturmSequence p).map (fun q => coefficientEval q x)).filter (· != 0)
    |>.map (0 < ·)
def signVariations : List Bool → ℕ
  | [] => 0
  | [_] => 0
  | a :: b :: rest => (if a == b then 0 else 1) + signVariations (b :: rest)
def exactSturmVariation (p : List ℚ) (x : ℚ) : ℕ := signVariations (sturmSigns p x)

theorem certificatePB_eval (x : ℚ) : coefficientEval certificatePB x = pB x := by
  simp [coefficientEval, certificatePB, pB]; ring
theorem certificateR7_eval (x : ℚ) : coefficientEval certificateR7 x = r7 x := by
  simp [coefficientEval, certificateR7, r7]; ring
theorem certificateQ17_eval (x : ℚ) : coefficientEval certificateQ17 x = q17 x := by
  simp [coefficientEval, certificateQ17, q17]; ring

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sturm_variations_pB :
    exactSturmVariation certificatePB 0 = 4 ∧ exactSturmVariation certificatePB 1 = 3 := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sturm_variations_r7 :
    exactSturmVariation certificateR7 (613 / 1000) = 3 ∧
      exactSturmVariation certificateR7 1 = 3 := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sturm_variations_q17 :
    exactSturmVariation certificateQ17 (613 / 1000) = 9 ∧
      exactSturmVariation certificateQ17 1 = 9 := by
  decide +kernel

end StokesV5
