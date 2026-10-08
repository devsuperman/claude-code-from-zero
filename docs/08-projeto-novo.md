# 08 · Começando um projeto do zero

_Última revisão: 2026-10_

**Objetivo:** criar um projeto novo com o Claude Code desde o primeiro commit, em fatias pequenas e verificáveis.

Exemplo ao longo do módulo: o **encurtador de URLs** do [projeto-fio-condutor](../exemplos/README.md). Troque a stack pela sua.

## Passo a passo

### 1. Crie a pasta e o repositório

```bash
mkdir encurtador && cd encurtador
git init
claude
```

Use git desde o minuto zero: cada fatia vira um commit e você pode voltar atrás.

### 2. Defina o escopo em modo plano

Alterne para o modo plano (`Shift+Tab`) e converse antes de gerar qualquer coisa:

```
Quero um encurtador de URLs: recebe uma URL longa, devolve um código curto, e redireciona o código para a URL original. Stack: Python + FastAPI + SQLite. Sem autenticação por enquanto.

Proponha: estrutura de pastas, endpoints, modelo de dados e a ordem das fatias de implementação. Pergunte o que estiver ambíguo. Não crie arquivos.
```

Leia, ajuste e só então avance. É aqui que decisões ruins custam mais barato.

### 3. Gere o esqueleto mínimo

```
Crie só o esqueleto: estrutura de pastas, dependências, um endpoint /health e um teste que o chama. Inclua um README curto com os comandos para instalar, rodar e testar.
```

Rode você mesmo os comandos do README. Se não rodam, corrija agora.

### 4. Crie o `CLAUDE.md` inicial

```
Crie um CLAUDE.md enxuto com os comandos de instalar, rodar, testar e lintar, e as convenções que combinamos.
```

Revise e faça o primeiro commit (esqueleto + `CLAUDE.md` + teste passando).

### 5. Evolua em fatias

Cada fatia segue o mesmo ciclo: **uma funcionalidade → teste → commit**.

```
Fatia 1: POST /links recebe {"url": "..."} e devolve {"code": "..."}. Escreva o teste primeiro, depois a implementação. Rode a suíte ao final.
```

```
Fatia 2: GET /{code} redireciona (302) para a URL original; 404 se o código não existir. Mesmo ciclo.
```

Antes de cada commit: `git diff`, testes verdes.

### 6. Realimente o `CLAUDE.md`

Quando o agente errar algo que vai se repetir (ex.: usar uma biblioteca fora do combinado), adicione uma linha ao `CLAUDE.md`. Ele melhora a cada fatia.

## Boas práticas para projetos novos

- **Fatias pequenas:** se você não consegue revisar o diff em poucos minutos, a fatia é grande demais.
- **Teste primeiro** sempre que possível: é o critério de sucesso do agente.
- **Decida a stack você mesmo.** Peça opções e prós/contras, mas a escolha é sua.
- **Não gere tudo de uma vez.** Um "app completo" num prompt só vira código que ninguém entende.
- **Segredos fora do repo:** `.env` no `.gitignore` desde o primeiro commit.

## Existente × novo: o que muda

| | Projeto existente | Projeto novo |
|---|---|---|
| Primeiro passo | Entender o que já existe | Definir o que construir |
| `CLAUDE.md` | Gerado do código, depois enxugado | Escrito junto com as decisões |
| Risco principal | Quebrar o que funciona | Crescer sem rumo |
| Rede de segurança | Testes existentes (se houver) | Testes que você cria desde a fatia 1 |

## Exercício

1. Crie um projeto novo seguindo os passos 1 a 5 (use o encurtador ou outro à sua escolha).
2. Entregue pelo menos duas fatias, cada uma com teste e commit próprio.
3. Registre no `CLAUDE.md` pelo menos uma correção aprendida no caminho.

## Checklist

- [ ] Planejei em modo plano antes de gerar código
- [ ] O esqueleto roda e testa com os comandos do README
- [ ] Cada fatia tem teste e commit próprio
- [ ] O `CLAUDE.md` reflete o que aprendi

**Próximo:** módulo 09 (em breve)
