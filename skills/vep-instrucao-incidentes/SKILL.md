---
name: "vep-instrucao-incidentes"
description: "Instrui no SEEU da VEP de Boa Vista/RR progressão, livramento ou extinção com lapso vencido e sem decisão: cadastra o incidente pendente e abre as vistas (MP; no livramento, defesa e depois MP), sob plano e aprovação."
---

# Instrução de incidentes vencidos no SEEU

Usar quando a triagem (vep-triagem-expedientes) apontar processo com lapso de progressão, livramento condicional (LC) ou término vencido, sem incidente pendente ou sem vista. Não é cumprimento de decisão (isso é vep-progressao). Validada em 12/11/2026 com 7 processos (0213290-43.2009, 1000079-81.2021, 1001425-33.2022, 1000920-42.2022, 1001701-30.2023, 1000434-28.2020, 1000474-15.2017). Término de pena (extinção) validado em 22/11/2026 com 17 processos do Regime Aberto (ex.: 1001273-77.2025, movs. 39 e 40). Leva de 22/11/2026 com 61 processos do Fechado e Semiaberto: RSPE anexo ao incidente (ato A), progressão já instruída vai conclusa (ato I), certidão carcerária por capturas de tela (ato F) e reenvio do DJ (ato J). Leva de 24/11/2026 (processos paralisados, ver vep-paralisados): datas pelo texto do RSPE, ato B detalhado (LC e progressão sem link na capa), LC e progressão juntos (ato K) e indulto pendente (ato L).

## Regras

1. Escrita só no perfil **Analista**, sob plano, aprovação expressa do usuário, execução ato a ato e prova (Res. CNJ 615/2025). Conferir o perfil antes de cada ato: menus Intimações, Decurso de Prazo e Cadastro, sem Assinaturas.
2. Fluxo de vistas (ordem do usuário):
   - **Progressão e extinção**: só MP, MANIFESTAÇÃO, 5 dias.
   - **Progressão no fim do mês** (ordem do usuário de 25/11/2026): faltando 6 dias ou menos para o fim do mês, sem vista ao MP; cadastrar o incidente e mandar concluso direto, com a certidão do Prêmio CNJ de Qualidade (texto na `vep-analise-paralisados`, Peculiaridades), certidão carcerária e RSPE.
   - Esse fluxo é ordem do usuário e diverge da Portaria, art. 16, § 1º, IV (vista sucessiva à defesa e ao MP em todos os incidentes, depois conclusão com ou sem manifestação). Divergência apontada em 22/11/2026; ordem mantida.
   - **Livramento**: primeiro a defesa (Defensoria: Realizar Remessa, MANIFESTAÇÃO, 10 dias; advogado: Intimar Partes, caixa Advogado, 5 dias); depois do retorno da defesa, MP MANIFESTAÇÃO 5 dias. Se a defesa já pediu o LC nos autos, o pedido vale como manifestação: vai direto ao MP.
   - Todo processo que vai concluso leva antes a certidão carcerária do Canaimé e o RSPE (ordem do usuário de 22/11/2026: "os que forem concluso tem que juntar a CC"; nos incidentes com data vencida, também a Portaria, art. 14, V e parágrafo único). Ver ato F.
   - Portaria, art. 16, caput: na instauração, juntar certidão carcerária atualizada e RSPE. Na leva de 22/11/2026 a instauração levou certidão e RSPE, e a certidão carcerária só entrou antes da conclusão. Divergência apontada ao usuário em 23/11/2026; decisão dele: por enquanto, a certidão carcerária só se junta antes de enviar concluso.
   - **Todo incidente de LC deve ser decidido.** Se a defesa teve vista (mesmo só para ciência) e não se manifestou sobre o LC, e o processo já foi ao MP, o LC vai concluso independente do parecer (ato F).
   - **Conduta má** (falta grave nos 12 meses anteriores, contados do fato): seguir a OS 001/2026 com indeferimento de ofício dos incidentes pendentes (ato G).
