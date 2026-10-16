import Bicomplex.RomanSurface
import StokesV5.PaperGeometry
import Mathlib.Analysis.Calculus.Deriv.Prod

namespace Bicomplex
noncomputable section

/-- The paper's normalized chart at p=(0,a,b), eta=(0,b,-a), xi=(-1,0,0). -/
def romanNormalizedChart (a b s t : ℝ) : ℝ × ℝ × ℝ :=
  StokesV5.normalize3 (-s,a+t*b,b-t*a)

theorem roman_normalized_chart_formula {a b : ℝ} (ha : a^2 = 1/2) (hb : b^2 = 1/2)
    (s t : ℝ) : romanSurface (romanNormalizedChart a b s t) =
      ((a+t*b)*(b-t*a)/(1+s^2+t^2), -s*(b-t*a)/(1+s^2+t^2),
        -s*(a+t*b)/(1+s^2+t^2)) := by
  have hs : (-s)^2+(a+t*b)^2+(b-t*a)^2 = 1+s^2+t^2 := by
    calc
      _ = (a^2+b^2)*(1+t^2)+s^2 := by ring
      _ = _ := by rw [ha,hb]; ring
  have hn : StokesV5.norm3 (-s,a+t*b,b-t*a)^2 = 1+s^2+t^2 := by
    dsimp [StokesV5.norm3]
    rw [hs, Real.sq_sqrt (by positivity)]
  simp only [romanSurface, romanNormalizedChart, StokesV5.normalize3, div_mul_div_comm,
    ← pow_two, hn]
  ext <;> ring

theorem roman_normalized_chart_frame {a b : ℝ} (ha : a^2 = 1/2) (hb : b^2 = 1/2)
    (s t : ℝ) :
    StokesV5.cross3 (0,a,b) (0,b,-a) = (-1,0,0) ∧
    romanNormalizedChart a b s t = StokesV5.normalize3
      ((0,a,b) + s • StokesV5.cross3 (0,a,b) (0,b,-a) + t • (0,b,-a)) := by
  have he : StokesV5.cross3 (0,a,b) (0,b,-a) = (-1,0,0) := by
    ext <;> simp [StokesV5.cross3] <;> nlinarith
  refine ⟨he,?_⟩
  rw [he]
  congr 1
  ext <;> simp [romanNormalizedChart] <;> ring

theorem roman_chart_s_derivative {a b : ℝ} (ha : a^2 = 1/2) (hb : b^2 = 1/2) (t : ℝ) :
    HasDerivAt (fun s => romanSurface (romanNormalizedChart a b s t))
      (0, -(b-t*a)/(1+t^2), -(a+t*b)/(1+t^2)) 0 := by
  simp_rw [roman_normalized_chart_formula ha hb]
  have hd := ((hasDerivAt_const (0 : ℝ) (1 : ℝ)).add ((hasDerivAt_id (0 : ℝ)).pow 2)).add_const (t^2)
  have hn : 1+(0 : ℝ)^2+t^2 ≠ 0 := by positivity
  have h0 := (hasDerivAt_const (0 : ℝ) ((a+t*b)*(b-t*a))).div hd hn
  have h1 := (((hasDerivAt_id (0 : ℝ)).neg).mul_const (b-t*a)).div hd hn
  have h2 := (((hasDerivAt_id (0 : ℝ)).neg).mul_const (a+t*b)).div hd hn
  apply (h0.prodMk (h1.prodMk h2)).congr_deriv
  dsimp
  ext <;> simp <;> field_simp <;> ring

theorem roman_chart_st_derivative {a b : ℝ} (ha : a^2 = 1/2) (hb : b^2 = 1/2) :
    HasDerivAt (fun t => deriv (fun s => romanSurface (romanNormalizedChart a b s t)) 0)
      (0,a,-b) 0 := by
  simp_rw [(roman_chart_s_derivative ha hb _).deriv]
  have hd := (hasDerivAt_const (0 : ℝ) (1 : ℝ)).add ((hasDerivAt_id (0 : ℝ)).pow 2)
  have h1 := (((hasDerivAt_const (0 : ℝ) b).sub
    ((hasDerivAt_id (0 : ℝ)).mul_const a)).neg).div hd (by norm_num)
  have h2 := (((hasDerivAt_const (0 : ℝ) a).add
    ((hasDerivAt_id (0 : ℝ)).mul_const b)).neg).div hd (by norm_num)
  simpa using (hasDerivAt_const (0 : ℝ) (0 : ℝ)).prodMk (h1.prodMk h2)

