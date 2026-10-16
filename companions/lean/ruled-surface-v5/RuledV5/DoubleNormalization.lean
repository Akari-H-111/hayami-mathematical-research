import RuledV5.DoubleFamily

namespace RuledV5
noncomputable section
open StokesV5

private def quotientF (x y : ℝ) : ℝ :=
  16*(1-x)*y^3-4*(3*x^2+4*x-8)*y^2+4*(x+1)*(x-2)^2*y-x^2*(x-2)^2
private def normalA (k : ℝ) : ℝ := -k^4+12*k^3-60*k^2+112*k-64
private def normalB (k : ℝ) : ℝ := 12*k^2-16*k

private lemma normalA_neg {k : ℝ} (hk : 2 < k) : normalA k < 0 := by
  have hh : 0 < (k-2)*((k-2)*(k-4)^2+8*(k-2)+16) := by positivity
  have hi : -normalA k=(k-2)*((k-2)*(k-4)^2+8*(k-2)+16) := by
    unfold normalA; ring
  linarith

private lemma familyH_pos {v : ℝ} (hv : -1 < v) : 0 < doubleFamilyH v := by
  have hi : doubleFamilyH v=(v+1)^3+4*v^2+4 := by unfold doubleFamilyH; ring
  rw [hi]
  have hp : 0 < v+1 := by linarith
  positivity

private lemma family_k_identity {v : ℝ} (hh : doubleFamilyH v ≠ 0) (hm : 1-v ≠ 0) :
    doubleFamilyX v*(1+v^2)=(1+doubleFamilyY v)*(1-v^2) := by
  unfold doubleFamilyX doubleFamilyY
  field_simp <;> (try unfold doubleFamilyH) <;> ring

/-- The unordered cosine data determine a unique nonnegative physical normalization parameter. -/
theorem double_family_parameter_unique {v w : ℝ}
    (hv0 : 0 ≤ v) (hv : v ≤ Real.sqrt 5-2)
    (hw0 : 0 ≤ w) (hw : w ≤ Real.sqrt 5-2)
    (hx : doubleFamilyX v=doubleFamilyX w) (hy : doubleFamilyY v=doubleFamilyY w) : v=w := by
  have hs := Real.sq_sqrt (by norm_num : (0:ℝ) ≤ 5)
  have hvm : 0 < 1-v := by nlinarith
  have hwm : 0 < 1-w := by nlinarith
  have hvh := familyH_pos (by linarith : -1 < v)
  have hwh := familyH_pos (by linarith : -1 < w)
  have hkv := family_k_identity (ne_of_gt hvh) (ne_of_gt hvm)
  have hkw := family_k_identity (ne_of_gt hwh) (ne_of_gt hwm)
  rw [← hx,← hy] at hkw
  have he : (doubleFamilyX v+1+doubleFamilyY v)*(v^2-w^2)=0 := by
    linear_combination hkv-hkw
  have hxp : 0 < doubleFamilyX v := by unfold doubleFamilyX; positivity
  have hyp : 0 < doubleFamilyY v := by unfold doubleFamilyY; positivity
  have hcoef : doubleFamilyX v+1+doubleFamilyY v ≠ 0 := by linarith
  have hz := (mul_eq_zero.mp he).resolve_left hcoef
  exact (sq_eq_sq₀ hv0 hw0).mp (sub_eq_zero.mp hz)

