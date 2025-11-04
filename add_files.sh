#!/usr/bin/env bash
set -e

update_git_helper() {
  echo "🔄 Atualizando Git Helper..."
  if [ -d "$INSTALL_DIR" ]; then
    cd "$INSTALL_DIR"
    git pull origin main
    chmod +x git-helper.sh
    sudo ln -sf "$INSTALL_DIR/git-helper.sh" "$BIN_PATH"
    echo "✅ Atualizado com sucesso!"
  else
    echo "❌ Diretório de instalação não encontrado!"
  fi
  exit 0
}

if [[ "$1" == "update" ]]; then
  update_git_helper
fi

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
