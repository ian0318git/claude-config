# Claude Config 🎯

Personal Claude Code configuration templates and CLAUDE.md variants for different project types.

## Structure

```
claude-config/
├── CLAUDE.md                    # 通用主版（預設）
├── variants/
│   ├── embedded-c.md            # C / Embedded / Firmware 專案
│   ├── kotlin-android.md        # Kotlin / Android 專案
│   ├── python-ai-agent.md       # Python AI / Agent / Data 專案
│   └── web-typescript.md        # TypeScript / Full-stack 專案
├── decisions/
│   └── DECISIONS.md             # 決策記錄範本
└── scripts/
    └── setup.sh                 # 一鍵下載對應 CLAUDE.md
```

## Quick Start

在新專案中套用對應的 CLAUDE.md：

```bash
# 通用版
curl -o .claude/CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/CLAUDE.md

# Python AI / Agent 專案
curl -o .claude/CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/variants/python-ai-agent.md

# TypeScript Web 專案
curl -o .claude/CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/variants/web-typescript.md
```

或用腳本一鍵搞定：

```bash
bash <(curl -s https://raw.githubusercontent.com/ian0318git/claude-config/main/scripts/setup.sh)
```

## 使用方式

1. 在專案根目錄執行下載指令
2. Claude Code 會自動讀取 `.claude/CLAUDE.md`
3. 各 variant 已針對該技術棧調整檢查清單與規則

## License

MIT
