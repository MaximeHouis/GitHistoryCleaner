#!/bin/bash -e
## Clean the git history.

## Use at your own risk.
## Use at your own risk.
## Use at your own risk.
## Use at your own risk.
## Use at your own risk.
## Use at your own risk.
## Use at your own risk.
## Use at your own risk.
## Use at your own risk.
## Use at your own risk.

REPO=$(basename $(git rev-parse --show-toplevel))

if [[ $# == 1 ]]; then
    MESSAGE="$1"
else
    MESSAGE="Clean history"
fi

read -r -p "[$REPO] Are you sure you want to ERASE git history? [y/N] " CONFIRM
CONFIRM=${CONFIRM,,} ## To lowercase
if [[ $CONFIRM =~ ^(yes|y) ]]; then
    set -xe

    git fetch --all --prune  &> /dev/null
    git pull origin master &> /dev/null
    git checkout --orphan new_master &> /dev/null
    git add -A &> /dev/null
    git commit -am "$MESSAGE" &> /dev/null
    git branch -D master &> /dev/null
    git branch -m master &> /dev/null
    git push -f origin master &> /dev/null
    git branch --set-upstream-to=origin/master master &> /dev/null
else
    echo "Cancelled."
    exit 1
fi
