# Bicomplex：歷史宣稱與開放問題交接 prompt

整理日期：2026-10-02（Asia/Taipei）。本文件可整份貼入下一個窗口。

---

請在既有本地專案
`/Users/akari_hayami_64/Documents/hayami-mathematical-research`
接續 Bicomplex 研究。作者希望理解並推進祖論文與早期草稿留下的數學問題；不要求把所有歷史措辭恢復為真，也不預先指定研究方向、方法、次序或最終形式。你可以自主選擇值得研究的問題，重新檢驗既有判定，尋找新構造、證明、反例或更精確的問題表述。

下面是讀稿交接與現有證據的索引，不是預定解法。某個橋接尚未建立，不表示任意新增結構下都不可能；某個原命題已有反例，也不能僅改名就當作追回。新定理與歷史模型恢復分別記錄。

## 文件與版本身分

主比較對象是歷史 final v12 與作者這回附上的 v7 PDF；本地 `source_ancestor` TeX 是另一層歷史材料。「祖論文」「祖本 source」「v7 草稿」不可混為同一版本。

@/Users/akari_hayami_64/Documents/hayami-mathematical-research/AGENTS.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/RESEARCH_BOARD.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/README.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/source-registry/SOURCE_REGISTRY.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/source-registry/RECOVERED_SOURCE_PROVENANCE.md

歷史原文：

@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/source-registry/final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf
@/Users/akari_hayami_64/Downloads/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v7.pdf
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/source_ancestor/signal_manifolds_v2.tex

| 材料 | 身分與本回核對 |
| --- | --- |
| final v12 PDF | 43 頁，現有歷史宣稱稽核的權威；SHA-256 `4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a`。既有 claim map 的 66 個原文區塊首行本回逐一核對到該 PDF 的指定頁。 |
| 附件 v7 PDF | 26 頁，SHA-256 `6cefa5258257f3a23e35b5dd5cbe123b7af0ed3319c3a614b1c8d54c94bd654f`。本回讀取全部 26 頁文字，視讀 pp.7、11、14、21、25 關鍵原頁，索引 39 個具名區塊。它不是 final v12，亦未證實由本地祖本 TeX 生成。 |
| `signal_manifolds_v2.tex` | 1,908 行歷史 source，既有重建記錄為 26 頁；SHA-256 `4c0a5b5a8287ab5559c892b2ee21c170984e5f9649481018f851095118a1f016`。已有容量、算術、對称、Poisson 與 eta 的限制，並有 v7 沒有的 A3／figure-eight／cusp 結果。不能因頁數相同而認為它是 v7 或遺失的 final source。 |

v7 首頁為 July 2026，頁腳仍是 June 2026 草稿標記；檔名、PDF metadata、頁數與用語只能識別材料，不能單獨證明版本演化或發表優先權。v7 與 v12 的相同命題編號也不保證相同內容。

ResearchGate 元頁面是作者提供的歷史背景：
https://www.researchgate.net/publication/408878000_Geometric_Realization_of_Bicomplex_Signal_Manifolds_Spectral_Stability_Whitney_Folds_and_Monodromy_of_the_Observation_Field
本回未重新讀取公開頁、下載遠端 PDF 或操作平台；已有記錄指出元摘要與 v12 內文有版本差異。

目前成果與差距的入口，按研究需要閱讀：

@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/proofs/ORIGINALITY_AND_GAPS.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/claims/CLAIM_MAP.json
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/proofs/REFERENCE_AUDIT.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/revision/Bicomplex_Signal_Manifolds_v13_working.tex
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/revision/Bicomplex_Realization_Point_Trace_v0_02_working.tex
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/revision/Whitney_Green_Domains_v0_03_working.tex
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/companions/lean/bicomplex-signal-manifolds/COVERAGE.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/releases/candidates/bicomplex-green-v0.03-receipt.json

舊 `NEXT_THREAD_PROMPT.md` 是先前完整執行任務的歷史指令。本次作者已改為讓下一窗口自由研究；不沿用其中的固定研究次序，也不因留言板列了一個「下一原子任務」就限制選題。

