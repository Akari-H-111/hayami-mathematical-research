import RuledV5.Curvature

namespace RuledV5
noncomputable section
open StokesV5 Filter
open scoped Topology

def boundaryTangentR (ε : ℝ) (p : ℝ × ℝ) : ℝ × ℝ × ℝ :=
  ((1-2*p.2)*p.1/Real.sqrt (1-p.1^2),
   -(1-p.2)*ε*boundaryC p.1*p.1 /
      (Real.sqrt (1-(boundaryC p.1)^2)*Real.sqrt (1-p.1^2)),p.2)

def boundaryTangentU (ε : ℝ) (p : ℝ × ℝ) : ℝ × ℝ × ℝ :=
  (2*(1-boundaryC p.1),-boundaryS ε p.1,p.1)

theorem boundaryC_hasDerivAt {r : ℝ} (hr : r ∈ Set.Ioo (-1) 1) :
    HasDerivAt boundaryC (r/Real.sqrt (1-r^2)) r := by
  have hpos : 0 < 1-r^2 := by
    have := mul_pos (show 0 < 1+r by linarith [hr.1])
      (show 0 < 1-r by linarith [hr.2])
    nlinarith
  have h := ((hasDerivAt_const r (1:ℝ)).sub ((hasDerivAt_id r).pow 2)).sqrt
    (ne_of_gt hpos)
  apply (h.const_sub (1:ℝ)).congr_deriv
  dsimp
  field_simp
  ring

theorem boundaryS_hasDerivAt (ε : ℝ) {r : ℝ} (hr : r ∈ Set.Ioo (-1) 1) :
    HasDerivAt (boundaryS ε)
      (-ε*boundaryC r*r/(Real.sqrt (1-(boundaryC r)^2)*Real.sqrt (1-r^2))) r := by
  have hc := boundaryC_bounds hr
  have hpos : 0 < 1-(boundaryC r)^2 := by
    have := mul_pos (show 0 < 1+boundaryC r by linarith [hc.1])
      (show 0 < 1-boundaryC r by linarith [hc.2])
    nlinarith
  have h := (((hasDerivAt_const r (1:ℝ)).sub ((boundaryC_hasDerivAt hr).pow 2)).sqrt
    (ne_of_gt hpos)).const_mul ε
  apply h.congr_deriv
  dsimp
  field_simp
  ring

theorem boundary_actual_tangent_basis (ε : ℝ) {p : ℝ × ℝ}
    (hr : p.1 ∈ Set.Ioo (-1) 1) :
    fderiv ℝ (boundarySurface ε) p (1,0)=boundaryTangentR ε p ∧
    fderiv ℝ (boundarySurface ε) p (0,1)=boundaryTangentU ε p := by
  have hc := (boundaryC_hasDerivAt hr).comp_hasFDerivAt p
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))
  have hs := (boundaryS_hasDerivAt ε hr).comp_hasFDerivAt p
    (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))
  have hu := hasFDerivAt_snd (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p)
  have h := (hc.add ((hu.const_mul 2).mul ((hasFDerivAt_const (1:ℝ) p).sub hc))).prodMk
    (((hasFDerivAt_const (1:ℝ) p).sub hu).mul hs |>.prodMk
      (hu.mul (hasFDerivAt_fst (𝕜 := ℝ) (E := ℝ) (F := ℝ) (p := p))))
  change HasFDerivAt (boundarySurface ε) _ p at h
  rw [h.fderiv]
  constructor <;> ext <;>
    simp [boundaryTangentR,boundaryTangentU] <;> ring

-- Smooth extension of S_r(r,k*r)/r. The theorem below binds it to fderiv.
def cornerScaledTangent (ε k r : ℝ) : ℝ × ℝ × ℝ :=
  ((1-2*k*r)/Real.sqrt (1-r^2),
   -(1-k*r)*ε*boundaryC r /
      (Real.sqrt (1-(boundaryC r)^2)*Real.sqrt (1-r^2)),k)

