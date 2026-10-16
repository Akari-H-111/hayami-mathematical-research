import RuledV5.SelfIntersection

namespace RuledV5
noncomputable section
open StokesV5

/-- Rational normalization of the unordered double-label curve. -/
def doubleFamilyH (v : ℝ) : ℝ := v^3+7*v^2+3*v+5
def doubleFamilyX (v : ℝ) : ℝ := 2*(1+v)*(3+v^2)/doubleFamilyH v
def doubleFamilyY (v : ℝ) : ℝ :=
  (1+v)^2*(1+3*v^2)/((1-v)*doubleFamilyH v)
def doubleFamilyL (v : ℝ) : ℝ := (1+v)*(1+3*v^2)/doubleFamilyH v
def doubleFamilyDelta (v : ℝ) : ℝ := doubleFamilyX v ^ 2-4*doubleFamilyY v
def doubleFamilyA (v ε : ℝ) : ℝ :=
  (doubleFamilyX v+ε*Real.sqrt (doubleFamilyDelta v))/2
def doubleFamilyLabel (v ε : ℝ) : ℝ × ℝ :=
  (Real.arccos (1-doubleFamilyA v ε),
    (doubleFamilyA v ε-doubleFamilyL v)/(2*doubleFamilyA v ε))
/-- The actual image formula in section 1 of the proof note. -/
def doubleFamilyImage (v : ℝ) : ℝ × ℝ × ℝ :=
  (1-doubleFamilyL v,
    (3-v)*Real.sqrt ((1+v)*(1+v^2)*(1+3*v^2))/
      (doubleFamilyH v*Real.sqrt (1-v)),
    2*Real.sqrt 2*v*Real.sqrt ((1+v)*(v^2+3))/
      (doubleFamilyH v*Real.sqrt (1-v)))

private def familyYsq (v : ℝ) : ℝ :=
  (3-v)^2*(1+v)*(1+v^2)*(1+3*v^2)/((1-v)*doubleFamilyH v^2)
private def familyZsq (v : ℝ) : ℝ :=
  8*v^2*(1+v)*(v^2+3)/((1-v)*doubleFamilyH v^2)

private lemma family_bounds {v : ℝ} (hv0 : 0 ≤ v) (hv : v ≤ Real.sqrt 5-2) :
    v < 1/4 ∧ 0 < 1-v ∧ 0 < doubleFamilyH v ∧ 0 ≤ 1-4*v-v^2 := by
  have hs := Real.sq_sqrt (by norm_num : (0:ℝ) ≤ 5)
  have hs0 := Real.sqrt_nonneg (5:ℝ)
  have hq : v < 1/4 := by nlinarith
  have hm : 0 ≤ Real.sqrt 5-(v+2) := by linarith
  have hp : 0 ≤ Real.sqrt 5+(v+2) := by positivity
  refine ⟨hq, by linarith, ?_, ?_⟩
  · unfold doubleFamilyH; positivity
  · nlinarith [mul_nonneg hm hp]

private lemma family_identities {v : ℝ} (h0 : doubleFamilyH v ≠ 0) (h1 : 1-v ≠ 0) :
    doubleFamilyDelta v =
      16*(1+v)^3*(1+v^2)*(1-4*v-v^2)/((1-v)*doubleFamilyH v^2) ∧
    1-doubleFamilyX v+doubleFamilyY v = 4*v^2*(v^2+3)/((1-v)*doubleFamilyH v) ∧
    2-doubleFamilyX v = 4*(3*v^2+1)/doubleFamilyH v ∧
    doubleFamilyY v-doubleFamilyL v*doubleFamilyX v+doubleFamilyL v^2 =
      8*v*(v+1)^3*(3*v^2+1)/((1-v)*doubleFamilyH v^2) ∧
    doubleFamilyX v-2*doubleFamilyL v = 4*(1-v)*(v+1)^2/doubleFamilyH v := by
  unfold doubleFamilyDelta doubleFamilyX doubleFamilyY doubleFamilyL
  refine ⟨?_, ?_, ?_, ?_, ?_⟩ <;> field_simp <;> (try unfold doubleFamilyH) <;> ring

