# Cheatsheet

> Resumo rápido. Para a lista completa e atual, use `/help` e a [documentação oficial](https://docs.claude.com/en/docs/claude-code/overview).

## Terminal

| Comando | O que faz |
|---------|-----------|
| `claude` | Inicia sessão interativa |
| `claude "prompt"` | Inicia já com um prompt |
| `claude -p "prompt"` | Modo não interativo: responde e sai |
| `claude --continue` | Retoma a última conversa |
| `claude --resume` | Escolhe uma conversa anterior |
| `claude --version` | Mostra a versão |

## Dentro da sessão

| Comando | O que faz |
|---------|-----------|
| `/help` | Ajuda e lista de comandos |
| `/init` | Gera um `CLAUDE.md` para o projeto |
| `/clear` | Zera o contexto |
| `/compact` | Resume o histórico para liberar contexto |
| `/context` | Mostra o uso da janela de contexto |
| `/cost` | Mostra o consumo da sessão |
| `/model` | Troca o modelo |
| `/permissions` | Vê e edita regras de permissão |
| `/resume` | Retoma uma conversa anterior |
| `/exit` | Sai |

## Atalhos

| Atalho | O que faz |
|--------|-----------|
| `Esc` | Interrompe a ação atual |
| `Shift+Tab` | Alterna modo: normal, aceitar edições, plano |
| `@arquivo` | Referencia um arquivo |
| `!comando` | Executa um comando de shell direto |
| `Ctrl+C` | Cancela entrada / sai (duas vezes) |

## Primeiros passos

**Projeto existente** ([módulo 07](docs/07-projeto-existente.md))

1. `git switch -c claude/tarefa` (árvore limpa) e `claude`
2. "Explique a arquitetura e como testar. Não altere nada."
3. `/init` → revisar e enxugar o `CLAUDE.md`
4. Rodar testes/lint; tarefa pequena com critério de sucesso
5. `git diff` → commit

**Projeto novo** ([módulo 08](docs/08-projeto-novo.md))

1. `git init` e `claude`
2. Modo plano: escopo, stack, endpoints, fatias
3. Esqueleto mínimo + teste + README com comandos
4. `CLAUDE.md` inicial → primeiro commit
5. Fatias: funcionalidade → teste → commit

## Qual ferramenta? ([módulo 03](docs/03-alternativas.md))

| Preciso de... | Categoria |
|---|---|
| Delegar tarefas no repo, com automação | Agente de terminal |
| Tudo dentro do editor | IDE com IA / extensão |
| Atribuir uma issue e receber um PR | Agente na nuvem |

## Regras de bolso

1. Uma sessão, um assunto. Mudou de tarefa? `/clear`.
2. Explore e planeje antes de implementar.
3. Sempre dê um critério de sucesso verificável.
4. Leia os diffs.
5. Errou 3 vezes seguidas? Recomece com um prompt melhor.