private theorem roman_chart_t_derivative {a b : ℝ} (ha : a^2 = 1/2) (hb : b^2 = 1/2)
    (t : ℝ) : HasDerivAt (fun t => romanSurface (romanNormalizedChart a b 0 t))
      (-4*a*b*t/(1+t^2)^2,0,0) t := by
  simp_rw [roman_normalized_chart_formula ha hb]
  simp only [zero_pow (by norm_num : (2 : ℕ) ≠ 0), add_zero, neg_zero, zero_mul, zero_div]
  have hd := (hasDerivAt_const t (1 : ℝ)).add ((hasDerivAt_id t).pow 2)
  have hn : 1+t^2 ≠ 0 := by positivity
  have h := (((hasDerivAt_const t a).add ((hasDerivAt_id t).mul_const b)).mul
    ((hasDerivAt_const t b).sub ((hasDerivAt_id t).mul_const a))).div hd hn
  have h' : HasDerivAt (fun t => (a+t*b)*(b-t*a)/(1+t^2)) (-4*a*b*t/(1+t^2)^2) t := by
    apply h.congr_deriv
    dsimp
    field_simp [hn]
    ring_nf
    rw [ha,hb]
    ring
  exact h'.prodMk ((hasDerivAt_const t (0 : ℝ)).prodMk (hasDerivAt_const t (0 : ℝ)))

theorem roman_chart_tt_derivative {a b : ℝ} (ha : a^2 = 1/2) (hb : b^2 = 1/2) :
    HasDerivAt (fun t => deriv (fun t => romanSurface (romanNormalizedChart a b 0 t)) t)
      (-4*a*b,0,0) 0 := by
  simp_rw [(roman_chart_t_derivative ha hb _).deriv]
  have hd := ((hasDerivAt_const (0 : ℝ) (1 : ℝ)).add ((hasDerivAt_id (0 : ℝ)).pow 2)).pow 2
  have h := ((hasDerivAt_const (0 : ℝ) (-4*a*b)).mul (hasDerivAt_id (0 : ℝ))).div hd (by norm_num)
  simpa using h.prodMk ((hasDerivAt_const (0 : ℝ) (0 : ℝ)).prodMk (hasDerivAt_const (0 : ℝ) (0 : ℝ)))

/-- Four signed representatives in the actual normalized chart, with Euclidean norm. -/
theorem roman_normalized_whitney_jets {a b : ℝ} (ha : a^2 = 1/2) (hb : b^2 = 1/2) :
    let fs := deriv (fun s => romanSurface (romanNormalizedChart a b s 0)) 0
    let ft := deriv (fun t => romanSurface (romanNormalizedChart a b 0 t)) 0
    let fst := deriv (fun t => deriv (fun s => romanSurface (romanNormalizedChart a b s t)) 0) 0
    let ftt := deriv (fun t => deriv (fun t => romanSurface (romanNormalizedChart a b 0 t)) t) 0
    ft = 0 ∧ StokesV5.norm3 fs = 1 ∧
      (Matrix.det !![fs.1,fst.1,ftt.1; fs.2.1,fst.2.1,ftt.2.1;
        fs.2.2,fst.2.2,ftt.2.2] = 2 ∨
       Matrix.det !![fs.1,fst.1,ftt.1; fs.2.1,fst.2.1,ftt.2.1;
        fs.2.2,fst.2.2,ftt.2.2] = -2) := by
  dsimp only
  rw [(roman_chart_s_derivative ha hb 0).deriv, (roman_chart_t_derivative ha hb 0).deriv,
    (roman_chart_st_derivative ha hb).deriv, (roman_chart_tt_derivative ha hb).deriv]
  simp only [mul_zero, zero_mul, sub_zero, add_zero, zero_pow (by norm_num : (2 : ℕ) ≠ 0),
    zero_div, one_pow, div_one]
  refine ⟨rfl,?_,?_⟩
  · norm_num [StokesV5.norm3,ha,hb]
  have hdet : Matrix.det !![0,0,-4*a*b; -b,a,0; -a,-b,0] = -4*a*b := by
    calc
      _ = -4*a*b*(a^2+b^2) := by simp [Matrix.det_fin_three]; ring
      _ = _ := by rw [ha,hb]; ring
  rw [hdet]
  have hab : (4*a*b)^2 = 4 := by
    calc
      _ = 16*a^2*b^2 := by ring
      _ = 4 := by rw [ha,hb]; norm_num
  have he : 4*a*b = 2 ∨ 4*a*b = -2 := (sq_eq_sq_iff_eq_or_eq_neg).mp (by nlinarith : (4*a*b)^2 = (2 : ℝ)^2)
  rcases he with he | he <;> simp_all <;> nlinarith