3. Login, senha e códigos são do usuário. A primeira assinatura da sessão pede código por e-mail; a sessão expira e o novo login pede o código do autenticador. Avisar e esperar; a juntada que estiver na prévia se perde.
4. Claude clica em Assinar nas juntadas da leva aprovada.
5. Nunca finalizar Retorno de Conclusão.
6. Antes do plano, conferir a OS 001/2026: falta grave nos 12 meses anteriores à data da análise, contados da data do fato (aba Incidentes Concedidos, HOMOLOGAÇÃO DE FALTA GRAVE). Se houver, seguir a vep-progressao, item J.

## Leitura para o plano (somente leitura)

1. Capa: links "Instaurar Incidente de Ofício (...)" no quadro de pendências, vistas abertas, retorno de conclusão, localizadores (ex.: "Exame Criminológico").
2. Aba **Partes**: Defensoria, advogado constituído ou "parte sem advogado" (vai à Defensoria). OAB com "D" é defensor público.
3. Datas: aba Informações Adicionais, clicar em "Cálculo dos Requisitos Temporais" para expandir (é carregado só na tela, não vem no HTML do fetch). Anotar data-base, fração e "Data do Requisito Temporal" de progressão, LC e término. A nota "(Existe falta grave nos últimos 12 meses em DD/MM/AAAA)" explica LC sem alerta de ofício na capa.
   - Sem abrir a tela, pelo texto do RSPE (validado em 24/11/2026 em 9 processos): baixar o PDF pela URL do `openWindow` da capa, descomprimir cada `stream` com `DecompressionStream('deflate')`, juntar as strings de `Tj`/`TJ`, tirar os escapes (`\(`, `\)`, `\f`, `\b`), descartar os bytes 0 e somar 29 ao código de cada caractere. Saem "Data-base adotada no cálculo para progressão", a fração (ex.: "Hediondo primário (40%)"), "Data prevista para progressão", os mesmos campos do LC, "Regime Atual" e "Data prevista para o Término". Leva cerca de 10 s por processo: rodar em segundo plano.
   - Falta grave: na aba Incidentes Concedidos, a linha HOMOLOGAÇÃO DE FALTA GRAVE traz a data do fato. Portaria, art. 16, § 1º: progressão, 12 meses anteriores; **livramento, 60 meses**; dentro do prazo, incidente não concedido com certidão e ciência (inciso III). O SEEU recalcula o LC para fato + 12 meses, então a capa mostra LC "vencido" que a Portaria barra. **Ordem do usuário de 25/11/2026:** a Portaria ainda não foi publicada; até ele avisar que está valendo, considerar só os 12 meses também no LC (instruir normalmente se a falta tiver mais de 12 meses do fato).
4. Pedidos da defesa e pareceres já juntados: ler o teor.
5. Plano por processo: incidente, texto da certidão, remessas com prazos. Levar ao usuário e esperar "aprovo".

## Atos

### A. Incidente com link de pendência (progressão, LC ou término com alerta)

1. Na capa, clicar no link "Instaurar Incidente de Ofício (...)": abre `peticionar.do` com Tipo Movimento INCIDENTE DE EXECUÇÃO PENAL e o incidente já escolhido (FIXAÇÃO/ALTERAÇÃO DE REGIME com novo regime e motivo, ou LIVRAMENTO CONDICIONAL). No término de pena vem EXTINÇÃO / CUMPRIMENTO DA PENA e a lista de penas ativas (checkbox `selection`): marcar todas. A data do término está no próprio texto do link ("expirado em" ou "a vencer em").
   Sem o link na capa: Mesa do Analista (`/seeu/usuario/mesaAnalistaVep.do`), aba Pendências de Incidentes, lista "A vencer" ou "Vencidos", link "[ Instaurar Incidente Pendente ]" do processo. Abre a mesma tela; conferir que veio INCIDENTE DE EXECUÇÃO PENAL com o incidente preenchido. Sem nenhum dos dois: ato B.