theorem corner_scaled_tangent_actual (ε k : ℝ) {r : ℝ}
    (hr : r ∈ Set.Ioo (-1) 1) :
    r • cornerScaledTangent ε k r =
      fderiv ℝ (boundarySurface ε) (r,k*r) (1,0) := by
  rw [(boundary_actual_tangent_basis ε hr).1]
  ext <;> simp [cornerScaledTangent,boundaryTangentR] <;> ring

theorem corner_scaled_tangent_limit (ε k : ℝ) :
    Tendsto (cornerScaledTangent ε k) (𝓝 (0:ℝ)) (𝓝 (1,0,k)) := by
  have hc : ContinuousAt boundaryC 0 := (boundaryC_contDiffAt (by norm_num)).continuousAt
  have h : ContinuousAt (cornerScaledTangent ε k) 0 := by
    unfold cornerScaledTangent
    apply ContinuousAt.prodMk
    · apply ContinuousAt.div (by fun_prop) (by fun_prop)
      norm_num
    · apply ContinuousAt.prodMk
      · apply ContinuousAt.div
        · exact (((continuousAt_const.sub (continuousAt_const.mul continuousAt_id)).neg.mul
            continuousAt_const).mul hc)
        · exact ((continuousAt_const.sub (hc.pow 2)).sqrt).mul
            ((continuousAt_const.sub (continuousAt_id.pow 2)).sqrt)
        · norm_num [boundaryC_at_zero]
      · exact continuousAt_const
  simpa [cornerScaledTangent,boundaryC_at_zero] using h.tendsto

theorem corner_tangent_u_limit (ε : ℝ) :
    Tendsto (fun r : ℝ => boundaryTangentU ε (r,0)) (𝓝 0) (𝓝 (2,-ε,0)) := by
  have hc : ContinuousAt boundaryC 0 := (boundaryC_contDiffAt (by norm_num)).continuousAt
  have hs : ContinuousAt (boundaryS ε) 0 := by unfold boundaryS; fun_prop
  have h : ContinuousAt (fun r : ℝ => boundaryTangentU ε (r,0)) 0 := by
    exact (continuousAt_const.mul (continuousAt_const.sub hc)).prodMk
      (hs.neg.prodMk continuousAt_id)
  simpa [boundaryTangentU,boundaryC_at_zero,boundaryS_at_zero] using h.tendsto

theorem corner_scaled_area_limit (ε k : ℝ) :
    Tendsto (fun r : ℝ => r⁻¹ • cross3
      (fderiv ℝ (boundarySurface ε) (r,k*r) (1,0))
      (fderiv ℝ (boundarySurface ε) (r,k*r) (0,1))) (𝓝[>] 0) (𝓝 (ε*k,2*k,-ε)) := by
  have he : (fun r : ℝ => r⁻¹ • cross3
      (fderiv ℝ (boundarySurface ε) (r,k*r) (1,0))
      (fderiv ℝ (boundarySurface ε) (r,k*r) (0,1))) =ᶠ[𝓝[>] 0]
      fun r => cross3 (cornerScaledTangent ε k r) (boundaryTangentU ε (r,0)) := by
    filter_upwards [self_mem_nhdsWithin,
      (eventually_lt_nhds (show (0:ℝ)<1/2 by norm_num)).filter_mono nhdsWithin_le_nhds]
      with r hr0 hr1
    change (0:ℝ)<r at hr0
    have hr : r ∈ Set.Ioo (-1) 1 := ⟨by linarith,by linarith⟩
    rw [← corner_scaled_tangent_actual ε k hr,(boundary_actual_tangent_basis ε hr).2]
    have hu : boundaryTangentU ε (r,k*r)=boundaryTangentU ε (r,0) := rfl
    rw [hu]
    ext <;> simp [cross3] <;> field_simp
  have hc : Continuous (fun p : (ℝ × ℝ × ℝ) × (ℝ × ℝ × ℝ) => cross3 p.1 p.2) := by
    unfold cross3;fun_prop
  have hl := hc.continuousAt.tendsto.comp
    ((corner_scaled_tangent_limit ε k).prodMk_nhds (corner_tangent_u_limit ε))
  have hh : cross3 (1,0,k) (2,-ε,0)=(ε*k,2*k,-ε) := by ext <;> simp [cross3] <;> ring
  rw [hh] at hl
  exact (hl.mono_left nhdsWithin_le_nhds).congr' he.symm