## v7 草稿的宣稱索引與差距

下表按原編號覆蓋全部 39 個具名區塊：§3 三個、§4 四個、§5 四個、§6 一個、§7 八個、§8 十六個、§9 兩個、§10 一個。另列沒有具名編號的 §9.3 及摘要、正文、圖表與結論。頁碼為 v7 的 PDF 物理頁，與可見印刷頁一致。

「已有修正／no-go」指既有後續 source 與稽核記錄的證據；「未建立／讀稿待核」不冒稱本回已完成新證明或找到新反例。

| v7 原文位置 | 草稿宣稱 | 已有結果、差距或仍開放的問題 |
| --- | --- | --- |
| §§2–3；Definitions 3.1–3.3，pp.2–3 | 由 unit power、moment map 與 `(X,Y)=(cos t,1−cos t)` 導出 ruled surface；4D→3D 幾何投影；information-geometric capacity。 | 原文没有明示相容的狀態族與投影。0.02 提供了另一功率配置的 realization，不能當作歷史推導恢復。Capacity 定義沒有 stochastic channel／noise／resource constraint。 |
| Theorem 4.1、Corollary 4.4，pp.3–4；Proposition 6.1，p.6 | 恰兩個 lateral observation zeros，indices ∓1、Jacobian 公式；奇異性由 `c²−3c+1` 支配。 | Interior dipole 有已核對結果，但「全域恰兩個 immersion singularities」與其不同。完成後的 source atlas 有五個 rank-loss 點，包含邊界。v7 自己的 8.5 又討論 polar zero；不能把 interior、完整 source、原角座標與 observation field 的零點集合混用。 |
| Theorem 4.2、Remark 4.3，p.3 | `sqrt(F)` 繞 dipole 後變號，兩次繞行恢復；把它解讀為 Whitney sheets 的交換，並保留 Spin-1/2 類比。 | Square-root monodromy 本身有證明。它不自動辨認 normalization deck cover、fold cover、phase cover 或物理 spin representation。後期 Z4／Pin 分析保留了不相容與附加資料問題。 |
| Lemma 5.1、Remark 5.2，p.5 | `|P′(c0)|=sqrt(5)`，與 Jacobian／Stokes intensity 的數值或常數重現相聯。 | 已有 monic-polynomial 身分式；係數受 polynomial normalization 影響。相同常數不提供 capacity、mass 或動力學的橋。 |
| Conjecture 5.3、Remark 5.4，p.5 | `C=sqrt(5) ln S`、Bekenstein／holographic entropy 的相容性、`ΔC=1/C`。 | v7 明列猜想。祖本與 v12 改為 sublevel exponent `3/4` 的 resolution law，且已有「幾何不決定 Shannon capacity」no-go；不能把 resolution cost 的定義當成舊 capacity law 的證明。具有獨立操作意義的模型仍可研究。 |
| Theorem 7.1、Remark 7.2，pp.6–7；Proposition 8.1，pp.9–10 | `dx` 下 formal adjoint 為 `T_(1−σ)`，σ=1/2 對稱；full-line Mellin／Plancherel 解讀。 | v7 的 7.2 已正確寫 half-line indices `(1,0)`、無 self-adjoint extension；這不是新版才發現的反例。8.1 的 `W` 卻寫成 full-line Haar space 到 half-line Lebesgue space 的「isometry」，沒有保留完整 domain。已有後續 full-line／half-line 分離與 domain 修正。引言另用 weighted measure，不能與 `dx` 定理混讀。 |
| Corollary 7.3，p.7 | `Tσ x^(−σ−iω)=−ω x^(−σ−iω)`，並由 formal self-adjointness 推 σ=1/2 的 Hilbert orthogonality。 | 特徵微分計算保留；在 σ=1/2 的 half-line `L²(dx)` 中這些函數不是 Hilbert vectors。祖本已撤回由 formal symmetry 推正交的句子。Full-line distributional spectral realization 是另一個明確的對象。 |
| Theorem 7.4、Remark 7.5、Proposition 7.6、Corollary 7.8，pp.8–9 | 有限 phasor 的 Gram norm、`O(T⁻¹)`、充分 positivity threshold、conditioning／logdet bounds。 | 有限 positive integer／distinct-frequency 與指定 inner product 下已有結果。新版 independence 對任意 `T>0` 成立；舊 threshold 用於 quantitative conditioning。沒有 uniform growing-frequency-family 或 infinite-dimensional stable reconstruction 的宣稱自動成立。 |
| Remark 7.7，pp.8–9；Remark 8.2，p.10；Figure 6，p.11 | rank-M free group／perfect Pontryagin pairing；normalized time-average 趨向 Dirac δ-kernel；連接 Artusa 的 Weil-étale duality。 | 現有精確結果是有限固定 distinct frequencies 的 Gram limit／Bohr–Haar orthogonality。Multiplicative integer relations 與線性 phasor independence 是不同問題；不宣告 multiplicative group 自由 rank M。Kronecker orthogonality 與 distributional Dirac kernel 的 normalization、measure 亦不同；Weil-group／cohomology 對應沒有供給。 |
| Proposition 8.3、Remark 8.4，pp.10–12 | 全 fold locus 有 `i* Ψ! Z ≅ Z[−1]`；dipole 總指數與 Verdier duality 相聯；只由 tensor、pullback 的一致便得 cohomology theories 唯一。 | 草稿的 local cohomology sketch 沒有完成所用 category、six operations、dualizing complex、base-change hypotheses 與 shifts 的辨認；後續祖本不再宣稱該公式。現有 normalization-defect theorem 不是這個 exceptional-pullback theorem。整條 `det DΨ=0` locus 是否皆為 fold及邊界例外亦屬讀稿待核，不能由 Figure 10 認定。 |
| Proposition 8.5、Remark 8.6，pp.12–13 | polar observation zero 是 rank-one Whitney fold、smooth extension local degree zero；total signed count 不是 χ(D)。 | Polar fold 與 full-extension degree-zero已有修正證明；原物理半鄰域不直接承接完整小圓的 index。Surface cross-cap 與 planar observation fold 分開；auxiliary field 的 signed count 不等於無條件 Poincaré–Hopf／Verdier 結論。 |
| Proposition 8.7、Remark 8.8，p.13；Figure 7，p.14 | compactological／quasi-separated condensed realization，兩 dipoles 正好是 structure-sheaf 非自由或 non-manifold defects。 | Compact Hausdorff image 可作 condensed set；草稿特定 compact-family 的 axioms／等價適用性仍需具體辨認。底層 condensed set 不自帶 canonical ringed structure、tangent module 或這種 singularity detector，祖本已有 scope no-go。Normalization quotient 有獨立、具體的 constructible-sheaf 替代。 |
| Definition 8.9、Proposition 8.10、Corollary 8.11、Remark 8.12，pp.14–15；Figure 8，p.16 | constant condensed sheaf 上 canonical τ，有 ± sectors、rank-two charpoly `t²−1`、weight-zero purity、Akari–Hilbert operator；Mellin domain 就是 even observable sector。 | τ²=1 的有限 algebra不供給草稿尚未定義的 carrier、兩個實際 eigenspaces或 functorial map。Rank-one constant sheaf、double-cover pushforward、sign local system 與 operator domain 不是同一物件。Phase monodromy 不等於 Frobenius purity；index `n` 不依賴 Whitney coordinate，也不建立 Mellin-space→sheaf/Dirac-space 的映射。這些橋目前未提供。 |
| Proposition 8.13、Remark 8.14，pp.15–17；Figure 9，p.17 | log-window bound `O(1/log T)` 與 linear-window `O(1/T)` 的差距由 integer sparsity／log aliasing／Frobenius analogy 解釋。 | 顯示的 oscillatory integral 可計算；相同 interval／相同訊號／變數變換／normalization 是否真在比較同一實驗需另辨認。正整數 N 不是 multiplicative subgroup。兩種 upper bounds 的比值不能直接當作實際 decorrelation ratio，亦未建立 arithmetic-geometric mechanism。祖本的 Bohr completion 不恢復這段較強解讀。 |
| Proposition 8.15、Remark 8.16，pp.17–18；Figure 10，p.18 | σ=k/2 的 Deligne weight correspondence、cohomological midpoint。 | v7 自己已稱 analogy；正文結論有較強敘述。祖本與 v12 明確限制 real geometry 不供 Deligne／Weil data。選定 complex residual `X²+Y⁴` 後的 MHS 已有結果，但不從 σ=1/2 推得，也不辨認 phase eigenvalues 與 Frobenius weights。 |
| Remark 9.1，p.21；§9.1，pp.19–21 | volume/area 比值為 dimensionless impedance；`m=μ_eff η^n ΔC`，fundamental-group rank 作 generation labels。 | v7 明列 ansatz。祖本與 v12 已證原比值仍帶一個 length scale；`R=1` 選單位，不能自動給 mass law。State-space／image-space 的 π1、state selection、mass operator 與尺度均沒有在草稿模型中建立物理對應。 |
| Conjecture 9.2；§9.2，p.21 | synchronized observations 誘導 nonzero commutator、`ℏ_eff∝1/ν0`、Jacobian／Berry-curvature 修正。 | 已有 canonical powers 的 `{X,Y}=0` no-go；草稿沒有定義非方陣 `dμ` 所謂 determinant、量子 observable domain、deformation product 或實際 Berry bundle。若改用其他 observables／dynamics，是新模型，不能說原功率投影已產生非交換性。 |
| Remark 10.1，p.21；Listing 1，pp.21–24 | Lean targets 中若干標成 proved／calc done。 | Listing 含 `sorry`、`True := trivial`、只證 scalar inequality或有限代數的代理。它不是全文 machine certificate，本回未 build。當前可用 formal scope 以實際 companions／coverage／receipt 為準。 |
| §9.3，p.21（未編號） | dipole asymmetric indices 提供 chirality seed，適當 elliptic family 的 eta 作 open problem。 | Sign-holonomy circle model 已有 eta=0 結果。這排除該簡單模型的 spectral asymmetry，不排除另供 asymmetric operator／boundary dynamics；實際曲面 Dirac 問題仍 open。 |

