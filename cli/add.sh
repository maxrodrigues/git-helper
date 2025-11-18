#!/usr/bin/env bash
set -e

# get changed files
changed_files=$(git status -s | awk '{print $2}')

if [ -z "$changed_files" ]; then
  echo -e "😎 Repositório 100% atualizado — bora tomar um café?"
  exit 0
fi

# get selected files
selected=$(echo "$changed_files" | fzf --bind space:select -m --prompt="Use a tecla de espaço para selecionar os arquivos.: " --preview 'git diff --color=always {}' --border --height=100%)

# check have a selected files
if [ -z "$selected" ]; then
  echo "😅 Nenhum arquivo marcado… acho que o commit ficou pra depois do café!"
  exit 0
fi

# add selected files
for arq in $selected; do
  git add "$arq"
  echo "✅ Arquivo adicionado: $arq"
done

echo "🌟 Mudanças salvas com sucesso — bora carimbar esse commit?"
echo
echo "Digite 'commit' escolher o tipo de commit e a mensagem."
