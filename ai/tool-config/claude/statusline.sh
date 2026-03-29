#!/bin/bash
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name')
used=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
project_dir=$(echo "$input" | jq -r '.workspace.project_dir')
project=$(basename "$project_dir")
branch=$(git -C "$project_dir" branch --show-current 2>/dev/null)

# Color thresholds: green < 70%, yellow 70-89%, red 90%+
CYAN='\033[96m'; GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'; RESET='\033[0m'

if [ "$used" -ge 90 ]; then BAR_COLOR="$RED"
elif [ "$used" -ge 70 ]; then BAR_COLOR="$YELLOW"
else BAR_COLOR="$GREEN"; fi

filled=$((used / 10)); empty=$((10 - filled))
bar=$(printf '%*s' "$filled" | tr ' ' '█')$(printf '%*s' "$empty" | tr ' ' '░')

prefix="${CYAN}${project}${RESET}"
[ -n "$branch" ] && prefix="${CYAN}${project}${RESET} ($branch)"
printf "%b" "$prefix | $model | ${BAR_COLOR}${bar}${RESET} ${used}%\n"
