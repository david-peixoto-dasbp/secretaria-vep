---
name: "vep-atos-ordinatorios"
description: "Pratica no SEEU da VEP de Boa Vista/RR os atos ordinatórios da Portaria: remição (art. 38), agravo (art. 35), vista de pedidos (art. 4º e 19), conclusão ordinária e saneamento, sob plano e aprovação."
---

# Atos ordinatórios de tramitação no SEEU

Recebe os grupos 2 a 5 da `vep-analise-juntadas` (ou da `vep-triagem-expedientes`) e pratica os atos que não são cumprimento de decisão. Versão 0.2 (27/11/2026; a 0.1, de 16/11/2026, foi montada a partir da triagem de 103 processos; a 0.2 acrescenta o item K, pedidos que alteram o cálculo); os atos de escrita ainda não foram validados em campo com esta skill (os mecanismos de remessa, intimação e concluso vêm da `vep-instrucao-incidentes` e da `vep-pendencias-incidentes`, validados em 12 e 13/11/2026). Cópia no repositório da Secretaria: `skills/vep-atos-ordinatorios`.

## Regras

1. Conferir antes `normas/portaria-vigente.txt`; os artigos abaixo são da versão de 05/11/2026. A Portaria prevalece, salvo decisão judicial no caso concreto; apontar divergências.
2. Escrita só no perfil Analista, sob plano, aprovação expressa, ato a ato e prova (Res. CNJ 615/2025). Senha e códigos são do usuário; Claude clica em Assinar nas juntadas da leva aprovada. Nunca finalizar Retorno de Conclusão.
3. Antes de cada processo, reler a capa: já concluso, vista já aberta ou ato já praticado por colega: não repetir.
4. Prazos (art. 6º): 5 dias; Defensoria em dobro (§ 2º); agravo: prazo do art. 588 do CPP (2 dias; Defensoria 4). Usar os prazos que a equipe já lança nos autos quando forem diferentes e avisar.
5. Orientação de toda remessa ou intimação cita o movimento e a data da peça (ex.: "Pedido de remição da DP, mov. 172, de 03/09/2026").

## R. Remição (art. 38)

| Situação | Ato |
|---|---|
| Declaração unificada juntada (atestado de trabalho, estudo ou leitura) | Juntar certidão carcerária atualizada e Relatório de Situação Processual Executória e abrir vista à defesa para formular o pedido (caput). Defensoria: Realizar Remessa, MANIFESTAÇÃO; advogado: Intimar Partes |
| Defesa formulou o pedido | Vista ao MP, MANIFESTAÇÃO, 5 dias (§ 1º) |
| MP manifestou ou o prazo dele decorreu | Conclusão ordinária (item C), agrupador REMIÇÃO |
| Prazo da defesa decorrido sem pedido, ou defesa "sem requerimentos" | Certidão do fato; autos ficam na Secretaria (§ 2º) |
| Pedido reiterado que nunca foi ao MP | Vista ao MP com a orientação citando o pedido original e a reiteração; marcar PRIORITÁRIO |

- **Remição com benefício:** somar os dias pedidos (estudo = horas ÷ 12; leitura = 4 dias por obra; trabalho = 1 dia a cada 3) e ver se progressão, LC ou término fica vencido ou a até 60 dias. Se ficar, avisar no plano, instaurar o incidente se faltar (`vep-instrucao-incidentes`) e concluir no agrupador do benefício.
- **Remição retida:** certidões de outubro de 2026 deixaram de tramitar remições "por ordem do juiz" (Portaria 05/2025, art. 3º, par. único: só com proveito imediato, acumulando até 6 meses), e a DP impugnou. A Portaria vigente (art. 38, § 1º) manda concluir. Não reter por conta própria: com impugnação da defesa, concluir; sem impugnação, perguntar ao usuário.

## A. Agravo em execução (art. 35)

