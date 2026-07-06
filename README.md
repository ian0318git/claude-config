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

Claude Code reads `~/.claude/CLAUDE.md` first, then checks `<project>/.claude/CLAUDE.md` for overrides.

## License

MIT