2. Desmarcar "gerar pendência no menu Análise de Juntadas" (id `ckbsGerarPendenciaAnlaiseJuntada`). Os `name` dos campos desta tela e do modal de remessa vêm embaralhados: localizar sempre por `getElementById` (`descricaoTipoArquivo`, `descricaoModelo`, `submitButton`). Mesmo assim o SEEU cria a pendência de análise da juntada: avisar o usuário no encerramento.
3. Tipo do Arquivo: `openSelecaoTipoArquivo()`, pesquisar "Certidão", radio da linha exatamente "Certidão". Atalho validado: preencher direto `codTipoArquivo` = 37 e `descricaoTipoArquivo` = "Certidão".
4. Tipo do Modelo: Meus Modelos; lupa "Seleção de Modelo"; escolher o primeiro "CERTIDÃO REQUISITO TEMPORAL" (o texto dele é de progressão obstada por falta grave: o parágrafo CERTIFICO é trocado por inteiro).
5. Há dois botões com id `digitarButton`: clicar no **visível com valor "Digitar Texto"** (o outro é "Partes para Modelo"). No editor (`CKEDITOR.instances.conteudoEditor`), achar o `<p>` com CERTIFICO em `ed.editable().$` e trocar o `innerHTML`; `ed.fire('change')`.
6. Texto padrão, sem travessão: "CERTIFICO que, conforme o cálculo dos requisitos temporais do SEEU, o reeducando atingiu o lapso temporal para [a progressão ao regime X / o livramento condicional] em **DD/MM/AAAA** (data-base: DD/MM/AAAA), [havendo pedido da defesa no mov. N,] razão pela qual instauro o incidente de [...], pendente de apreciação, e encaminho os autos [ao Ministério Público / à Defensoria Pública] para manifestação." No LC com advogado: "...e intimo a defesa para manifestação, no prazo de 5 (cinco) dias; após, os autos seguirão ao Ministério Público". No término: "CERTIFICO que, conforme o cálculo de pena do SEEU, o término da pena do reeducando [ocorreu / ocorrerá] em **DD/MM/AAAA**, razão pela qual instauro o incidente de extinção da pena pelo cumprimento, pendente de apreciação, e encaminho os autos ao Ministério Público para manifestação." (o parágrafo do modelo começa com "De ordem da chefia imediata" e é trocado por inteiro).
7. Continuar (`submitButton`); às vezes aparece a prévia "Documento" com Salvar e Voltar: clicar **Salvar** (nunca Voltar). Volta a tela da juntada com o online.pdf na lista; os campos do incidente somem, é normal.
   - RSPE (Portaria, art. 16, caput): o endereço está no script da capa (`gerarResaQuadroAcoes`, chamada `openWindow` com `emitirRelatorioSituacaoProcessualExecutoria` e `idProcessoExecucaoPenal`). Baixar com `window.top.fetch` e guardar o ArrayBuffer em `window.top` (Blob buscado num frame que depois navega não resolve, e a chamada estoura). No frame da juntada, copiar para um `Uint8Array` do próprio frame, criar `File` ("Relatorio da Situacao Processual Executoria.pdf", application/pdf) e `DataTransfer`, pôr em `input[type=file][name=arquivosFile]` e disparar `change`. Tipo do anexo (`select[name=tipos]`): 139, Relatório da Situação Processual Executória. Certidão em primeiro; depois de assinar, a movimentação mostra N.1 certidão e N.2 relatório.
8. Assinar: botão "Assinar" no rodapé (clique real, id `celularButton`). A altura da janela alterna entre sessões e até no meio da leva (551 ou 607 px): medir a posição do botão logo antes de cada clique e conferir pela movimentação; se não surgir a JUNTADA do dia, a assinatura não ocorreu e o clique deve ser refeito. Prova: "JUNTADA DE INCIDENTE DE EXECUÇÃO PENAL" e o incidente na aba Incidentes Pendentes. A data de referência do incidente fica a data da assinatura (a Data Início digitada antes se perde).

### B. LC ou progressão sem link de pendência (validado em 24/11/2026 no 0002010-25.2010, 1000005-56.2023 e 1000430-54.2021)