摘要 p.1、§8.7 比較表 p.19、Figure 11 p.20、結論 pp.24–25 與 Table 2 p.25 都有把多個橋接串成較強結论的語句。這些語句承接上表的對象與假設缺口，不因標為 “Proven” 或 “Framework” 就得到額外證據。Table 2 不是完整 39-block inventory，還須保留正文中的 remarks、definitions 和 scope conflicts。

## final v12／祖本已經做出的限制與新增內容

v12 有全部 66-block 原文與頁碼，見 `CLAIM_MAP.json`。其中主表保留 v13 checkpoint 當時的狀態，最新結論還要讀 `continuation` overlays；不能只摘一個早期 “open” 欄位就重做已補完的 scalar 結果。

祖本 source 已不再採用 v7 的全部強宣稱：它加入 sublevel exponent `3/4`、capacity no-go、full-line Plancherel／Dirichlet–Hardy／Bohr–Haar、normalization defect sheaf、ambient SU(2)／arithmetic scope、mass scale obstruction、power Poisson commutation 與 circle eta=0。它另外明示 complex A3 residual、Milnor fiber／MHS、兩種不同 figure-eight、weighted phase action 的 amplitude／clock no-go，以及實際 principal-curvature trace 的 cusp obstruction。這些不能當作 v7 原文已提供的結果，也不能把所有 no-go 說成這次新版才撤回。

