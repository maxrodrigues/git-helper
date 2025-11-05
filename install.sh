#!/usr/bin/env bash
# install.sh — Install Git Helper

set -e

REPO_URL="https://github.com/maxrodrigues/git-helper.git"
INSTALL_DIR="$HOME/.git-helper"
BIN_PATH="/usr/local/bin"
clear

echo -e "========================================"
echo -e "🚀 Instalando Git Helper..."
echo -e "========================================"

if ! command -v fzf &>/dev/null; then
  echo "⚠️  fzf não encontrado."
  read -p "Deseja instalar automaticamente? [Y/n]: " resp
  resp=${resp:-S}

  if [[ "$resp" =~ ^[sS]$ ]]; then
    echo -e "📦 Instalando fzf..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
      brew install fzf
    else
      sudo apt update -qq && sudo apt install -y fzf
    fi
    echo -e "✅ fzf instalado com sucesso!"
  else
    echo -e "❌ Instalação cancelada. Execute 'sudo apt install fzf' manualmente."
    exit 1
  fi
fi

# Clona ou atualiza
if [ -d "$INSTALL_DIR" ]; then
  echo "🔄 Atualizando versão existente..."
  cd "$INSTALL_DIR" && git pull
else
  git clone "$REPO_URL" "$INSTALL_DIR"
fi

# Dá permissão e cria link simbólico
chmod +x "$INSTALL_DIR"/*.sh

sudo ln -sf "$INSTALL_DIR/add.sh" "$BIN_PATH/add"
sudo ln -sf "$INSTALL_DIR/commit.sh" "$BIN_PATH/commit"
sudo ln -sf "$INSTALL_DIR/update.sh" "$BIN_PATH/git-helper-update"
sudo ln -sf "$INSTALL_DIR/uninstall.sh" "$BIN_PATH/git-helper-remove"

echo
echo -e "✅ Instalação concluída!"
echo -e "Agora você pode executar: git-helper"
echo
echo -e "Para atualizar no futuro, use: git-helper update"
