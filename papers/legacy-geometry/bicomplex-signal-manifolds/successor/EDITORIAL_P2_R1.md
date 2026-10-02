# 論文二編輯審閱 r1

2026-10-02。依作者方針（振奮但謙虛、不防禦），由 Claude 自行審閱並決定。結果：9 頁第一版變成 9 頁 r1，hash 綁定在 `qa_paper2/VISUAL_QA.json`。

## 證明可讀性與內容補強

| 位置 | 問題 | r1 的處理 |
| --- | --- | --- |
| Lemma 3.1 | 為何 ∂_y 自動落在 ker df(0)，沒有寫出來 | 補一句：df(0) 的像是第一軸，所以 ker dx(0)=ker df(0) |
| Lemma 3.2 後 | 一般公式缺具體例子 | 新增 Remark 3.3：標準 cross-cap 的 arclength 座標閉式 V=(y/2)√(x²+4y²)+(x²/4)arsinh(2y/\|x\|)，V(0,y)=y\|y\|；並解釋兩 sheet 沿雙射線反向展開。verifier 精確核對 |
| Thm 4.2 證明 | 內部點與邊界點所用的 sector 沒有區分 | 明寫內部點用整個圓盤，邊界點用 Definition 2.1 的 sector |
| Thm 5.2 證明 | Dom A* 的分解只引框架 | 補 u=R_η(A*−η)φ、φ−u∈ker(A*−η)=G_ηℂᵏ，以及直和的理由 |
| 新 Corollary 5.3 | — | 每個延拓都 semibounded，且 \|N_H−N_{H_F}\|≤k，由 finite rank 加上 Weyl interlacing。這也讓開放問題中的 Weyl law 有了實質依據 |
| Thm 6.1 後 | 和錐點理論的關係只在引言提到 | 新增 Remark 6.2：由 Lemma 3.2，半徑 r 的圓長為 2πr(1+o(1))，即總角 2π，是只有一個對數通道的臨界情形；Whitney 不變量只進入 B_η |
| 引言 | 「gives a complete answer」過強 | 改為「The answer turns out to be simple: for the scalar Laplacian, a cross-cap behaves like a regular point」 |
| Evidence 附錄 | 條列冗長，最後一頁只剩參考文獻 | 改為一段文字；參考文獻改用 footnotesize，維持 9 頁 |

## 維持不變的判斷

- 主定理的證明長度不擴寫。0.02／0.03 已有完整推導，論文二的版本為一般情形改寫，每一步都可追溯。
- 不加入未經驗證的新宣稱（例如 Weyl law、Roman surface 參數的數值），保留為開放問題。

## 下一步

作者通讀論文一 r1 與論文二 r1，接著決定公開範圍與時程。
