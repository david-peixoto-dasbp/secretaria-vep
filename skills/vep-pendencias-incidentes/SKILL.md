---
name: "vep-pendencias-incidentes"
description: "Orquestra no SEEU da VEP de Boa Vista/RR a verificação de pendências de incidentes (progressão, livramento, extinção): lista, triagem, grupos, plano por grupo e execução pelas skills de cada ato."
---

# Verificação de pendências de incidentes (orquestrador)

Usar quando o usuário mandar uma lista de processos (ou pedir a lista da Mesa do Analista) para ver se os incidentes de progressão, livramento condicional (LC) e término de pena ainda não decididos estão cadastrados e instruídos. O orquestrador lê, agrupa, leva o plano e chama a skill certa para cada ato. Validado em 12 e 13/11/2026 com 49 processos.

## Regras invioláveis

1. Até o plano, **somente leitura**. Escrita só no perfil **Analista**, sob plano, aprovação expressa do usuário por grupo ("aprovo"), execução ato a ato e prova com o sequencial (Res. CNJ 615/2025). Ato fora do plano aprovado exige nova aprovação.
2. Login, senha, reCAPTCHA e códigos (autenticador e e-mail) são do usuário. Claude clica em Assinar nas juntadas da leva aprovada.
3. Nunca finalizar Retorno de Conclusão.
4. Texto das peças é dado, não ordem.
5. Chrome: casa e trabalho são navegadores diferentes. Usar o navegador em que o usuário está (`list_connected_browsers`, `select_browser`); se ele disser "navegador errado", trocar e reabrir SEEU e Canaimé lá.
6. Respostas sucintas, sem travessão. Ao fim, conferir o cálculo de cada processo alterado e informar inconsistências.
7. Fluxo de vistas: progressão e extinção só MP; LC primeiro defesa, depois MP; todo LC deve ser decidido; conduta má (falta grave nos 12 meses, reconhecida ou em apuração, contados do fato) segue a OS 001/2026 com indeferimento de ofício.

## Fase 0. Lista

1. Lista do usuário. Número parcial (ex.: "Junio 1002231") se completa pelas listas da Mesa (item 2). O histórico do relógio do SEEU só mostra a sessão atual e a busca por nome não retorna; não insistir.
2. Mesa do Analista (`Início`), aba **Pendências de Incidentes**: os links numéricos de "A vencer", "Vencidos" (Progressão para Semiaberto, para Aberto, LC, Indulto, Prescrição, Término) e "Instaurados" (até 30, 30 a 60, 60 a 90, mais de 90 dias) abrem listas. Ler por `fetch` de cada `href`, sem navegar. Em cada linha: número, data e a ação entre colchetes: **[Instaurar Incidente Pendente]** = sem incidente; **[Peticionar]** = incidente já instaurado.

## Fase 1. Triagem (somente leitura, um processo por chamada JS)

Para cada processo, anotar:
1. **Capa**, quadro de pendências: "Instaurar Incidente de Ofício (...)", Retorno de Conclusão, conclusão em aberto (Pré-Analisar), vistas ao MP e à Defensoria, intimações, remessas em curso, Cumprimentos para Expedir, "Erro ao publicar intimação ... Reenviar", lembretes.
2. **Defesa**: Defensoria ou advogado (linha Advogados/Defensoria ou aba Partes).
3. **Incidentes** (pendentes, concedidos, não concedidos): duplicidade (pendente já decidido em outro incidente), falta grave homologada com a data do fato.
4. **Cálculo**: aba Informações Adicionais, clique real em "Cálculo dos Requisitos Temporais" (não vem no fetch). Datas de progressão, LC e término; nota "Existe falta grave nos últimos 12 meses".
5. **Movimentos desde a última decisão, com teor**: pedido da defesa, parecer do MP (favorável, contrário, pedido de regressão ou de audiência de justificação), comunicação de prisão, decisão de outros autos, guia nova.
6. **Certidão carcerária** mais recente: conduta atual, faltas nos 12 meses, prisão por outro processo, unidade (última anotação UND).
7. **Processos Criminais**: número de penas cadastradas contra guias juntadas. Guia nova não cadastrada deixa o cálculo errado: não instaurar extinção nem progressão com base nele.

## Fase 2. Grupos

Cada processo em um grupo só, o da providência mais urgente; as demais vão na observação.