/-- The explicit square-root pair is exactly the unordered pair with the given sum and product. -/
theorem double_family_roots {a b v : ℝ}
    (hsum : a+b=doubleFamilyX v) (hprod : a*b=doubleFamilyY v) :
    (a=doubleFamilyA v 1 ∧ b=doubleFamilyA v (-1)) ∨
      (a=doubleFamilyA v (-1) ∧ b=doubleFamilyA v 1) := by
  have hd : 0 ≤ doubleFamilyDelta v := by
    unfold doubleFamilyDelta
    rw [← hsum,← hprod]
    nlinarith [sq_nonneg (a-b)]
  have hs := Real.sq_sqrt hd
  change Real.sqrt (doubleFamilyDelta v)^2=doubleFamilyX v^2-4*doubleFamilyY v at hs
  have hrSum : doubleFamilyA v 1+doubleFamilyA v (-1)=doubleFamilyX v := by
    unfold doubleFamilyA; ring
  have hrProd : doubleFamilyA v 1*doubleFamilyA v (-1)=doubleFamilyY v := by
    unfold doubleFamilyA; nlinarith
  have hroot : (a-doubleFamilyA v 1)*(a-doubleFamilyA v (-1))=0 := by
    calc
      _ = a^2-a*(doubleFamilyA v 1+doubleFamilyA v (-1))+
          doubleFamilyA v 1*doubleFamilyA v (-1) := by ring
      _ = a^2-a*doubleFamilyX v+doubleFamilyY v := by rw [hrSum,hrProd]
      _ = 0 := by rw [← hsum,← hprod]; ring
  rcases mul_eq_zero.mp hroot with h | h
  · left
    have ha := sub_eq_zero.mp h
    exact ⟨ha,by rw [ha] at hsum; linarith⟩
  · right
    have ha := sub_eq_zero.mp h
    exact ⟨ha,by rw [ha] at hsum; linarith⟩

private lemma conic_reconstruction {k z : ℝ} (hk0 : 2 < k) (hk1 : k < 3)
    (hg : normalA k*z^2+normalB k*z-4*k^2=0) :
    ∃ v : ℝ, -1 < v ∧ v < 1 ∧
      (k-2)*z=doubleFamilyX v ∧ z-1=doubleFamilyY v := by
  let r := (2*normalA k*z+normalB k)/(4*k*(k-4))
  let v := r/(k-1)
  have hk : k ≠ 0 := by linarith
  have hk4 : k-4 ≠ 0 := by linarith
  have hkmin : 0 < k-1 := by linarith
  have hr : 4*k*(k-4)*r=2*normalA k*z+normalB k := by
    dsimp [r]
    field_simp
  have hid : (2*normalA k*z+normalB k)^2-
      4*normalA k*(normalA k*z^2+normalB k*z-4*k^2)=
      (4*k*(k-4))^2*((3-k)*(k-1)) := by
    unfold normalA normalB
    ring
  have hsq := congrArg (fun x : ℝ => x^2) hr
  have hc0 : (4*k*(k-4))^2*(r^2-(3-k)*(k-1))=0 := by
    linear_combination hsq+hid+4*normalA k*hg
  have hc : r^2=(3-k)*(k-1) := by
    have hh := (mul_eq_zero.mp hc0).resolve_left
      (pow_ne_zero 2 (mul_ne_zero (mul_ne_zero (by norm_num) hk) hk4))
    linarith
  have hrv : r=v*(k-1) := by
    dsimp [v]
    field_simp
  have he : (k-1)*((k-1)*v^2-(3-k))=0 := by rw [hrv] at hc; nlinarith [hc]
  have hkv : (k-1)*v^2=3-k := by
    have hh := (mul_eq_zero.mp he).resolve_left (ne_of_gt hkmin)
    linarith
  have hv2 : v^2 < 1 := by nlinarith [mul_nonneg (show 0 ≤ k-2 by linarith) (sq_nonneg v)]
  have hvlo : -1 < v := by nlinarith [sq_nonneg (v+1)]
  have hvhi : v < 1 := by nlinarith [sq_nonneg (v-1)]
  have hden : 0 < 1+v^2 := by positivity
  have hkform : k=(3+v^2)/(1+v^2) := by
    apply (eq_div_iff (ne_of_gt hden)).mpr
    nlinarith
  have hrform : r=2*v/(1+v^2) := by
    rw [hrv,hkform]
    field_simp <;> ring
  have hh := familyH_pos hvlo
  have hm : 0 < 1-v := by linarith
  have hn : 2*normalA k*(1+doubleFamilyY v)+normalB k=4*k*(k-4)*r := by
    rw [hkform,hrform]
    unfold normalA normalB doubleFamilyY
    field_simp <;> (try unfold doubleFamilyH) <;> ring
  have hz0 : (2*normalA k)*(z-(1+doubleFamilyY v))=0 := by
    linear_combination -hr-hn
  have hz : z=1+doubleFamilyY v := by
    have hh := (mul_eq_zero.mp hz0).resolve_left
      (mul_ne_zero (by norm_num) (ne_of_lt (normalA_neg hk0)))
    linarith
  refine ⟨v,hvlo,hvhi,?_,by linarith⟩
  rw [hz,hkform]
  unfold doubleFamilyX doubleFamilyY
  field_simp <;> (try unfold doubleFamilyH) <;> ring

