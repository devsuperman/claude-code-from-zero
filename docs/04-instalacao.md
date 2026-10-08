# 04 · Instalação e primeiro uso

_Última revisão: 2026-10 · Confirme os passos atuais na [documentação oficial](https://docs.claude.com/en/docs/claude-code/setup)._

**Objetivo:** instalar, autenticar e fazer a primeira pergunta ao código.

## Instalar

Duas formas comuns:

```bash
# Instalador nativo (macOS, Linux, WSL)
curl -fsSL https://claude.ai/install.sh | bash

# Via npm (requer Node.js recente)
npm install -g @anthropic-ai/claude-code
```

Confirme:

```bash
claude --version
```

## Primeira sessão

```bash
cd meu-projeto
claude
```

Na primeira execução ele pede autenticação (conta Claude ou chave de API) e abre o navegador. Depois, escreva em linguagem natural e tecle Enter.

## Seus primeiros prompts

Comece **só lendo**, sem pedir alterações:

```
Explique a estrutura deste projeto: pastas principais, como rodar e como testar.
```

```
Onde é feita a autenticação? Mostre os arquivos e o fluxo.
```

## O essencial da interface

| Ação | Como |
|------|------|
| Ajuda | `/help` |
| Interromper o que ele está fazendo | `Esc` |
| Sair | `Ctrl+C` duas vezes, ou `/exit` |
| Referenciar um arquivo | `@caminho/arquivo` |
| Rodar um comando de shell direto | prefixe com `!` |
| Alternar modo (normal / aceitar edições / plano) | `Shift+Tab` |
| Limpar o contexto | `/clear` |
| Retomar conversa anterior | `claude --continue` ou `claude --resume` |

## Exercício

1. Instale e autentique.
2. Abra uma sessão em um projeto seu (ou clone qualquer projeto open source pequeno).
3. Peça uma explicação da arquitetura. Depois pergunte algo específico, usando `@` para apontar um arquivo.
4. Pressione `Esc` no meio de uma resposta e redirecione.
5. Saia e retome a sessão com `claude --continue`.

## Problemas comuns

- **`claude: command not found`:** o diretório de binários não está no `PATH`. Reabra o terminal ou revise a instalação.
- **Login não abre o navegador:** copie a URL exibida e abra manualmente.
- **Rodou na pasta errada:** o Claude Code trabalha a partir do diretório atual. Entre na raiz do projeto antes de iniciar.

## Checklist

- [ ] `claude --version` funciona
- [ ] Fiz uma pergunta sobre o código e li a resposta
- [ ] Usei `@arquivo`, `Esc` e retomei uma sessão

**Próximo:** [05 · Como o Claude Code trabalha](05-como-funciona.md)