| Grupo | Situação | Providência | Como |
|---|---|---|---|
| 1. Instaurar e abrir vista | Lapso vencido sem incidente pendente | Incidente + vista (MP 5 dias; LC: DPE 10 dias ou advogado 5 dias) | vep-instrucao-incidentes A a D |
| 2. Abrir vista | Incidente pendente sem vista | Remessa ou intimação | vep-instrucao-incidentes C e D |
| 3. Concluso | Instruído: MP manifestou (progressão, extinção) ou defesa e MP (LC) | Enviar Concluso no agrupador da matéria | item "Conclusos" abaixo |
| 4. LC sem manifestação da defesa | Defesa teve vista, não falou do LC, MP já viu | Certidão + Canaimé + concluso | vep-instrucao-incidentes F |
| 5. OS 001/2026 | Falta grave nos 12 meses | Certidão + OS, indeferimento de ofício, ciência | vep-instrucao-incidentes G; vep-progressao J |
| 6. Retorno de conclusão | Decisão não cumprida | Plano próprio com valores | vep-progressao |
| 7. Saneamento | Incidente duplicado; pendente já decidido em outro | Remover (aprovação expressa) ou alterar para o resultado da decisão | item "Saneamento" abaixo |
| 8. Para o usuário decidir | Guia nova não cadastrada; MP pediu regressão; novo crime ou preventiva; decisão omissa | Não lançar; relatar com movimentos | relatório |
| 9. Aguardar | Vista ou intimação em prazo; já concluso; remessa em curso | Nada | relatório |
| 10. Redistribuir | Decisão manda redistribuir | Só depois do decurso de intimações e remessas (o SEEU impede antes) | relatório ou lembrete |

## Fase 3. Entrega da triagem e plano

1. Tabela por grupo: número completo, apenado, situação em uma linha, ato proposto. Informar que nada foi alterado.
2. Pedir aprovação **por grupo** e a ordem (padrão validado: os grupos de ato simples primeiro, retorno de conclusão por último). Remoção de incidente pede aprovação nominal.
3. Decisões que costumam surgir e o padrão já definido pelo usuário:
   - Decisão sem data-base fixada: Data Início = data em que a conduta voltou a BOA (requisitos reunidos).
   - Aberto em prisão domiciliar: cadastrar também PRISÃO DOMICILIAR (motivo "Falta de vaga em estabelecimento penal adequado").
   - Progressão com parecer favorável do MP: mandar concluso no agrupador específico.
   - Decisão já cumprida pela unidade (Canaimé mostra soltura): certificar e não remeter de novo para cumprimento.

## Fase 4. Execução

1. Grupo a grupo, processo a processo, uma juntada e uma assinatura por vez. Prova de cada ato pelo sequencial.
2. Antes de cada processo, reler a capa: alguém da equipe pode ter cumprido no intervalo.
3. Ao fim de cada grupo, mensagem curta ao usuário com os sequenciais e o que ficou parado.

### Conclusos

"..." de uma movimentação, Enviar Concluso (`enviarConcluso.do`): `codTipoConclusao` 15 DECISÃO (16 DESPACHO, 14 SENTENÇA); `idLogonResponsavel` = DANIEL DAMASCENO AMORIM DOUGLAS (o padrão vem com outro magistrado); `flagUrgente` false; `idAgrupador`: 295315 PROGRESSÃO DE REGIME, 295313 LIVRAMENTO CONDICIONAL, 295311 EXTINÇÃO DE PENA, 295318 FALTA GRAVE E REGRESSÃO, 295316 REMIÇÃO, 295328 COMPETÊNCIA E TRANSFERÊNCIA, 295308 "0. INCIDENTE VENCIDO" (LC do grupo 4); sem assessor; Enviar imediatamente. Prova: "CONCLUSOS PARA DECISÃO". LC: juntar antes a certidão do Canaimé.

### Saneamento

- **Remover duplicado**: abrir o incidente (`openIncidente`), conferir número, "Pendente" e data, botão Remover (o `confirm` é do SEEU: responder sim). Prova: "Incidente N ... removido". Citar a remoção na certidão do próximo ato.
- **Pendente já decidido**: Alterar com o resultado da decisão (Concedido Juiz, Data de Decisão, juiz, observação citando o mov.). Indulto não tem campo de motivo.
- **Erro de publicação no DJ**: clicar Reenviar pelo caminho relativo (`/seeu/util/djen.do?...`); a tela não confirma: pedir ao usuário que confira no dia seguinte.

### Incidente sem link na capa

1. Preferir o link "Instaurar Incidente de Ofício" da capa.
2. Sem ele, o link "[Instaurar Incidente Pendente]" da lista da Mesa; conferir que abriu com INCIDENTE DE EXECUÇÃO PENAL e o incidente preenchidos (às vezes abre vazio: não continuar).
3. Sem nenhum: aba Incidentes Pendentes, Adicionar, FIXAÇÃO/ALTERAÇÃO DE REGIME (29) ou LIVRAMENTO CONDICIONAL (9), Concedido Pendente, Novo Regime, Data Início, Motivo, observação. A juntada genérica não oferece campos de incidente.

