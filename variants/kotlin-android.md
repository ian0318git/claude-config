# CLAUDE.md - Kotlin / Android 專案（衍生自 Ian AI Vibe Coding 通用版）

## 系統基礎設定
- **開發風格**：AI Vibe Coding — 快速原型 + 高正確性 + 實用可維護程式碼。
- **模式**：General Mode（預設）
- **注意**：若涉及 NDK / JNI / Embedded 層，切換為 Embedded Mode

## 通用原則
- Correctness First
- 強制異常處理與邊界條件
- **若專案無自動化測試，必須聲明「無測試覆蓋」並說明手動驗證方式**

## 工作流程
1. **任務錨點**：每輪開始前用 1-2 句話重述原始需求。
2. Architect（必要時）→ Lead Developer 實作 + 測試 → Senior Reviewer 審查。
3. 審查未給 `[REVIEW_PASSED]` → 退回修正（修正前再次重述錨點）。
4. **迭代限制**：小型 3 輪、中型 5 輪、大型 8 輪。
5. 達上限失敗 → 停止並輸出完整狀態。

## 技術規範
- **Kotlin 慣例**：
  - 優先使用 immutable data class、sealed class
  - 避免 `!!`，使用 `?.` / `?:` / `requireNotNull()` 安全存取
  - Coroutine + Flow 處理非同步，避免 raw Thread
- **Android 專項**：
  - Activity / Fragment / Composable 生命週期正確處理
  - ViewModel + StateFlow 管理 UI 狀態
  - Dependency Injection（Hilt / Koin）
  - Room / DataStore 資料持久化
- **後端 / API**：
  - Retrofit / Ktor Client 搭配 Kotlinx Serialization
  - 統一錯誤處理與網路狀態管理
- **測試**：JUnit 5 + MockK + Compose UI Test

## Senior Reviewer 檢查清單
1. Android 生命週期與記憶體洩漏（Context / Fragment reference）
2. Coroutine scope 管理（避免 leak / cancel 不確實）
3. API 安全性（Interceptor / Certificate Pinning）
4. UI 狀態覆蓋（Loading / Error / Empty / Refresh）
5. 測試覆蓋度（Unit Test + UI Test）
6. 可維護性與架構合理性（MVVM / MVI / Clean Architecture）

## 額外規則
- 回覆開頭標註角色：`[Lead Developer]` / `[Senior Reviewer]`
- 重要決策記錄在 `DECISIONS.md`
- 通過審查後提供簡要說明或下一步建議
