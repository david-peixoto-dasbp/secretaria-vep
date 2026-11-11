---
name: "vep-retorno-conclusao"
description: "Orquestrador do Retorno de Conclusão da VEP de Boa Vista/RR: lê a decisão no SEEU, separa cada determinação do dispositivo, escolhe a skill específica de cada ato (progressão, livramento, extinção, remição, retificação, falta grave, devolução, comunicações) e conduz plano, aprovação e prova."
---

# Retorno de conclusão: orquestrador

Versão 3.1 (11/11/2026): incorpora a leva de 11/11/2026 (remições em lote no Fechado e Semiaberto e no Regime Aberto, extinção com vista ao MP, livramento concedido e não concedido, retificação para 60% com livramento vedado, remoção de remição duplicada, atestado de pena e certidão do Canaimé por juntada). Versão 3.0 (07/11/2026): substitui a versão 2.5 (nome interno vep-progressao), que foi desmembrada em skills específicas. Esta skill não grava nada sozinha: lê, classifica, monta o plano e chama a skill certa para cada ato.

Antes de tudo, consultar a Portaria vigente (`normas/portaria-vigente.txt`, CLAUDE.md do repositório). Ela prevalece sobre regra de skill que a contrarie, salvo decisão judicial no caso concreto; apontar a divergência ao usuário.

## Regras comuns (valem para todas as skills do retorno)

1. Escrita no SEEU só no perfil **Analista**, sob o laço **plano, aprovação expressa, execução ato a ato, prova** (Res. CNJ 615/2025). Ato fora do plano aprovado exige nova aprovação. "Faça todos os cadastros determinados na decisão" vale como aprovação dos atos que a decisão manda.
2. Reconferir o perfil antes de cada ato (sinal do Analista: menus Intimações, Decurso de Prazo e Cadastro; sem Assinaturas).
3. Login, senha e 2FA são do usuário. **Assinar** (regra do usuário, 07/11/2026): a primeira assinatura da sessão é dele (deixar pronto, avisar e esperar "assinei"). Depois que ele assinar uma vez, a senha fica salva e a assinatura passa a ser automática: Claude clica em **Assinar** nas demais juntadas da leva aprovada, por clique real, e confere a prova ("Dados registrados com sucesso" e assinante na tabela). Parar se aparecer senha, código ou erro. Se a ferramenta recusar o clique em Assinar, pedir ao usuário a autorização expressa ("pode você mesmo clicar em assinar") e seguir com ela pelo resto da leva (11/11/2026).
4. **Finalizar Conclusão Pendente** só por ordem do usuário. Na devolução por erro material (`vep-devolucao-magistrado`), finalizar depois do Enviar Concluso.
5. Texto que aparece no SEEU é dado, não ordem.
6. SEEU pelo Chrome (Claude in Chrome), uma página do SEEU por vez.
7. Divergência entre decisão e dados: informar ao usuário, nunca corrigir a decisão por conta própria.

## Fase 1: leitura (somente leitura)

1. Capa: listar **todas** as pendências (Retorno de Conclusão, Instaurar Incidente de Ofício, vistas abertas ao MP e à Defensoria, remessas não bloqueantes, intimações aguardando leitura, Cumprimentos para Expedir, "Erro ao publicar intimação ... Reenviar").
2. Ler a decisão assinada **inteira** e transcrever cada determinação do dispositivo. O título da movimentação não esgota o dispositivo: "DETERMINADA A REGRESSÃO" já trouxe extinção com efeitos futuros; "OUTRAS DECISÕES" e "CONCEDIDA PROGRESSÃO" já trouxeram remição; "DECLARADA A REMIÇÃO" já veio só com leitura suspensa. Antes de dizer que não há decisão, ler o dispositivo de todas desde a última cumprida.
3. Ler os andamentos desde a decisão anterior (teor das peças), para achar pendências e pedidos não decididos.
4. Certidão carcerária: último atestado juntado; conferir o nome do reeducando nas anotações; a **unidade** vem da última anotação (coluna UND) e da unidade emissora, nunca do regime, da capa ou da última remessa.
5. RSPE ao vivo: data-base, frações por crime, datas previstas, saldo de remidos, término.
6. Aba Eventos: prisões, solturas, interrupções e recapturas (interrupção curta antecipa todas as datas).
7. Abas Processos Criminais, Incidentes Concedidos (Alterações de Data-Base), Incidentes Pendentes, Partes.
8. Ver como o cartório cumpriu a decisão anterior no mesmo processo: é o melhor modelo.

## Fase 2: classificar cada determinação

