# 01 · Antes × Depois: a mudança de paradigma

_Última revisão: 2026-10_

**Objetivo:** entender o que muda no seu trabalho diário, e o que não muda, quando você passa a programar com um agente.

## Em uma frase

Antes, o gargalo era **digitar e pesquisar**. Agora é **especificar com clareza e verificar**.

## O fluxo, lado a lado

| Etapa | Antes | Depois (com Claude Code) |
|---|---|---|
| Entender código novo | Ler arquivos na mão, `grep`, seguir chamadas | Perguntar: "como funciona o fluxo de X?" e conferir os arquivos citados |
| Escrever | Digitar, consultar docs e Stack Overflow | Descrever o objetivo, revisar o plano, revisar o diff |
| Depurar | Reproduzir, logar, pesquisar o erro | Colar o erro, pedir reprodução com teste e correção da causa raiz |
| Testar | Escrever testes depois (ou nunca) | Testes como critério de sucesso: o agente itera até passar |
| Refatorar | Editar arquivo por arquivo | Descrever a regra e revisar as mudanças em lote |
| Documentar | Tarefa adiada | Gerada junto com a mudança, sob sua revisão |
| Code review | Você revisa o código dos outros | Você revisa o código dos outros **e o do agente** |

## Seu papel muda

| Antes | Depois |
|---|---|
| Digitador e executor | Quem define o objetivo, delega e revisa |
| Valor em saber a sintaxe de cabeça | Valor em design, critério e julgamento |
| Feedback em minutos ou horas | Feedback em segundos; iterações curtas |
| Um assunto por vez | Várias tentativas e abordagens exploradas rápido |

## Mesmo trabalho, dois jeitos

Tarefa: **validar a URL no encurtador antes de salvar**.

**Antes**
1. Abrir o handler e achar onde a URL é recebida.
2. Pesquisar como validar URL na linguagem.
3. Escrever a validação e os casos de erro.
4. Escrever os testes, rodar, ajustar.
5. Revisar a própria mudança e fazer o commit.

**Depois**
```
Valide a URL em @src/shorten.py antes de salvar. Aceite só http/https com host,
rejeite o resto com erro 400. Siga o estilo de @tests/test_shorten.py, escreva
os testes primeiro e rode a suíte ao final.
```
Você lê o plano, aprova, lê o diff, confirma que os testes passam e faz o commit.

O trabalho de digitar encolheu. O de **pensar o que está certo** e **conferir** não.

## O que não muda

- Fundamentos: arquitetura, estruturas de dados, protocolos, banco. Sem eles você não revisa.
- **A responsabilidade é sua.** O que entra no commit é seu, tenha quem escreveu sido você ou o agente.
- Git, testes, revisão e boas práticas continuam sendo a rede de segurança.

## Onde o novo fluxo falha

| Risco | Defesa |
|---|---|
| Resposta confiante, mas errada | Exigir execução de testes; ler o diff |
| Aceitar sem entender | Se não consegue explicar a mudança, não faça o commit |
| Mudança grande demais para revisar | Fatiar em passos pequenos |
| Contexto poluído, resultado pior | Uma sessão por assunto; `/clear` |
| Atrofia das suas habilidades | Continue lendo código, pedindo explicações e escrevendo o que importa |

## Exercício

1. Escolha uma tarefa pequena do seu backlog.
2. Anote como você a faria sem o agente (passos e tempo estimado).
3. Faça com o Claude Code, usando um prompt com objetivo e critério de sucesso.
4. Compare: onde ganhou tempo? Onde teve que corrigir o agente?

## Checklist

- [ ] Sei dizer onde o gargalo mudou
- [ ] Sei o que continua sendo minha responsabilidade
- [ ] Sei três riscos do novo fluxo e a defesa para cada um

**Próximo:** [02 · AI Native](02-ai-native.md)
