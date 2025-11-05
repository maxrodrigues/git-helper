# 🪶 Git Helper

> Um assistente de linha de comando para deixar seus commits Git mais rápidos, padronizados e... divertidos ☕

O **Git Helper** é um conjunto de scripts Bash que tornam o uso do Git mais fluido, bonito e interativo — com menus, seleção de arquivos via [fzf](https://github.com/junegunn/fzf) e mensagens de commit padronizadas com emojis.

---

## 🚀 Funcionalidades

* ✅ Seleção de arquivos modificados com `fzf`
* ✅ Padronização de mensagens de commit (feat, fix, docs, etc.)
* ✅ Emojis automáticos e prompts interativos
* ✅ Auto-instalação e auto-atualização
* ✅ Mensagens descontraídas quando o repositório está limpo ☕
* ✅ Remoção simples e completa via comando

---

## 🧩 Estrutura de comandos

| Comando             | Descrição                                                     |
| ------------------- | ------------------------------------------------------------- |
| `add`    | Seleciona interativamente os arquivos a adicionar (`git add`) |
| `commit` | Cria commits padronizados com seleção via `fzf`               |
| `git-helper-update` | Atualiza o Git Helper para a versão mais recente              |
| `git-helper-remove` | Remove completamente o Git Helper do sistema                  |

---

## ⚙️ Instalação

Execute no terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/maxrodrigues/git-helper/main/install.sh | bash
```

Isso irá:

* Clonar o repositório para `~/.git-helper`
* Criar links simbólicos em `/usr/local/bin`
* Garantir permissão de execução nos scripts

---

## 🔁 Atualização

A qualquer momento, você pode atualizar o Git Helper com:

```bash
git-helper-update
```

O script verifica se há uma nova versão no repositório remoto e pergunta antes de atualizar.

---

## ❌ Desinstalação

Para remover completamente o Git Helper:

```bash
git-helper-remove
```

Isso apaga todos os scripts, links simbólicos e o diretório `~/.git-helper`.

---

## 🕹️ Uso

### 🧱 Adicionando arquivos

```bash
add
```

➡️ Aparecerá um menu interativo com todos os arquivos modificados.
Use as setas para navegar e **barra de espaço** para marcar os arquivos.
Pressione **Enter** para confirmar.

---

### ✏️ Criando commits

```bash
commit
```

➡️ Escolha o tipo de commit (feat, fix, docs...)
➡️ Escreva a mensagem do commit
➡️ Confirme antes de finalizar

Exemplo de saída:

```
[feat] ✨: Adiciona tela de login com autenticação JWT
```

---

## 💡 Exemplos de commits gerados

```
[fix] 🐛: Corrige bug ao salvar formulário
[refactor] ♻️: Melhora estrutura do componente Header
[cleanup] 🧹: Remove código e comentários obsoletos
```

---

## 🧠 Requisitos

* **Git**
* **fzf** — o script instala automaticamente, se necessário.

    * Instalação manual:

      ```bash
      sudo apt install fzf
      ```

      ou no macOS:

      ```bash
      brew install fzf
      ```

---

## 📜 Licença

Distribuído sob a licença **MIT** — sinta-se livre para usar, modificar e contribuir! Lembre-se de referenciar!
> “Um bom commit conta uma história. Um ótimo commit vem com um café.” ☕
