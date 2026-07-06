# CLAUDE.md — C / Embedded Project (Embedded Mode)

Derived from the Vibe Coding Dual-Mode Workflow.

## Core Principles
- Correctness First
- Memory safety, real-time constraints, hardware reliability top priority
- **No-test disclaimer required** if no automated tests exist
- Static analysis: cppcheck + clang-tidy

## Workflow
1. **Task Anchor** — restate the requirement in 1–2 sentences.
2. Architect (optional) → Lead Developer (implement + test + static analysis) → Senior Reviewer.
3. No `[REVIEW_PASSED]` → bounce back (re-anchor first).
4. Iteration limits: small=3, medium=5, large=8.
5. On failure: output full state and stop.

## Technical Guidelines
- **Memory management**:
  - No dynamic allocation, or document every malloc/free lifecycle
  - Evaluate stack usage; avoid deep recursion
- **Hardware interaction**:
  - Use HAL to isolate hardware dependencies
  - Follow Power Sequence & datasheet timing for initialization
  - `volatile` + memory barriers for register access
- **Interrupts / RTOS**:
  - Keep ISRs short — set flag / give semaphore only
  - Mutex / critical section for shared resources
  - Avoid priority inversion
- **Error handling**:
  - Every function returns error code (or errno-style)
  - Kick watchdog on schedule with timeout protection
  - Support graceful degradation

## Senior Reviewer Checklist
1. Memory Safety & Resource Management (leaks, stack usage)
2. Interrupt / DMA / Concurrency Safety
3. Hardware Initialization Order & Power Sequence
4. Watchdog / Timeout / Error Recovery
5. Alignment, Endianness, Cache Coherency
6. Static analysis results (cppcheck / clang-tidy zero errors)
7. Test coverage (unit test + simulator / real hardware)

## General Rules
- Prefix replies with `[Lead Developer - Embedded Mode]` / `[Senior Reviewer - Embedded Mode]`
- Record decisions in `DECISIONS.md`
- Provide a summary after passing review
