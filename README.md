# Claude Config

Structured CLAUDE.md templates for AI-assisted development, organized by project type. English by default; Chinese versions available under [`zh/`](./zh/).

## Structure

```
claude-config/
├── CLAUDE.md                    # Main template — dual-mode (General + Embedded)
├── variants/                    # Project-level templates (download to project root)
│   ├── embedded-c.md            # C / Embedded / Firmware projects
│   ├── kotlin-android.md        # Kotlin / Android projects
│   ├── python-ai-agent.md       # Python AI / Agent / Data projects
│   └── web-typescript.md        # TypeScript / Full-stack projects
├── zh/                          # Chinese (中文) versions
│   ├── CLAUDE.md
│   └── variants/
├── decisions/
│   └── DECISIONS.md             # Decision record template
└── scripts/
    └── setup.sh                 # One-click setup with auto-detection
```

## Quick Start

### Global config — set your default workflow

```bash
curl -o ~/.claude/CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/CLAUDE.md
```

### Project-level config — one per project (commit it!)

```bash
# Python AI / Agent project: run in project root
curl -o CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/variants/python-ai-agent.md

# Chinese version for a project
curl -o CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/zh/variants/python-ai-agent.md
```

### Auto-detection

```bash
# Run in project root — detects type and downloads variant to ./CLAUDE.md
bash <(curl -s https://raw.githubusercontent.com/ian0318git/claude-config/main/scripts/setup.sh)

# Global mode
bash <(curl -s https://raw.githubusercontent.com/ian0318git/claude-config/main/scripts/setup.sh) --global
```

## How It Works

| File | Scope | Where it goes | Use case |
|------|-------|---------------|----------|
| `CLAUDE.md` | global | `~/.claude/` | Default workflow for all projects |
| `variants/*.md` | project | project root (`./CLAUDE.md`) | Per-project override; commit to repo |

Claude Code reads `~/.claude/CLAUDE.md` first, then checks `<project>/CLAUDE.md` for overrides.

---

## Design Concepts

The main `CLAUDE.md` is built around several key design decisions that shape how Claude Code interacts with your projects. Here is the rationale behind each one.

### 1. Dual-Mode Architecture (General + Embedded)

One template must serve two fundamentally different domains:

- **General Mode** covers Python, TypeScript, web, and AI agent projects — where async I/O, type safety, API contracts, and error recovery pipelines are the primary concerns.
- **Embedded Mode** covers C/C++, firmware, and hardware projects — where memory safety, interrupt latency, register-level correctness, and real-time constraints dominate.

Rather than maintaining two separate configs that drift apart, a single file with a mode switch keeps the shared workflow (anchoring, review pipeline, iteration limits) in one place while branching only the domain-specific rules and checklists. The mode is auto-detected by file extension (`.c`/`.cpp`/`.h` → Embedded) or explicitly toggled by prefixing `Use Embedded Mode` in the prompt.

### 2. Role-Based Pipeline with Temperature Control

Instead of treating Claude as a single monolithic agent, the template defines three distinct roles:

| Role | Responsibility | Temperature Guidance |
|------|---------------|---------------------|
| **Architect** | Produces a concise design doc for large tasks | N/A (optional role) |
| **Lead Developer** | Implements, tests, commits | Normal generation |
| **Senior Reviewer** | Audits the output, enforces quality gates | 0.0–0.1 (critical thinking) |

The Senior Reviewer is deliberately restricted to low temperature and **must not use the same model string as the Lead Developer**. This prevents the same model from rubber-stamping its own output. When the model cannot be swapped, the review must cite test results and static analysis — not subjective phrasing. Every comment is tagged with severity.

This mimics a human code-review culture where a reviewer's incentive is to *find* issues, not to *confirm* the work is correct.

### 3. Task Anchoring

Before every round of work, the Lead Developer must restate the original requirement in 1–2 sentences. This prevents **goal drift** — where successive LLM calls gradually reinterpret or narrow the original request — and ensures that when a Reviewer bounces a task back, both parties agree on what the original ask was.

### 4. Iteration Limits with Escalation

LLM sessions can loop indefinitely on fix-review-fix cycles. The template caps iterations by task size:

| Task Size | Max Rounds | Report Cadence |
|-----------|-----------|----------------|
| Small | 3 | N/A |
| Medium | 5 | N/A |
| Large | 8 | Every 3 rounds |

When the cap is reached, the process stops and outputs full state to the human. This acts as a **circuit breaker** — it prevents wasted tokens and signals that human judgment is needed.

### 5. No-Test Disclaimer

The most common failure mode in AI-assisted coding is the "looks correct" sign-off without any evidence. The template requires:

> If the project has no automated tests, the Lead Developer **must** state "no test coverage" and describe manual verification; never skip validation.

This forces transparency. When tests exist, the Senior Reviewer checks them. When they don't, the gap is documented rather than silently ignored.

### 6. Correctness First

Every section of the template is subordinate to this principle. Code is written for functional correctness and long-term stability, not speed of delivery. Error paths are explicitly handled, edge cases are enumerated, and every mode-specific checklist (scraper stability, memory safety, lifecycle correctness) exists to catch the kind of bug that is invisible on first glance but catastrophic in production.

---

## License

MIT
