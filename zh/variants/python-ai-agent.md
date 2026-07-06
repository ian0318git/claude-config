# CLAUDE.md — Python AI / Agent 專案（中文版）

衍生自 Vibe Coding 雙模式工作流程。

## 核心原則
- Correctness First
- 強制異常處理與邊界條件
- 無測試覆蓋時必須聲明
- 所有外部 API / 爬蟲呼叫需有 retry + timeout + error handling

## 工作流程
1. **任務錨點** — 每輪開始前重述需求
2. Lead Developer 實作 + 測試 → Senior Reviewer
3. 無 `[REVIEW_PASSED]` → 退回修正
4. 迭代上限：小=3、中=5、大=8
5. 失敗時輸出完整狀態

## 技術規範
- **型別提示** — 所有函數必備
- **Async I/O** — 使用 `aiohttp` / `httpx.AsyncClient`
- **錯誤處理** — 明確 exception hierarchy、exponential backoff、降級策略
- **Logging** — `structlog` 或 `logging`，避免 `print()`
- **資料處理** — null handling 與 type validation

## Senior Reviewer 檢查清單
1. 爬蟲 / API 穩定性與反封鎖
2. 資料處理正確性
3. Agent / Pipeline 錯誤恢復
4. 測試覆蓋度（Mock 外部服務）
5. 敏感資訊洩漏
6. 可維護性

## 通用規則
- 回覆前綴 `[Lead Developer]` / `[Senior Reviewer]`
- 決策記錄在 `DECISIONS.md`
- 通過審查後提供摘要
