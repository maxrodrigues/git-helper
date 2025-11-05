# 🤝 Contribuindo com o Git Helper

Obrigado por se interessar em contribuir com o **Git Helper**! ☕
Toda ajuda é bem-vinda — seja corrigindo bugs, sugerindo melhorias, escrevendo documentação ou criando novas funcionalidades.

---

## 🧱 Estrutura do Projeto

O repositório é composto por alguns scripts principais:

| Arquivo     | Função                                          |
| ----------- | ----------------------------------------------- |
| `add.sh`    | Seleção interativa de arquivos para commit      |
| `commit.sh` | Criação de commits padronizados com emojis      |
| `update.sh` | Verifica e instala atualizações                 |
| `install.sh` | Instala o Git Helper e cria os links simbólicos |
| `uninstall.sh` | Remove completamente o Git Helper               |

---

## 🧩 Como configurar o ambiente local

1. **Clone o repositório**

   ```bash
   git clone https://github.com/maxrodrigues/git-helper.git
   cd git-helper
   ```

2. **Dê permissão de execução aos scripts**

   ```bash
   chmod +x *.sh
   ```

3. **(Opcional)** Instale globalmente os comandos:

   ```bash
   sudo bash install.sh
   ```

4. **Teste localmente**

   ```bash
   ./add.sh
   ./commit.sh
   ```

---

## 🧠 Padrões de código

* Scripts escritos em **Bash puro**, portáveis entre Linux e macOS.
* Sempre inclua o *shebang* padrão:

  ```bash
  #!/usr/bin/env bash
  ```
* Use `set -e` no início dos scripts para abortar em caso de erro.
* Evite dependências externas sempre que possível.
* Mensagens de terminal devem ser **claras, curtas e amigáveis**.

---

## 🧾 Padrão de commits

Siga o padrão **Conventional Commits** com emojis para manter o histórico limpo e expressivo, caso tenha duvidas utilize o comando de `commit` do projeto.

Exemplo:

```
[feat] ✨: Adiciona verificação automática de atualizações
```

---

## 🧩 Submetendo alterações

1. Faça um fork do projeto
2. Faça suas alterações e adicione commits claros e em português.
3. Execute os scripts localmente para garantir que funcionam.
4. Abra um **Pull Request** descrevendo sua mudança.

---

## 💡 Sugestões de melhorias

* Adicionar suporte a `git push` automático.
* Criar opção para templates personalizados de commits.
* Implementar logs coloridos com histórico de versões.

---

## 🫶 Código de conduta

Seja respeitoso, colaborativo e construtivo.
Nosso objetivo é tornar o Git Helper uma ferramenta útil e divertida para toda a comunidade.

---

> “Contribuir é como commitar: quanto mais claro, melhor.” ☕
> **Feito com 💻 e ☕ por [Max Rodrigues](https://github.com/maxrodrigues)**
