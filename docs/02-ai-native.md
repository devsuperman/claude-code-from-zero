# 02 · AI Native

_Última revisão: 2026-10_

**Objetivo:** entender o que significa trabalhar de forma AI native, o que isso muda e por que importa.

## O que é

**AI native** é projetar o jeito de trabalhar (e, às vezes, o produto) assumindo que a IA está presente desde o início, e não encaixada depois.

| | Usar IA | Ser AI native |
|---|---|---|
| Ponto de partida | Fluxo antigo + uma ferramenta nova | Fluxo pensado para humano + agente |
| Onde a IA entra | Em momentos isolados (um autocomplete, uma pergunta) | Em todo o ciclo: explorar, planejar, implementar, testar, revisar |
| O que você prepara | Nada de especial | Contexto, testes e especificações que o agente consiga usar |
| Pergunta típica | "A IA consegue fazer isso?" | "Como estruturo o trabalho para a IA fazer isso bem?" |

## O que muda

- **O repositório vira interface.** `CLAUDE.md`, testes, scripts de build e mensagens de commit claras passam a ser insumo do agente, não só da equipe.
- **Especificação ganha valor.** Quem descreve bem o problema e o critério de sucesso obtém mais.
- **Testes viram o contrato.** Sem verificação automática, o agente trabalha às cegas e você revisa tudo na mão.
- **Revisão vira o centro do trabalho.** Gerar código é barato; garantir que está certo, não.
- **Iteração fica curta.** Experimentar duas abordagens custa minutos, então vale comparar antes de decidir.
- **Habilidades valorizadas:** design de sistemas, leitura crítica de código, domínio do negócio, comunicação precisa.

## Por que importa

- **Velocidade:** tarefas repetitivas e exploratórias caem de horas para minutos.
- **Custo de experimentar:** protótipos e refatorações antes impraticáveis ficam viáveis.
- **Competitividade:** quem aprende a delegar bem entrega mais com o mesmo time.
- **Qualidade, se bem feito:** testes e documentação deixam de ser o que "fica para depois".

## Os riscos

| Risco | Como lidar |
|---|---|
| Dívida técnica por código aceito sem entender | Revisão obrigatória; mudanças pequenas |
| Excesso de confiança | Critérios verificáveis; testes rodando |
| Segurança e vazamento de dados | Permissões mínimas, sem segredos no diretório, revisar comandos |
| Dependência de uma ferramenta | Conhecer as [alternativas](03-alternativas.md); manter o conhecimento no repositório |

## Níveis de adoção

| Nível | Como se trabalha |
|---|---|
| 0 | Sem IA |
| 1 | Autocomplete |
| 2 | Chat: você cola código e copia a resposta |
| 3 | Agente interativo (este curso): você delega e revisa |
| 4 | Agentes em paralelo ou em automação (CI, modo headless), com você supervisionando |

Quase ninguém precisa do nível 4 no primeiro dia. Suba um nível por vez, quando o anterior estiver confortável.

## Como começar

1. Escolha um projeto real e peça ao agente que explique a arquitetura.
2. Crie um `CLAUDE.md` com comandos e convenções.
3. Garanta que os testes rodam com um comando.
4. Delegue tarefas pequenas com critério de sucesso.
5. Anote o que o agente errou e leve a correção para o `CLAUDE.md`.

## Exercício

Avalie um projeto seu:

1. Os testes rodam com um único comando?
2. Um estranho (ou um agente) consegue descobrir como rodar o projeto lendo só o repositório?
3. As convenções estão escritas em algum lugar?

Cada "não" é uma melhoria que torna o projeto mais AI native. Corrija a primeira.

## Checklist

- [ ] Sei diferenciar usar IA de ser AI native
- [ ] Sei três mudanças práticas no meu jeito de trabalhar
- [ ] Sei em que nível de adoção estou

**Próximo:** [03 · Alternativas ao Claude Code](03-alternativas.md)
