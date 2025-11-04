#!/bin/bash
set -e

# get changed files
changed_files=$(git status -s | awk '{print $2}')

# get selected files
selected=$(echo "$changed_files" | fzf --bind space:select -m --prompt="Use the spacebar to select the files.: " --preview 'git diff --color=always {}' --border --height=50%)

# check have a selected files
if [ -z "$selected" ]; then
  echo "No files selected."
  exit 0
fi

# add selected files
for arq in $selected; do
  git add "$arq"
  echo "✅ File added: $arq"
done