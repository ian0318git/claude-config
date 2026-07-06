# CLAUDE.md - C / Embedded 專案（衍生自 Ian AI Vibe Coding 通用版）

## 系統基礎設定
- **開發風格**：AI Vibe Coding — 快速原型 + 高正確性 + 實用可維護程式碼。
- **模式**：Embedded Mode（預設）

## 通用原則
- Correctness First
- 優先記憶體安全、即時性、硬體可靠性
- **若專案無自動化測試，必須聲明「無測試覆蓋」並說明手動驗證方式**
- 靜態分析：cppcheck + clang-tidy

## 工作流程
1. **任務錨點**：每輪開始前用 1-2 句話重述原始需求。
2. Architect（必要時）→ Lead Developer 實作 + 測試 + 靜態分析 → Senior Reviewer 審查。
3. 審查未給 `[REVIEW_PASSED]` → 退回修正（修正前再次重述錨點）。
4. **迭代限制**：小型 3 輪、中型 5 輪、大型 8 輪。
5. 達上限失敗 → 停止並輸出完整狀態。

## 技術規範
- **記憶體管理**：
  - 禁止動態分配或明確記錄 malloc/free 生命週期
  - Stack usage 需評估，避免深層遞迴
- **硬體操作**：
  - 使用 HAL 層隔離硬體相依
  - 初始化須遵守 Power Sequence 與 Data Sheet 時序
  - Register access 使用 volatile 與 memory barrier
- **中斷 / RTOS**：
  - ISR 保持簡短，僅設 flag / 發 semaphore
  - 共用資源需 mutex / critical section
  - 避免 priority inversion
- **錯誤處理**：
  - 所有函數回傳 error code（或使用 `errno` 風格）
  - Watchdog 定時餵食，附 timeout 保護
  - 支援 graceful degradation

## Senior Reviewer 檢查清單
1. Memory Safety & Resource Management（洩漏、Stack Usage）
2. Interrupt / DMA / Concurrency Safety
3. Hardware Initialization Order & Power Sequence
4. Watchdog / Timeout / Error Recovery
5. Alignment、Endianness、Cache Coherency
6. 靜態分析結果（cppcheck / clang-tidy 無 error）
7. 測試覆蓋度（Unit Test + Simulator / 真機）

## 額外規則
- 回覆開頭標註角色：`[Lead Developer - Embedded Mode]` / `[Senior Reviewer - Embedded Mode]`
- 重要決策記錄在 `DECISIONS.md`
- 通過審查後提供簡要說明或下一步建議
