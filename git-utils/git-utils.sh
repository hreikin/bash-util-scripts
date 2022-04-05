#!/bin/sh
# A simple script to push all provided git repositories to Github, Gitlab, etc.
# Tested only with SSH keys configured on the host system.

# Array containing directories of git projects.
GIT_DIRS=(
    '/home/hreikin/git/tkintermd'
    '/home/hreikin/git/pymd-editor'
    '/home/hreikin/git/gen-pygments-css'
    '/home/hreikin/git/simple-python-project-template'
)

function git_push_all {
    echo Pushing all pre-configured git projects.

    # For each directory in GIT_DIRS variable, change into it and then run "git push 
    # origin main".
    for dir in ${GIT_DIRS[@]}; do
        cd $dir
        echo $dir
        git push origin main

    done
    return
}

function git_pull_all {
    echo Pulling all pre-configured git projects.

    # For each directory in GIT_DIRS variable, change into it and then run "git push 
    # origin main".
    for dir in ${GIT_DIRS[@]}; do
        cd $dir
        echo $dir
        git pull origin main

    done
    return
}

git_pull_all
git_push_all
echo Process Complete, exiting.
exit 0