| Situação | Ato |
|---|---|
| Agravo sem razões (petição de interposição que diz "razões a serem oportunamente oferecidas") | Intimar o agravante para as razões (inciso I): MP por Realizar Remessa, finalidade RAZÕES/CONTRARRAZÕES; Defensoria idem; advogado por Intimar Partes |
| Agravo com razões (anexas ou juntadas depois) | Intimar o agravado para contrarrazões (inciso II), mesma finalidade |
| Razões e contrarrazões juntadas, ou decurso certificado | Certidão de decurso, se for o caso, e conclusão para juízo de retratação (par. único), agrupador da matéria do agravo |
| Despacho que mandou abrir vista e "após, conclusos" | Juntadas as contrarrazões, concluir |
| "RECEBIDO O RECURSO SEM EFEITO SUSPENSIVO" e certidão do NGD com o número do agravo no TJRR | Nada: aguardar o julgamento |
| Agravante anunciou que apresentará as razões no prazo | Aguardar; decorrido, certificar e concluir |

Conferir se a peça é mesmo agravo: pedido cadastrado como "Recurso de Agravo" por engano (ex.: pedido de apreciação urgente) se trata como pedido (item P) e se avisa o usuário para reclassificar.

## P. Pedidos diversos e vistas

1. **Impulso (art. 4º):** pedido de domiciliar, transferência de unidade ou de comarca (art. 19), comutação, indulto, visita, saída, regime harmonizado (pedido que altera o cálculo segue o item K): Realizar Remessa ao MP, MANIFESTAÇÃO, 5 dias, e agendar a conclusão pela ferramenta do SEEU.
2. **Resposta de diligência** que a decisão mandou submeter às partes (ex.: ofício de outro juízo, resposta da unidade sobre remição adiada): remessa ou intimação às partes conforme a decisão; depois, conclusão.
3. **Parecer de outro processo:** certidão apontando o mov. e o número que consta no texto, e nova vista ao MP.
4. **Petição de advogado sem procuração:** art. 8º.
5. **Cópia de acórdão juntada pela parte:** ato ordinatório para a parte diligenciar a remessa pelo tribunal, certificando (art. 31, par. único).
6. **Indulto:** certidão do lapso e vista às partes; com manifestação de ambas (ou só ciência), concluir.

## K. Pedidos que alteram o cálculo

Regra do usuário de 27/11/2026. Vale para todo pedido que altera o cálculo de pena: data da prisão ou da soltura, data do fato, fração, data-base, detração, regime, soma ou exclusão de pena. Remição segue o item R; indulto, comutação e benefícios (progressão, LC, término) seguem os seus itens. Exceção da Portaria: impugnação da reincidência cadastrada pela Secretaria (art. 22, § 3º) vai sempre à parte contrária e conclusa, mesmo sem divergência.

| Situação | Ato |
|---|---|
| Pedido de uma parte e a outra ainda não foi ouvida | Intimar a parte contrária para manifestação, 5 dias (art. 6º): pedido da defesa, Realizar Remessa ao MP, MANIFESTAÇÃO; pedido do MP, vista à Defensoria ou Intimar Partes ao advogado. Orientação cita o mov. e a data do pedido |
| Parte contrária pede diligência antes (ex.: certificar que o apenado ficou preso no período) | Cumprir a diligência (certidão com base no Canaimé e nos autos) e seguir as linhas abaixo conforme a manifestação |
| Parte contrária concordou, só deu ciência ou o prazo decorreu sem manifestação | Analisar a procedência nos documentos dos autos (sentença, acórdão, guia, APF, certidão carcerária; frações pela `vep-base-legal-execucao`). Procedente: retificar o cadastro de ofício no SEEU, conferir o cálculo final e juntar certidão da retificação (pedido e mov., manifestação ou decurso, documento que comprova, o que mudou e as datas de benefício antes e depois), com ciência às partes. **Não concluir** |
| Parte contrária se opôs, no todo ou em parte | Conclusão ordinária (item C), agrupador 295324 CÁLCULO, DETRAÇÃO E DATA-BASE |
| Os autos não comprovam o pedido, ou ele exige interpretação do título (ex.: crime continuado sem data definida na sentença) | Certidão do ponto que impede a retificação e conclusão (item C), mesmo agrupador |

Exemplos de 26/11/2026: data da prisão um dia depois do APF (1001595-05.2022 e 1001225-84.2026) e data do fato fora do período reconhecido na sentença (1000963-37.2026).

## C. Conclusão ordinária

