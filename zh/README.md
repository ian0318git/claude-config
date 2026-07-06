# Claude Config（中文版）

依專案類型分類的結構化 CLAUDE.md 模板。預設為英文，中文版收錄於 [`zh/`](./) 目錄。

## 結構

```
claude-config/
├── CLAUDE.md                    # 主模板 — 雙模式通用版（全域）
├── zh/
│   ├── CLAUDE.md                # 主模板（中文）
│   └── variants/                # 專案層級模板
├── decisions/
│   └── DECISIONS.md             # 決策記錄範本
└── scripts/
    └── setup.sh                 # 一鍵設定
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

## 授權

MIT
