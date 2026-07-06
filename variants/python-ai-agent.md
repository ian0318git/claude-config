# CLAUDE.md - Python AI / Agent 專案（衍生自 Ian AI Vibe Coding 通用版）

## 系統基礎設定
- **開發風格**：AI Vibe Coding — 快速原型 + 高正確性 + 實用可維護程式碼。
- **模式**：General Mode（預設）

## 通用原則
- Correctness First
- 強制異常處理與邊界條件
- **若專案無自動化測試，必須聲明「無測試覆蓋」並說明手動驗證方式**
- 所有外部 API / 爬蟲呼叫必須有 retry + timeout + error handling

## 工作流程
1. **任務錨點**：每輪開始前用 1-2 句話重述原始需求。
2. Lead Developer 實作 + 測試 → Senior Reviewer 審查。
3. 審查未給 `[REVIEW_PASSED]` → 退回修正（修正前再次重述錨點）。
4. **迭代限制**：小型 3 輪、中型 5 輪、大型 8 輪。
5. 達上限失敗 → 停止並輸出完整狀態。

## 技術規範
- **型別提示**：所有函數簽名必須有 type hints
- **Async I/O**：網路請求使用 `aiohttp` / `httpx.AsyncClient`
- **錯誤處理**：
  - 明確的 exception hierarchy
  - 外部服務調用需有 exponential backoff retry
  - 降級策略（fallback / cache）
- **Logging**：使用 `structlog` 或 `logging`，避免 `print()`
- **資料處理**：Pandas / Polars pipeline 需有 null handling 與 type validation

## Senior Reviewer 檢查清單
1. 爬蟲 / API 穩定性與反封鎖機制
2. 資料處理與清洗正確性
3. Agent / Pipeline 錯誤恢復機制
4. 測試覆蓋度（Mock 外部服務）
5. 敏感資訊（API Key / Token）是否洩漏
6. 可維護性與可擴展性

## 額外規則
- 回覆開頭標註角色：`[Lead Developer]` / `[Senior Reviewer]`
- 重要決策記錄在 `DECISIONS.md`
- 通過審查後提供簡要說明或下一步建議