def romanRotate (v : ℝ × ℝ × ℝ) : ℝ × ℝ × ℝ := (v.2.2,v.1,v.2.1)

def romanRotatePower (k : Fin 3) (v : ℝ × ℝ × ℝ) : ℝ × ℝ × ℝ :=
  if k = 0 then v else if k = 1 then romanRotate v else romanRotate (romanRotate v)

private lemma roman_rotate_derivative {f : ℝ → ℝ × ℝ × ℝ} {v : ℝ × ℝ × ℝ} {x : ℝ}
    (h : HasDerivAt f v x) : HasDerivAt (fun x => romanRotate (f x)) (romanRotate v) x :=
  h.snd.snd.prodMk (h.fst.prodMk h.snd.fst)

private lemma roman_rotate_power_derivative {f : ℝ → ℝ × ℝ × ℝ} {v : ℝ × ℝ × ℝ} {x : ℝ}
    (k : Fin 3) (h : HasDerivAt f v x) :
    HasDerivAt (fun x => romanRotatePower k (f x)) (romanRotatePower k v) x := by
  fin_cases k <;> simp +decide only [romanRotatePower, Fin.isValue, ite_true, ite_false]
  · exact h
  · exact roman_rotate_derivative h
  · exact roman_rotate_derivative (roman_rotate_derivative h)

theorem roman_rotation_symmetry (k : Fin 3) (v : ℝ × ℝ × ℝ) :
    romanSurface (romanRotatePower k v) = romanRotatePower k (romanSurface v) ∧
    StokesV5.norm3 (romanRotatePower k v) = StokesV5.norm3 v := by
  fin_cases k <;> simp +decide [romanRotatePower,romanRotate,romanSurface,StokesV5.norm3]
  all_goals congr 1 <;> ring

theorem roman_all_chart_frames (k : Fin 3) {a b : ℝ} (ha : a^2 = 1/2) (hb : b^2 = 1/2)
    (s t : ℝ) :
    romanRotatePower k (romanNormalizedChart a b s t) =
      StokesV5.normalize3 (romanRotatePower k (0,a,b) +
        s • StokesV5.cross3 (romanRotatePower k (0,a,b)) (romanRotatePower k (0,b,-a)) +
        t • romanRotatePower k (0,b,-a)) := by
  have hsum : a^2+b^2 = 1 := by linarith
  have ha4 : a^4 = 1/4 := by rw [show a^4 = (a^2)^2 by ring, ha]; norm_num
  have hb4 : b^4 = 1/4 := by rw [show b^4 = (b^2)^2 by ring, hb]; norm_num
  fin_cases k <;> simp +decide [romanRotatePower,romanRotate,romanNormalizedChart,
    StokesV5.normalize3,StokesV5.cross3,StokesV5.norm3]
  all_goals ring_nf <;> norm_num [ha,hb,ha4,hb4] <;> ring_nf <;> simp

