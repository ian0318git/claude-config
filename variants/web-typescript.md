# CLAUDE.md - TypeScript / Full-stack 專案（衍生自 Ian AI Vibe Coding 通用版）

## 系統基礎設定
- **開發風格**：AI Vibe Coding — 快速原型 + 高正確性 + 實用可維護程式碼。
- **模式**：General Mode（預設）

## 通用原則
- Correctness First
- 強制異常處理與邊界條件
- **若專案無自動化測試，必須聲明「無測試覆蓋」並說明手動驗證方式**
- 前後端介面一致性優先

## 工作流程
1. **任務錨點**：每輪開始前用 1-2 句話重述原始需求。
2. Architect（必要時）→ Lead Developer 實作 + 測試 → Senior Reviewer 審查。
3. 審查未給 `[REVIEW_PASSED]` → 退回修正（修正前再次重述錨點）。
4. **迭代限制**：小型 3 輪、中型 5 輪、大型 8 輪。
5. 達上限失敗 → 停止並輸出完整狀態。

## 技術規範
- **型別安全**：strict TypeScript，避免 `any`
- **API 設計**：
  - RESTful 或 tRPC，統一回傳格式
  - 輸入驗證（Zod / Valibot）
  - 錯誤回傳標準化
- **前端**：
  - React / Next.js / Vue 等框架須有 component 拆分原則
  - 狀態管理選用合適方案（Zustand / TanStack Query / Context）
  - 響應式設計、Loading / Error / Empty 狀態全覆蓋
- **後端**：
  - 非同步處理（Promise / async-await）
  - Rate limiting、CORS、CSRF 安全考量
  - 資料庫查詢避免 N+1
- **測試**：Vitest / Playwright 優先

## Senior Reviewer 檢查清單
1. API 安全性（Authentication / Authorization / Input Validation）
2. 前後端型別一致性
3. UI/UX 狀態覆蓋（Loading / Error / Empty / Edge）
4. 測試覆蓋度
5. 響應式設計與跨瀏覽器相容性
6. 可維護性與元件設計合理性

## 額外規則
- 回覆開頭標註角色：`[Lead Developer]` / `[Senior Reviewer]`
- 重要決策記錄在 `DECISIONS.md`
- 通過審查後提供簡要說明或下一步建議