1. Só com pedido instruído: MP manifestado ou prazo decorrido, ou despacho que manda concluir. Pedido que altera o cálculo só vai concluso com divergência da parte contrária ou quando os autos não permitem retificar (item K).
2. "..." de uma movimentação, Enviar Concluso: `codTipoConclusao` 15 DECISÃO (16 DESPACHO); responsável = DANIEL DAMASCENO AMORIM DOUGLAS (o padrão pode vir com outro magistrado: trocar); `flagUrgente` false; agrupador temático atual, nunca os iniciados por "z.": 295316 REMIÇÃO, 295315 PROGRESSÃO DE REGIME, 295313 LIVRAMENTO CONDICIONAL, 295311 EXTINÇÃO DE PENA, 295318 FALTA GRAVE E REGRESSÃO, 295328 COMPETÊNCIA E TRANSFERÊNCIA; para agravo e outros, ler a lista e escolher o da matéria; sem assessor; Enviar imediatamente.
3. Erro "Há conclusões em aberto para o processo" significa que já está concluso: parar e relatar.
4. Prova: "CONCLUSOS PARA DECISÃO" e "Pré-Analisar Conclusão" na capa.

## S. Saneamento

| Situação | Ato |
|---|---|
| "Erro ao publicar intimação ... Reenviar" | Clicar Reenviar pelo caminho relativo (`/seeu/util/djen.do?...`); a tela não confirma: pedir ao usuário que confira no dia seguinte. Se a parte já se manifestou depois, avisar que o reenvio pode ser dispensado |
| Extinção da punibilidade cumprida (ciências, BNMP, alvará) | Decorridos os prazos, certificar o trânsito e arquivar; desativar lembretes obsoletos |
| Progressão ao aberto cumprida | Depois do decurso de intimações e remessas (o SEEU impede antes), redistribuir ao Regime Aberto |
| Lembrete obsoleto na capa (ex.: "Juntar mandado de prisão" de anos atrás) | Desativar, citando no relatório |
| Mandado no BNMP com dado errado (número do processo) | Certidão do erro e retificação no BNMP (art. 29); se exigir assinatura do juiz, concluir |
| Data de prisão cadastrada diferente do APF juntado | Com pedido de parte: item K. Erro constatado de ofício: conferir o documento, retificar o evento e certificar |
| Renúncia do advogado | Intimar o apenado ou dar vista à Defensoria para assumir a defesa |
| DP pede desabilitação por haver advogado constituído | Ajustar as partes e intimar o advogado |
| Decisão que mandou retificar e não foi lançado | Não é saneamento: `vep-progressao` |

## Fluxo

1. **Plano** por processo: ato, destinatário, finalidade, prazo, orientação, agrupador. Aguardar "aprovo".
2. **Execução**, uma juntada e uma assinatura por vez.
3. **Certidões:** Juntar Documento, Tipo Movimento CERTIDÃO, texto pelo modelo da equipe, sem pendência de análise (desmarcar por último).
4. **Prova** de cada ato pelo sequencial e conferência do cálculo nos processos com cadastro alterado.
5. **Entrega:** tabela com processo, apenado, ato e sequencial; o que parou e por quê.

## Técnicas de tela

- Ações da movimentação: procurar `[onclick*="'REALIZAR_REMESSA'"]`, `'INTIMAR_PARTES'` ou `'ENVIAR_CONCLUSO'` e executar o `onclick`; abrem em modal (iframe dentro do frame da capa). Conferir o número do processo no modal.
- **Remessa** (`remessaAutos.do`): checkboxes `tipoRemessa` só por clique real (coordenada = posição CSS x `devicePixelRatio`, medir de novo após `scrollIntoView`); MP `codFinalidadeRemessa` (2 CIÊNCIA, 5 MANIFESTAÇÃO; RAZÕES/CONTRARRAZÕES pelo texto da opção); Defensoria `codFinalidadeRemessaDP`; `orientacoes`; prazos por último (`prazo`, `prazoDP`); Realizar Remessa.
- **Intimação** (`intimacao.do`): em Partes - Executado, caixa Advogado (`idPartesProcessoIFAdvogado`, clique real), `prazoPartesPassivas`, Intimar.
- **Concluso:** diálogo em outro frame; achar o `select` percorrendo `window.top.frames`; ler o magistrado antes de enviar; trocar `confirm` e `alert` por funções que registram a mensagem.
- Retornos de JS curtos, sem URL, `=`, `?` ou CPF. Sessão caída: refazer o login e redefinir os helpers; conferir se o ato em curso foi gravado antes de repetir.