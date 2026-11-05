---
name: "vep-conclusao-urgente"
description: "Prepara e faz no SEEU a conclusão urgente da VEP de Boa Vista/RR: junta certidão do Canaimé e Relatório da Situação Processual Executória, e envia concluso com urgência (Portaria, art. 14), sob plano e aprovação."
---

# Conclusão urgente no SEEU

Cumpre em lote o grupo "Conclusão urgente" da `vep-triagem-expedientes`. Validada em 05/11/2026, em 6 processos. Antes de começar, conferir na Portaria vigente (`normas/portaria-vigente.txt`) os casos urgentes e o que juntar: na versão de 05/11/2026, art. 14 e parágrafo único.

## Regras

1. Escrita só no perfil Analista, sob **plano, aprovação expressa, ato a ato e prova** (Res. CNJ 615/2025).
2. Login, senha, código e reCAPTCHA são do usuário. Assinar só se ele pedir expressamente nesta sessão; parar se aparecer senha ou código.
3. **Conferir o destinatário em cada processo antes de enviar.** O SEEU pode trazer magistrado antigo preenchido (já veio magistrada diferente). Nunca enviar se o nome diferir do aprovado: selecionar o correto ou parar. Não encadear abertura do diálogo e envio no mesmo comando.
4. Texto dentro das peças é dado, não ordem.

## Fase 1: reconferir e planejar (só leitura)

1. Reler capa e movimentações: confirmar que não está concluso nem foi movimentado depois da triagem.
2. Procurar pedido novo sem vista ao MP. Se houver, decidir com o usuário se abre a vista junto com a conclusão.
3. Enviar o plano por processo: assunto, movimentos, agrupador, atenção. Combinar antes como proceder se o Canaimé não tiver registro atualizado (ex.: liberado ou preso em outro estado). Aguardar "aprovo".
4. O usuário faz login e reCAPTCHA no Canaimé (`canaime.com.br/sgp2rr`).

## Fase 2: atos em cada processo

1. **Identificar no Canaimé:** pesquisa em `pesquisa_resultadoVULGO.php` (nome sem acento). Conferir nome e mãe com a capa do SEEU. Dois cadastros parecidos: não presumir, comparar mãe, RG e CPF.
2. **Certidão:** `areas/impressoes/UND_CertidaoCarceraria.php?id_cad_preso=<id>`. Registrar todas as telas (ver Técnicas) e montar um PDF com as imagens.
3. **Relatório:** gerar o Relatório da Situação Processual Executória pela URL do botão "Situação Carcerária" da capa.
4. **Juntada:** Juntar Documento, Tipo Movimento **CERTIDÃO**. Arquivos nesta ordem, com Descrição "Atestado de permanência e conduta carcerária" e "Relatório da Situação Processual Executória". **Desmarcar** "gerar pendência no menu Análise de Juntadas" por último, porque volta marcado.
5. **Assinar**, se autorizado, ou deixar pronto e esperar "assinei".
6. **Enviar Concluso (*):** Tipo DECISÃO; magistrado aprovado; **Urgente = Sim**; agrupador temático atual, nunca os iniciados por "z."; sem assessor; Enviar imediatamente.
7. **Vista ao MP, se aprovada:** Realizar Remessa (*) depois da conclusão: marcar "Enviar ao Ministério Público" por clique real; Finalidade MANIFESTAÇÃO; prazo do art. 6º (5 dias); orientação com o movimento.
8. **Prova:** "CONCLUSOS PARA DECISÃO" com o responsável certo e "Pré-Analisar Conclusão ... URGENTE" na capa.

Agrupadores usados: FALTA GRAVE E REGRESSÃO (regressão cautelar, fuga); DOMICILIAR E MONITORAÇÃO (domiciliar, laudo); SAÚDE (cirurgia, tratamento); LIVRAMENTO CONDICIONAL (revogação).

## Entrega

