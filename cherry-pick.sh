#!/bin/bash
git fetch --all
git branch -r | grep -v '\->' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | grep -v "main\|master" | cut -d/ -f2 | while read -r remote; do
        echo "#Switching $remote"
        git switch $remote
        echo "#Cherry-picking commit"
        git cherry-pick dd46b72da8890ecf3b4896f3867b0e5fec1ec551
        echo "#Pushig commit"
        git push
done