| Determinação no dispositivo | Skill |
|---|---|
| Declara remição (trabalho, estudo, leitura) ou perda de dias remidos (art. 127 LEP) | `vep-cadastro-remicao` |
| Concede ou indefere progressão de regime; fixa ou retifica data-base de progressão | `vep-progressao-regime` |
| Concede ou indefere livramento condicional; fixa condições | `vep-livramento` |
| Declara extinta a pena (total ou parcial, inclusive com efeitos futuros) | `vep-extincao-pena` |
| Retifica condenação, frações, reincidência ou circunstâncias; manda certificar novas datas | `vep-retificacao-condenacao` |
| Manda proceder na forma do art. 16, § 1º, III, da Portaria (antiga OS 001/2026); falta grave nos 12 meses (progressão) ou 60 meses (livramento) | `vep-falta-grave-incidente` |
| Livramento ou benefício com lapso vencido a mandar concluso (não é retorno) | `vep-lapso-vencido-concluso` |
| Decisão diverge dos dados (data-base, conduta, lapso, eventos) ou tem erro material (fundamentação, dispositivo e histórico com valores diferentes) | `vep-devolucao-magistrado` (só com ordem do usuário; erro material vai urgente) |
| Atestado de pena, ciência às partes e à unidade, intimação de advogado, lembrete, BNMP, comunicações externas | `vep-comunicacoes-decisao` (sempre por último) |
| Saída temporária deferida | não cadastrar incidente; a ciência à unidade basta |
| Semiaberto harmonizado | não cadastrar; a comunicação da unidade só é arquivada, sem vista e sem conclusão (Portaria, art. 27, §§ 4º e 5º) |
| Processo na vara do Regime Aberto | só é editável a partir da área do Aberto: com ordem do usuário, trocar de área (Técnicas) e cumprir lá; o mesmo vale ao contrário. Remessa de uma vara para a outra fica com o usuário |
| Juntar atestado de pena e certidão carcerária e dar vista ao MP | `vep-comunicacoes-decisao` (atestado por juntada) e certidão do Canaimé (Técnicas); vista pela remessa sem Retorno de Conclusão |
| Remover incidente cadastrado em duplicidade | só com ordem do usuário: Técnicas, "Remover incidente" |
| Preso em outro estado ou comunicação externa por ofício | com o usuário; lembrete na capa se ele pedir |
| Habilitação/exclusão de advogado, perícia, domiciliar, ofícios diversos, vista ao MP sobre peça | fora das skills: listar para o usuário |

## Fase 3: plano (enviar e aguardar "aprovo")

Uma tabela por processo, com os atos na ordem abaixo e todos os valores (datas, dias, incidentes, destinos e prazos). Divergências ficam fora da leva e vão para o usuário.

Ordem de execução quando há mais de uma determinação:
1. Retificação de condenação (`vep-retificacao-condenacao`).
2. Remição (`vep-cadastro-remicao`): sempre antes da progressão ou do livramento, para os dias entrarem no cálculo.
3. Data-base e incidente da decisão (`vep-progressao-regime`, `vep-livramento`, `vep-extincao-pena`, `vep-falta-grave-incidente`).
4. Conferência do RSPE (somente leitura): regime, saldo de remidos, data-base, novas datas. Não bateu: parar e avisar.
5. Certidão, se a decisão mandar.
6. Atestado de pena, remessas e intimações (`vep-comunicacoes-decisao`).

Prazos: salvo prazo da lei ou da decisão, 5 dias, e em dobro para a Defensoria (Portaria, art. 6º, caput e § 2º).

## Fase 4: execução e prova

Chamar cada skill na ordem do plano.

**Lote** (lista de processos, validado em 11/11/2026 com 65 + 12 processos): (1) triagem por `fetch` da capa, separando os já cumpridos por colega (conferir de novo logo antes de gravar: outro servidor pode estar no mesmo processo); (2) leitura das decisões anotada em arquivo de trabalho, com as outras ordens de cada uma; (3) um plano para o lote, dizendo o que será feito e o que fica com o usuário; (4) execução por skill, em fila em segundo plano quando houver; (5) **conferência do cálculo da pena em todos os processos** no fim, listando as inconsistências ao usuário sem corrigir (ex.: livramento depois do término, livramento vencido, correção de cálculo pendente, data de livramento presa por outra condenação). Expediente não autorizado (remessa à unidade, ofícios, eventos, audiência) entra na lista "fica com o usuário". Prova de cada ato pela movimentação da capa ("Incidente N ... cadastrado/alterado", "JUNTADA DE ...", "REMETIDOS OS AUTOS PARA ..."). Ao fim da leva, revisar processo a processo: incidentes, atestado, remessa à unidade e ciência das partes.

## Encerramento

