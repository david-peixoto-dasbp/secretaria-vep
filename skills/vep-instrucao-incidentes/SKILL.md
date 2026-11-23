---
name: "vep-instrucao-incidentes"
description: "Instrui no SEEU da VEP de Boa Vista/RR progressão, livramento ou extinção com lapso vencido e sem decisão: cadastra o incidente pendente e abre as vistas (MP; no livramento, defesa e depois MP), sob plano e aprovação."
---

# Instrução de incidentes vencidos no SEEU

Usar quando a triagem (vep-triagem-expedientes) apontar processo com lapso de progressão, livramento condicional (LC) ou término vencido, sem incidente pendente ou sem vista. Não é cumprimento de decisão (isso é vep-progressao). Validada em 12/11/2026 com 7 processos (0213290-43.2009, 1000079-81.2021, 1001425-33.2022, 1000920-42.2022, 1001701-30.2023, 1000434-28.2020, 1000474-15.2017). Término de pena (extinção) validado em 22/11/2026 com 17 processos do Regime Aberto (ex.: 1001273-77.2025, movs. 39 e 40). Leva de 22/11/2026 com 61 processos do Fechado e Semiaberto: RSPE anexo ao incidente (ato A), progressão já instruída vai conclusa (ato I), certidão carcerária por capturas de tela (ato F) e reenvio do DJ (ato J).

## Regras

1. Escrita só no perfil **Analista**, sob plano, aprovação expressa do usuário, execução ato a ato e prova (Res. CNJ 615/2025). Conferir o perfil antes de cada ato: menus Intimações, Decurso de Prazo e Cadastro, sem Assinaturas.
2. Fluxo de vistas (ordem do usuário):
   - **Progressão e extinção**: só MP, MANIFESTAÇÃO, 5 dias.
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

### B. LC sem link de pendência

A juntada genérica de INCIDENTE DE EXECUÇÃO PENAL não oferece escolha de incidente. Cadastrar direto:
1. Capa, aba Incidentes Pendentes, Adicionar; no select `codTipoIncidenteP` escolher LIVRAMENTO CONDICIONAL; Adicionar.
2. Modal "Seleção de Tipo de Incidente": marcar o radio LIVRAMENTO CONDICIONAL e clicar **Novo Incidente**.
3. Formulário (`incidente.do`): Concedido Juiz = Pendente; Data Início = data do requisito; Observação com o lapso, a data-base e o fluxo de vistas; marcar a pena ativa (`selection`); Cumprido = Não; Salvar.
4. Prova: "ATO ORDINATÓRIO PRATICADO Incidente N - LIVRAMENTO CONDICIONAL cadastrado".

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
   - Sem conexão com o computador do usuário (sem `device_stage_files`), por capturas de tela (validado no 1002315-35.2023, mov. 157): `scrollTo` em passos de cerca de `innerHeight` menos 30 px, screenshot com `save_to_disk` em cada passo, anotando o scrollY real; a última no scroll máximo. Em Python: recortar a largura do conteúdo (x de 0 a 716 com zoom 100%; deixar o cursor fora, em x 1300), colar cada captura no seu scrollY, cortar páginas A4 em linhas brancas, salvar em JPEG qualidade 88 (em PNG passa de 5 MB; o `file_upload` aceita até 3,8 MB) e conferir a primeira página. Resultado: 13 capturas, 7 páginas, 1,9 MB.
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