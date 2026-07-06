# Claude Config

Structured CLAUDE.md templates for AI-assisted development, organized by project type. English by default; Chinese versions available under [`zh/`](./zh/).

## Structure

```
claude-config/
├── CLAUDE.md                    # Main template — dual-mode (General + Embedded)
├── variants/
│   ├── embedded-c.md            # C / Embedded / Firmware projects
│   ├── kotlin-android.md        # Kotlin / Android projects
│   ├── python-ai-agent.md       # Python AI / Agent / Data projects
│   └── web-typescript.md        # TypeScript / Full-stack projects
├── zh/                          # Chinese (中文) versions
│   ├── CLAUDE.md
│   └── variants/
│       ├── embedded-c.md
│       ├── kotlin-android.md
│       ├── python-ai-agent.md
│       └── web-typescript.md
├── decisions/
│   └── DECISIONS.md             # Decision record template
└── scripts/
    └── setup.sh                 # One-click setup with auto-detection
```

## Quick Start

```bash
# Main template (English)
curl -o .claude/CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/CLAUDE.md

# Python AI / Agent project
curl -o .claude/CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/variants/python-ai-agent.md

# Chinese version
curl -o .claude/CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/zh/variants/python-ai-agent.md
```

Or use the setup script (auto-detects project type):

```bash
bash <(curl -s https://raw.githubusercontent.com/ian0318git/claude-config/main/scripts/setup.sh)
```

## How It Works

1. Run the download command in your project root.
2. Claude Code reads `.claude/CLAUDE.md` automatically.
3. Each variant tailors the reviewer checklist and technical guidelines to its stack.

## License

MIT
