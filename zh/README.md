# Claude Config（中文版）

依專案類型分類的結構化 CLAUDE.md 模板。預設為英文，中文版收錄於 [`zh/`](./) 目錄。

## 結構

```
claude-config/
├── CLAUDE.md                    # 主模板 — 雙模式（General + Embedded）
├── variants/                    # 專案層級模板（下載到專案根目錄）
│   ├── embedded-c.md            # C / Embedded / Firmware 專案
│   ├── kotlin-android.md        # Kotlin / Android 專案
│   ├── python-ai-agent.md       # Python AI / Agent / Data 專案
│   └── web-typescript.md        # TypeScript / Full-stack 專案
├── zh/                          # 中文版
│   ├── CLAUDE.md
│   └── variants/
├── decisions/
│   └── DECISIONS.md             # 決策記錄範本
└── scripts/
    └── setup.sh                 # 一鍵設定（支援 --global / --lang zh）
```

## 快速開始

### 全域設定 — 預設工作流程

```bash
curl -o ~/.claude/CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/zh/CLAUDE.md
```

### 專案設定 — 每個專案各自一份（可 commit）

```bash
# 在專案根目錄執行
curl -o CLAUDE.md \
  https://raw.githubusercontent.com/ian0318git/claude-config/main/zh/variants/python-ai-agent.md
```

### 自動偵測

```bash
# 專案模式（下載到 ./CLAUDE.md）
bash <(curl -s https://raw.githubusercontent.com/ian0318git/claude-config/main/scripts/setup.sh) --lang zh

# 全域模式
bash <(curl -s https://raw.githubusercontent.com/ian0318git/claude-config/main/scripts/setup.sh) --global --lang zh
```

## 範圍說明

| 檔案 | 範圍 | 下載位置 | 用途 |
|------|------|---------|------|
| `zh/CLAUDE.md` | 全域 | `~/.claude/` | 所有專案的預設工作流程 |
| `zh/variants/*.md` | 專案 | 專案根目錄 (`./CLAUDE.md`) | 各專案獨立覆寫，可 commit |

Claude Code 優先讀取 `~/.claude/CLAUDE.md`，再檢查專案目錄下的 `CLAUDE.md` 作為覆寫。

## 授權

MIT
