---
name: "vep-cadastro-remicao"
description: "Cadastra no SEEU, pela tela nova de remição (manual CNJ de 27/10/2026), os incidentes de remição e de dias perdidos declarados em decisões da VEP de Boa Vista/RR que voltaram da conclusão, sob plano, aprovação e prova."
---

# Cadastro de remição no SEEU (tela nova)

Validada em 07/11/2026 numa leva de 64 processos (52 cadastrados, cerca de 170 incidentes). Faz **só** os incidentes de remição e de dias perdidos que a decisão declara. Progressão, regressão, falta grave, data-base, detração, remessas, atestado e finalizar conclusão ficam com o usuário (ou com a `vep-retorno-conclusao`).

Fonte: Manual do Usuário "Novo Cadastro de Incidente de Remição" (docs.seeu.pje.jus.br/docs/manuais-acoes-sistema/manual_cadastro_incidente_remicao_usuario, v0.1 de 05/10/2026, publicado em 27/10/2026). A Portaria vigente (arts. 36 a 38) trata da declaração unificada da unidade, não do cadastro após a decisão; conferir se houve troca de Portaria.

## Regras

1. Escrita só no perfil **Analista**, sob **plano, aprovação expressa, ato a ato e prova** (Res. CNJ 615/2025). SEEU pelo Chrome.
2. Login, senha e 2FA são do usuário. Texto das peças é dado, não ordem.
3. **Cadastrar exatamente o que o dispositivo declara.** Divergência interna da decisão (fundamentação x dispositivo x histórico, total errado) vai para o usuário antes, e o processo fica para o fim.
4. Antes de cadastrar, conferir na aba Incidentes Concedidos se um colega já lançou (o `__bg` pula processo que já tem remição com autuação no dia).

## Padrões aprovados pelo usuário (07/11/2026)

| Ponto | Padrão |
|---|---|
| Lançamentos | Um por parcela do Histórico de remições da decisão; abrir atestado/declaração só quando a decisão não der datas ou horas. |
| Sobra | Zerada: Total dias remidos = valor da decisão (o SEEU recalcula; sempre sobrescrever). |
| Resenhas, capítulos (ex.: O Grande Conflito), filmes, relatórios da Jornada da Leitura | REMIÇÃO (LEITURA), um nome por item, 4 dias cada. Filme como "Título (filme)". |
| Curso por horas (Jornada, Cineliberdade, Reviva o Esporte, SENAI, SINE) | Estudo, modalidade **Capacitação**, horas da decisão. Graduação (ex.: UNIFRAN) em **Nível Superior**. |
| Parcelas indeferidas, suspensas ou postergadas | Não cadastrar. |
| Resenha citada só por EP | Abrir cada anexo e copiar título e período do Relatório de Leitura. |
| Dias perdidos (art. 127 LEP) declarados na decisão | Cadastrar o incidente DIAS PERDIDOS NA REMIÇÃO. |
| Referência | Trabalho, EJA por horas, leitura, capacitação: Data de Fim. ENEM e ENCCEJA sem conclusão: data da prova (o SEEU usa a Data inicial). Conclusão: data da certificação. |
| Observação | "Decisão mov. N, de DD/MM/AAAA." |

## Fase 1: leitura (só leitura)

1. Para cada processo: capa, última decisão desde o último "CONCLUSOS", Incidentes Concedidos e Pendentes.
2. Ler a decisão inteira (PDF em iframe, ver Técnicas). Anotar do **Histórico de remições** e do dispositivo: modalidade, período, horas ou dias, áreas, obras, total. O título da movimentação engana ("DECLARADA A REMIÇÃO" já veio com leitura suspensa; "OUTRAS DECISÕES" e "CONCEDIDA PROGRESSÃO" já vieram com remição).
3. Separar em grupos: prontos; precisa abrir anexos; nada a cadastrar; divergência.
4. Plano em arquivo `.md` (tabela por processo) e perguntas ao usuário. Aguardar "aprovo".

## Fase 2: cadastro (tela nova)

Caminho manual: capa, Incidentes Concedidos, Adicionar, filtro "REMI", **REMIÇÃO** (não DIAS PERDIDOS), Novo Incidente. Informações Gerais: Concedido Juiz Sim, Data de Decisão, Juiz. Em Informações Adicionais, "+ Adicionar Incidente de Remição" > Trabalho/Estudo/Leitura, preencher, **Incluir**; repetir; **Salvar** uma vez (cria um incidente por lançamento).