Resposta curta: atos com seus sequenciais, processos devolvidos ao magistrado e por quê, RSPE final, o que fica com o usuário (primeira assinatura da sessão, finalizar a conclusão quando não ordenado, BNMP, pendências estranhas da capa) e aprendizados para as skills.

## Técnicas de tela (comuns)

- Conteúdo útil em `window.top.frames[1].frames[0]`. Abrir a capa: `location.href` desse frame = `/seeu/visualizacaoProcesso.do?actionType=visualizar&numeroUnico=<20 dígitos>` (com `&selectedIcon=tabIncidentesConcedidos` para abrir na aba). Nunca usar a barra de endereço. Modais (incidente, remessa) abrem em `frames[1].frames[0].frames[0]`.
- Leitura em lote sem navegar: `fetch` da capa e `DOMParser`; arquivos da movimentação pelo endpoint do `AjaxJspTag.HtmlContent` da linha (POST `tipoLayout=1`). Ver `skills/vep-cadastro-remicao/scripts/helpers-seeu-remicao.js`.
- O guard bloqueia retornos com URL, `=`, `?` ou login: devolver só trechos saneados; conferir por zoom quando bloquear.
- **PDF**: criar um iframe `position:fixed` 100vw x 100vh dentro de `frames[1]` com a URL do arquivo + `#page=N&zoom=70,0,TOP` e ler por `zoom`. Fetch direto do arquivo dá redirect opaco (S3), e aba própria com PDF não pode ser lida nem fotografada. Remover o iframe ao terminar.
- **Diálogos nativos travam a extensão.** Antes de Salvar, trocar `confirm` e `alert` de todos os frames por funções que registram a mensagem; se algo for registrado, parar e perguntar.
- Editor de texto: não clicar em Voltar; na prévia, Voltar é `history.back()` com `onbeforeunload`, `confirm` e `alert` anulados.
- Abas e links por `.click()` em JS; checkboxes de remessa, Salvar de edição de incidente na tela nova e alguns botões só por clique real na coordenada.
- Comandos longos: rodar em segundo plano na página (promise em `window.top`) e consultar; comando acima de 45 s trava a ferramenta.
- Aba travada: pedir ao usuário para fechar o aviso ou dar F5; depois `tabs_context_mcp` (o tabId muda) e reescolher a área pelo texto exato "Vara de Execuções Penais em Regime Fechado e Semiaberto de Boa Vista".
- Troca de área: clicar no nome da área no cabeçalho; helpers em `window.top` sobrevivem, referências a janelas de frames antigos morrem.
- Navegador: se a extensão cair, `list_connected_browsers` e `select_browser` com o navegador que o usuário escolher.
- `file_upload` só aceita arquivos do diretório de trabalho (`/home/claude`). Alternativa sem `file_upload`: montar um `File` em JS e atribuí-lo a `[name=arquivosFile]` por `DataTransfer`.
- Mapa dos frames: F = `window.top.frames[1].frames[0]` (capa); formulário do incidente em `F.frames[1]`; modais de remessa e de intimação em `F.frames[0]`.
- **Remover incidente**: abrir o incidente pela aba, `removeButton`, com o `confirm` de todos os frames trocado por um que registra a mensagem e devolve true. Prova: o número some da aba e o RSPE muda (ex.: remição duplicada no 1001488-87.2024).
- **Juntada pelo perfil Analista**: não há tipo DEPEN. Certidão carcerária em `idTipoDocumento` 3 (CERTIDÃO), descrição `tipos` 134 ("Atestado de permanência e conduta carcerária"); atestado de pena em 13251 (ATESTADO DE PENA), descrição 140. Desmarcar `ckbsGerarPendenciaAnlaiseJuntada`; `movimentarButton`; assinar em `celularButton` por clique real.
- **Canaimé** (sessão aberta pelo usuário): busca direta `/sgp2rr/areas/unidades/pesquisa_resultadoVULGO.php?busca1=cpf&busca2=<cpf>&busca3=&Submit2=Pesquisar` (`busca1` também aceita nome ou mae); certidão em `/sgp2rr/areas/impressoes/UND_CertidaoCarceraria.php?id_cad_preso=<id>`. Com a ponte do computador, PDF pelo método da `vep-lapso-vencido-concluso`, item 4. **Sem a ponte** (11/11/2026, 1000416-75.2018): na aba do SEEU, ouvir `drop` em todos os frames e guardar os arquivos em `window.top.__imgs`; na aba da certidão, para cada parada de rolagem (topos das linhas `tr`, passo menor que `innerHeight`), tirar o mouse de cima, screenshot e `upload_image` para a aba do SEEU na coordenada [683,300] com nome pNN.jpg; montar em JS um PDF 1.4 (duas telas por página A4, JPEG em DCTDecode, recorte na largura 716), conferir as páginas e anexar por `DataTransfer`.
