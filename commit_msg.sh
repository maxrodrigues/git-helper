#!/usr/bin/env bash
set -e

# ==============================
# 🧠 Funções auxiliares
# ==============================
check_fzf() {
  if ! command -v fzf &>/dev/null; then
    echo "⚠️  fzf não encontrado."
    read -p "Deseja instalar automaticamente? [S/n]: " resp
    resp=${resp:-S}
    if [[ "$resp" =~ ^[sS]$ ]]; then
      echo "📦 Instalando fzf..."
      if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install fzf
      else
        sudo apt update -qq && sudo apt install -y fzf
      fi
      echo "✅ fzf instalado com sucesso!"
    else
      echo "❌ Instalação cancelada. Execute 'sudo apt install fzf' manualmente."
      exit 1
    fi
  fi
}

# ==============================
# 🚀 Início do script
# ==============================
clear
check_fzf

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'

# Verifica alterações
if git diff --cached --quiet && git diff --quiet; then
  echo "🌈 Nenhuma alteração encontrada — bora tomar um café?"
  exit 0
fi

# informa a branch atual
branch=$(git branch --show-current)
echo "📦 Branch atual: $branch"
echo

types=(
  "feat: Novo recurso ✨"
  "fix: Correção de bug 🐛"
  "docs: Documentação 📚"
  "test: Testes 🧪"
  "build: Build ➕"
  "perf: Performance ⚡"
  "style: Estilo de código 🎨"
  "refactor: Refatoração ♻️"
  "chore: Tarefas diversas 🔧"
  "ci: Integração contínua 🧱"
  "raw: Dados RAW 🗃️"
  "cleanup: Limpeza de código 🧹"
  "remove: Remoção de arquivos 🗑️"
  "Cancelar"
)

echo "🎯 Selecione o tipo de commit:"
selected=$(printf "%s\n" "${types[@]}" | fzf --prompt="Tipo de commit ➜ " --height=50% --border --ansi)

# Caso o usuário cancele a seleção
if [[ -z "$selected" ]]; then
  echo "☕ Nenhum tipo selecionado — pausa pro café!"
  exit 0
fi

# Extrai o tipo (antes dos dois pontos)
type=$(echo "$selected" | cut -d':' -f1)
emoji=$(echo "$selected" | awk '{print $NF}' | tr -d '[:space:]')

echo
read -p "✏️  Escreva a mensagem do commit: " message
if [[ -z "$message" ]]; then
  echo "⚠️  A mensagem do commit não pode estar vazia!"
  exit 1
fi

commit_message="[$type] $selected: $message"

echo
echo "💬 Commit final:"
echo "$commit_message"
read -p "Confirmar commit? [S/n]: " confirm
confirm=${confirm:-S}
[[ ! $confirm =~ ^[sS]$ ]] && echo "❌ Commit cancelado." && exit 0

git add -A
git commit -m "$commit_message"

echo
echo "✅ Commit criado com sucesso!"
echo "📜 $commit_message"


#echo "1. feat: Novo recurso ✨"
#echo "2. fix: Correção de bug 🐛"
#echo "3. docs: Documentação 📚"
#echo "4. test: Testes 🧪"
#echo "5. build: Build ➕"
#echo "6. perf: Performance ⚡"
#echo "7. style: Estilo de código 🎨"
#echo "8. refactor: Refatoração ♻️"
#echo "9. chore: Tarefas 🔧"
#echo "10. ci: Integração contínua 🧱"
#echo "11. raw: Dados RAW 🗃️"
#echo "12. cleanup: Limpeza de código 🧹"
#echo "13. remove: Remoção de arquivos 🗑️"
#echo "0. Cancelar ❌"
#echo

#read -p "Digite o número correspondente ao tipo de commit: " commit_type
#
#case $commit_type in
#  0) echo "Operação cancelada."; exit 0;;
#  1) type="feat"; emoji="✨";;
#  2) type="fix"; emoji="🐛";;
#  3) type="docs"; emoji="📚";;
#  4) type="test"; emoji="🧪";;
#  5) type="build"; emoji="➕";;
#  6) type="perf"; emoji="⚡";;
#  7) type="style"; emoji="🎨";;
#  8) type="refactor"; emoji="♻️";;
#  9) type="chore"; emoji="🔧";;
#  10) type="ci"; emoji="🧱";;
#  11) type="raw"; emoji="🗃️";;
#  12) type="cleanup"; emoji="🧹";;
#  13) type="remove"; emoji="🗑️";;
#  *) echo "Tipo de commit inválido"; exit 1;;
#esac

#echo
#read -p "✏️  Escreva a mensagem do commit: " message
#if [[ -z "$message" ]]; then
#  echo "⚠️  A mensagem não pode estar vazia!"
#  exit 1
#fi

#commit_message="[$type] $emoji: $message"
#commit_message="[$type] $selected: $message"
#echo
#echo "💬 Commit final:"
#echo "$commit_message"
#read -p "Confirmar commit? [S/n]: " confirm
#confirm=${confirm:-S}
#[[ ! $confirm =~ ^[sS]$ ]] && echo "❌ Commit cancelado." && exit 0
#
#git commit -a -m "$commit_message"
#
#echo
#echo "✅ Commit criado com sucesso: $commit_message"
