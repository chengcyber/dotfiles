#!/usr/bin/env bash

languages=`echo "typescript nodejs javascript golang lua tmux" | tr ' ' '\n'`

commands=`echo "xargs rg sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$commands" | fzf`

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter query: " query

if printf $languages | grep -qs "$selected"; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
