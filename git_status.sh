#!/bin/bash
# git_status.sh
GIT_ERROR=$(git -C . rev-parse 2>/dev/null && echo $?)
if [ "${GIT_ERROR}" == "0" ]; then
    # Change dir to pane dir
    CURRENT_PANE_PATH=$(tmux display-message -p -F "#{pane_current_path}" -t0)
    cd ${CURRENT_PANE_PATH}
    # Get branch name
    GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    # Get repository path
    GIT_REPO_PATH=$(git rev-parse --show-toplevel)

    # Merge git data
    GIT_STATUS=" ${GIT_BRANCH} ...${GIT_REPO_PATH:25} "
    printf $GIT_STATUS
else 
    GIT_STATUS=" dsaf "
fi

printf "${GIT_STATUS}"
: '
# Change dir to pane dir
CURRENT_PANE_PATH=$(tmux display-message -p -F "#{pane_current_path}" -t0)
cd ${CURRENT_PANE_PATH}
# Get branch name
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
# Get repository path
GIT_REPO_PATH=$(git rev-parse --show-toplevel)

# Merge git data
GIT_STATUS=" ${GIT_BRANCH} ...${GIT_REPO_PATH:25} "

#printf $GIT_STATUS

printf $(git -C . rev-parse 2>/dev/null && echo $?)
'

