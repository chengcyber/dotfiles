#!/bin/sh

set -e

print_usage() {
    echo "Usage: sync-repo.sh <folder1> <folder2> ..."
}

if [ $# -lt 1 ]; then
    echo "Missing arguments"
    print_usage
    exit 1
fi


for folder in "$@"
do 
    echo "[log] Working on $folder..."
    if [ -d "$folder" ]; then
        (cd $folder && git fetch origin || echo "[Error] git fetch origin error") 
    else
        echo "[Warn] Folder doesn't exist: $folder"
    fi
done