A juntada genérica de INCIDENTE DE EXECUÇÃO PENAL não oferece escolha de incidente, e em 24/11/2026 nem a capa nem a Mesa do Analista trouxeram o link "Instaurar Incidente de Ofício". Cadastrar direto, com a capa como página principal (`navigate` para `visualizacaoProcesso.do?actionType=visualizar&numeroUnico=<20 dígitos>`):
1. Aba Incidentes Pendentes (`#tabItemprefix9`). Clicar **Adicionar** abaixo da lista (com janela 896x1369: cerca de (802, 999) com a lista vazia e (802, 1012) com uma linha; conferir na screenshot).
2. Modal "Seleção de Tipo de Incidente" (lista alfabética de radios): FIXAÇÃO/ALTERAÇÃO DE REGIME em cerca de (53, 469) e LIVRAMENTO CONDICIONAL em cerca de (53, 597); conferir com zoom e clicar **Novo Incidente** (723, 1117).
3. O formulário abre num frame (`/seeu/processo/criminal/execucao/incidente.do`): achar o frame que tem `[name=dataInicio]` percorrendo `window.top.frames`. Campos: `concedidoJuiz` = P; `dataInicio` = data do requisito; `observacao` com o lapso, a data-base, a fração e o fluxo de vistas; no LC, marcar todas as penas ativas (`input[name=selection]`) e `cumprido` = false. Na progressão: `codTipoRegimeNovo` (1 Aberto, 2 Semiaberto, 3 Fechado) e `codMotivo` = 0 (Progressão de Regime); não há lista de penas.
4. Progressão ainda não vencida mostra "Não atingiu o Requisito Objetivo para a Progressão de Regime": é normal (instauração 90 dias antes, art. 16).
5. Salvar (no LC cerca de (747, 945); na progressão cerca de (747, 740)). A capa recarrega e a aba Pendentes mostra o número do incidente: anotar para a certidão. Na progressão ao **aberto**, depois do Salvar o SEEU abre a tela "Condições de cumprimento do Regime Aberto" (`transacaoPenal.do`): o incidente já está gravado; não preencher nada e voltar à capa (validado no 1000854-67.2019, movs. 348 a 350, em 25/11/2026).
6. Prova: "ATO ORDINATÓRIO PRATICADO Incidente N - ... cadastrado". Depois, a juntada da certidão com RSPE (ato A, passos 2 a 8) e as vistas.

### C. Remessas (MP, Defensoria, unidade)

1. Na capa, "..." da primeira movimentação (a juntada recém-feita), Realizar Remessa (`remessaAutos.do`). Conferir no modal o número do processo. Por script: no `div[id^="idMenuBtn"]` da linha, clicar no `tr` cujo `td` é "Realizar Remessa" (dispara `ajaxPermiteExecutarAcao`). Dá para escolher a movimentação pelo sequencial, útil quando a primeira é um cancelamento.
2. Checkboxes `tipoRemessa` (ministerioPublico, defensoriaPublica, entidadeRemessa) só com **clique real**. A página está com zoom 0,9: coordenada de tela = posição CSS x `devicePixelRatio`. Depois de `scrollIntoView` esperar cerca de 1 s (rolagem suave) e medir de novo antes de clicar.
3. Finalidades, por id: MP `finalidadeRemessa` (escolher pelo texto MANIFESTAÇÃO ou CIÊNCIA), `orientacoes`, `prazo`, `urgenteN`; Defensoria `finalidadeRemessaDP`, `orientacoesDP`, `prazoDP`; botão `remessaButton`. A caixa do MP continua só com clique real; antes de enviar, conferir que só `ministerioPublico` está marcado e que o número do modal é o do processo. Unidade: `idTipoDestinoRemessa` = 17 (DEPEN), lupa `a.searchButton`, escolher a entidade pelo nome (a unidade vem da última anotação UND da certidão carcerária), finalidade 53 CIÊNCIA - DIRETOR DA UNIDADE.
4. Orientações com o motivo, os movimentos e o lapso. **Prazos por último** (`prazo`, `prazoDP`, `prazoEntidadeRemessa`). Urgente = Não. Realizar Remessa.
5. Prova: "REMETIDOS OS AUTOS PARA ..." com finalidade e prazo.

### D. Intimação do advogado (LC com defesa constituída)

"..." da primeira movimentação, Intimar Partes (`intimacao.do`): em Partes - Executado, marcar a caixa Advogado (`idPartesProcessoIFAdvogado`, clique real), `prazoPartesPassivas` = 5, Intimar. Prova: "EXPEDIÇÃO DE INTIMAÇÃO Para advogados...".

### F. LC com vista à defesa sem manifestação: certidão, Canaimé e concluso (validado no 1001839-31.2022, movs. 267 e 268)

