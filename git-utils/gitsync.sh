#!/usr/bin/env bash

function pull {
    git stash
    git pull --rebase
    git stash pop
}

function push {
    pull
    git add .
    git commit --allow-empty -m "$(date)"
    git push
}

# Change these to match the directories you want to sync.
GIT_DIRS=(
    '/home/hreikin/git/bash-util-scripts'
    '/home/hreikin/git/gen-pygments-css'
    '/home/hreikin/git/pdf-toolbox'
    '/home/hreikin/git/pymd-editor'
    '/home/hreikin/git/python-utilities'
    '/home/hreikin/git/simple-python-project-template'
    '/home/hreikin/git/tkintermd'
)

for dir in ${GIT_DIRS[@]}; do
    cd $dir
    git fetch
    status=$(git status --porcelain=v1)
    if [[ -n "$status" ]]; then
        push
    else
        pull
    fi
echo Process Complete, exiting.
exit 0
