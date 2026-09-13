# Lean 完成與後續研究路線

更新日期：2026-09-13

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

完整聲明與指令在 `companions/lean/stokes-caustic-v5/LEAN_STATUS.md`。已發布的 v0.02 封包保持不可變；新增定理進入工作 source，完成後另發 v0.03 或後續版本。

## 第一優先：完成 Stokes v5 的幾何橋

| 里程碑 | 狀態 | 下一個可證命題 | 驗證／落點 |
| --- | --- | --- | --- |
| L0. Observation map 與可微性 | `LEAN-PASSED` | 已完成 | `StokesV5/ObservationMap.lean`; `LEAN_STATUS.md` |
| L1. Explicit derivative | `LEAN-PASSED` | 已完成 | `StokesV5/ObservationMap.lean` |
| L2. Jacobian factorization | `LEAN-PASSED` | 已完成 | `StokesV5/ObservationMap.lean` |
| L3. Ordinary-branch hypotheses | `LEAN-PASSED` | 已完成 | `StokesV5/ObservationMap.lean`; `StokesV5/FoldGeometry.lean` |
| L4. Exceptional common point | `LEAN-PASSED` | 已證 `(0,0)` 不滿足 fold criterion | `StokesV5/ObservationMap.lean`; `StokesV5/WhitneyFold.lean` |
| L5. Plane-to-plane fold criterion | `LEAN-PASSED / CRITERION LEVEL` | 已定義 intrinsic Jacobian criterion 並套用兩 ordinary branches；未構造 `(x,y^2)` local coordinates | `StokesV5/WhitneyFold.lean` |
| L6. v0.03 release | `CANDIDATE READY / NOT PUBLISHED` | 本地與解壓 replay 已通過；對外發布屬另一步驟 | `releases/candidates/stokes-caustic-v5-v0.03/`; v0.02 未改寫 |

L1–L6 的本地 candidate 階段已完成。下一步只能是經明確授權後對外發布，或另開 coordinate-level local-normal-form 研究線。

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
lake -q build StokesV5
lake -q env lean StokesV5/Status.lean
lake -q env lean StokesV5/Audit.lean
rg -n '^[[:space:]]*sorry\b' StokesV5 StokesV5.lean
```

完成一個里程碑後，同步更新：

- `companions/lean/stokes-caustic-v5/LEAN_STATUS.md`
- `companions/lean/stokes-caustic-v5/RESEARCH_STATUS.md`
- `companions/lean/stokes-caustic-v5/GEOMETRIC_CLOSURE_BOUNDARY.md`
- `releases/current/stokes-caustic-v5/THEOREM_MAP.md`（作為 v0.02 基線；準備新 release 時複製到新版本後再更新，不改寫 v0.02）
- 根目錄 `RESEARCH_BOARD.md`
