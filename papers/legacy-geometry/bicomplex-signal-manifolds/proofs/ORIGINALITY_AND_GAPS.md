# Bicomplex：原創性、歷史差距與目前缺口

2026-10-02。比較對象：祖本、權威 final v12、v13 working、continuation 0.02，以及本輪新增的 0.03。這是本地數學與來源稽核，不是首次發現、同行審查或公開發布的證書。

目前版本比祖本更完整、比 v12 更可靠，卻沒有證明 v12 的所有原宣稱。能追回的 scalar Green 結論已改用明確固定外邊界的算子證明；原定義下已被反證的結論不能保留。原創性應落在具體模型與實際 Whitney 度量的假設驗證，不能以 bicomplex 名稱、標準框架或 Lean 定理數代替。

## 2026-10-02 論文二文獻比對更新

- **Grieser 2002 全文已取得並讀完**（作者公開的掃描檔），先前的取得限制解除。其 §1 正是 0.02 的奇異座標法，只給 quasi-isometry；0.03 的 arclength 漸近估計（a−I=O(ρ^{1/2}) 與外在半徑正規化）不在其中，維持「候選貢獻」。
- **最接近的同型定理是 Colin de Verdière 1982 的 pseudo-laplacian。** 光滑曲面上每點 deficiency 1，展開為 log 加常數。Hillairet–Kokotov 的錐點理論則顯示，角 ≤2π 時只有對數通道。cross-cap 屬於角 2π 的情形。
- 論文二的定位建議：把 Colin de Verdière 的圖像推廣到浸入曲面的 Whitney cross-cap。也可以考慮推廣到一般具有 cross-cap 的緊緻浸入曲面，但這需要新的全域緊緻性驗證。詳見 `successor/PAPER2_LITERATURE.md`。

## 2026-10-02 continuation 0.04 更新：祖本 moment assignment 與 v7 範疇／窗口橋

新 7 頁 note `revision/Moment_Readouts_Exceptional_Pullbacks_v0_04_working.tex` 處理兩組問題。一是祖本、v7、v12 共有的 moment assignment（v7 p.2、v12 p.4 的 Definition 3.1）。二是作者這回附上的 v7 草稿（已登錄為非權威歷史稿，見 `claims/V7_DRAFT_INDEX.md`）中 Proposition 8.3、Remarks 8.4／8.16、Definition 8.9 至 Corollary 8.11，以及 Proposition 8.13／Remark 8.14。全部是新定理、反例或非 canonical 構造，**不是**追回歷史推導。

| 問題 | 0.04 結果 | 證據類型 |
| --- | --- | --- |
| 祖本 \|z₁\|²=cos t 是否可由「投影」實現 S | t=±π/2 的所有態都在圓 C₀={z₁=0} 上，兩條邊的像是不共線的 V。任何沿 C₀ 為 real-analytic 的 readout 都不行，包括 affine 投影、所有實多項式、bicomplex 變數及其共軛的多項式；對閉 source D 與 t 開的 D∘（加連續性）皆成立。Phase-invariant 與 mixed-state readout 不需任何正則性即失敗 | 正文證明＋exact／finite replay |
| 是障礙還是只是缺資料 | 尖銳：明示連續 state family（在 completed edge charts 中光滑）與明示 C^∞ readout 實現 S（64881 標籤 replay 誤差 1.4e−14）；僅取半個 source D₊ 時有 real-analytic readout，但 affine 仍不行 | 正文證明（C^∞ 構造、analytic tubular retraction）|
| 為何 0.02 的 powers (1−u,u) 可行 | Edge criterion：分量消失處的像必須落在 analytic loop 之內；0.02 的兩條消失邊映到圓弧，祖本則是兩條邊構成 V | 正文 remark |
| v7 8.3 的 i*Ψ^!Z≅Z[−1] | **錯誤**。對凸 domain 上任何連續 Ψ，Ψ^!Z≅j_!Z_int，fold 點上 shift 為 0；草稿的 [−1] 是任一嵌入弧的 i^!（codimension），與 fold 無關。Ψ=(N,M) 因 Q=0 只定義於 D∘ | 正文證明；KNP Prop. 4.6.9／Rem. 4.6.19、Scholze Def. 5.1 |
| fold 真正在哪裡被看見 | Ordinary fold 點上 Scholze Def. 5.1 條件(1) 的 comparison map 失敗，cokernel i_*Z_L；條件(2)（f^!Z 可逆）仍成立。Fold 分類引用已發表 Stokes v5 Theorem 2.4 | 正文證明 |
| v7 8.9–8.11 的 rank-two ±1 分解 | 連通空間上 End(Z_X)=Z，constant sheaf 上 τ=±id。正確 carrier 是 √F double cover 的 π_*Z：在 Z 上不可分解，只在 Z[½] 上分裂為 Z⊕𝓛（𝓛 繞 P± monodromy −1）。Fold involution 有固定曲線，deck involution 無固定點，兩者不互推 | 正文證明；winding／idempotent replay |
| v7 8.13／8.14 的 log／linear gap | 兩個界都是 2/(\|δ\|·window mass)，對任意實頻率成立；比值 T/log T 只是 mass 比，與整數無關。在同一區間 [1,T] 上，同一 characters x^{−iδ} 用 Lebesgue 測度完全不去相關（模長 →(1+δ²)^{−1/2}），順序反轉。ℕ 不是子群，它生成的 ℚ_{>0} 稠密 | exact 積分＋finite replay |

