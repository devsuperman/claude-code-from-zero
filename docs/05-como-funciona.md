# 05 · Como o Claude Code trabalha

_Última revisão: 2026-10_

**Objetivo:** entender o mecanismo (loop, ferramentas, contexto, permissões) para evitar a maioria dos erros de uso.

## O loop do agente

```
Você pede → Claude decide uma ação → usa uma ferramenta → lê o resultado → decide o próximo passo → ... → responde
```

Repete até concluir. Cada passo é visível e você interrompe com `Esc`.

## Ferramentas

O modelo só gera texto; as **ferramentas** é que agem:

| Tipo | Exemplos | Pede permissão? |
|------|----------|-----------------|
| Leitura | ler arquivo, listar pastas, buscar texto | Em geral não |
| Edição | criar e alterar arquivos | Sim, por padrão |
| Execução | comandos de shell (testes, build, git) | Sim, por padrão |
| Externas | web, servidores MCP | Depende da configuração |

## Contexto: o recurso escasso

Mensagens, arquivos lidos e saídas de comandos vão para a **janela de contexto**, que é limitada.

- Quanto mais cheia, **pior a atenção** do modelo aos detalhes e **maior o custo**.
- Arquivos grandes e logs longos consomem muito.
- `/context` mostra o uso; `/clear` zera; `/compact` resume o histórico.

**Regra prática:** uma sessão, um assunto. Mudou de tarefa? `/clear`.

## Permissões

Por padrão o Claude Code **pergunta antes** de editar ou executar. Você escolhe:

- **Aprovar uma vez**
- **Aprovar sempre** para aquele tipo de ação
- **Negar** e explicar o que prefere

`Shift+Tab` alterna entre modos:

1. **Normal:** pergunta tudo que modifica algo
2. **Aceitar edições:** edita sem perguntar, mas continua perguntando sobre comandos
3. **Plano:** só lê e propõe um plano, sem alterar nada

> Comece em modo normal para aprender o que ele faz. Libere aos poucos o que for seguro (por exemplo, `npm test`). Um módulo futuro de segurança aprofunda isso.

## Memória do projeto: CLAUDE.md

O modelo não lembra de sessões anteriores. O que persiste é o **`CLAUDE.md`** na raiz do projeto, lido no início de cada sessão: comandos de build/teste, convenções e avisos. Crie com `/init` e use [este template](../templates/CLAUDE.md.exemplo) como base. Os módulos [07](07-projeto-existente.md) e [08](08-projeto-novo.md) mostram como criá-lo.

## Ele erra? Sim

Pode inventar uma API, assumir algo errado ou "concluir" sem verificar. Por isso:

- peça que ele rode os testes e mostre o resultado;
- leia os diffs antes de aceitar;
- desconfie de respostas que soam confiantes sobre código que ele não leu.

## Exercício

1. Em um projeto seu, peça: _"Rode os testes e me diga o que falha."_ Observe quais permissões ele pede.
2. Rode `/context` e veja quanto da janela já foi usada.
3. Alterne para o modo plano com `Shift+Tab` e peça: _"Planeje a adição de um endpoint/função X."_ Note que nada é alterado.
4. Rode `/init` e leia o `CLAUDE.md` gerado. Algo está errado ou faltando?

## Checklist

- [ ] Sei descrever o loop do agente e o papel das ferramentas
- [ ] Sei por que o contexto é limitado e como gerenciá-lo
- [ ] Sei alternar entre os modos de permissão
- [ ] Sei que o `CLAUDE.md` é a memória persistente do projeto

**Próximo:** [06 · Escrevendo bons prompts](06-bons-prompts.md)
