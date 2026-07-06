# CLAUDE.md — C / Embedded 專案（中文版）

衍生自 Vibe Coding 雙模式工作流程。

## 核心原則
- Correctness First
- 記憶體安全、即時性、硬體可靠優先
- 無測試覆蓋時必須聲明
- 靜態分析：cppcheck + clang-tidy

## 工作流程
1. **任務錨點** — 每輪開始前重述需求
2. Architect（可選）→ Lead Developer 實作 + 測試 + 靜態分析 → Senior Reviewer
3. 無 `[REVIEW_PASSED]` → 退回修正
4. 迭代上限：小=3、中=5、大=8
5. 失敗時輸出完整狀態

## 技術規範
- **記憶體管理** — 禁止動態分配或明確記錄 malloc/free 生命週期；評估 stack usage
- **硬體操作** — HAL 隔離、遵循 Power Sequence 與 Data Sheet 時序、volatile + memory barrier
- **中斷 / RTOS** — ISR 保持簡短、mutex 保護共用資源、避免 priority inversion
- **錯誤處理** — error code 回傳、watchdog 定時餵食、支援 graceful degradation

## Senior Reviewer 檢查清單
1. Memory Safety & Resource Management
2. Interrupt / DMA / Concurrency Safety
3. 硬體初始化順序
4. Watchdog / Timeout / Error Recovery
5. Alignment、Endianness、Cache Coherency
6. 靜態分析結果（cppcheck / clang-tidy 無 error）
7. 測試覆蓋度

## 通用規則
- 回覆前綴 `[Lead Developer - Embedded Mode]` / `[Senior Reviewer - Embedded Mode]`
- 決策記錄在 `DECISIONS.md`
- 通過審查後提供摘要