final v12 在此之後的 Green、Krein、twisted Dirac 與 Pin 傳輸宣稱尤其需要分開看：

| final v12 位置 | 現有證據與未解差距 |
| --- | --- |
| §§3–6，pp.4–13 | 實際全域 atlas、interior dipole、square-root lifting、chosen complexification 與 cusp／phase scope 已有修正。Historical moment-compatible realization 未恢復；從名稱 “Bicomplex” 到不可被普通兩複數分量取代的結構仍沒有已證必要性。 |
| §§7、8.1–8.7，pp.14–19 | Mellin measure/domain、finite Gram、Hardy/Haar 與 ordinary normalization defect 有指定範圍的結果。v12 7.2 已正確否定 half-line SA extension，7.3 已限制 generalized-eigenfunction 解讀；8.7 已限制 canonical condensed structure。 |
| 8.8–8.11，pp.20–21 | Polar fold、completed source、指定 Galerkin 與 capacity／fixed-Dirichlet form有修正。Finite Galerkin 或 zero capacity 不替代 graph-domain／Dirac 證明。 |
| 8.12，p.22 | 標準 cross-cap front/seam 計算有範圍；原全文的 actual weighted overlap coercivity與完整 front/seam normal-family／parametrix 沒有全部由 0.03 證完。現在已有另一條 actual scalar metric／Green 證明，不能將「舊方法未補完」與「指定 scalar 定理仍未證」混同。 |
| 8.13–8.17，pp.23–28 | 原 `Hmin` 定義的 compact-support graph closure仍有無窮 outer-boundary modes，原 `(2,2)`／exhaustive U(2)／two-dimensional kernel不能原樣保留。0.02–0.03 對另一個明確 fixed-outer-Dirichlet point restriction `A=HF restricted to ker τ` 證分類、Green coefficients、Markov／reference-length selection及 zero-energy data；兩個 operator不可混稱。 |
| 8.18–8.19，pp.28–30 | Ordinary normalization-defect→point-Green sheaf map 的 support／odd-even obstruction已有；0.03 補 scalar limiting parity。新的 sign-twisted／spinorial／derived bridge仍未提供。 |
| 8.20–8.21，pp.30–32 | Sign twist／exact-cone modes 有 model 計算；actual Whitney twisted Dirac 的 closed domains、graph estimates、overlap/gauge control、additional-mode exclusion與 chiral/full quotient dimensions仍未完成。Scalar metric或 cone channel count不能代替。 |
| 8.22–8.24，pp.32–35 | 有限 first-order kernel／Z4／Clifford資料及 regular-cut conditional Green algebra保留；actual singular-cut trace spaces、phase-line fiber identification、Pin transmission與 self-adjoint/adjoint domains仍 open。Central Pin sign、整體 action multiplier不能由已有 Green identity 消除。 |
| 8.25–8.30，pp.35–36 | Constrained-source SU(2) scope與 real arithmetic no-go保留。Chosen A3 fiber的 weight dimensions `(2,1)` 屬 rank-three H1；不是 v7 rank-two ± model。Full nearby/vanishing-cycle maps未由 monodromy alone決定，Weil theory 是額外的 functorial input。 |
| 9.1–9.6，pp.36–37 | Scale obstruction、power-coordinate Poisson commutation與 sign-circle eta=0已有；physical mass、clock、capacity、chirality和 noncommutative dynamics尚無獨立 realization。 |