1. Certidão carcerária do Canaimé: o login e o reCAPTCHA são do usuário. Na tela de pesquisa, buscar pelo nome (`input[name=busca2]`, botão Pesquisar) e conferir ID, mãe e unidade com a capa do SEEU. Com mais de um ID, usar o da unidade atual, não o com "SAÍDA". Abrir direto `/sgp2rr/areas/impressoes/UND_CertidaoCarceraria.php?id_cad_preso=<ID>`.
2. PDF: na aba da certidão, montar um HTML autossuficiente (imagens em dataURL, CSS embutido, iframes de cabeçalho e rodapé em `srcdoc`, sem scripts) e baixar por blob (`a.download`) para Downloads; trazer com `device_stage_files` (pedir acesso a ~/Downloads); renderizar no contêiner com Playwright (JS desligado, A4, `print_background`) e conferir a primeira e a última página. O Chrome bloqueia o segundo download automático do mesmo site: pedir ao usuário que permita downloads de canaime.com.br antes da leva.
   - Sem conexão com o computador do usuário (sem `device_stage_files`), por capturas de tela (validado no 1002315-35.2023, mov. 157; refeito em 25/11/2026 em 8 processos): técnica detalhada na `vep-sei-seeu-canaime`, seção Canaimé. Resumo: `zoom` da região [0,0,716,551] **com scale 1** (com scale menor o arquivo salvo também sai reduzido) em `scrollTo` de 530 em 530 px e um último no scroll máximo (`scrollHeight` menos `innerHeight`); montar o PDF em Python colando cada captura no seu scrollY e **ordenando as capturas pela sobreposição de 21 px entre elas**, não pela hora do arquivo (capturas do mesmo lote têm o mesmo milissegundo e saem embaralhadas: em 25/11/2026 a CC do 0800544-60.2019 e a do 0013017-72.2014 foram juntadas fora de ordem e precisaram de nova juntada com certidão de substituição). Diferença de sobreposição perto de zero em todos os pares é a prova; se o último salto deixar buraco (sobreposição negativa), tirar uma captura extra. JPEG qualidade 88 (o `file_upload` aceita até 3,8 MB).
   - Antes de certificar a conduta, buscar no `innerText` da certidão falta, PAD, fuga, evasão, regressão, sindicância e isolamento, depois de retirar a frase padrão "não ter cometido nenhuma falta média ou grave". Ler o registro achado (ex.: relatório de ocorrência arquivado pela direção) e citá-lo na certidão.
3. Juntada: botão Juntar Documento da capa e `window.top.location.href` = URL do frame (para o `file_upload`; ler `pathname` + `search` do frame logo depois do clique, o endereço traz `_tj`). Com a página em `window.top` e janela de 1366x607: Digitar Texto (174, 340), Continuar (1256, 542), Salvar da prévia (1262, 548), Assinar (1262, 560); medir antes de clicar e conferir que a pendência de análise segue desmarcada. Tipo Movimento CERTIDÃO (3), sem pendência de análise. Certidão pelo modelo, com três parágrafos: lapso do LC (data, data-base, pena x fração) e incidentes pendentes; vista à defesa (mov., data) sem manifestação sobre o LC e parecer do MP só sobre a progressão (mov.); certidão do Canaimé anexa, com a conduta atual. Depois o PDF por `file_upload`, tipo "Atestado de permanência e conduta carcerária" (134). Certidão em primeiro. Assinar.
4. Na tela "Movimentar Processo" que abre após a assinatura, Ações, Enviar Concluso: DECISÃO; responsável = juiz titular (o padrão vem com outro magistrado: trocar); Urgente Não; agrupador "0. INCIDENTE VENCIDO" (295308); sem assessor; Enviar imediatamente. Prova: "CONCLUSOS PARA DECISÃO" e "Pré-Analisar Conclusão". O Enviar Concluso abre o modal `enviarConcluso.do`; ao enviar, a página navega e o JS retorna erro de alvo navegado, o que é normal: provar pelo `fetch` da capa. Na progressão, agrupador 295315 PROGRESSÃO DE REGIME (ato I).

### G. OS 001/2026 com incidentes já pendentes (validado no 1001359-48.2025, movs. 94 a 98)

