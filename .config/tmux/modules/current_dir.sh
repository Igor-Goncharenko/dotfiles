#!/bin/bash
# current_dir.sh

CURRENT_PANE_PATH=$(tmux display-message -p -F "#{pane_current_path}")

# Cut /home/user/
pattern="/home/$(whoami)"
replacement="~"
CUT_PATH=$(echo "$CURRENT_PANE_PATH" | sed "s@$pattern@$replacement@g"  )

printf "${CUT_PATH}"