## 目前可自由探索的開放問題

以下沒有優先順序；不是要求逐項完成的清單。你可以選其中之一、研究它們的關聯、否定一個假設，或從原文找到更值得研究的新問題。

- **歷史幾何來源與 canonicity。** 相容於 `(cos t,1−cos t)` 的狀態族及獨立觀測映射能否實現原 S？哪些 phase／coupling／regularity資料必須另給？0.02 的 powers `(1−u,u)` 不回答這個歷史相容性問題；已證 endpoint 與 three-Hermitian-observable no-go的適用範圍也需保留。
- **真正需要 bicomplex 結構的內容。** 目前主要構造可在兩個 complex components描述。是否存在有用且可證、依賴 bicomplex multiplication／involution／zero divisors而不只是重新命名的命題，仍待研究。
- **v7 的 categorical 與 arithmetic 橋。** Condensed realization 的確切 compactology／ringed object、fold exceptional pullback、canonical deck carrier、Mellin observable sector、six-functor coherence、Frobenius／Weil／weight correspondence等，哪些有合理且有內容的修正版？哪些原式根本缺 object 或不可由所給資料推出？目前 normalization defect、Bohr–Haar 和 chosen A3/MHS 都是分立成果，尚非這套統一橋。
- **實際 singular Dirac／Pin 問題。** 實際 Whitney metric下選定 spin／flat phase line／Hilbert density後的閉算子、最大最小 domains與 boundary channels；奇異 cut 的 trace／Clifford-compatible fiber maps、拼接与 adjoint-domain equality。Exact cone 和 regular-cut conditional定理不是其完成證據。
- **Normalization／sheaf與 analytic operator 的相容橋。** Ordinary scalar版本有 support與parity障礙。是否存在有意義的新 carrier／morphism，使 sheaf data與真正 graph traces相容？近旁/cohomological rank相同不等於同一物件。Chosen A3 nearby/vanishing cycles 的 specialization／variation等 maps也尚未建完整。
- **Actual front/seam 的更完整分析。** 既有 actual scalar定理之外，原 8.12／8.21 方法所要求的全套 weighted overlap／normal-family／parametrix結果是否成立、具有何種用途，仍可獨立研究。Bη／B0沒有 closed numerical formula不是已證 scalar分類的欠證。
- **分析／算術 reconstruction 的強化。** 有限 distinct-frequency Gram與 Bohr limit已有；若希望取得 infinite-family、growing bandwidth、資源公平的 reconstruction或 log/linear sampling比較，需要另外明示問題。v7 的 sparsity／aliasing／Weil解讀並未因此證成。
- **獨立的 signal／physical realization。** Capacity／entropy／noise/resources、mass/state selection/units、absolute clock、quantization與 genuine spectral asymmetry都還需有可檢驗模型。既有 no-go僅針對指定資料或簡單模型，不排除另外建模；也不允许宣稱常數相似或二重覆蓋已給 particle physics。
- **原創性與前序成果的精確比較。** 模型特定 realization／實際 Whitney metric與 Green估計可列 candidate contributions；首創性未確立。Abstract extension、singular-metric coordinates等已有文獻，作者 Ruled／Stokes同一 S 的重用也要辨認。Grieser全文比較等仍有既有 retrieval限界，不以「未搜到相同結果」為原創證書。