1. Não usar o link "Instaurar Incidente de Ofício" (criaria outro incidente). Juntar Documento, Tipo Movimento CERTIDÃO, sem pendência de análise. Certidão no modelo do 1001196-10.2021 (mov. 400): OS, item 1; incidentes; a) falta grave e data do fato; b) situação e audiência; c) movimentações; itens 1.a a 1.d e 1.e.
2. Cópia da OS por `file_upload` (tirada do 1001196-10.2021, mov. 400.2, ou do repositório), tipo "Documentos Diversos" (117).
3. Abrir cada incidente pendente (`openIncidente`), Alterar: Concedido Juiz = Não; Motivo = Indeferimento Subjetivo; Data de Decisão = dia 1º do mês da análise; juiz titular; observação citando a OS, a falta e o mov. da certidão. O SEEU grava "Tempo Indeferimento: 6 meses". No LC, sair pela capa (`location.href`), nunca por Voltar.
4. Ciência: MP CIÊNCIA 3 dias e defesa (Defensoria CIÊNCIA 6 dias ou advogado), com orientação citando a OS e o item 1.e.

### E. Retorno de conclusão pendente no mesmo processo

Se houver decisão (ex.: remição) ainda não cumprida, cumprir na mesma leva pela vep-progressao (atestado de pena pelo diálogo "Anexar Atestado de Pena à Movimentação", unidade, ciência às partes) e juntar a ciência da decisão na orientação da remessa ao MP. Não finalizar a conclusão.

### H. Incidente lançado como Não Concedido sem decisão (validado no 1000453-68.2019, movs. 222 e 223)

Um servidor lançou o incidente de extinção como Não Concedido, com observação "aguardando certidão de óbito", sem decisão. Corrigir:
1. Aba Incidentes Não-Concedidos, `openIncidente`, Alterar.
2. Concedido Juiz = Pendente (data e juiz da decisão somem); observação com o motivo da retificação e os movimentos; Salvar.
3. Sair pela capa (`location.href`). Prova: "Incidente N - EXTINÇÃO alterado" e o incidente na aba Pendentes. Depois, vista ao MP (ato C), citando na orientação o motivo.

### I. Progressão já instruída sem incidente (validado no 1002315-35.2023, movs. 156 a 158)

A defesa pediu a progressão, o MP teve vista e o prazo decorreu, mas o incidente não foi instaurado.
1. Ato A, com certidão que cite o pedido da defesa e a vista ao MP (movs. e data do decurso) e diga que os autos irão conclusos depois da certidão carcerária; RSPE anexo. Sem nova vista.
2. Ato F, passos 1 a 4: certidão que cite o incidente (mov.), o RSPE e a conduta, com a certidão carcerária anexa; concluso DECISÃO, agrupador 295315 PROGRESSÃO DE REGIME, não urgente.

### J. Erro de publicação no DJ (validado em 22/11/2026 em 4 processos, ex.: 0015712-96, mov. 437 para 443)

Na linha do movimento "Erro ao publicar intimação", o link Reenviar (`/seeu/util/djen.do`, ação de reenvio): `fetch` pelo caminho relativo. O SEEU cria na hora a movimentação "DISPONIBILIZADO NO DJ ELETRÔNICO", que é a prova. Conferir todas as linhas de erro do processo, não só a mais recente (no 1000491-46 havia outra, de 21/07/2026, mov. 299).

### K. LC e progressão no mesmo processo (validado no 0002010-25.2010, movs. 580 a 583)

1. Conferir a falta grave (Leitura, item 3): no LC, 60 meses (Portaria, art. 16, § 1º, II). Cadastrar os dois incidentes (ato B).
2. Uma certidão para os dois: "CERTIFICO que, conforme o cálculo dos requisitos temporais do SEEU, o reeducando atingiu o lapso temporal para o livramento condicional em DD/MM/AAAA e atingirá o lapso para a progressão ao regime X em DD/MM/AAAA (data-base: ...), razão pela qual instaurei os incidentes de livramento condicional nº N e de progressão de regime nº M, pendentes de apreciação (Portaria, art. 16). [Se houver falta grave e o usuário tiver mandado instruir mesmo assim:] CERTIFICO, ainda, que a falta grave reconhecida nos autos (fato de ..., homologada em ...) tem mais de 12 (doze) meses da data do fato, e que junto o Relatório da Situação Processual Executória. Encaminho os autos à Defensoria Pública para manifestação sobre o livramento condicional; após, os autos seguirão ao Ministério Público para manifestação sobre os dois incidentes."
3. Remessa à Defensoria (MANIFESTAÇÃO, 10 dias) ou intimação do advogado (5 dias), com orientação citando os dois incidentes. MP só no segundo momento.

