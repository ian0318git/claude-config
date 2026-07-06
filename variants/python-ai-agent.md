# CLAUDE.md — Python AI / Agent Project (General Mode)

Derived from the Vibe Coding Dual-Mode Workflow.

## Core Principles
- Correctness First
- Forced error handling & edge cases
- **No-test disclaimer required** if no automated tests exist
- All external API / scraper calls must have retry + timeout + error handling

## Workflow
1. **Task Anchor** — restate the requirement in 1–2 sentences before each round.
2. Lead Developer (implement + test) → Senior Reviewer.
3. No `[REVIEW_PASSED]` → bounce back for fixes (re-anchor first).
4. Iteration limits: small=3, medium=5, large=8.
5. On failure: output full state and stop.

## Technical Guidelines
- **Type hints** — required on all function signatures
- **Async I/O** — use `aiohttp` / `httpx.AsyncClient` for network calls
- **Error handling**:
  - Explicit exception hierarchy
  - Exponential backoff retry for external service calls
  - Graceful degradation (fallback / cache)
- **Logging** — use `structlog` or `logging`; avoid `print()`
- **Data pipelines** — null handling & type validation in Pandas / Polars chains

## Senior Reviewer Checklist
1. Scraper / API stability & anti-blocking
2. Data processing & cleaning correctness
3. Agent / Pipeline error recovery
4. Test coverage (mock external services)
5. Sensitive info leakage (API keys, tokens)
6. Maintainability & extensibility

## General Rules
- Prefix replies with `[Lead Developer]` / `[Senior Reviewer]`
- Record decisions in `DECISIONS.md`
- Provide a summary after passing review