/-- Every sphere singularity is covered by the three cyclic charts and four sign choices. -/
theorem roman_singular_chart_parameters {p : ℝ × ℝ × ℝ} (hp : p ∈ romanSingularPoints) :
    ∃ (k : Fin 3) (a b : ℝ), a^2 = 1/2 ∧ b^2 = 1/2 ∧ p = romanRotatePower k (0,a,b) := by
  rcases p with ⟨x,y,z⟩
  rcases hp with ⟨hx,hy,hz⟩ | ⟨hy,hx,hz⟩ | ⟨hz,hx,hy⟩
  · dsimp only at hx hy hz
    exact ⟨0,y,z,hy,hz,by simpa [romanRotatePower] using hx⟩
  · dsimp only at hx hy hz
    exact ⟨1,z,x,hz,hx,by simp +decide [romanRotatePower,romanRotate,hy]⟩
  · dsimp only at hx hy hz
    exact ⟨2,x,y,hx,hy,by simp +decide [romanRotatePower,romanRotate,hz]⟩

/-- The actual normalized-chart Whitney test for all twelve sphere points. -/
theorem roman_all_normalized_whitney_jets (k : Fin 3) {a b : ℝ}
    (ha : a^2 = 1/2) (hb : b^2 = 1/2) :
    let F := fun s t => romanSurface (romanRotatePower k (romanNormalizedChart a b s t))
    let fs := deriv (fun s => F s 0) 0
    let ft := deriv (fun t => F 0 t) 0
    let fst := deriv (fun t => deriv (fun s => F s t) 0) 0
    let ftt := deriv (fun t => deriv (fun t => F 0 t) t) 0
    ft = 0 ∧ StokesV5.norm3 fs = 1 ∧
      (Matrix.det !![fs.1,fst.1,ftt.1; fs.2.1,fst.2.1,ftt.2.1; fs.2.2,fst.2.2,ftt.2.2] = 2 ∨
       Matrix.det !![fs.1,fst.1,ftt.1; fs.2.1,fst.2.1,ftt.2.1; fs.2.2,fst.2.2,ftt.2.2] = -2) := by
  dsimp only
  simp_rw [(roman_rotation_symmetry k _).1]
  have hs (t : ℝ) := roman_rotate_power_derivative k (roman_chart_s_derivative ha hb t)
  have ht (t : ℝ) := roman_rotate_power_derivative k (roman_chart_t_derivative ha hb t)
  have hst := roman_chart_st_derivative ha hb
  simp_rw [(roman_chart_s_derivative ha hb _).deriv] at hst
  have htt := roman_chart_tt_derivative ha hb
  simp_rw [(roman_chart_t_derivative ha hb _).deriv] at htt
  rw [(hs 0).deriv, (ht 0).deriv]
  simp_rw [(hs _).deriv, (ht _).deriv]
  rw [(roman_rotate_power_derivative k hst).deriv, (roman_rotate_power_derivative k htt).deriv]
  have hbase := roman_normalized_whitney_jets ha hb
  dsimp only at hbase
  rw [(roman_chart_s_derivative ha hb 0).deriv, (roman_chart_t_derivative ha hb 0).deriv,
    (roman_chart_st_derivative ha hb).deriv, (roman_chart_tt_derivative ha hb).deriv] at hbase
  have hz : romanRotatePower k (0,0,0) = 0 := by
    fin_cases k <;> simp +decide [romanRotatePower,romanRotate]
  have hnorm (v : ℝ × ℝ × ℝ) := (roman_rotation_symmetry k v).2
  have hdet (v w z : ℝ × ℝ × ℝ) :
      Matrix.det !![(romanRotatePower k v).1,(romanRotatePower k w).1,(romanRotatePower k z).1;
        (romanRotatePower k v).2.1,(romanRotatePower k w).2.1,(romanRotatePower k z).2.1;
        (romanRotatePower k v).2.2,(romanRotatePower k w).2.2,(romanRotatePower k z).2.2] =
      Matrix.det !![v.1,w.1,z.1;v.2.1,w.2.1,z.2.1;v.2.2,w.2.2,z.2.2] := by
    fin_cases k <;> simp +decide [romanRotatePower,romanRotate,Matrix.det_fin_three] <;> ring
  simp only [zero_mul,mul_zero,sub_zero,add_zero,zero_pow (by norm_num : (2 : ℕ) ≠ 0),
    div_one,zero_div,one_pow] at hbase ⊢
  have hbase' := And.intro True.intro hbase.2
  simpa only [hz,hnorm,hdet] using hbase'

end
end Bicomplex
