# Claude Config（中文版）

依專案類型分類的結構化 CLAUDE.md 模板。預設為英文，中文版收錄於 [`zh/`](./) 目錄。

## 結構

```
claude-config/
├── CLAUDE.md                    # 主模板 — 雙模式通用版
├── zh/
│   ├── CLAUDE.md                # 主模板（中文）
│   └── variants/
│       ├── embedded-c.md        # C / Embedded 專案
│       ├── kotlin-android.md    # Kotlin / Android 專案
│       ├── python-ai-agent.md   # Python AI / Agent 專案
│       └── web-typescript.md    # TypeScript / Full-stack 專案
├── decisions/
│   └── DECISIONS.md             # 決策記錄範本
└── scripts/
    └── setup.sh                 # 一鍵設定（支援 --lang zh）
```

## 快速開始

```bash
# 中文版主模板
curl -o .claude/CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/zh/CLAUDE.md

# 中文版 Python AI / Agent 專案
curl -o .claude/CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/zh/variants/python-ai-agent.md
```

或用 setup.sh（支援語言參數）：

```bash
# 英文版（預設）
bash <(curl -s https://raw.githubusercontent.com/ian0318git/claude-config/main/scripts/setup.sh)

# 中文版
bash <(curl -s https://raw.githubusercontent.com/ian0318git/claude-config/main/scripts/setup.sh) --lang zh
```

## 授權

MIT