/-- The physical negative-sign branch has a genuine parameter in the open double-arc interval. -/
theorem double_curve_normalization {a b : ℝ}
    (ha : a ∈ Set.Ioo 0 1) (hb : b ∈ Set.Ioo 0 1) (hab : a ≠ b)
    (hD : doublePolynomial (1-a) (1-b)=0) (hH : doubleSign a b < 0) :
    ∃ v : ℝ, 0 < v ∧ v < Real.sqrt 5-2 ∧
      a+b=doubleFamilyX v ∧ a*b=doubleFamilyY v := by
  let z := a*b+1
  let k := 2+(a+b)/z
  have ha0 := ha.1
  have hb0 := hb.1
  have hz : 0 < z := by dsimp [z]; positivity
  have hk0 : 2 < k := by
    dsimp [k]
    have hh : 0 < (a+b)/z := div_pos (by linarith [ha.1,hb.1]) hz
    linarith
  have hk1 : k < 3 := by
    have hprod : 0 < (1-a)*(1-b) := mul_pos (by linarith [ha.2]) (by linarith [hb.2])
    have hh : (a+b)/z < 1 := (div_lt_one hz).mpr (by dsimp [z]; nlinarith)
    dsimp [k]; linarith
  have hx : (k-2)*z=a+b := by dsimp [k]; field_simp <;> ring
  have hy : z-1=a*b := by dsimp [z]; ring
  have hF : quotientF (a+b) (a*b)=0 := by
    convert hD using 1 <;> unfold quotientF doublePolynomial <;> ring
  have hid : quotientF ((k-2)*z) (z-1)=
      z^2*(normalA k*z^2+normalB k*z-4*k^2) := by
    unfold quotientF normalA normalB; ring
  rw [hx,hy,hF] at hid
  have hg : normalA k*z^2+normalB k*z-4*k^2=0 :=
    (mul_eq_zero.mp hid.symm).resolve_left (pow_ne_zero 2 (ne_of_gt hz))
  obtain ⟨v,hvlo,hvhi,hxv,hyv⟩ := conic_reconstruction hk0 hk1 hg
  have hsum : a+b=doubleFamilyX v := hx.symm.trans hxv
  have hprod : a*b=doubleFamilyY v := hy.symm.trans hyv
  have hh := familyH_pos hvlo
  have hm : 0 < 1-v := by linarith
  have hsign : doubleSign a b =
      8*v*(v-3)*(v+1)*(v^2+3)*(3*v^2+1)/((1-v)^2*doubleFamilyH v^2) := by
    calc
      _ = -2*(a*b)^2-2*(a+b)*(a*b)-(a+b)^2-2*(a*b)+2*(a+b) := by
        unfold doubleSign; ring
      _ = _ := by
        rw [hsum,hprod]
        unfold doubleFamilyX doubleFamilyY
        field_simp <;> (try unfold doubleFamilyH) <;> ring
  have hv0 : 0 < v := by
    by_contra hn
    have hvn : v ≤ 0 := le_of_not_gt hn
    have hpair : 0 ≤ v*(v-3) := mul_nonneg_of_nonpos_of_nonpos hvn (by linarith)
    have hnum : 0 ≤ 8*v*(v-3)*(v+1)*(v^2+3)*(3*v^2+1) := by
      have hi : 8*v*(v-3)*(v+1)*(v^2+3)*(3*v^2+1)=
          8*(v*(v-3))*(v+1)*(v^2+3)*(3*v^2+1) := by ring
      rw [hi]
      have hp : 0 < v+1 := by linarith
      positivity
    have hn := div_nonneg hnum (by positivity : 0 ≤ (1-v)^2*doubleFamilyH v^2)
    rw [← hsign] at hn
    linarith
  have hδ : doubleFamilyDelta v=(a-b)^2 := by
    unfold doubleFamilyDelta
    rw [← hsum,← hprod]
    ring
  have hδpos : 0 < doubleFamilyDelta v := by rw [hδ]; exact sq_pos_of_ne_zero (sub_ne_zero.mpr hab)
  have hδform : doubleFamilyDelta v=
      16*(1+v)^3*(1+v^2)*(1-4*v-v^2)/((1-v)*doubleFamilyH v^2) := by
    unfold doubleFamilyDelta doubleFamilyX doubleFamilyY
    field_simp <;> (try unfold doubleFamilyH) <;> ring
  have hf : 0 < 1-4*v-v^2 := by
    by_contra hn
    have hnum : 16*(1+v)^3*(1+v^2)*(1-4*v-v^2) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (by positivity) (le_of_not_gt hn)
    have hquot := div_nonpos_of_nonpos_of_nonneg hnum
      (by positivity : 0 ≤ (1-v)*doubleFamilyH v^2)
    rw [← hδform] at hquot
    linarith
  have hvstar : v < Real.sqrt 5-2 := by
    have hs := Real.sq_sqrt (by norm_num : (0:ℝ) ≤ 5)
    have hs0 := Real.sqrt_nonneg (5:ℝ)
    by_contra hn
    have hbig : 0 ≤ v+2-Real.sqrt 5 := by linarith
    have hplus : 0 ≤ v+2+Real.sqrt 5 := by positivity
    nlinarith [mul_nonneg hbig hplus]
  exact ⟨v,hv0,hvstar,hsum,hprod⟩