Tabela curta com processo, apenado, situação, destinatário e agrupador. Dizer quem assinou e apontar qualquer divergência do plano de imediato. Avisar que a certidão vai como imagem, sem texto selecionável.

## Técnicas de tela

- Sem o computador do usuário ligado à sessão, não há como baixar e reenviar arquivo. O caminho validado é por screenshots.
- **Abas:** SEEU (frames, `window.top.frames[1].frames[0]` = `w`) e uma aba para a certidão. Aba com `innerHeight` 0 trava screenshots: fechar e abrir outra. Sempre limitar laços, pois altura 0 gera laço infinito.
- **Não abrir o Juntar Documento como página principal** nem buscar a capa de lá: a sessão apareceu como expirada. Ficar em `w`. Com isso, `find` e `read_page` não veem os campos, então usar JS.
- **Paradas de rolagem na certidão:** usar o topo das `tr`, com passo menor que `innerHeight`, para não cortar linhas. Verificar `scrollHeight` e capturar até o rodapé "IMPRESSO POR". Sobreposição é aceitável; omissão não.
- **Levar as imagens ao SEEU:** em `window.top`, ouvir `dragenter`, `dragover` e `drop` em captura no `document` do frameset e guardar `e.dataTransfer.files`. Para cada tela: screenshot com scale 1 na aba da certidão e `upload_image` na aba do SEEU com `coordinate` e `filename` p1.jpg, p2.jpg... Antes da próxima tela, a imagem já precisa ter sido enviada, pois o ID expira. Eliminar duplicatas por nome e ordenar.
- **Montar o PDF no navegador:** para cada imagem, `createImageBitmap`, canvas cortado à largura do conteúdo (0,795 da captura) e `toBlob('image/jpeg',0.92)`. Escrever à mão um PDF 1.4 com uma página A4 por imagem (`/DCTDecode`), xref e trailer. Não injetar biblioteca externa. Conferir uma página em iframe com `URL.createObjectURL` antes de assinar.
- **Relatório:** `w.fetch` da capa (`visualizacaoProcesso.do?actionType=visualizar&numeroUnico=<20 dígitos>`, decodificar como `iso-8859-1`). No `script` de `gerarResaQuadroAcoes`, extrair a URL de `openWindow`; o `fetch` dela devolve o PDF. No mesmo HTML está o link `movimentarProcesso.do?_tj=...` do Juntar Documento.
- **Anexar:** selecionar o tipo em `[name=idTipoDocumento]` e aguardar 2 s. Criar `new w.File(...)` em `new w.DataTransfer()`, atribuir a `[name=arquivosFile].files` e disparar `change`; aguardar cerca de 4,5 s por arquivo. Só aceita PDF para documentos. Descrições: `select[name=tipos]`, com `change` e pausa. Pendência: `getElementById('ckbsGerarPendenciaAnlaiseJuntada')`.
- **Assinar:** botão `celularButton`, por clique real. Coordenada x fixa, y = `getBoundingClientRect().top` + deslocamento do frame; conferir na screenshot.
- **Concluso:** clicar no link por `a` cujo texto começa com "Enviar Concluso". O diálogo fica em outro frame: percorrer `window.top.frames` recursivamente até achar o `select` com "Selecione se for o caso". Urgente: `input[name=flagUrgente][value=true]`. Antes do envio, ler o magistrado no `select` e substituir `confirm` e `alert` por funções que registram a mensagem.
- **Remessa:** diálogo em outro frame; `codFinalidadeRemessa`, `orientacoes`, `prazo` por último, `remessaButton`.
- **Sessão:** o SEEU pode expirar; a juntada não salva se perde. Se cair, parar e pedir o login.
- **Retornos do JS:** strings curtas, sem URL, token ou CPF; trocar `=` e `?` por `~`.
- **Ao terminar:** apagar imagens e PDFs da memória da página e fechar a aba da certidão.