原創性：analytic-rigidity／edge criterion、明示 C^∞ 與半 source 構造，以及對草稿 f^! 公式的判定，是針對本模型的新結果。所用 Verdier duality、六函子 smoothness 定義、解析函數零點離散、Weierstrass 皆為標準理論。是否已有相同的一般 lemma 未作文獻搜尋，不宣稱首創。0.04 未增加 Lean theorem。

## 來源與比較基準

| 來源 | 可接受的角色 | 本輪核對 |
| --- | --- | --- |
| `source_ancestor/signal_manifolds_v2.tex` | 1,908 行、26 頁重建的早期祖本；不能冒充 final source | SHA-256 `4c0a5b5a8287ab5559c892b2ee21c170984e5f9649481018f851095118a1f016`；§3 功率／moment assignment 原文核對 |
| `../source-registry/final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf` | 43 頁、66 個具名區塊的數學宣稱權威 | SHA-256 `4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a`；頁码 physical = printed |
| v13 working / companion 0.01 | 修正正文與部分 Lean；17+3 頁 | 原封包 155 payload files 的 manifest、source/PDF 綁定保持不變 |
| continuation 0.02 | 新 realization、actual scalar point traces、指定 A 的 resolvent domains；7 頁 | 原封包 167 payload files 的 manifest、source/PDF 與 Lean proof inputs 綁定核對；本輪 baseline／revision／continuation exact replay PASS |
| `revision/Whitney_Green_Domains_v0_03_working.tex` | 本輪新增的實際 scalar Green 漸近、幾何邊界係數與唯一性；6 頁 | 正文使用 external scalar Hölder theorem；exact replay 只核對代數；native／逐頁 QA／isolated replay 另記於 0.03 receipt |

ResearchGate 元頁面與 PDF 摘要不是同一版本。本輪透過公開 web readback 查到：元摘要仍聲稱「恰好兩個 immersion singularities」、功率導出曲面與 condensed/Weil 橋；頁面列 v11、v12，而 v12 全文已撤換一部分 condensed/Weil 語句，並加入後期 Green／Dirac 宣稱。此工具結果是搜尋索引／web 抽取，**沒有新下載 PDF byte hash 或登入平台回讀**。數學稽核仍以本地 hash-locked v12 為準。公開 metadata 的同步屬另需作者確認的外部操作。

