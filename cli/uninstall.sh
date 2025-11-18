#!/usr/bin/env bash
set -e

INSTALL_DIR="$HOME/.git-helper/cli"
BIN_PATH="/usr/local/bin"
clear
echo "⚙️  Iniciando remoção do Git Helper..."
read -p "Tem certeza que deseja desinstalar o Git Helper? [s/N]: " confirm
confirm=${confirm:-N}

if [[ ! "$confirm" =~ ^[sS]$ ]]; then
  echo "❌ Remoção cancelada."
  exit 0
fi

# Remove links simbólicos
sudo rm -f "$BIN_PATH/git-add-helper"
sudo rm -f "$BIN_PATH/git-commit-helper"
sudo rm -f "$BIN_PATH/git-helper-update"
sudo rm -f "$BIN_PATH/git-helper-remove"

# Remove diretório de instalação
if [ -d "$INSTALL_DIR" ]; then
  rm -rf "$INSTALL_DIR"
fi

echo "✅ Git Helper removido com sucesso!"
echo "💡 Você pode reinstalar a qualquer momento com:"
echo "   curl -fsSL https://raw.githubusercontent.com/maxrodrigues/git-helper/main/cli/install.sh | bash"