## 已有成果、證據範圍與操作邊界

截至既有 0.03 checkpoint，actual scalar point trace、修正 A 的 `(2,2)`／U(2)、compact extension resolvents、Krein kernel dimension two、extrinsic logarithmic Green normalization、2π pairing、Markov uniqueness、共同 reference-length invariant-plane uniqueness、global reflection matrix symmetry與 limiting sheet-even coefficients已有書面證明及明示外部定理。Reference-length規約不是物理 dilation／RG law；global reflection不是 local deck isometry；limiting parity不是整個 Green function的 deck invariance。

現有 0.03 receipt記錄 180 payload files／181 ZIP members、四份 PDF共33頁重建與原位／解壓重播。Own Lean scope為33 named theorems；0.03未增加 Lean theorem，以66個未改 proof/config/verifier inputs綁定先前33 own／224 Ruled／258 Stokes各自審計，沒有 fresh Lean build。本文沒有把這些歷史 receipt結果重新當作本回測試。

本次整理窗口只分析 source／PDF宣稱、核對來源 hashes與66個頁碼首行、生成這份 prompt；沒有研究新證明、修改正文、重跑 mathematical baseline／Lean、重編 PDF或改既有 board／claim map／封包。附件亦未複製或修改。舊封存與無關工作保持原狀。

下一窗口的研究方法與選題由你決定。實際來源與證據可自行核對；需要重播的既有命令已在 README／board／receipt。新的里程碑依專案慣例同步留言板；證明、假設、external theorem、exact computation、finite/numerical evidence、Lean與歷史恢復分開。保留所有無關改動與不可變封存；正式公開操作仍需作者另行確認。
