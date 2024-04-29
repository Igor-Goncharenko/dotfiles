#!/bin/bash
# git_status.sh

# Change dir to pane dir
# add '-t0' flag to choose first pane
CURRENT_PANE_PATH=$(tmux display-message -p -F "#{pane_current_path}")
cd ${CURRENT_PANE_PATH}

GIT_ERROR=$(git -C . rev-parse 2>/dev/null && printf $?)
if [ "${GIT_ERROR}" == "0" ]; then
    # Get branch name
    GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    # Get repository path
    GIT_REPO_ABSOLUTE_PATH=$(git rev-parse --show-toplevel)
    GIT_REPO_PATH=$(echo "$GIT_REPO_ABSOLUTE_PATH" | sed -e "s@.*/@@g")

    # Merge git data
    GIT_STATUS=" ${GIT_BRANCH} ${GIT_REPO_PATH} "
else 
    GIT_STATUS=""
fi

# Out data
printf "${GIT_STATUS}"

