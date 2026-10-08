# 07 · Começando em um projeto existente

_Última revisão: 2026-10_

**Objetivo:** usar o Claude Code com segurança em um repositório que já existe, do primeiro comando à primeira mudança commitada.

## Passo a passo

### 1. Prepare o terreno

```bash
cd meu-projeto
git status            # árvore limpa?
git switch -c claude/primeira-tarefa
claude
```

Branch própria + árvore limpa = qualquer erro se desfaz com `git restore` / `git switch`.

### 2. Peça um mapa (só leitura)

```
Explique a arquitetura deste projeto: pastas principais, fluxo de uma requisição/execução típica, como rodar e como testar. Não altere nada.
```

Confira dois ou três pontos que você conhece. Se ele errar o que você sabe, desconfie do resto e peça fontes (`mostre os arquivos`).

### 3. Gere o `CLAUDE.md`

```
/init
```

Depois **revise e enxugue**. Mantenha só o que o agente erraria sem saber: comandos de build/teste/lint, convenções não óbvias, armadilhas. Use o [template](../templates/CLAUDE.md.exemplo) como guia. Faça o commit do arquivo.

### 4. Confirme que a verificação funciona

```
Rode a suíte de testes e o linter e me diga o resultado.
```

Sem um comando de verificação que funcione, o agente trabalha às cegas. Se os testes já falham, anote isso no `CLAUDE.md` para não culparem a mudança nova.

### 5. Faça uma primeira tarefa pequena

Escolha algo pequeno, de baixo risco e verificável: um bug simples, um teste faltando, um pequeno ajuste. Use os 4 elementos do [módulo 06](06-bons-prompts.md):

```
Em @src/utils/date.ts, a função formatDate quebra com datas nulas. Reproduza com um teste que falha, corrija a causa raiz e rode a suíte. Não altere a assinatura pública.
```

### 6. Revise e faça o commit

```bash
git diff
```

Leia o diff como se fosse de outra pessoa. Só então `git commit`. Se não entendeu uma parte, pergunte ao agente antes de aceitar.

## Situações comuns

| Situação | O que fazer |
|---|---|
| Repositório grande | Aponte a pasta relevante (`@src/billing/`) e peça mapas por área, não do repo todo |
| Sem testes | Primeira tarefa: pedir testes de caracterização para o trecho que vai mudar |
| Código legado confuso | Peça explicação e um plano antes; mude em passos pequenos |
| Agente ignora convenções | Escreva a convenção no `CLAUDE.md` |
| Monorepo | `CLAUDE.md` na raiz + um por pacote, com o que é específico dele |

## Exercício

Repita os passos 1 a 6 em um projeto seu. No fim, responda: o `CLAUDE.md` gerado teria evitado algum erro que o agente cometeu? Se sim, o que faltou nele?

No projeto-fio-condutor, use o [encurtador de URLs](../exemplos/README.md) como base.

## Checklist

- [ ] Trabalhei em branch própria, com árvore limpa
- [ ] Revisei e commitei um `CLAUDE.md` enxuto
- [ ] Confirmei que testes/lint rodam com um comando
- [ ] Fiz uma tarefa pequena com critério de sucesso e li o diff antes do commit

**Próximo:** [08 · Começando um projeto do zero](08-projeto-novo.md)
