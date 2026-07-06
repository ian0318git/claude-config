#!/usr/bin/env bash
set -euo pipefail

# Claude Config Setup Script
# Downloads the right CLAUDE.md variant for your project (auto-detection or manual select)
# Supports English (default) and Chinese (--lang zh)
# Writes to ~/.claude/CLAUDE.md (global Claude Code config)

REPO_URL="https://raw.githubusercontent.com/ian0318git/claude-config/main"

# Color helpers
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

LANG="${LANG:-en}"

# Parse args
while [[ $# -gt 0 ]]; do
    case "$1" in
        --lang) LANG="$2"; shift 2 ;;
        *) echo "Usage: $0 [--lang en|zh]"; exit 1 ;;
    esac
done

PREFIX=""
[[ "$LANG" == "zh" ]] && PREFIX="zh/"

echo -e "${BLUE}╔══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Claude Config Setup                ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════╝${NC}"
echo ""

# Detect project type
detect_project_type() {
    local has_c=0 has_py=0 has_ts=0 has_kt=0
    [[ -n "$(find . -maxdepth 2 -name '*.c' -o -name '*.cpp' -o -name '*.h' 2>/dev/null | head -1)" ]] && has_c=1
    [[ -f "platformio.ini" ]] && has_c=1
    [[ -n "$(find . -maxdepth 2 -name '*.py' 2>/dev/null | head -1)" ]] && has_py=1
    [[ -f "pyproject.toml" ]] && has_py=1
    [[ -f "package.json" ]] && has_ts=1
    [[ -n "$(find . -maxdepth 2 -name '*.ts' -o -name '*.tsx' 2>/dev/null | head -1)" ]] && has_ts=1
    [[ -n "$(find . -maxdepth 2 -name '*.kt' 2>/dev/null | head -1)" ]] && has_kt=1
    [[ -f "build.gradle.kts" ]] && has_kt=1

    if [[ "$has_c" -eq 1 ]]; then
        echo "embedded-c"
    elif [[ "$has_kt" -eq 1 ]]; then
        echo "kotlin-android"
    elif [[ "$has_py" -eq 1 ]]; then
        echo "python-ai-agent"
    elif [[ "$has_ts" -eq 1 ]]; then
        echo "web-typescript"
    else
        echo "main"
    fi
}

# Prompt if not auto-detected
choose_variant() {
    echo -e "${YELLOW}Could not auto-detect project type.${NC}"
    echo "Select a variant:"
    echo "  1) Main (dual-mode)"
    echo "  2) Python AI / Agent"
    echo "  3) TypeScript / Full-stack"
    echo "  4) Kotlin / Android"
    echo "  5) C / Embedded"
    echo ""
    read -rp "Enter number [1-5]: " choice
    case "$choice" in
        2) echo "python-ai-agent" ;;
        3) echo "web-typescript" ;;
        4) echo "kotlin-android" ;;
        5) echo "embedded-c" ;;
        *) echo "main" ;;
    esac
}

# Main
detected=$(detect_project_type)
if [[ "$detected" == "main" ]]; then
    variant=$(choose_variant)
else
    variant="$detected"
    variant_names=("main" "python-ai-agent" "web-typescript" "kotlin-android" "embedded-c")
    display_names_en=("Main" "Python AI / Agent" "TypeScript / Full-stack" "Kotlin / Android" "C / Embedded")
    display_names_zh=("主版" "Python AI / Agent" "TypeScript / Full-stack" "Kotlin / Android" "C / Embedded")
    for i in "${!variant_names[@]}"; do
        if [[ "${variant_names[$i]}" == "$variant" ]]; then
            [[ "$LANG" == "zh" ]] && echo -e "${BLUE}Auto-detected:${NC} ${display_names_zh[$i]}" \
                                  || echo -e "${BLUE}Auto-detected:${NC} ${display_names_en[$i]}"
            break
        fi
    done
fi

# Build URL and download to ~/.claude/
mkdir -p ~/.claude
if [[ "$variant" == "main" ]]; then
    url="$REPO_URL/${PREFIX}CLAUDE.md"
else
    url="$REPO_URL/${PREFIX}variants/$variant.md"
fi

echo -e "${GREEN}Downloading${NC} $variant ..."
if curl -sfL "$url" -o ~/.claude/CLAUDE.md; then
    echo -e "${GREEN}Done!${NC} ~/.claude/CLAUDE.md has been written."
else
    echo -e "${YELLOW}Failed to download.${NC} Check your internet connection."
    exit 1
fi