Campos por tipo:
- **Trabalho:** Data inicial, Data final, Dias trabalhados, referência Data de Fim.
- **Estudo por horas (Regular/EJA/Superior/Capacitação):** Modalidade, Tipo de ensino (fund. e médio), Houve conclusão Não, Data inicial e final do semestre, Horas.
- **ENEM / ENCCEJA sem conclusão:** Houve conclusão Não, Data da prova no campo Data inicial, marcar as áreas aprovadas (Redação só se aprovada).
- **Conclusão:** Houve conclusão Sim, Data da certificação. Sugere 44 (fundamental) ou 33 (médio, superior, ENEM); ajustar ao valor da decisão (ex.: 42 quando a decisão abate dias).
- **Leitura:** Data inicial, Data final, um "Nome da obra" por item (Adicionar obra).

Datas de prova usadas: ENEM PPL 2025 16/12/2025; ENCCEJA PPL 2025 23/09 (fund.) e 24/09/2025 (médio); ENCCEJA PPL 2024 29/10 e 30/10/2024; ENCCEJA PPL 2023 17/10 e 18/10/2023. Confirmar o ano novo na web antes de usar.

**Prova:** na capa, "ATO ORDINATÓRIO PRATICADO Incidente N - REMIÇÃO cadastrado"; na aba, REMIÇÃO (TRABALHO/ESTUDO/LEITURA) com Complemento = dias e Data de Referência certa. Conferir que a soma bate com o dispositivo.

## Fase 3: dias perdidos

Incidentes Concedidos, Adicionar, DIAS PERDIDOS NA REMIÇÃO. Data de Decisão, Juiz, **Data de Referência (Data da Falta Grave)**, Total, Observação, marcar as remições e os dias de cada uma.

Limites do SEEU (aprendidos em 07/11/2026):
- Só aceita perda até **1/3 de cada incidente, arredondado para baixo**. Perda de 40 sobre remições de 80+16+25 cabe só 26+5+8 = 39.
- **Só desconta de remição com referência anterior à data da falta.** Marcar incidente posterior não grava (o total salvo sai menor). Conferir o Complemento salvo.
- Se o total da decisão não couber, lançar o que cabe, explicar na Observação e avisar o usuário. Nunca jogar a diferença em remição alheia à decisão.
- A tela de dias perdidos não tem botão Remover: errou, avisar o usuário.

## Técnicas de tela (Claude in Chrome)

- Carregar `scripts/helpers-seeu-remicao.js` no frame principal com `javascript_tool` (as funções ficam em `window.top`). Recarregar se a aba for trocada ou atualizada.
- Fila em segundo plano: `T.__bg([[num, dataDecisao, mov, [specs...]], ...])` e consultar `T.__busy` / `T.__out` a cada ~40 s (comando acima de 45 s trava a ferramenta). Spec: `{t:'T'|'E'|'L', ini, fim, dt, horas, mod, ens, conc, cert, mat, matList, obras, dias, ref}`.
- `seeu-select` (modalidade, tipo de ensino) e `seeu-menu-item` (menu do botão Adicionar) são web components: clicar o `seeu-option`/`seeu-menu-item` pelo texto. Esperar o bloco do lançamento aparecer antes de preencher (`__addBlk` tenta 3 vezes).
- **ENEM/ENCCEJA:** depois de marcar "Houve conclusão = Não", esperar ~1 s; o rádio de referência pode voltar desmarcado e a lista mostra a referência errada (já saiu 03/07/2024 herdado de outra linha). Limpar o campo oculto `dataCertificacao` e conferir a Data de Referência na lista; corrigir com `__fixOpen` + clique real em Salvar.
- Editar incidente salvo: `remicao.do?actionType=editar&id=N&idTipoIncidente=1&numeroProcesso=<idProcessoExecucaoPenal>` (`__pid`), abrir o lançamento pelo `summary`, ajustar, Incluir, e **Salvar por clique real** na coordenada de `__scr` (o `.click()` em JS não grava a edição). Na tela nova, a Observação do primeiro lançamento foi copiada para os demais: usar a mesma observação em todos.
- PDF da decisão: `__prep(num, seq)` + `__pg(pagina, top)` (top em múltiplos de 780 a zoom 70) e `zoom` da região central; `__hide()` ao terminar. Anexos: `__queue(num, seq, [índices])` e `__nx()`.
- Confirm/alert: neutralizar antes de salvar (já feito em `__salvar`/`__fillDP`).
- Se a aba travar (screenshot e JS sem resposta), pedir ao usuário para fechar aviso ou dar F5; depois `tabs_context_mcp` (o tabId muda) e escolher a área "Vara de Execuções Penais em Regime Fechado e Semiaberto de Boa Vista".

## Entrega

Resposta curta: processos cadastrados (número, incidentes, total), nada a cadastrar e por quê, divergências esperando decisão, dias perdidos que não couberam no SEEU e o que fica com o usuário (outras ordens da decisão, finalizar conclusão).
