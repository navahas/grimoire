#!/usr/bin/env bash

# Usage examples:
# ./notification.sh "success" "Build completed!"
# ./notification.sh "warn" "Tests have warnings"
# ./notification.sh "error" "Build failed!"
# ./notification.sh "info" "Task finished"
#
# Parameters: [type] [message] [command]
# - type: success|warn|error|info (determines color)
# - message: display message
# - command: optional command to execute before showing notification

set -euo pipefail

# Script parameters
readonly type="${1:-info}"
readonly message="${2:-Task ended!}"
readonly user_command="${3:-}"

# Execute user command if provided
if [[ -n "$user_command" ]]; then
    echo "Executing: $user_command"
    eval "$user_command"
fi

# Set color based on notification type
case "$type" in
    "success") readonly color="green" ;;
    "warn")    readonly color="yellow" ;;
    "error")   readonly color="red" ;;
    "info")    readonly color="blue" ;;
    *)         readonly color="white" ;;
esac

readonly script_path="$HOME/.tmux/plugins/tmux-grimoire/scripts/cast_shpell.sh"

if [[ ! -x "$script_path" ]]; then
    echo "Error: Script not found or not executable: $script_path" >&2
    exit 1
fi

# Set popup configuration
tmux set-option -g "@shpell-${type}-position" "top-center"
tmux set-option -g "@shpell-${type}-width" "40%"
tmux set-option -g "@shpell-${type}-height" "20%"
tmux set-option -g "@shpell-${type}-color" "$color"

echo "Showing $type notification..."
temp_script="/tmp/notification_$$.sh"

cat > "$temp_script" << 'EOF'
#!/bin/bash
tput civis 2>/dev/null || printf "\033[?25l"
stty -echo
trap 'stty echo; tput cnorm 2>/dev/null || printf "\033[?25h"; rm -f "$0"' EXIT
trap '' INT TSTP
clear
printf "\n\n    %s\n" "$1"
while :; do sleep 1; done
EOF

chmod +x "$temp_script"
"$script_path" ephemeral "$type" "$temp_script '$message'"