theorem corner_paths_eventually_regular {ε : ℝ} (he : ε ≠ 0) (k : ℝ) :
    ∀ᶠ r in 𝓝[>] (0:ℝ), Function.Injective (fderiv ℝ (boundarySurface ε) (r,k*r)) := by
  have hn : (ε*k,2*k,-ε) ≠ (0:ℝ × ℝ × ℝ) := by
    intro hz
    have h := congrArg (fun v : ℝ × ℝ × ℝ => v.2.2) hz
    exact he (neg_eq_zero.mp h)
  have hh := (corner_scaled_area_limit ε k).eventually (eventually_ne_nhds hn)
  filter_upwards [hh] with r hr
  rw [differential_injective_iff_cross]
  intro hz
  exact hr (by rw [hz,smul_zero])

-- A continuous tangent-plane field on an embedded C1 patch admits a local
-- nonzero continuous normal. Such a normal cannot annihilate this surface.
theorem no_continuous_corner_normal_local {ε δ : ℝ} (he : ε ≠ 0) (hδ : 0 < δ)
    (n : (ℝ × ℝ) → ℝ × ℝ × ℝ) (hn : ContinuousAt n (0,0))
    (hortho : ∀ p : ℝ × ℝ, p.1 ∈ Set.Ioo 0 δ → p.2 ∈ Set.Icc 0 δ →
      dot3 (n p) (fderiv ℝ (boundarySurface ε) p (1,0))=0 ∧
      dot3 (n p) (fderiv ℝ (boundarySurface ε) p (0,1))=0) :
    n (0,0)=0 := by
  have hpath (k : ℝ) : Tendsto (fun r : ℝ => n (r,k*r)) (𝓝[>] 0) (𝓝 (n (0,0))) := by
    have hp : Tendsto (fun r : ℝ => (r,k*r)) (𝓝 0) (𝓝 (0,0)) := by
      simpa only [mul_zero] using
        (show ContinuousAt (fun r : ℝ => (r,k*r)) (0:ℝ) by fun_prop).tendsto
    exact (hn.tendsto.comp hp).mono_left nhdsWithin_le_nhds
  have hlim (k : ℝ) : Tendsto (fun r : ℝ => dot3 (n (r,k*r)) (cornerScaledTangent ε k r))
      (𝓝[>] 0) (𝓝 (dot3 (n (0,0)) (1,0,k))) := by
    unfold dot3
    have h : Tendsto (cornerScaledTangent ε k) (𝓝[>] (0:ℝ)) (𝓝 (1,0,k)) :=
      (corner_scaled_tangent_limit ε k).mono_left nhdsWithin_le_nhds
    simpa only [add_assoc] using ((hpath k).fst_nhds.mul h.fst_nhds).add
      (((hpath k).snd_nhds.fst_nhds.mul h.snd_nhds.fst_nhds).add ((hpath k).snd_nhds.snd_nhds.mul h.snd_nhds.snd_nhds))
  have hz (k : ℝ) (hk : k=0 ∨ k=1) : dot3 (n (0,0)) (1,0,k)=0 := by
    have hz : (fun r : ℝ => dot3 (n (r,k*r)) (cornerScaledTangent ε k r)) =ᶠ[𝓝[>] 0]
        fun _ => (0:ℝ) := by
      filter_upwards [self_mem_nhdsWithin,
        (eventually_lt_nhds (show (0:ℝ)<1/2 by norm_num)).filter_mono nhdsWithin_le_nhds,
        (eventually_lt_nhds hδ).filter_mono nhdsWithin_le_nhds]
        with r hr0 hr1 hrδ
      change (0:ℝ)<r at hr0
      have hr : r ∈ Set.Ioo (-1) 1 := ⟨by linarith,by linarith⟩
      have hu : k*r ∈ Set.Icc (0:ℝ) δ := by rcases hk with rfl | rfl <;> constructor <;> linarith
      have ho := (hortho (r,k*r) ⟨hr0,hrδ⟩ hu).1
      rw [← corner_scaled_tangent_actual ε k hr] at ho
      have hs (a : ℝ) (v w : ℝ × ℝ × ℝ) : dot3 v (a • w)=a*dot3 v w := by
        simp [dot3]; ring
      rw [hs] at ho
      exact (mul_eq_zero.mp ho).resolve_left (ne_of_gt hr0)
    exact tendsto_nhds_unique (hlim k) (tendsto_const_nhds.congr' hz.symm)
  have hu : dot3 (n (0,0)) (2,-ε,0)=0 := by
    have hl : Tendsto (fun r : ℝ => dot3 (n (r,0)) (boundaryTangentU ε (r,0)))
        (𝓝[>] 0) (𝓝 (dot3 (n (0,0)) (2,-ε,0))) := by
      have hn0 := hpath 0
      simp only [zero_mul] at hn0
      have ht : Tendsto (fun r : ℝ => boundaryTangentU ε (r,0))
          (𝓝[>] 0) (𝓝 (2,-ε,0)) :=
        (corner_tangent_u_limit ε).mono_left nhdsWithin_le_nhds
      unfold dot3
      simpa only [add_assoc] using (hn0.fst_nhds.mul ht.fst_nhds).add
        ((hn0.snd_nhds.fst_nhds.mul ht.snd_nhds.fst_nhds).add (hn0.snd_nhds.snd_nhds.mul ht.snd_nhds.snd_nhds))
    have hz : (fun r : ℝ => dot3 (n (r,0)) (boundaryTangentU ε (r,0))) =ᶠ[𝓝[>] 0]
        fun _ => (0:ℝ) := by
      filter_upwards [self_mem_nhdsWithin,
        (eventually_lt_nhds (show (0:ℝ)<1/2 by norm_num)).filter_mono nhdsWithin_le_nhds,
        (eventually_lt_nhds hδ).filter_mono nhdsWithin_le_nhds]
        with r hr0 hr1 hrδ
      change (0:ℝ)<r at hr0
      rw [← (boundary_actual_tangent_basis ε (show r ∈ Set.Ioo (-1) 1 by
        constructor <;> linarith)).2]
      exact (hortho (r,0) ⟨hr0,hrδ⟩ ⟨le_rfl,hδ.le⟩).2
    exact tendsto_nhds_unique hl (tendsto_const_nhds.congr' hz.symm)
  have hx := hz 0 (Or.inl rfl)
  have hzz := hz 1 (Or.inr rfl)
  simp only [dot3,mul_zero,add_zero,mul_one] at hx hzz hu
  have hny : (n (0,0)).2.1=0 := by
    have heq : ε*(n (0,0)).2.1=0 := by nlinarith [hu,hx]
    exact (mul_eq_zero.mp heq).resolve_left he
  change n (0,0)=(0,0,0)
  exact Prod.ext hx (Prod.ext hny (by linarith [hx,hzz]))


theorem no_continuous_corner_normal {ε : ℝ} (he : ε ≠ 0)
    (n : (ℝ × ℝ) → ℝ × ℝ × ℝ) (hn : ContinuousAt n (0,0))
    (hortho : ∀ p : ℝ × ℝ, p.1 ∈ Set.Ioo 0 (1/2) → p.2 ∈ Set.Icc 0 1 →
      dot3 (n p) (fderiv ℝ (boundarySurface ε) p (1,0))=0 ∧
      dot3 (n p) (fderiv ℝ (boundarySurface ε) p (0,1))=0) :
    n (0,0)=0 :=
  no_continuous_corner_normal_local (δ := 1/2) he (by norm_num) n hn
    (fun p hr hu => hortho p hr ⟨hu.1,by linarith [hu.2]⟩)

end
end RuledV5
