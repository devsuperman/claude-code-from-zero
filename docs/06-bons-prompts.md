# 06 · Escrevendo bons prompts

_Última revisão: 2026-10_

**Objetivo:** escrever prompts claros: o que fazer, onde, e como saber que terminou.

## Os 4 elementos

1. **Objetivo:** o resultado esperado, não só a ação.
2. **Escopo:** onde mexer (e onde não mexer).
3. **Referências:** arquivos, padrões existentes a seguir (`@arquivo`).
4. **Critério de sucesso:** como verificar (teste, comando, comportamento).

## Antes e depois

**1. Vago → específico**

❌ `Adicione testes para o foo.py`

✅ `Escreva testes para @src/foo.py cobrindo o caso em que o usuário está deslogado. Siga o estilo de @tests/test_bar.py e evite mocks. Rode a suíte ao final.`

**2. Sem critério → verificável**

❌ `Corrija o bug do login`

✅ `Usuários com e-mail em maiúsculas não conseguem logar. Reproduza com um teste que falha, corrija a causa raiz (não o sintoma) e confirme que o teste passa e o restante da suíte continua verde.`

**3. Sem referência → seguindo padrão**

❌ `Crie um widget de calendário`

✅ `Veja como @components/HomeWidget.tsx é implementado e crie um widget de calendário seguindo o mesmo padrão. Só o necessário, sem novas bibliotecas.`

**4. Implementar às cegas → explorar primeiro**

❌ `Implemente cache nas consultas`

✅ `Antes de codar, leia como as consultas são feitas hoje e proponha 2 abordagens de cache com prós e contras. Não altere nada ainda.`

## Técnicas que funcionam

- **Peça um plano antes** em tarefas não triviais (modo plano com `Shift+Tab`).
- **Divida** tarefas grandes em passos que você consegue revisar.
- **Dê exemplos** do formato ou estilo desejado.
- **Diga o que NÃO fazer** quando houver risco (_"não altere a API pública"_).
- **Deixe ele perguntar:** _"Se algo estiver ambíguo, pergunte antes de começar."_
- **Cole o erro completo**, não uma paráfrase.
- **Corrija cedo:** se o rumo está errado, `Esc` e redirecione, em vez de esperar terminar.

## Armadilhas

- Corrigir a mesma coisa 3 vezes na mesma sessão: o contexto ficou poluído. Use `/clear` e reescreva o prompt incorporando o que aprendeu.
- Prompts enormes com tudo ao mesmo tempo. Prefira etapas.
- Aceitar sem ler. A revisão é sua parte do trabalho.

## Exercício

Pegue uma tarefa real do seu backlog.

1. Escreva primeiro o prompt "preguiçoso" e **não** o envie.
2. Reescreva com os 4 elementos.
3. Execute em modo plano, leia o plano e ajuste.
4. Execute a implementação e confira o critério de sucesso.

Compare o resultado com o que você teria obtido com o prompt preguiçoso.

## Checklist

- [ ] Meu prompt tem objetivo, escopo, referência e critério de sucesso
- [ ] Usei modo plano em uma tarefa não trivial
- [ ] Sei quando dar `Esc` ou `/clear` em vez de insistir

**Próximo:** [07 · Começando em um projeto existente](07-projeto-existente.md)
