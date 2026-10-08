# 02 · Como o Claude Code trabalha

_Última revisão: 2026-10_

Entender o mecanismo evita metade dos erros de uso.

## O loop do agente

```
Você pede → Claude decide uma ação → usa uma ferramenta → lê o resultado → decide o próximo passo → ... → responde
```

Ele repete esse ciclo até concluir. Cada passo é visível: você acompanha e pode interromper com `Esc`.

## Ferramentas

O modelo em si só gera texto. O que o torna útil são as **ferramentas** que ele aciona:

| Tipo | Exemplos | Pede permissão? |
|------|----------|-----------------|
| Leitura | ler arquivo, listar pastas, buscar texto | Em geral não |
| Edição | criar e alterar arquivos | Sim, por padrão |
| Execução | comandos de shell (testes, build, git) | Sim, por padrão |
| Externas | web, servidores MCP | Depende da configuração |

## Contexto: o recurso escasso

Tudo o que acontece na sessão (suas mensagens, arquivos lidos, saídas de comandos) vai para a **janela de contexto**, que tem tamanho limitado.

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

> Comece em modo normal para aprender o que ele faz. Libere aos poucos o que for seguro (por exemplo, `npm test`). O módulo 07 aprofunda isso.

## Memória do projeto: CLAUDE.md

O modelo não lembra de sessões anteriores. O que persiste é o arquivo **`CLAUDE.md`** na raiz do projeto, lido automaticamente no início de cada sessão. Nele ficam comandos de build/teste, convenções e avisos importantes. Crie um com `/init` e use [este template](../templates/CLAUDE.md.exemplo) como base. O módulo 06 detalha.

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

**Próximo:** [03 · Escrevendo bons prompts](03-bons-prompts.md)