private lemma family_data {v : ℝ} (hv0 : 0 ≤ v) (hv : v ≤ Real.sqrt 5-2) :
    0 < doubleFamilyX v ∧ 0 < doubleFamilyY v ∧ 0 < doubleFamilyL v ∧
    doubleFamilyX v < 2 ∧ 0 ≤ doubleFamilyDelta v ∧
    0 ≤ 1-doubleFamilyX v+doubleFamilyY v ∧
    0 ≤ doubleFamilyY v-doubleFamilyL v*doubleFamilyX v+doubleFamilyL v^2 ∧
    0 < doubleFamilyX v-2*doubleFamilyL v := by
  obtain ⟨hvq,hm,hh,hd⟩ := family_bounds hv0 hv
  obtain ⟨hδ,hxy,hx,hL,hxL⟩ := family_identities (ne_of_gt hh) (ne_of_gt hm)
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · unfold doubleFamilyX; positivity
  · unfold doubleFamilyY; positivity
  · unfold doubleFamilyL; positivity
  · have : 0 < 2-doubleFamilyX v := by rw [hx]; positivity
    linarith
  · rw [hδ]; positivity
  · rw [hxy]; positivity
  · rw [hL]; positivity
  · rw [hxL]; positivity

private lemma family_root {v ε : ℝ} (hv0 : 0 ≤ v) (hv : v ≤ Real.sqrt 5-2)
    (he : ε=1 ∨ ε= -1) :
    doubleFamilyA v ε ^ 2-doubleFamilyX v*doubleFamilyA v ε+doubleFamilyY v=0 := by
  have hd := (family_data hv0 hv).2.2.2.2.1
  have hs := Real.sq_sqrt hd
  change Real.sqrt (doubleFamilyDelta v)^2=doubleFamilyX v^2-4*doubleFamilyY v at hs
  rcases he with rfl | rfl <;> unfold doubleFamilyA <;> nlinarith

