---
name: vep-multa-retorno-conclusao
description: Triagem e cumprimento em lote, no SEEU, dos processos da Multa Penal de Boa Vista/RR em Retorno de Conclusão (sentenças de extinção e despachos ao MP): remessas, reenvio do DJ e finalização da conclusão, sob plano e aprovação.
---

# Multa Penal: retorno de conclusão em lote

Versão 0.1 (24/11/2026). Validada numa leva de 162 processos da área "Vara de Execuções da Comarca de Boa Vista - Multa Penal": 131 movimentados, 118 conclusões finalizadas, 29 intimações reenviadas ao DJ.

## Regras

1. Portaria vigente (`normas/portaria-vigente.txt`), Capítulo VII (arts. 32 a 34) e art. 35 (agravo). Ela prevalece sobre esta skill, salvo decisão judicial no caso concreto.
2. SEEU pelo Chrome do trabalho, perfil **Analista**, área **Multa Penal**. Plano, aprovação, execução e prova (Res. CNJ 615/2025). A ordem "movimente o grupo X" vale como aprovação dos atos que as decisões do grupo mandam; prazos e destinatários vão na mensagem de início.
3. **Finalizar Conclusão Pendente só com ordem do usuário** (24/11/2026: "finalize as conclusões depois que o processo estiver todo saneado"; "se não tiver mais nada pra fazer nos processos vc pode finalizar"). Saneado = todos os atos da decisão cumpridos e nenhuma pendência na capa ligada à decisão (Cumprimentos para Expedir, Análise de Juntadas, intimação com erro no DJ, providência extra do dispositivo).
4. **Sessão compartilhada:** as abas do SEEU usam a mesma sessão. Se o usuário trocar de área em outra aba, a capa deixa de mostrar as pendências da Multa e os atos falham. Antes de cada ato, conferir no texto da página "Atuação: Vara de Execuções da Comarca de Boa Vista - Multa Penal"; se mudou, parar e perguntar antes de trocar de volta.

## Fase 1: triagem (somente leitura)

Seguir a `vep-triagem-expedientes`, com a leitura do texto integral das decisões em lote (técnica abaixo). Grupos usados na Multa:

| Grupo | Quando | Ato |
|---|---|---|
| A. Sentença de extinção | Tema 931, prescrição, indulto, exceção de pré-executividade | MP CIÊNCIA; Defesa se ainda não intimada; após o trânsito, arquivar (e INFODIP quando a sentença manda) |
| B. Despacho ao MP | Tema 931 (capacidade econômica), prescrição, planilha, juntar sentença ou certidão do art. 164 LEP | MP MANIFESTAÇÃO no prazo do despacho |
| C. Agravo | razões, contrarrazões, retratação, remessa ao TJRR | art. 35; remessa ao TJ com intimação das partes |
| D. Outros atos | mandado, CPF, arquivamento, carta precatória, vista ao Distribuidor | conforme a decisão |
| E. Aguardar | vista já aberta | nada |
| F. Já concluso | conclusão aberta na capa | nada |

Na triagem, anotar por processo: intimação da Defesa já expedida (e se deu "Erro ao publicar"), intimação ao MP expedida (em 24/11/2026 nenhuma das 131 tinha), providências extras do dispositivo (ciência à execução penal com cópia, traslado, encaminhar peças, Sisbajud, CPF, ofício), Cumprimentos para Expedir e juntadas posteriores.

## Fase 2: padrões de cumprimento (aprovados em 24/11/2026)

| Situação | Ato |
|---|---|
| Sentença de extinção, MP | Realizar Remessa, MP, CIÊNCIA, 5 dias úteis |
| Sentença de extinção, Defesa sem advogado ou com Defensoria habilitada | na mesma remessa, Defensoria, CIÊNCIA, 10 dias úteis |
| Sentença, Defesa com advogado | Intimar Partes, caixa Advogado (em regra já sai na assinatura) |
| Despacho ao MP | MP, MANIFESTAÇÃO, prazo do despacho (5; 15 para juntar título; 30 para impugnar embargos) |
| Despacho que também manda intimar a Defesa | Defensoria, CIÊNCIA ou MANIFESTAÇÃO, 10 dias úteis |
| Vista já aberta na capa | não remeter de novo |
| Intimação com "Erro ao publicar" | link **Reenviar** da movimentação (abaixo) |
| Tudo cumprido e ordem do usuário | Finalizar Conclusão Pendente |