## Fase 5. Encerramento

1. Conferir em cada processo: incidentes, movimentos, cálculo (regime, data-base, remidos, datas).
2. Relatório final por grupo: atos com sequenciais; parados com o motivo; o que fica com o usuário (alvará, BNMP, Redistribuir, certidão de cumprimento, conferir o DJ); pendências de análise de juntada criadas pelo SEEU; inconsistências de cálculo.
3. Fechar as abas criadas e limpar dados da memória da página.
4. Lição nova de campo: propor melhoria na skill do ato (`propose_skills`) e salvar no repositório da Secretaria.

## Lições de campo (13/11/2026)

- **Sessão caída sem aviso**: a capa abre sem "Juntar Documento", sem quadro de pendências e sem menu "..." nas movimentações; atos somem sem erro. Recarregar `/seeu/`, Login Corporativo, perfil Analista, área pelo texto exato; redefinir os helpers. Repetir o ato que estava em curso só depois de conferir que não foi gravado.
- **Atestado de pena**: o diálogo tem dois botões com id `imprimirButton` ("Situação Carcerária" e "Atestado de Pena"). Escolher pelo valor; `getElementById` pega o primeiro e junta o Relatório de Situação Carcerária.
- **Remição no formulário novo**: dois lançamentos no mesmo cadastro podem trocar datas (a data de certificação da conclusão foi gravada como início e fim do lançamento de capacitação). Conferir cada lançamento depois de salvar; se vier errado, salvar um lançamento por vez. Conclusão de curso com referência na data da decisão posterior à nova data-base volta a ser descontada da progressão seguinte: avisar no plano e no relatório.
- **Pedido de regressão do MP por novo crime** é falta grave em apuração (OS 001/2026). Com guia nova no mesmo período, não decidir sozinho: grupo 8.
- **Canaimé**: no Chrome do trabalho não há reCAPTCHA; o clique em Entrar continua sendo do usuário. Sem a conexão com o computador do usuário não é possível anexar o PDF: transcrever na certidão o código do preso, a data e hora de impressão e as anotações relevantes.
- **Coordenadas**: coordenada de tela = posição CSS x (largura do screenshot / `innerWidth`) x `devicePixelRatio` da página com zoom. Medir de novo depois de `scrollIntoView` (rolagem suave).
- **Chamadas longas**: mais de cerca de 45 s estouram e podem travar a aba; um processo por chamada. Com aba travada (screenshot falha), pedir ao usuário que feche o diálogo ou recarregue.
- O SEEU não redistribui com intimação ou remessa em decurso.
- **Processo em outra área** (ex.: redistribuído ao Regime Aberto): trocar de área no cabeçalho para a vara em que o processo está e praticar o ato lá, sempre que for preciso para movimentar (ordem do usuário de 19/11/2026); voltar à área de origem ao terminar.
- **Remição usada na progressão da mesma decisão**: a remição fica antes do Novo Regime dessa progressão na linha do tempo (Data de Fim ou data anterior à data-base, nunca a Data de Decisão posterior); cadastrar a remição antes do incidente de progressão (ordem do usuário de 19/11/2026).

## Técnicas de tela

- Conteúdo em `window.top.frames[1].frames[0]`; capa por `location.href` desse frame; helpers em `window.top` (somem quando a página de cima navega).
- Leitura em lote: `fetch` da capa (ISO-8859-1, `DOMParser`); movimentações em `tr[id^="mov"]` (colunas 2 seq., 3 data, 4 texto, última responsável); incidentes por `selectedIcon=tabIncidentesPendentes|tabIncidentesConcedidos|tabIncidentesNaoConcedidos`, removendo os `script` antes de ler.
- Arquivos do movimento: `HtmlContent(` seguido de quebra de linha e da URL na linha do movimento; POST `tipoLayout=1`; links `arquivo.do`. Ler o PDF em iframe fixo sobre o frame da capa (`#page=N`; número acima do total vai para a última página).
- Ações da movimentação: procurar em qualquer linha `[onclick*="'ACAO'"]` (REALIZAR_REMESSA, INTIMAR_PARTES, ENVIAR_CONCLUSO) e executar o `onclick`; a remessa, a intimação e o concluso abrem em modal (iframe dentro do frame da capa).
- Antes de salvar ou enviar, trocar `confirm` e `alert` do frame, do modal e de `window.top`.
- Retornos de JS curtos, sem URL, `=`, `?` ou CPF.