private lemma root_bounds {x y L a : ℝ} (hx : 0 < x) (hy : 0 < y)
    (hx2 : x < 2) (hxy : 0 ≤ 1-x+y)
    (hprod : 0 ≤ y-L*x+L^2) (hxL : 0 < x-2*L)
    (ha : a^2-x*a+y=0) : 0 < a ∧ a ≤ 1 ∧ L ≤ a := by
  have ha0 : 0 < a := by
    by_contra hn
    have hn' : a ≤ 0 := le_of_not_gt hn
    nlinarith [mul_nonpos_of_nonneg_of_nonpos hx.le hn', sq_nonneg a]
  refine ⟨ha0, ?_, ?_⟩
  · by_contra hn
    have hp : 0 < (a-1)*(a+1-x) := mul_pos (by linarith) (by linarith)
    nlinarith
  · by_contra hn
    have hp : 0 < (L-a)*(x-a-L) := mul_pos (by linarith) (by linarith)
    nlinarith

private lemma family_root_bounds {v ε : ℝ} (hv0 : 0 ≤ v) (hv : v ≤ Real.sqrt 5-2)
    (he : ε=1 ∨ ε= -1) :
    0 < doubleFamilyA v ε ∧ doubleFamilyA v ε ≤ 1 ∧
      doubleFamilyL v ≤ doubleFamilyA v ε := by
  obtain ⟨hx,hy,_,hx2,_,hxy,hprod,hxL⟩ := family_data hv0 hv
  exact root_bounds hx hy hx2 hxy hprod hxL (family_root hv0 hv he)

theorem double_family_cosine {v ε : ℝ} (hv0 : 0 ≤ v) (hv : v ≤ Real.sqrt 5-2)
    (he : ε=1 ∨ ε= -1) :
    Real.cos (doubleFamilyLabel v ε).1=1-doubleFamilyA v ε := by
  obtain ⟨ha0,ha1,_⟩ := family_root_bounds hv0 hv he
  exact Real.cos_arccos (by linarith) (by linarith)

theorem double_family_sum_product {v : ℝ} (hv0 : 0 ≤ v) (hv : v ≤ Real.sqrt 5-2) :
    doubleFamilyA v 1+doubleFamilyA v (-1)=doubleFamilyX v ∧
      doubleFamilyA v 1*doubleFamilyA v (-1)=doubleFamilyY v := by
  have hs := Real.sq_sqrt (family_data hv0 hv).2.2.2.2.1
  change Real.sqrt (doubleFamilyDelta v)^2=doubleFamilyX v^2-4*doubleFamilyY v at hs
  constructor <;> unfold doubleFamilyA <;> nlinarith

/-- Physical membership includes the coincident cross-cap limit. -/
theorem double_family_physical {v ε : ℝ} (hv0 : 0 ≤ v) (hv : v ≤ Real.sqrt 5-2)
    (he : ε=1 ∨ ε= -1) : closedLabels (doubleFamilyLabel v ε) := by
  obtain ⟨ha0,ha1,hLa⟩ := family_root_bounds hv0 hv he
  have hL := (family_data hv0 hv).2.2.1
  unfold closedLabels doubleFamilyLabel
  refine ⟨⟨?_, Real.arccos_le_pi_div_two.mpr (by linarith)⟩, ?_, ?_⟩
  · linarith [Real.arccos_nonneg (1-doubleFamilyA v ε), Real.pi_pos]
  · exact div_nonneg (by linarith) (by positivity)
  · apply (div_le_iff₀ (by positivity : 0 < 2*doubleFamilyA v ε)).mpr
    linarith

private lemma family_remainders {v : ℝ} (h0 : doubleFamilyH v ≠ 0) (h1 : 1-v ≠ 0) :
    2*doubleFamilyL v^2+2*doubleFamilyL v*doubleFamilyY v+
      doubleFamilyX v*doubleFamilyY v-2*doubleFamilyY v=0 ∧
    -doubleFamilyL v^2-2*doubleFamilyL v*doubleFamilyX v+4*doubleFamilyL v-
      4*familyYsq v-doubleFamilyX v^2+2*doubleFamilyX v+doubleFamilyY v=0 ∧
    doubleFamilyL v^2*doubleFamilyY v+doubleFamilyL v^2-
      2*doubleFamilyL v*doubleFamilyX v*doubleFamilyY v+4*familyZsq v*doubleFamilyY v+
      doubleFamilyX v^2*doubleFamilyY v-doubleFamilyY v^2-doubleFamilyY v=0 ∧
    -doubleFamilyL v^2*doubleFamilyX v+2*doubleFamilyL v*doubleFamilyX v^2-
      2*doubleFamilyL v*doubleFamilyY v-2*doubleFamilyL v-4*familyZsq v*doubleFamilyX v-
      doubleFamilyX v^3+2*doubleFamilyX v*doubleFamilyY v+doubleFamilyX v=0 := by
  unfold doubleFamilyL doubleFamilyX doubleFamilyY familyYsq familyZsq
  refine ⟨?_, ?_, ?_, ?_⟩ <;> field_simp <;> (try unfold doubleFamilyH) <;> ring

private lemma family_coordinate_equations {v a : ℝ}
    (h0 : doubleFamilyH v ≠ 0) (h1 : 1-v ≠ 0)
    (ha : a^2-doubleFamilyX v*a+doubleFamilyY v=0) :
    (a+doubleFamilyL v)^2*(2-a)=4*familyYsq v*a ∧
    (a-doubleFamilyL v)^2*(1-a^2)=4*familyZsq v*a^2 := by
  obtain ⟨hf0,hf1,hg0,hg1⟩ := family_remainders h0 h1
  constructor
  · linear_combination (-2*doubleFamilyL v-a-doubleFamilyX v+2)*ha+hf0+a*hf1
  · linear_combination
      (-doubleFamilyL v^2+2*doubleFamilyL v*doubleFamilyX v-4*familyZsq v-a^2+
        a*(2*doubleFamilyL v-doubleFamilyX v)-doubleFamilyX v^2+doubleFamilyY v+1)*ha+
      hg0+a*hg1

private lemma family_image_squares {v : ℝ} (hv0 : 0 ≤ v) (hv : v ≤ Real.sqrt 5-2) :
    0 ≤ (doubleFamilyImage v).2.1 ∧ 0 ≤ (doubleFamilyImage v).2.2 ∧
    (doubleFamilyImage v).2.1^2=familyYsq v ∧
    (doubleFamilyImage v).2.2^2=familyZsq v := by
  obtain ⟨hvq,hm,hh,_⟩ := family_bounds hv0 hv
  have h3 : 0 < 3-v := by linarith
  have hA : 0 ≤ (1+v)*(1+v^2)*(1+3*v^2) := by positivity
  have hB : 0 ≤ (1+v)*(v^2+3) := by positivity
  refine ⟨?_, ?_, ?_, ?_⟩
  · dsimp [doubleFamilyImage]; positivity
  · dsimp [doubleFamilyImage]; positivity
  · dsimp [doubleFamilyImage, familyYsq]
    simp only [div_pow, mul_pow, Real.sq_sqrt hA, Real.sq_sqrt hm.le]
    ring
  · dsimp [doubleFamilyImage, familyZsq]
    simp only [div_pow, mul_pow, Real.sq_sqrt hB, Real.sq_sqrt hm.le,
      Real.sq_sqrt (by norm_num : (0:ℝ) ≤ 2)]
    ring

/-- Every root label, including the coalescent endpoint, has the displayed actual image. -/
theorem double_family_image {v ε : ℝ} (hv0 : 0 ≤ v) (hv : v ≤ Real.sqrt 5-2)
    (he : ε=1 ∨ ε= -1) :
    ruledSurface (doubleFamilyLabel v ε)=doubleFamilyImage v := by
  let a := doubleFamilyA v ε
  let t := Real.arccos (1-a)
  let u := (a-doubleFamilyL v)/(2*a)
  obtain ⟨ha0,ha1,_⟩ := family_root_bounds hv0 hv he
  change 0 < a at ha0
  change a ≤ 1 at ha1
  have hp := double_family_physical hv0 hv he
  change closedLabels (t,u) at hp
  have hu0 := hp.2.1
  have hu1 := hp.2.2
  have hc : Real.cos t=1-a := Real.cos_arccos (by linarith) (by linarith)
  have hs : Real.sin t^2=a*(2-a) := by nlinarith [Real.sin_sq_add_cos_sq t]
  have hq : qChart t^2=1-a^2 := by
    unfold qChart qSq
    rw [hc, Real.sq_sqrt (mul_nonneg (by linarith : 0 ≤ 1-a) (by linarith))]
    ring
  obtain ⟨_,hm,hh,_⟩ := family_bounds hv0 hv
  obtain ⟨hY,hZ⟩ := family_coordinate_equations (ne_of_gt hh) (ne_of_gt hm)
    (family_root hv0 hv he)
  change (a+doubleFamilyL v)^2*(2-a)=4*familyYsq v*a at hY
  change (a-doubleFamilyL v)^2*(1-a^2)=4*familyZsq v*a^2 at hZ
  obtain ⟨hiy,hiz,hsY,hsZ⟩ := family_image_squares hv0 hv
  change ruledSurface (t,u)=doubleFamilyImage v
  apply Prod.ext
  · change Real.cos t+2*u*(1-Real.cos t)=1-doubleFamilyL v
    rw [hc]
    dsimp [u]
    field_simp
    ring
  · apply Prod.ext
    · change (1-u)*Real.sin t=(doubleFamilyImage v).2.1
      have hn : 0 ≤ (1-u)*Real.sin t :=
        mul_nonneg (by linarith) (by dsimp [t]; rw [Real.sin_arccos]; positivity)
      apply (sq_eq_sq₀ hn hiy).mp
      have heq : 4*a*((1-u)*Real.sin t)^2=(a+doubleFamilyL v)^2*(2-a) := by
        simp only [mul_pow,hs]
        dsimp [u]
        field_simp
        ring
      rw [hY, ← hsY] at heq
      nlinarith
    · change u*qChart t=(doubleFamilyImage v).2.2
      have hn : 0 ≤ u*qChart t := mul_nonneg hu0 (Real.sqrt_nonneg _)
      apply (sq_eq_sq₀ hn hiz).mp
      have heq : 4*a^2*(u*qChart t)^2=(a-doubleFamilyL v)^2*(1-a^2) := by
        simp only [mul_pow,hq]
        dsimp [u]
        field_simp
        ring
      rw [hZ, ← hsZ] at heq
      nlinarith [sq_pos_of_pos ha0]

/-- The two labels are distinct before their cross-cap limit. -/
theorem double_family_distinct {v : ℝ} (hv0 : 0 ≤ v) (hv : v < Real.sqrt 5-2) :
    doubleFamilyLabel v 1 ≠ doubleFamilyLabel v (-1) := by
  obtain ⟨_,hm,hh,_⟩ := family_bounds hv0 hv.le
  have hs := Real.sq_sqrt (by norm_num : (0:ℝ) ≤ 5)
  have hplus : 0 < Real.sqrt 5+(v+2) := by positivity
  have hminus : 0 < Real.sqrt 5-(v+2) := by linarith
  have hd : 0 < 1-4*v-v^2 := by nlinarith [mul_pos hminus hplus]
  have hδ : 0 < doubleFamilyDelta v := by
    rw [(family_identities (ne_of_gt hh) (ne_of_gt hm)).1]
    positivity
  have hroot := Real.sqrt_pos.mpr hδ
  obtain ⟨ha0,ha1,_⟩ := family_root_bounds (ε := (1:ℝ)) hv0 hv.le (Or.inl rfl)
  obtain ⟨hb0,hb1,_⟩ := family_root_bounds (ε := (-1:ℝ)) hv0 hv.le (Or.inr rfl)
  intro heq
  have hc := congrArg (fun p : ℝ × ℝ => Real.cos p.1) heq
  change Real.cos (Real.arccos (1-doubleFamilyA v 1))=
    Real.cos (Real.arccos (1-doubleFamilyA v (-1))) at hc
  rw [Real.cos_arccos (by linarith) (by linarith),
    Real.cos_arccos (by linarith) (by linarith)] at hc
  unfold doubleFamilyA at hc
  nlinarith

/-- Sufficiency on the complete parameter interval, including its physical boundary crossing. -/
theorem double_family_sufficient {v : ℝ} (hv0 : 0 ≤ v) (hv : v < Real.sqrt 5-2) :
    closedLabels (doubleFamilyLabel v 1) ∧ closedLabels (doubleFamilyLabel v (-1)) ∧
    doubleFamilyLabel v 1 ≠ doubleFamilyLabel v (-1) ∧
    ruledSurface (doubleFamilyLabel v 1)=doubleFamilyImage v ∧
    ruledSurface (doubleFamilyLabel v (-1))=doubleFamilyImage v := by
  exact ⟨double_family_physical hv0 hv.le (Or.inl rfl),
    double_family_physical hv0 hv.le (Or.inr rfl), double_family_distinct hv0 hv,
    double_family_image hv0 hv.le (Or.inl rfl), double_family_image hv0 hv.le (Or.inr rfl)⟩

/-- The reflected pair is physical, distinct, and has the displayed negative-half image. -/
theorem double_family_mirror_sufficient {v : ℝ} (hv0 : 0 ≤ v) (hv : v < Real.sqrt 5-2) :
    let p := doubleFamilyLabel v 1
    let q := doubleFamilyLabel v (-1)
    let I := doubleFamilyImage v
    closedLabels (-p.1,p.2) ∧ closedLabels (-q.1,q.2) ∧
    (-p.1,p.2) ≠ (-q.1,q.2) ∧
    ruledSurface (-p.1,p.2)=(I.1,-I.2.1,I.2.2) ∧
    ruledSurface (-q.1,q.2)=(I.1,-I.2.1,I.2.2) := by
  obtain ⟨hp,hq,hne,hpI,hqI⟩ := double_family_sufficient hv0 hv
  dsimp only
  refine ⟨⟨⟨by linarith [hp.1.2], by linarith [hp.1.1]⟩,hp.2⟩,
    ⟨⟨by linarith [hq.1.2], by linarith [hq.1.1]⟩,hq.2⟩, ?_, ?_, ?_⟩
  · intro heq
    apply hne
    have hh := congrArg (fun r : ℝ × ℝ => (-r.1,r.2)) heq
    simpa only [neg_neg] using hh
  · rw [surface_mirror, hpI]
  · rw [surface_mirror, hqI]

end
end RuledV5
