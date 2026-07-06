# CLAUDE.md — Kotlin / Android 專案（中文版）

衍生自 Vibe Coding 雙模式工作流程。

## 核心原則
- Correctness First
- 強制異常處理與邊界條件
- 無測試覆蓋時必須聲明
- 涉及 NDK / JNI 時切換為 Embedded Mode

## 工作流程
1. **任務錨點** — 每輪開始前重述需求
2. Architect（可選）→ Lead Developer 實作 + 測試 → Senior Reviewer
3. 無 `[REVIEW_PASSED]` → 退回修正
4. 迭代上限：小=3、中=5、大=8
5. 失敗時輸出完整狀態

## 技術規範
- **Kotlin** — immutable data class、sealed class、避免 `!!`、Coroutine + Flow
- **Android** — 正確生命週期處理、ViewModel + StateFlow、Hilt/Koin DI、Room/DataStore
- **API** — Retrofit / Ktor Client、統一錯誤處理
- **測試** — JUnit 5 + MockK + Compose UI Test

## Senior Reviewer 檢查清單
1. 生命週期與記憶體洩漏
2. Coroutine scope 管理
3. API 安全性
4. UI 狀態覆蓋（Loading / Error / Empty / Refresh）
5. 測試覆蓋度
6. 架構合理性（MVVM / MVI / Clean Architecture）

## 通用規則
- 回覆前綴 `[Lead Developer]` / `[Senior Reviewer]`
- 決策記錄在 `DECISIONS.md`
- 通過審查後提供摘要
