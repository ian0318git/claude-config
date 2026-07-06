# CLAUDE.md — TypeScript / Full-stack Project (General Mode)

Derived from the Vibe Coding Dual-Mode Workflow.

## Core Principles
- Correctness First
- Forced error handling & edge cases
- **No-test disclaimer required** if no automated tests exist
- Frontend/backend contract consistency is a priority

## Workflow
1. **Task Anchor** — restate the requirement in 1–2 sentences.
2. Architect (optional) → Lead Developer (implement + test) → Senior Reviewer.
3. No `[REVIEW_PASSED]` → bounce back (re-anchor first).
4. Iteration limits: small=3, medium=5, large=8.
5. On failure: output full state and stop.

## Technical Guidelines
- **Type safety** — strict TypeScript, avoid `any`
- **API design**:
  - RESTful or tRPC with uniform response format
  - Input validation (Zod / Valibot)
  - Standardized error responses
- **Frontend**:
  - Sensible component decomposition (React / Next.js / Vue)
  - State management via Zustand / TanStack Query / Context
  - Responsive design; cover loading / error / empty states
- **Backend**:
  - Async everywhere (Promise / async-await)
  - Rate limiting, CORS, CSRF security
  - Avoid N+1 queries
- **Testing** — Vitest / Playwright preferred

## Senior Reviewer Checklist
1. API security (AuthN / AuthZ / input validation)
2. Frontend/backend type consistency
3. UI state coverage (loading / error / empty / edge cases)
4. Test coverage
5. Responsive design & cross-browser compatibility
6. Component architecture & maintainability

## General Rules
- Prefix replies with `[Lead Developer]` / `[Senior Reviewer]`
- Record decisions in `DECISIONS.md`
- Provide a summary after passing review
