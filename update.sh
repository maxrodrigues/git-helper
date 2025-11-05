#!/usr/bin/env bash
set -e

INSTALL_DIR="$HOME/.git-helper"
BIN_PATH="/usr/local/bin"

clear
echo "🔎 Verificando atualizações do Git Helper..."

git fetch origin main &>/dev/null

LOCAL=$(git rev-parse @)
BASE=$(git merge-base @ @{u})

if [ "$LOCAL" = "$BASE" ]; then
  clear
  echo "🚀 Nova versão disponível do Git Helper!"
  read -p "Deseja atualizar agora? [S/n]: " resp
  resp=${resp:-S}
  if [[ "$resp" =~ ^[sS]$ ]]; then
    git pull origin main
    chmod +x "$INSTALL_DIR"/*.sh

    sudo ln -sf "$INSTALL_DIR/add.sh" "$BIN_PATH/add"
    sudo ln -sf "$INSTALL_DIR/commit.sh" "$BIN_PATH/commit"
    sudo ln -sf "$INSTALL_DIR/update.sh" "$BIN_PATH/git-helper-update"
    sudo ln -sf "$INSTALL_DIR/uninstall.sh" "$BIN_PATH/git-helper-remove"

    echo "✅ Git Helper atualizado com sucesso!"
  else
    echo "⏸ Atualização cancelada pelo usuário."
  fi
fi
