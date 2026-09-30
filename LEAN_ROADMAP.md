# Lean 完成與後續研究路線

更新日期：2026-09-30

## 目前基線

`companions/lean/stokes-caustic-v5/` 使用 Lean `4.33.1`、Mathlib `v4.33.1`，現有 modules 已編譯且無 `sorry`。已涵蓋：

- exact polynomial definitions 與 identities；
- cleared-denominator Jacobian numerator reduction；
- rational branch 與 endpoint identities；
- `pB` 唯一根的固定實區間證書；
- `R7`、`B`、`Q17` 的 exact sign barriers；
- 正 `Q` chart 上的 real observation map、分母正性與 Fréchet differentiability。
- explicit Fréchet derivative 與 exact Jacobian factorization；
- ordinary symmetry/rational branches 的 rank-one kernel 與 transversality；
- exceptional common point 的 transversality failure；
- plane-to-plane Whitney-fold Jacobian criterion 及兩 ordinary branches 的證書。
- 兩 ordinary branches 的實際 `C∞` source／target local charts 與雙側 smooth inverses，將 map 化為 `(x,y^2)`；
- 整個物理臨界集合／區間、exceptional source tangents、discriminant cubic contact error；
- 實際球面 radial image 的 unit length、mirror symmetry、共同端點、非零起點導數、嚴格第三座標單調性與唯一邊界最大值。
- 全文 Taylor／Big-O remainder、exceptional no-fold obstruction／ordinary four-jet／rescaling、固定 Sturm variations、輔助曲線 quintic／最大值與精確有理數值界。

全文逐項覆蓋在 `companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md`；258 個公開定理的 audit/build/status 與 proof-hole scan 由 `verify_lean.py` 重播。已發布 v0.02／v0.03 保持不可變；新成果另封裝 v0.04。全文所列 open germ classification／versal unfolding 仍為開放問題。

## 第一優先：完成 Stokes v5 的幾何橋

| 里程碑 | 狀態 | 下一個可證命題 | 驗證／落點 |
| --- | --- | --- | --- |
| L0. Observation map 與可微性 | `LEAN-PASSED` | 已完成 | `StokesV5/ObservationMap.lean`; `LEAN_STATUS.md` |
| L1. Explicit derivative | `LEAN-PASSED` | 已完成 | `StokesV5/ObservationMap.lean` |
| L2. Jacobian factorization | `LEAN-PASSED` | 已完成 | `StokesV5/ObservationMap.lean` |
| L3. Ordinary-branch hypotheses | `LEAN-PASSED` | 已完成 | `StokesV5/ObservationMap.lean`; `StokesV5/FoldGeometry.lean` |
| L4. Exceptional common point | `LEAN-PASSED` | 已證 `(0,0)` 不滿足 fold criterion | `StokesV5/ObservationMap.lean`; `StokesV5/WhitneyFold.lean` |
| L5. Plane-to-plane fold criterion | `LEAN-PASSED / CRITERION LEVEL` | 已完成；更強座標結果見 L7 | `StokesV5/WhitneyFold.lean` |
| L6. v0.03 release | `PUBLISHED / VERIFIED` | 保留原 criterion-level scope；不追溯加入後續定理 | Zenodo version DOI `10.5281/zenodo.22735974`; concept DOI `10.5281/zenodo.22726976`; `EXTERNAL_ACTIONS.md`; v0.02 未改寫 |
| L7. Actual local normal forms | `LEAN-PASSED / WORKING SOURCE` | 已構造兩分支的 `(x,y^2)` source／target charts 與雙側局部 smooth inverses | `StokesV5/LocalNormalForm.lean`; `StokesV5/RationalCoordinates.lean`; `StokesV5/RationalNormalForm.lean` |
| L8. Physical locus / discriminant / radial image | `LEAN-PASSED / WORKING SOURCE` | 已完成 theorem map 列出的主要幾何結論；後續發布為獨立作業 | `StokesV5/PhysicalLocus.lean`; `StokesV5/Discriminant.lean`; `StokesV5/RadialMonotonicity.lean`; `StokesV5/RadialGeometry.lean`; `COORDINATE_PROOFS.md` |
| L9. Full asserted manuscript coverage | `LEAN-PASSED / WORKING SOURCE` | 逐項涵蓋定理、展開、four-jet、輔助 quintic、Sturm 表與數值界；不包含原文的開放研究問題 | `FULL_PAPER_COVERAGE.md`; `verify_lean.py` |
| L10. v0.04 release | `PUBLISHED / API+DOWNLOAD VERIFIED` | GitHub／Zenodo 已公開；新 software DOI `10.5281/zenodo.23057630`、同 concept；公開三檔 SHA-256 一致；僅 `doi.org` 解析尚待回讀 | `releases/candidates/stokes-caustic-v5-v0.04-publication.md`; `EXTERNAL_ACTIONS.md` |

L1–L10 證明／封存／兩平台公開發布已完成；v0.04 software DOI 為 `10.5281/zenodo.23057630`，v0.03 DOI `10.5281/zenodo.22735974` 與 concept DOI `10.5281/zenodo.22726976` 不變。完整重播與公開 API／下載讀回均通過；Zenodo 新版已公開，僅新 DOI 的 `doi.org` 解析尚待回讀，並非登入或發布 blocker。

## 第二優先：下一批 Lean 候選

1. **Ruled surface v4 的修正版有限核心。** 只有在邊界 atlas／`Q>0` 範圍與 Theorem 5.3 的新增假設確定後才開始；Lean target 是修正後定理，不是把已知錯誤原文形式化。
2. **Bicomplex v12 的有限模組。** 從多項式 identity、`A3` germ、有限 Gram matrix、Poisson/eta pairing 開始；Green/Dirac/Pin/sheaf 與 operator domains 先留在 specialist audit。
3. **Paper III 的有限維 marked spectral-floor core。** 先將 marking、state、landing、source maps 全部做成顯式輸入，再形式化 stable-core closure 與 finite spectral avoidance；不得把 marking 從型別或假設中消去。
4. **Paper I 的固定有限模型。** 只挑最小、可重播的 exact-rational theorem；63 頁全文形式化不是近期里程碑。

## filtered-complex／Diophantine 橋的 Lean 邊界

這是獨立研究線。第一個 Lean artifact 應是來源類別、兩側 metric 與候選映射的精確定義，加上一個有限 toy model；在紙筆／symbolic 層證明雙 Lipschitz 主命題之前，不建立空泛的一般 theorem，也不讓它阻塞 Stokes v5 L1–L6。

## 每次 Lean 變更的通過條件

從 `companions/lean/stokes-caustic-v5/` 執行：

```bash
python3 -B verify_lean.py
```

完成一個里程碑後，同步更新：

- `companions/lean/stokes-caustic-v5/LEAN_STATUS.md`
- `companions/lean/stokes-caustic-v5/RESEARCH_STATUS.md`
- `companions/lean/stokes-caustic-v5/GEOMETRIC_CLOSURE_BOUNDARY.md`
- `releases/current/stokes-caustic-v5/THEOREM_MAP.md`（作為 v0.02 基線；準備新 release 時複製到新版本後再更新，不改寫 v0.02）
- 根目錄 `RESEARCH_BOARD.md`
