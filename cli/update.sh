#!/usr/bin/env bash
set -e

INSTALL_DIR="$HOME/.git-helper/cli"
BIN_PATH="/usr/local/bin"

clear
echo "🔎 Verificando atualizações do Git Helper..."

CURRENT_DIR=$(pwd)

cd "$INSTALL_DIR"

git fetch origin main &>/dev/null

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ "$LOCAL" = "$REMOTE" ]; then
  echo "✅ O Git Helper já está atualizado!"
elif  [ "$LOCAL" = "$BASE" ]; then
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
elif [ "$REMOTE" = "$BASE" ]; then
  echo "⚠️  Seu repositório local está à frente do remoto."
  echo "Talvez você tenha feito modificações locais."
else
  echo "⚠️  O repositório local e remoto divergiram!"
  echo "Recomendo rodar 'git pull' manualmente para resolver."
fi

cd "$CURRENT_DIR"