### L. Indulto pendente (validado em 24/11/2026: 1000660-67.2019 mov. 181; 1000530-48.2017 movs. 383 e 384; 1000570-30.2017 movs. 249 e 250)

1. Incidente instaurado de ofício por certidão de lapso, defesa intimada e decurso, **sem vista ao MP**: só Realizar Remessa ao MP (MANIFESTAÇÃO, 5 dias) a partir do "..." da primeira movimentação, com orientação citando o incidente, a certidão e o decurso. Sem juntada.
2. MP já ouvido e defesa silente depois de despacho ou decisão que mandou complementar ou se manifestar (inclusive renúncia de prazo): certidão carcerária do Canaimé (ato F, passo 2), certidão que relata os movimentos (instauração, pedido, parecer, despacho, decurso ou renúncia) e a conduta, anexos certidão carcerária (134) e RSPE (139); Enviar Concluso DECISÃO, não urgente, agrupador INDULTO E COMUTAÇÃO (295312).
3. Apontar no encerramento, sem corrigir: atestados de trabalho sem tramitação e incidente cadastrado com tipo errado.

## Encerramento

- Conferir em cada processo: incidente na aba Incidentes Pendentes, movimentos da juntada e das remessas, datas da capa (o incidente pendente não altera o cálculo).
- Informar: atos com sequenciais; pendências de análise de juntada criadas; alertas de ofício que continuam na capa até a decisão; o que fica para o segundo momento (MP depois da defesa nos livramentos); localizadores e pedidos paralelos (ex.: indulto) que acompanham.
- Remover dados da memória da página e fechar a aba criada.

## Técnicas de tela

- Conteúdo em `window.top.frames[1].frames[0]`; abrir a capa pelo `location.href` desse frame.
- Antes de cada clique que pode abrir diálogo, trocar `confirm`, `alert` e `onbeforeunload` do frame (na remessa, `confirm` retornando true).
- Retornos de JS: sem URL, `=`, `?` ou CPF.
- Operações longas: promise em `window.top` e consulta depois (chamadas acima de cerca de 40 s estouram). Se a sessão cair, `window.top` recarrega e os helpers somem: redefinir.
- Uma juntada e uma assinatura por vez.
- **Juntada como página principal** (24/11/2026, janela 896x1369): `navigate` para a capa, guardar em `sessionStorage` a URL do Juntar Documento (onclick do botão) e a do RSPE, e fazer `location.href` para a do Juntar Documento. Tipo Movimento 3; `codTipoArquivo` 37 e `descricaoTipoArquivo` "Certidão"; Digitar Texto visível (cerca de (193, 601)); `CKEDITOR.instances.conteudoEditor.setData(html)`; Continuar (773, 1295); prévia; Salvar (783, 1305). Assinar: x 798, y medido no `celularButton` (cerca de 759 com 2 arquivos e 801 com 3).
- **`file_upload` recarrega a página:** variáveis guardadas na janela (ex.: o ArrayBuffer do RSPE) somem. Fazer primeiro o upload da certidão carcerária, depois buscar o RSPE e anexar por `DataTransfer`; só então os tipos (134 e 139) e, por último, desmarcar a pendência de análise.
- **Assinatura:** o modal "Confirme seu código" pode aparecer por instantes e sumir sozinho; esperar e tirar outra screenshot antes de concluir que falhou. A prova é a tela "Movimentar Processo" com "Dados registrados com sucesso".
- **Remessa logo após assinar:** na tela Movimentar Processo, link "Realizar Remessa" do painel Ações; o modal é um iframe (`remessaAutos.do`). Marcar o checkbox por clique real na coordenada do iframe somada à do elemento, depois de `scrollIntoView` e 1,2 s.
- **Travamento:** chamadas de JS com `await` longo (laços de `fetch`) estouram em 45 s e podem deixar o renderer sem resposta; rodar em segundo plano e consultar. Em 24/11/2026 a aba travou ao abrir o Juntar Documento (screenshot sem resposta por mais de 30 s): parar, avisar o usuário pelo celular e pedir que feche o aviso ou entre de novo; não repetir o ato sem conferir.