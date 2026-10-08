# 00 · Antes de começar

_Última revisão: 2026-10_

## O que é o Claude Code

Um **agente de código** que roda no seu terminal (e também em IDEs, no app desktop e na web). Você descreve um objetivo; ele lê o projeto, edita arquivos, roda comandos e itera até concluir ou pedir ajuda.

## Como difere do que você já usa

| | Chat (claude.ai) | Autocomplete (Copilot etc.) | Claude Code |
|---|---|---|---|
| Vê seu código | Só o que você cola | Arquivo aberto | O projeto inteiro, sob demanda |
| Executa comandos | Não | Não | Sim (com sua permissão) |
| Edita vários arquivos | Não | Limitado | Sim |
| Itera sozinho (roda testes, corrige) | Não | Não | Sim |
| Quem dirige | Você, copiando e colando | Você, linha a linha | Você define o objetivo; ele executa |

## A mudança de mentalidade

Com um agente, seu papel se parece mais com o de um **tech lead que delega e revisa** do que o de quem digita. Isso traz três consequências que o curso inteiro desenvolve:

1. **Contexto é o recurso mais valioso.** Quanto mais focada e limpa a sessão, melhor o resultado.
2. **Verificação é obrigatória.** O agente pode errar com confiança. Dê a ele formas de checar o próprio trabalho (testes, linter) e revise os diffs.
3. **Prompts específicos vencem prompts mágicos.** Clareza sobre o que, onde e como saber que terminou.

## Pré-requisitos

- Terminal e git no dia a dia
- Um projeto de código (pode ser pequeno)
- Conta com acesso ao Claude Code (plano Pro/Max ou API). Veja planos e limites na documentação oficial.

## Custos e limites

O uso consome tokens, e sessões longas com muito contexto consomem mais. Hábitos que reduzem custo também melhoram qualidade: sessões curtas, tarefas focadas, `/clear` entre assuntos. Use `/cost` para acompanhar.

## Quando **não** usar

- Para decisões que você ainda não entende: peça uma explicação ou um plano primeiro, em vez de pedir a implementação.
- Em mudanças triviais que você faz em 10 segundos.
- Com segredos ou dados sensíveis expostos no diretório (veja o módulo de segurança, em breve).

## Checklist

- [ ] Sei explicar a diferença entre chat, autocomplete e agente
- [ ] Entendo por que contexto e verificação importam
- [ ] Tenho um projeto para praticar

**Próximo:** [01 · Instalação e primeiro uso](01-instalacao.md)
