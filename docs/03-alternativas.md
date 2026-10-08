# 03 · Alternativas ao Claude Code

_Última revisão: 2026-10 · Este mercado muda rápido. Preços, modelos, limites e recursos **não** estão neste módulo de propósito: confira nas páginas oficiais linkadas abaixo._

**Objetivo:** saber que tipos de ferramenta existem, o que têm em comum e quando cada uma faz sentido.

## Quatro categorias

| Categoria | Ideia | Exemplos |
|---|---|---|
| **Agente de terminal** | Você dá um objetivo; ele lê, edita e roda comandos no seu projeto | Claude Code, [Codex CLI](https://github.com/openai/codex), [Gemini CLI](https://github.com/google-gemini/gemini-cli), [Aider](https://aider.chat/docs) |
| **IDE com IA integrada** | Editor próprio com chat e modo agente embutidos | [Cursor](https://cursor.com/docs) |
| **Extensão de IDE** | Agente dentro do editor que você já usa | [Cline](https://docs.cline.bot), [GitHub Copilot](https://docs.github.com/en/copilot) |
| **Agente na nuvem** | Você atribui uma tarefa (issue) e recebe um pull request | Copilot coding agent, Claude Code na web |

Chat (colar código) e autocomplete (sugestão de linha) são o nível básico e continuam úteis, mas não executam o trabalho por você.

## O que têm em comum

- Usam modelos de linguagem (LLMs) para entender e alterar código.
- Leem arquivos do projeto e propõem ou aplicam edições.
- Pedem permissão para ações sensíveis, em graus variados.
- Dependem de **bom contexto, critério de sucesso e revisão sua**.

Tudo o que você aprende neste curso sobre prompts, contexto e verificação vale para qualquer uma delas.

## No que diferem

| Eixo | Pergunta a fazer |
|---|---|
| **Onde roda** | Terminal, IDE, nuvem ou todos? |
| **Autonomia** | Sugere e espera, ou executa e itera sozinho? |
| **Modelos** | Fixo de um fornecedor, ou você escolhe (inclusive locais)? |
| **Código aberto** | A ferramenta é aberta e auditável? |
| **Extensibilidade** | Suporta plugar ferramentas, hooks, comandos e automação? |
| **Automação/CI** | Roda sem interação (scripts, pipelines)? |
| **Preço** | Assinatura, pagamento por uso ou chave de API própria? |
| **Privacidade** | Para onde vai seu código? Há opções corporativas? |

## Perfil geral do Claude Code

- **Terminal em primeiro lugar**, com versões em IDE, desktop e web.
- Usa os modelos da Anthropic.
- Foco em agente autônomo: lê, edita, executa, itera.
- Extensível (`CLAUDE.md`, comandos e skills, subagentes, hooks, MCP) e utilizável em automação (modo headless).

Esse é o perfil que o curso assume. Confira detalhes e limites atuais na [documentação oficial](https://docs.claude.com/en/docs/claude-code/overview).

## Quando considerar outra opção

| Se você... | Considere |
|---|---|
| Vive no editor e quer tudo ali | IDE com IA (ex.: Cursor) ou extensão (ex.: Cline, Copilot) |
| Quer escolher ou trocar de modelo, ou usar modelos próprios | Ferramentas abertas e multi-modelo (ex.: Aider, Cline) |
| Já paga um ecossistema e quer integração nativa | A ferramenta daquele fornecedor (ex.: Copilot no GitHub, Codex CLI, Gemini CLI) |
| Quer delegar tarefas e só revisar o PR | Agente na nuvem |
| Quer um agente de terminal com extensibilidade e automação | Claude Code |

Não é uma escolha exclusiva. É comum usar uma IDE para edição do dia a dia e um agente de terminal para tarefas maiores.

## Como avaliar na prática

Rode **a mesma tarefa real** em duas ferramentas, com o mesmo prompt, e compare:

1. O resultado passou nos testes?
2. Quanto você teve que corrigir?
3. O diff foi fácil de revisar?
4. Quanto tempo e custo?

Decida pelo seu projeto, não por ranking ou propaganda.

## Exercício

1. Escolha uma tarefa pequena do seu backlog.
2. Execute-a no Claude Code e em uma alternativa à sua escolha.
3. Preencha a tabela de 4 perguntas acima para cada uma.

## Checklist

- [ ] Sei citar as quatro categorias e um exemplo de cada
- [ ] Sei três pontos em comum e três diferenças
- [ ] Sei como comparar ferramentas no meu projeto

**Próximo:** [04 · Instalação e primeiro uso](04-instalacao.md)
