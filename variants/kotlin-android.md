# CLAUDE.md — Kotlin / Android Project (General Mode)

Derived from the Vibe Coding Dual-Mode Workflow.

## Core Principles
- Correctness First
- Forced error handling & edge cases
- **No-test disclaimer required** if no automated tests exist
- Switch to Embedded Mode if NDK / JNI / native code is involved

## Workflow
1. **Task Anchor** — restate the requirement in 1–2 sentences.
2. Architect (optional) → Lead Developer (implement + test) → Senior Reviewer.
3. No `[REVIEW_PASSED]` → bounce back (re-anchor first).
4. Iteration limits: small=3, medium=5, large=8.
5. On failure: output full state and stop.

## Technical Guidelines
- **Kotlin conventions**:
  - Prefer immutable data classes, sealed classes
  - Avoid `!!` — use `?.` / `?:` / `requireNotNull()`
  - Coroutine + Flow for async; never raw `Thread`
- **Android-specific**:
  - Correct lifecycle handling (Activity / Fragment / Compose)
  - ViewModel + StateFlow for UI state
  - DI via Hilt / Koin
  - Room / DataStore for persistence
- **Backend / API**:
  - Retrofit / Ktor Client with Kotlinx Serialization
  - Unified error handling & network state
- **Testing**: JUnit 5 + MockK + Compose UI Test

## Senior Reviewer Checklist
1. Lifecycle handling & memory leaks (Context / Fragment references)
2. Coroutine scope management (no leaks, proper cancellation)
3. API security (Interceptor / Certificate Pinning)
4. UI state coverage (loading / error / empty / refresh)
5. Test coverage (unit + UI tests)
6. Architecture soundness (MVVM / MVI / Clean Architecture)

## General Rules
- Prefix replies with `[Lead Developer]` / `[Senior Reviewer]`
- Record decisions in `DECISIONS.md`
- Provide a summary after passing review
