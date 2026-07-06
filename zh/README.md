# Claude Config（中文版）

依專案類型分類的結構化 CLAUDE.md 模板。預設為英文，中文版收錄於 [`zh/`](./) 目錄。

## 結構

```
claude-config/
├── CLAUDE.md                    # 主模板 — 雙模式（General + Embedded）
├── variants/                    # 專案層級模板（下載到專案根目錄）
│   ├── embedded-c.md            # C / Embedded / Firmware 專案
│   ├── kotlin-android.md        # Kotlin / Android 專案
│   ├── python-ai-agent.md       # Python AI / Agent / Data 專案
│   └── web-typescript.md        # TypeScript / Full-stack 專案
├── zh/                          # 中文版
│   ├── CLAUDE.md
│   └── variants/
├── decisions/
│   └── DECISIONS.md             # 決策記錄範本
└── scripts/
    └── setup.sh                 # 一鍵設定（支援 --global / --lang zh）
```

## 快速開始

### 全域設定 — 預設工作流程

```bash
curl -o ~/.claude/CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/zh/CLAUDE.md
```

### 專案設定 — 每個專案各自一份（可 commit）

```bash
# 在專案根目錄執行
curl -o CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/zh/variants/python-ai-agent.md
```

### 自動偵測

```bash
# 專案模式（下載到 ./CLAUDE.md）
bash <(curl -s https://raw.githubusercontent.com/ian0318git/claude-config/main/scripts/setup.sh) --lang zh

# 全域模式
bash <(curl -s https://raw.githubusercontent.com/ian0318git/claude-config/main/scripts/setup.sh) --global --lang zh
```

## 範圍說明

| 檔案 | 範圍 | 下載位置 | 用途 |
|------|------|---------|------|
| `zh/CLAUDE.md` | 全域 | `~/.claude/` | 所有專案的預設工作流程 |
| `zh/variants/*.md` | 專案 | 專案根目錄 (`./CLAUDE.md`) | 各專案獨立覆寫，可 commit |

Claude Code 優先讀取 `~/.claude/CLAUDE.md`，再檢查專案目錄下的 `CLAUDE.md` 作為覆寫。

---

## 設計概念

全域 `CLAUDE.md` 的每一個設計決策都有其背後的理由。以下是完整的設計思維。

### 1. 雙模式架構（General + Embedded）

一份模板必須同時服務兩個本質不同的領域：

- **General Mode** — Python、TypeScript、Web、AI Agent 專案。關注 Async I/O、型別安全、API 合約、錯誤恢復流程。
- **Embedded Mode** — C/C++、韌體、硬體專案。關注記憶體安全、中斷延遲、暫存器層級正確性、即時性約束。

與其維護兩份各自漂移的設定檔，不如用一份檔案加模式切換，將共享的工作流程（錨點、審查管線、迭代限制）放在同一處，只在領域特定的規則與檢查清單處分歧。模式可以透過副檔名自動偵測（`.c`/`.cpp`/`.h` → Embedded），也可以在 prompt 開頭加上「使用 Embedded Mode」手動切換。

### 2. 角色分層管線與溫度控制

模板將 Claude 視為多個不同角色，而非單一 monolithic 代理：

| 角色 | 職責 | 溫度建議 |
|------|------|---------|
| **Architect** | 大型任務前產出架構設計 | N/A（可選角色） |
| **Lead Developer** | 實作、測試、提交 | 正常生成 |
| **Senior Reviewer** | 審查輸出、把關品質閘門 | 0.0–0.1（批判模式） |

Senior Reviewer 被刻意限制在低溫度，且**不得與 Lead Developer 使用相同的 model string**。這防止同一個模型為自己的產出背書。當技術上無法切換模型時，審查必須引用測試結果與靜態分析報告，而非主觀語感。每條意見都需標註嚴重程度。

這模仿了人類的 code review 文化：審查者的激勵機制是**找到問題**，而不是**確認工作沒問題**。

### 3. 任務錨點機制

每輪工作開始前，Lead Developer 必須用 1–2 句話重述原始需求。這防止**目標漂移** — 也就是 LLM 在連續調用中逐漸重新解釋或縮小原始需求的現象 — 並確保當 Reviewer 退回任務時，雙方對原始需求的理解一致。

### 4. 迭代上限與熔斷機制

LLM 工作階段可能陷入 fix-review-fix 的無限迴圈。模板依任務規模設定迭代上限：

| 規模 | 最大輪數 | 回報頻率 |
|------|---------|---------|
| 小型 | 3 輪 | — |
| 中型 | 5 輪 | — |
| 大型 | 8 輪 | 每 3 輪 |

到達上限時，程序停止並輸出完整狀態給人類。這是一個**熔斷機制** — 防止浪費 token，並通知需要人類判斷介入。

### 5. 無測試聲明

AI 輔助開發最常見的失敗模式是未經實證就憑「看起來對」放行。模板要求：

> 若專案無自動化測試，Lead Developer **必須**聲明「無測試覆蓋」並說明手動驗證方式，不得跳過驗證直接宣稱完成。

這強制了透明性。有測試時，Senior Reviewer 檢查它們；沒有測試時，缺口被記錄下來，而非默默忽略。

### 6. Correctness First

模板的每個章節都服從這個原則。程式碼以功能正確與長期穩定為優先，而非交付速度。錯誤路徑被明確處理、邊界條件被列舉、每個模式特定的檢查清單（爬蟲穩定性、記憶體安全、生命週期正確性）的存在，都是為了捕捉那種乍看無害、上線卻致命的錯誤。

---

## 授權

MIT