來源：[ResearchGate 元頁面](https://www.researchgate.net/publication/408878000_Geometric_Realization_of_Bicomplex_Signal_Manifolds_Spectral_Stability_Whitney_Folds_and_Monodromy_of_the_Observation_Field)。完整逐項原文、頁碼、proof route、Lean 與義務在 `claims/CLAIM_MAP.json`；66 個歷史區塊不刪改，以 continuation overlay 顯示最新證據。

## 原創性判定

| 內容 | 判定 | 可使用的貢獻措辭與限制 |
| --- | --- | --- |
| BC idempotent coordinates、unit-power sphere、Bloch sphere | 已知結構 | BC ≅ C⊕C；本稿證明未使用不可由兩個複數分量替代的特殊乘法。不能說它發現了新的 bicomplex 幾何定律 |
| Whitney recognition、singular quasi-Euclidean coordinates | 已有主要文獻 | Grieser 2002 已分析 Whitney normalization metric。0.02 的明示常數是獨立推導，不是新方法的優先權證明 |
| point restriction、boundary triple、Weyl／Krein resolvent、U(2) | 已有一般定理 | Posilicano 2003/2004 的 graph-bounded、surjective τ 與 dense kernel 框架直接涵蓋這類構造。應寫「驗證實際模型的假設並應用」，不能寫「創立 U(2) 擴張理論」 |
| planar Green 存在、logarithmic bounds、reciprocity；Markov uniqueness | 已有研究領域 | Taylor–Kim–Brown 2012 Theorem 4.1 處理平面 divergence systems 的 Green／log bounds／reciprocity；Robinson–Sikora 2009/2011 處理 degenerate elliptic Markov uniqueness。此處新工作是實際 Whitney metric 與所指定 A 的適用性與係數證明 |
| Mellin half-density、Hardy evaluation、Haar orthogonality、finite exponential independence、A3 Milnor／MHS、Dirichlet form／Krein buckling | 標準理論或明示模型的計算 | 保留為工具、教學推導與模型比較；單獨不構成新的統一理論。修正 T>0 independence 比舊充分界限更強，但有限 distinct exponentials 的結論本身是經典事實 |
| 實際 S 的五點 atlas、dipole／winding、cusp 等 | 具體模型的成果，部分重用作者前序工作 | Ruled／Stokes 已處理同一 S／field／charts，必須標示重用與新增義務；不能把同一結果重新計數為独立 Bicomplex 發現。此次不判定各公開版本的優先日期 |
| 0.02 明示 Φ、固定 P、endpoint obstruction、three-Hermitian-observable no-go | 具體構造與模型限制；候選貢獻 | 正文已證。是否已有相同構造／no-go 仍未由系統性文獻查找排除。新模型的附加 phase coupling 要明示 |
| 0.03 實際 Euclidean Whitney germ 的 a−I=O(ρ¹ᐟ²)、extrinsic-radius log coefficient、完整 A* 漸近與後果 | 可提出的候選分析貢獻 | 已有正文證明；不以一般 Green／extension 框架為新。不宣稱 first-ever；Grieser 全文尚未取得，不能宣稱已排除其中更強的估計 |

直接查核的 primary sources：

- [Grieser, publisher record](https://www.math.uh.edu/~hjm/Vol28-4.html)：741–752；indexed primary PDF §1 明示 Whitney metric resolution。publisher PDF 403，Citeseer direct retrieval 404，尚未完成全文比較。
- [Posilicano, primary full text](https://arxiv.org/html/math/0309077)：§3 τ hypotheses、Theorem 3.1、Corollary 3.2；§2 Theorem 2.2。符號／resolvent sign convention需轉換，0.02 已自行證明其使用的慣例。
- [Taylor–Kim–Brown, primary full text](https://arxiv.org/html/1205.1089)：Theorem 4.1 給 bounded Lipschitz planar domain、bounded ellipticity／coercivity、mixed boundary 的存在、log bound、off-pole Hölder 與 reciprocity。這不直接給本稿的 extrinsic-radius coefficient 或處理整個 degenerate global source；本輪獨立證明所需局部結果。
- [Simon, author lecture notes](https://math.stanford.edu/~lms/lecs-on-pde.pdf)：2015-03-05，Lecture 18 Theorems 2–3，printed pp.212–216；n=2、F₀∈L³、f₀∈L²⊂L³ᐟ²。PDF SHA-256 `e1f1b2f51d2558aa467a8c064fe82e7b9e157ad28c9c75f01e38596cde656870`。已核對定理與證明段，不把 scalar regularity 搬成 Dirac-system 定理。
- [Robinson–Sikora, primary abstract](https://arxiv.org/abs/0912.4536)、[publisher metadata](https://journals.sns.it/index.php/annaliscienze/article/view/245)：compact core on open Ω、W¹,∞ coefficients、boundary capacity criterion。此 abstract／metadata 比較足以辨認已有研究，**未稱本輪讀完全文或直接引用其定理到 A**。

本輪查找包括 Whitney umbrella / cross-cap + Green / Laplacian / point interactions、singular metrics、two-dimensional divergence Green functions，以及 point restrictions／boundary triples／Markov uniqueness。未搜得直接完全相同結果並不證明不存在。原創性目前可以「模型與實際估計的候選貢獻」定位；首次發表優先權仍未確立。

## 與祖本及 v12 相比，追回了什麼

| 歷史宣稱／缺口 | 新版實際結果 | 仍有的差距 |
| --- | --- | --- |
| 功率 constraint + μ=(|z₁|²,|z₂|²)=(cos t,1−cos t) 導出 S | 0.02 給 Φ 與固定 phase-sensitive quadratic P，證 PΦ=S | 新分量功率為 (1−u,u)，不是祖本 moment assignment。祖本模型的相容 lift／readout 與為何選此耦合仍缺；不能說歷史導出已恢復 |
| singularity 只由 c²−3c+1 決定、只列兩 lateral 點（或另列一 boundary 點） | v13 completed atlas 列全五點；interior dipole 恰好兩點；各實際 germ 假設核對 | 全域 rank-loss 與 observation zeros 不得混為同一集合。舊「恰兩 immersion singularities」已修正 |
| Mellin formal-adjoint 用語與 introduction 的 weighted measure 易混用；**v12 7.2/7.3 已正確寫出** half-line indices (1,0)、無 SA extension及 generalized-eigenfunction scope | v13 補明 Hilbert measure、實際 Sobolev closure／adjoint domains與 boundary terms，保留 v12 已正確的 half-line/full-line 區別 | 不能把 v12 已排除的 half-line 自伴性當作待追回宣稱。Full-line 是另一個 domain；σ=1/2 與 measure 有關 |
| finite-time independence 只在 Tδ>2(M−1) 證 | v13 對每個 T>0、有限 distinct frequencies 證 independence；舊 threshold 保留作 conditioning bound | 這是更強、正確的數學陳述，不代表新發現了 exponentials 的線性獨立性 |
| Hmin=graph closure Cc∞(interior) 有 (2,2)、所有擴張 U(2)、Krein kernel=2 | 舊 H₀ 被無窮外邊界 harmonic modes 反證；0.02 固定 HF outer Dirichlet，再限制 τ=0，得到 A 的 (2,2)、U(2)、rank-two resolvent 與 Krein kernel=2 | 不是同一 minimum；每處摘要／定義／定理必须明示 operator replacement。H₀ 的 reduced positive Krein/buckling 結果另有適用證明 |
| 實際曲面 Green −log ρe/(2π)、A* expansion、2π pairing 只由 model/front-seam 推估 | 0.03 actual-germ arclength coordinate；a−I=O(ρ¹ᐟ²)，誤差源 L³/L²，外部 Hölder regularity；辨認 canonical resolvent Gη；寫出所有 A* 的 ℓ log ρe+b+O(ρe^β) | 已追回指定 A 的 scalar 結論。沒有給 Bη 的封閉數值公式，也不聲稱證完舊 full front/seam weighted parametrix |
| Markov uniqueness / no-running-scale 由有限邊界平面推論 | 0.03 先證實際全域 domain expansion，再以 bounded resolvent 證 A 的 Markov 唯一性；幾何 coefficient map 下證共同 reference-length invariant plane 唯一 | 此前提為固定 outer Dirichlet。Reference-length change 是記號／邊界規約，不是實際 surface dilation 或物理 RG law |
| zero-energy Green matrix 有 equal diagonals；scalar log channel sheet-even | 0.03 由實際 S(−t,u)=J S(t,u) 的 Euclidean isometry 證 B₀ equal diagonals；由相同 image radius 證 paired branches 的 limiting scalar coefficients even | Global reflection 交换兩 poles，local sheet exchange 是另一回事。沒有 full Green function 的 local deck invariance，沒有 canonical derived sheaf→operator bridge |
| actual Dirac chiral quotient／phase-to-Pin action 由 exact cone 與有限 Clifford 計算移植 | 保留 exact cone 與 regular-cut conditional results；明示实际 Lp curvature、Z4／norm／commutator 結果 | 此主線仍缺 actual singular domains／overlaps／fiber transmission。Scalar 0.03 不會自动補上 |
| condensed／Weil、capacity、mass、chirality 等整合 | 精確分開 constructible sheaf、chosen complex A3/MHS、Hardy/Haar 與各種 no-go | 缺獨立 realization theory／noise-resource model／physical dynamics 的橋。不能以 √5、維數一致、2π 或 4π 恢復這些認同 |

因此「新版甚至更厲害嗎」需要兩個尺度：就有效證明、明確 domain、可核查性與部分更強陳述而言，是；就所有歷史宣稱都成立、特殊 bicomplex 必要性或首次原創性而言，尚不能如此說。無效宣稱數量不應成為追趕目標。

也不能把所有正確的 scope limit 歸功於此次修訂：v12 7.2/7.3 已區分 half-line／full-line 與 generalized frequencies；5.5 已給 Shannon-capacity no-go；8.25、9.1、9.5 已分別限制 ambient SU2 invariance、無尺度 mass ratio 與非零 eta。新版保留這些結果並補精確對象／domain，並不是這輪才發現或才撤回全部物理／算術類比。元頁面的舊摘要比 v12 內文落後，兩者尤其不能混為同一「原版」。

## 本輪關閉的 scalar 缺口與證明邊界

新 0.03 的 proof routes：

| 命題 | 路徑 | 證據類型 |
| --- | --- | --- |
| 實際 smooth Euclidean Whitney germ 的 arclength homeomorphism、C¹ punctured inverse、tensor／density／radius estimates | `lem:arclength` | Taylor bounds、chain rule、dominated differentiation 的正文；matrix identity 有 exact check |
| canonical Gη 的 universal −1/(2π) log ρe 與 Hölder regular part；Bη real symmetric | `thm:log` | 正文 weak equation／Lax–Milgram／Caccioppoli／resolvent identification，external scalar Hölder theorem；不是 numerical fit 或 Lean proof |
| 所有 Dom A* 的 unique bounded coefficient maps、surjectivity、2π Green form、actual maximal isotropic U(2) domains | `thm:boundary` | 0.02 resolvent decomposition + 新 actual expansion；抽象分類非原創框架 |
| actual global reflection 的 symmetric Bη／B₀ | `cor:reflection` | actual Euclidean isometry；S symmetry identity exact replay |
| 指定 A 的唯一 submarkovian extension HF | `cor:markov` | normal contractions、semigroup resolvent boundedness、log obstruction 的正文 |
| 唯一 common-reference-length invariant plane | `cor:scale` | actual boundary maps + 有限 isotropic-plane 論證；不稱 physical scaling law |
| 同一 pole 兩個 source branches 的 asymptotically even coefficients | `cor:parity` | actual equal image radius 與 Hölder remainder；不假設 deck metric isometry |

這些結果補上 0.02 的 log normalization／geometric pairing／scalar Markov／coefficient parity，並給明確外邊界下的兩點分類。它們不補回舊 H₀ 的假結論，不證明每個 front/seam normal family 漸近、actual spinorial trace 或 sheaf functor。新 note 未增加 Lean theorem；33 own 的 scope 與 proof inputs保持。

## 目前確定尚缺的數學義務

| 義務 | 具體缺什麼／目前證據 | 關閉判準 |
| --- | --- | --- |
| 歷史 moment model 的幾何導出與 canonicity | **0.04 已判定**：祖本 powers 下沿 C₀ real-analytic 的 readout 不存在；C^∞ readout 存在但非 canonical；半 source 有 analytic、無 affine readout。μ 本身仍不決定 u／phases／P | 剩餘只有選擇問題：若要歷史模型，須明示接受非 analytic switching readout、半 source 或改 powers（0.02），並說明選擇原則；D₊ 上 quadratic readout 是否存在仍 open |
| actual twisted Dirac object 與 graph domains（v12 8.21） | exact cone 的 link modes 不等於 actual Whitney graph quotient；weight-zero partition commutator 不能直接吸收；curvature Lp 只是 input | 指定 spin structure、flat sign line、Hilbert density、closed operator／adjoint domains；證 singular conformal/gauge 與重疊估計、parametrix remainders、surjective graph traces與確切 channel dimensions |
| actual phase／Pin transmission（8.22–8.24） | chosen Clifford metric／norm／Z4 可核算；phase line與normalization deck line不是既證相同 bundle；singular cut traces不存在現成證明 | 定義實際 cut trace spaces、fiber map、conormal Clifford compatibility；證 graph continuity／maximality／adjoint-domain equality；如果第一階 obstruction 排除則保留 no-go，不強造 identification |
| normalization/sheaf→operator 的新 bridge（8.18–8.19） | ordinary scalar support／odd-even obstruction已有；0.03補actual coefficient parity；維數一致仍不足 | 另供 sign-twisted／form／spinorial target 和實際 morphism，證 category／parity／analytic domain 相容。這是新研究，非現稿 scalar theorem 的欠證 |
| arithmetic／condensed／physical realization | 8.30 是「已供 realization theory」的條件命題；real source不自帶Deligne/Weil/clock/noise model | 寫出 objects/maps/functors 或物理模型並核對定理假設；在此前維持 scoped model/observation，不宣稱橋已存在 |
| 原創性優先權 | 命題已證不等於文獻首創；Grieser全文尚無法讀取，point-interaction／singular-metric比較未完整 | 取得直接相關全文並逐項比 hypotheses/conclusions；保持 candidate-contribution 措辭直到證據足夠 |

另有兩項完成度差距，應與「數學欠證」分開：新 PDE／operator 結果尚未 Lean 形式化；v13、0.02、0.03 仍是分立本地稿，歷史正文中的 conditional/open 語句需在未來整合稿統一更新。此輪保留各 sealed checkpoint；新 proof note／audit 作最新閱讀入口。新 0.03 PDF 的本地驗收不等於新整合全文或公開版本已驗收。

## 66 個具名區塊的比較範圍

下表範圍無重疊且涵蓋 `CLAIM_MAP.json` 的全部 66 個區塊（包括 remark）。每項原文與早期 proof route 留在原 inventory；0.02／0.03 overlay 提供最新狀態，不能把表內 v13 的歷史 open label當作今天的結果。

| 區塊範圍 | 原創性與差距的處理位置 |
| --- | --- |
| 3.1 | 新 realization／歷史 powers 不一致／導出未追回 |
| 3.2–3.3 | measure/domain 修正；resolution cost 是定義非channel模型 |
| 4.1–4.4 | actual dipole／lifting；全域 rank與時間／spin解讀分開 |
| 5.1–5.2 | monic polynomial normalization；√5 計算不是新動力法則 |
| 5.3–5.5 | standard sublevel proofs、density條件、Shannon no-go |
| 5.6–5.7 | explicit complexification、standard Milnor theorem hypotheses |
| 5.8–5.11 | actual link／weighted phase model、不同figure-eight不認同 |
| 5.12–5.13 | actual cusp computation及其geometric bridge no-go |
| 6.1–6.2 | all-five atlas、actual recognition；前序幾何依賴 |
| 7.1–7.8 | Mellin closure／no SA half-line；Gram for all T>0、standard finite bounds |
| 8.1–8.5 | standard Fourier／Hardy／Haar；no unprovided arithmetic bridge |
| 8.6–8.7 | ordinary constructible defect／structure-sheaf scope |
| 8.8–8.10 | actual fold／completed source／exact Galerkin，不能代替PDE |
| 8.11–8.12 | actual capacity／compactness；0.02 point traces；0.03 asymptotic metric；不宣稱full old front/seam parametrix |
| 8.13–8.17 | H₀反例 vs corrected A；0.03 coefficients／Markov／reflection；classical Krein/buckling |
| 8.18–8.19 | scalar support及odd-even no-go；actual limiting parity現已補；新bridge未供 |
| 8.20–8.24 | exact cone／finite Clifford／regular-cut theorem保留；actual singular Dirac／phase-Pin仍缺 |
| 8.25–8.30 | ambient SU2 no-go、chosen MHS／conditional realization theory |
| 9.1–9.6 | dimensional/Poisson/eta scope；physicalinterpretations不升格 |

目前應以實際 Whitney scalar theorem 作可評審的分析主線，將 realization/no-go 作模型章，將 Dirac／Pin 作明確的未完成研究。下一個真正需要證明的原子任務是 actual twisted Dirac 的閉算子與 singular graph-domain estimates；重新堆疊標準框架或恢復已被反證的詞句都不會關閉缺口。