Ficam fora da leva automática e vão ao usuário: ciência à execução da pena privativa com cópia (outro processo, outra área), traslados, encaminhamento de peças, Sisbajud e liberação de valores, cadastro de CPF, mandados e ofícios pendentes na capa, carta precatória.

## Fase 3: execução (técnicas validadas)

**Defesa:** aba Partes da capa, tabela "Executado", coluna Advogados/Defensoria. "Parte sem advogado" ou "Defensoria Pública (Habilitada em ...)" = remessa à Defensoria. Nome de advogado ou OAB = Intimar Partes.

**Pendências da capa:** ler pelos pares `td.label` e a célula vizinha (chaves "Retorno de Conclusão", "Conclusão", "Vista ao Ministério Público (Não-Bloqueante)", "Vista à Defensoria Pública (Não-Bloqueante)", "Cumprimentos para Expedir", "Análise de Juntadas", "Intimações"). Não buscar "Vista ao Ministério Público" no texto inteiro: as movimentações antigas têm o mesmo texto e dão falso positivo.

**Remessa (modal `remessaAutos.do`):** capa, "Analisar Conclusão Retornada", link "Realizar Remessa". O modal é um iframe; achar o frame cujo `location.pathname` contém `remessaAutos.do`. Conferir "Processo: N" do modal. Campos:
- MP: checkbox `input[name=tipoRemessa][value=ministerioPublico]` (clique por `.click()`), `codNucleoMP` = 952 (Promotoria de Execuções Penais de Boa Vista, já selecionado), finalidade `codFinalidadeRemessa` (2 CIÊNCIA, 5 MANIFESTAÇÃO, 7 RAZÕES/CONTRARRAZÕES), `prazo`, `tipoContagemPrazo` 2 = dias úteis.
- Defensoria: `input[name=tipoRemessa][value=defensoriaPublica]`, `codNucleoDP` = 1922, `codFinalidadeRemessaDP`, `prazoDP`, `tipoContagemPrazoDP` 2 (vem desmarcado: marcar).
- Valores por `value` e evento `change`. **Preencher o bloco da Defensoria derruba o prazo do MP para o padrão (3)**: digitar os prazos por último e reconferir todos os campos antes de enviar.
- Neutralizar `alert` e `confirm` em todos os frames (confirm devolve false e registra), clicar `remessaButton`. Nenhum aviso apareceu em 131 remessas.
- Prova: a tela volta para "Movimentar Processo" e "MOVIMENTAÇÕES REALIZADAS" mostra "REMETIDOS OS AUTOS PARA MINISTÉRIO PÚBLICO ... CIÊNCIA com prazo de 5 dias úteis" (e a linha da Defensoria). Conferir finalidade e prazo pelo texto.

**Reenvio do DJ:** na lista de movimentações, a linha "DISPONIBILIZADO NO DJ ELETRÔNICO Erro ao publicar intimação: ... - Reenviar" tem o link "Reenviar" (`/seeu/util/djen.do`, ação reenvioIntimacao). Usar o mais recente e só se for posterior à decisão. O clique recarrega a capa sem mensagem. Prova, segundos depois: nova movimentação "DISPONIBILIZADO NO DJ ELETRÔNICO A intimação enviada nesta data, estará disponível ... a partir do próximo dia útil". A intimação eletrônica pode já estar confirmada ("CONFIRMADA A INTIMAÇÃO ELETRÔNICA"); o reenvio corrige só a publicação.

**Finalizar conclusão:** "Analisar Conclusão Retornada", botão `input[name=extraButton]` "Finalizar Conclusão Pendente" (`executarAction()`). Não abre aviso. Prova: "Conclusão pendente finalizada com sucesso!" e a pendência some da capa.

**Lote:** rodar uma função assíncrona em `window.top` que processa um processo por vez (abrir capa pelo `location.href` do frame interno, esperar o número do processo e a tabela de movimentações, agir, conferir) e guarda o resultado num objeto; consultar o andamento a cada 1 a 2 minutos com `browser_batch` de até 9 esperas de 10 s (lotes maiores estouram o tempo). Média: 8 s por remessa, 4 s por finalização, 18 s por reenvio com finalização. Primeiro testar em 1 ou 2 processos e só então soltar o lote.

## Encerramento

Resposta curta: quantos processos por ato, quantas conclusões finalizadas e a lista dos que ficaram abertos com o motivo de cada um. Apagar da memória da página os dados do lote.