private lemma positive_cosine_bounds {t : ℝ} (ht : t ∈ Set.Ioo 0 (Real.pi/2)) :
    1-Real.cos t ∈ Set.Ioo 0 1 := by
  have hcos := Real.cos_pos_of_mem_Ioo
    (show t ∈ Set.Ioo (-(Real.pi/2)) (Real.pi/2) by
      exact ⟨by linarith [ht.1,Real.pi_pos],ht.2⟩)
  have hsin := Real.sin_pos_of_pos_of_lt_pi ht.1
    (by linarith [ht.2,Real.pi_pos] : t < Real.pi)
  constructor
  · nlinarith [Real.cos_le_one t,Real.sin_sq_add_cos_sq t,sq_pos_of_pos hsin]
  · linarith

/-- Actual strict positive-half double pairs recover the rational parameter of their cosines. -/
theorem positive_double_normalization {p p' : ℝ × ℝ}
    (hp : closedLabels p) (hp' : closedLabels p')
    (ht : p.1 ∈ Set.Ioo 0 (Real.pi/2)) (ht' : p'.1 ∈ Set.Ioo 0 (Real.pi/2))
    (hc : Real.cos p.1 ≠ Real.cos p'.1) (h : ruledSurface p=ruledSurface p') :
    ∃! v : ℝ, 0 < v ∧ v < Real.sqrt 5-2 ∧
      (1-Real.cos p.1)+(1-Real.cos p'.1)=doubleFamilyX v ∧
      (1-Real.cos p.1)*(1-Real.cos p'.1)=doubleFamilyY v := by
  obtain ⟨hD,hH⟩ := positive_double_sign hp hp' ht ht' hc h
  have hD' : doublePolynomial (1-(1-Real.cos p.1)) (1-(1-Real.cos p'.1))=0 := by
    convert hD using 1 <;> congr 1 <;> ring
  obtain ⟨v,hv0,hv,hx,hy⟩ := double_curve_normalization (positive_cosine_bounds ht)
    (positive_cosine_bounds ht') (by intro he; apply hc; linarith) hD' hH
  refine ⟨v,⟨hv0,hv,hx,hy⟩,?_⟩
  intro w hw
  exact double_family_parameter_unique hw.1.le hw.2.1.le hv0.le hv.le
    (hw.2.2.1.symm.trans hx) (hw.2.2.2.symm.trans hy)

private lemma ruling_pair_unique {t t' u u' w w' : ℝ}
    (ha0 : 0 < 1-Real.cos t) (hb0 : 0 < 1-Real.cos t')
    (hc : Real.cos t ≠ Real.cos t')
    (h : ruledSurface (t,u)=ruledSurface (t',u'))
    (hw : ruledSurface (t,w)=ruledSurface (t',w')) : u=w ∧ u'=w' := by
  let a := 1-Real.cos t
  let b := 1-Real.cos t'
  let A := Real.sin t
  let B := Real.sin t'
  have hA : A^2=a*(2-a) := by dsimp [A,a]; nlinarith [Real.sin_sq_add_cos_sq t]
  have hB : B^2=b*(2-b) := by dsimp [B,b]; nlinarith [Real.sin_sq_add_cos_sq t']
  have hab : a ≠ b := by dsimp [a,b]; intro he; apply hc; linarith
  have hdet : a*B-b*A ≠ 0 := by
    intro he
    have hs := congrArg (fun x : ℝ => x^2) (sub_eq_zero.mp he)
    have hi : (a*B)^2-(b*A)^2=2*a*b*(a-b) := by
      simp only [mul_pow,hA,hB]
      ring
    have hz : 2*a*b*(a-b)=0 := by linarith
    exact (mul_ne_zero (mul_ne_zero (mul_ne_zero (by norm_num) (ne_of_gt ha0))
      (ne_of_gt hb0)) (sub_ne_zero.mpr hab)) hz
  have hx : a*(u-w)-b*(u'-w')=0 := by
    have h1 := congrArg Prod.fst h
    have h2 := congrArg Prod.fst hw
    change Real.cos t+2*u*a=Real.cos t'+2*u'*b at h1
    change Real.cos t+2*w*a=Real.cos t'+2*w'*b at h2
    linear_combination (h1-h2)/2
  have hy : A*(u-w)-B*(u'-w')=0 := by
    have h1 := congrArg (fun p : ℝ × ℝ × ℝ => p.2.1) h
    have h2 := congrArg (fun p : ℝ × ℝ × ℝ => p.2.1) hw
    change (1-u)*A=(1-u')*B at h1
    change (1-w)*A=(1-w')*B at h2
    linear_combination -h1+h2
  have hz : (a*B-b*A)*(u-w)=0 := by linear_combination B*hx-b*hy
  have hu : u=w := sub_eq_zero.mp ((mul_eq_zero.mp hz).resolve_left hdet)
  refine ⟨hu,?_⟩
  rw [hu] at hx
  have hb : b ≠ 0 := ne_of_gt hb0
  have he : b*(u'-w')=0 := by linarith
  exact sub_eq_zero.mp ((mul_eq_zero.mp he).resolve_left hb)

private lemma recover_pair_labels {p p' : ℝ × ℝ} {v ε η : ℝ}
    (hv0 : 0 ≤ v) (hv : v ≤ Real.sqrt 5-2)
    (ht : p.1 ∈ Set.Ioo 0 (Real.pi/2)) (ht' : p'.1 ∈ Set.Ioo 0 (Real.pi/2))
    (hc : Real.cos p.1 ≠ Real.cos p'.1) (h : ruledSurface p=ruledSurface p')
    (he : ε=1 ∨ ε= -1) (he' : η=1 ∨ η= -1)
    (ha : 1-Real.cos p.1=doubleFamilyA v ε)
    (hb : 1-Real.cos p'.1=doubleFamilyA v η) :
    p=doubleFamilyLabel v ε ∧ p'=doubleFamilyLabel v η := by
  have ht1 : p.1=(doubleFamilyLabel v ε).1 := by
    change p.1=Real.arccos (1-doubleFamilyA v ε)
    have harg : 1-doubleFamilyA v ε=Real.cos p.1 := by linarith
    rw [harg,Real.arccos_cos ht.1.le (by linarith [ht.2,Real.pi_pos])]
  have ht2 : p'.1=(doubleFamilyLabel v η).1 := by
    change p'.1=Real.arccos (1-doubleFamilyA v η)
    have harg : 1-doubleFamilyA v η=Real.cos p'.1 := by linarith
    rw [harg,Real.arccos_cos ht'.1.le (by linarith [ht'.2,Real.pi_pos])]
  have hpair : ruledSurface (p.1,(doubleFamilyLabel v ε).2)=
      ruledSurface (p'.1,(doubleFamilyLabel v η).2) := by
    rw [ht1,ht2]
    exact (double_family_image hv0 hv he).trans (double_family_image hv0 hv he').symm
  obtain ⟨hu,hu'⟩ := ruling_pair_unique (positive_cosine_bounds ht).1
    (positive_cosine_bounds ht').1 hc h hpair
  exact ⟨Prod.ext ht1 hu,Prod.ext ht2 hu'⟩

/-- Full necessity, including ruling parameters and uniqueness, in the strict positive angular half. -/
theorem positive_double_family {p p' : ℝ × ℝ}
    (hp : closedLabels p) (hp' : closedLabels p')
    (ht : p.1 ∈ Set.Ioo 0 (Real.pi/2)) (ht' : p'.1 ∈ Set.Ioo 0 (Real.pi/2))
    (hne : p ≠ p') (h : ruledSurface p=ruledSurface p') :
    ∃! v : ℝ, 0 < v ∧ v < Real.sqrt 5-2 ∧
      ((p=doubleFamilyLabel v 1 ∧ p'=doubleFamilyLabel v (-1)) ∨
       (p=doubleFamilyLabel v (-1) ∧ p'=doubleFamilyLabel v 1)) := by
  have hc : Real.cos p.1 ≠ Real.cos p'.1 := by
    intro he
    have htEq := congrArg Real.arccos he
    rw [Real.arccos_cos ht.1.le (by linarith [ht.2,Real.pi_pos]),
      Real.arccos_cos ht'.1.le (by linarith [ht'.2,Real.pi_pos])] at htEq
    have hx := congrArg Prod.fst h
    change Real.cos p.1+2*p.2*(1-Real.cos p.1)=
      Real.cos p'.1+2*p'.2*(1-Real.cos p'.1) at hx
    rw [htEq] at hx
    have hu0 : (1-Real.cos p'.1)*(p.2-p'.2)=0 := by linear_combination hx/2
    have hu := sub_eq_zero.mp ((mul_eq_zero.mp hu0).resolve_left
      (ne_of_gt (positive_cosine_bounds ht').1))
    exact hne (Prod.ext htEq hu)
  obtain ⟨v,⟨hv0,hv,hx,hy⟩,hunique⟩ := positive_double_normalization hp hp' ht ht' hc h
  have hpair : (p=doubleFamilyLabel v 1 ∧ p'=doubleFamilyLabel v (-1)) ∨
      (p=doubleFamilyLabel v (-1) ∧ p'=doubleFamilyLabel v 1) := by
    rcases double_family_roots hx hy with ⟨ha,hb⟩ | ⟨ha,hb⟩
    · exact Or.inl (recover_pair_labels (ε := 1) (η := -1) hv0.le hv.le ht ht' hc h
        (Or.inl rfl) (Or.inr rfl) ha hb)
    · exact Or.inr (recover_pair_labels (ε := -1) (η := 1) hv0.le hv.le ht ht' hc h
        (Or.inr rfl) (Or.inl rfl) ha hb)
  refine ⟨v,⟨hv0,hv,hpair⟩,?_⟩
  intro w hw
  apply hunique w
  have hsum := (double_family_sum_product hw.1.le hw.2.1.le).1
  have hprod := (double_family_sum_product hw.1.le hw.2.1.le).2
  have hcos1 := double_family_cosine (ε := (1:ℝ)) hw.1.le hw.2.1.le (Or.inl rfl)
  have hcos2 := double_family_cosine (ε := (-1:ℝ)) hw.1.le hw.2.1.le (Or.inr rfl)
  refine ⟨hw.1,hw.2.1,?_⟩
  rcases hw.2.2 with ⟨hpw,hp'w⟩ | ⟨hpw,hp'w⟩
  · rw [hpw,hp'w,hcos1,hcos2]
    constructor <;> nlinarith
  · rw [hpw,hp'w,hcos2,hcos1]
    constructor <;> nlinarith

/-- The same unique-parameter converse for the strict negative angular half. -/
theorem negative_double_family {p p' : ℝ × ℝ}
    (hp : closedLabels p) (hp' : closedLabels p')
    (ht : p.1 ∈ Set.Ioo (-(Real.pi/2)) 0) (ht' : p'.1 ∈ Set.Ioo (-(Real.pi/2)) 0)
    (hne : p ≠ p') (h : ruledSurface p=ruledSurface p') :
    ∃! v : ℝ, 0 < v ∧ v < Real.sqrt 5-2 ∧
      ((p=(-(doubleFamilyLabel v 1).1,(doubleFamilyLabel v 1).2) ∧
        p'=(-(doubleFamilyLabel v (-1)).1,(doubleFamilyLabel v (-1)).2)) ∨
       (p=(-(doubleFamilyLabel v (-1)).1,(doubleFamilyLabel v (-1)).2) ∧
        p'=(-(doubleFamilyLabel v 1).1,(doubleFamilyLabel v 1).2))) := by
  let r : ℝ × ℝ := (-p.1,p.2)
  let s : ℝ × ℝ := (-p'.1,p'.2)
  have hr : closedLabels r :=
    ⟨⟨by dsimp [r]; linarith [hp.1.2],by dsimp [r]; linarith [hp.1.1]⟩,hp.2⟩
  have hs : closedLabels s :=
    ⟨⟨by dsimp [s]; linarith [hp'.1.2],by dsimp [s]; linarith [hp'.1.1]⟩,hp'.2⟩
  have hrt : r.1 ∈ Set.Ioo 0 (Real.pi/2) := by dsimp [r]; constructor <;> linarith [ht.1,ht.2]
  have hst : s.1 ∈ Set.Ioo 0 (Real.pi/2) := by dsimp [s]; constructor <;> linarith [ht'.1,ht'.2]
  have hne' : r ≠ s := by
    intro he
    apply hne
    have hh := congrArg (fun x : ℝ × ℝ => (-x.1,x.2)) he
    simpa only [r,s,neg_neg] using hh
  have himage : ruledSurface r=ruledSurface s := by
    dsimp [r,s]
    rw [surface_mirror,surface_mirror,h]
  obtain ⟨v,hv,hunique⟩ := positive_double_family hr hs hrt hst hne' himage
  have flip {x y : ℝ × ℝ} (he : (-x.1,x.2)=y) : x=(-y.1,y.2) := by
    have hh := congrArg (fun z : ℝ × ℝ => (-z.1,z.2)) he
    simpa only [neg_neg] using hh
  have back {x y : ℝ × ℝ} (he : x=(-y.1,y.2)) : (-x.1,x.2)=y := by
    have hh := congrArg (fun z : ℝ × ℝ => (-z.1,z.2)) he
    simpa only [neg_neg] using hh
  refine ⟨v,⟨hv.1,hv.2.1,?_⟩,?_⟩
  · rcases hv.2.2 with ⟨h1,h2⟩ | ⟨h1,h2⟩
    · exact Or.inl ⟨flip h1,flip h2⟩
    · exact Or.inr ⟨flip h1,flip h2⟩
  · intro w hw
    apply hunique w
    refine ⟨hw.1,hw.2.1,?_⟩
    rcases hw.2.2 with ⟨h1,h2⟩ | ⟨h1,h2⟩
    · exact Or.inl ⟨back h1,back h2⟩
    · exact Or.inr ⟨back h1,back h2⟩

end
end RuledV5
