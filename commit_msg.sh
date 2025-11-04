#!/usr/bin/env bash
set -e
clear

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'

# Verifica alterações
if git diff --cached --quiet && git diff --quiet; then
  echo "🌈 Nenhuma alteração encontrada — bora tomar um café?"
  exit 0
fi

branch=$(git branch --show-current)
echo "📦 Branch atual: $branch"
echo

echo -e "${GREEN}Selecione o tipo de commit:${NC}"

echo "1. feat: Novo recurso ✨"
echo "2. fix: Correção de bug 🐛"
echo "3. docs: Documentação 📚"
echo "4. test: Testes 🧪"
echo "5. build: Build ➕"
echo "6. perf: Performance ⚡"
echo "7. style: Estilo de código 🎨"
echo "8. refactor: Refatoração ♻️"
echo "9. chore: Tarefas 🔧"
echo "10. ci: Integração contínua 🧱"
echo "11. raw: Dados RAW 🗃️"
echo "12. cleanup: Limpeza de código 🧹"
echo "13. remove: Remoção de arquivos 🗑️"
echo "0. Cancelar ❌"
echo

read -p "Digite o número correspondente ao tipo de commit: " commit_type

case $commit_type in
  0) echo "Operação cancelada."; exit 0;;
  1) type="feat"; emoji="✨";;
  2) type="fix"; emoji="🐛";;
  3) type="docs"; emoji="📚";;
  4) type="test"; emoji="🧪";;
  5) type="build"; emoji="➕";;
  6) type="perf"; emoji="⚡";;
  7) type="style"; emoji="🎨";;
  8) type="refactor"; emoji="♻️";;
  9) type="chore"; emoji="🔧";;
  10) type="ci"; emoji="🧱";;
  11) type="raw"; emoji="🗃️";;
  12) type="cleanup"; emoji="🧹";;
  13) type="remove"; emoji="🗑️";;
  *) echo "Tipo de commit inválido"; exit 1;;
esac

echo
read -p "✏️  Escreva a mensagem do commit: " message
if [[ -z "$message" ]]; then
  echo "⚠️  A mensagem não pode estar vazia!"
  exit 1
fi

commit_message="[$type] $emoji: $message"

echo
echo "💬 Commit final:"
echo "$commit_message"
read -p "Confirmar commit? [S/n]: " confirm
confirm=${confirm:-S}
[[ ! $confirm =~ ^[sS]$ ]] && echo "❌ Commit cancelado." && exit 0

git commit -a -m "$commit_message"

echo
echo "✅ Commit criado com sucesso: $commit_message"
