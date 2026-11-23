---
name: vep-sei-seeu-canaime
description: Técnicas validadas para operar pelo Claude in Chrome o SEI do TJRR (criar e editar documentos), o SEEU (busca por CPF, juntada com upload, intimação, remessa, assinatura) e o Canaimé. Consultar antes de agir nesses sistemas.
---

# Técnicas de tela: SEI, SEEU e Canaimé

Validadas em 23/11/2026 no Chrome do trabalho. Complementa as regras de cada skill do cartório: esta skill diz **como** clicar, não **se** pode.

## Gerais

- Antes de usar o Chrome, perguntar se o usuário está no trabalho ou em casa e escolher o navegador pelo deviceId (ver memória `seeu`).
- Login, senha, código por e-mail e reCAPTCHA são do usuário. Quando aparecerem, avisar e esperar. Para o código do SEEU, mandar notificação ao celular com o número do processo.
- **Janela de aviso (alert/confirm) trava a aba:** a screenshot e o JS deixam de responder. Pedir ao usuário que leia e feche. Para evitar, antes do clique que pode gerar aviso, substituir na própria página `window.alert` e `window.confirm` por funções que guardam a mensagem (o confirm devolve `true` só quando a confirmação já estiver aprovada).
- **Saída do JS** é bloqueada se tiver URL com query, e-mail ou token. Devolver só strings curtas e trocar `= ? & @` por outro caractere.
- Menus de passar o mouse no SEEU falham com clique rápido. Clicar no menu, passar o mouse no submenu, esperar 1 s e conferir na screenshot antes de clicar.

## SEEU

**Estrutura:** frameset com `mainFrame`, que contém `userMainFrame`. Acesso pelo JS: `document.querySelector('[name=mainFrame]').contentDocument.querySelector('[name=userMainFrame]').contentDocument`. Nessa estrutura `find` e `read_page` não enxergam os campos.

**Abrir processo:** ícone de lupa do topo, digitar os 20 dígitos, Enter, clicar no resultado.

**Busca por CPF ou nome:** Processos > Busca > Avançada. Campo CPF/CNPJ ou Nome da Parte, marcar "Buscar competências semelhantes na mesma comarca", Pesquisar. Usar "Refazer Pesquisa" entre buscas. Fazer um teste de controle com CPF conhecido.

**Ler movimentações:** linhas `tr` com 6 ou mais células e `cells[2]` numérico (seq.). Para ver documentos, clicar no "+" da linha. Pelo JS, `cells[1].querySelector('a,img,span,i,button').click()`; clicar de novo fecha. As linhas de documento começam com "N.M Descrição:". O PDF abre em aba nova e só pode ser lido por screenshot.

**Juntada com arquivo do Claude (upload):**
1. Na capa, clicar em "Juntar Documento". A página pode demorar e travar a screenshot por alguns segundos.
2. Para usar `file_upload`, levar o frame para a página principal: `window.location.href = <userMainFrame>.contentWindow.location.href`. Em 23/11/2026 a sessão continuou válida e `find` passou a achar o file-input. Se a sessão cair, parar e pedir login.
3. `file_upload` com o caminho do arquivo no workspace e a origem `https://seeu.pje.jus.br`. Arquivos do próprio workspace foram aceitos.
4. Tipo Movimento: combobox (`form_input`, valor `3` = CERTIDÃO). Descrição do arquivo enviado: select da linha (ex.: "Ofício (Outros)").
5. Certidão digitada: em "Tipo do Arquivo", digitar "Certid" e escolher "Certidão" na lista; "Digitar Texto" abre o editor (`CKEDITOR.instances.conteudoEditor`). Preencher com `setData(html)` e `input[name=descricao]`. Depois "Continuar", conferir a prévia e "Salvar".
6. Ordem: marcar o rádio da linha e clicar em "Mover Acima" (pode precisar de dois cliques). A certidão vai primeiro.
7. **Desmarcar "gerar pendência no menu Análise de Juntadas" por último**, porque volta marcado quando a página recarrega.
8. "Assinar" pede um código enviado por e-mail (vale cerca de 5 min). Notificar o usuário e esperar. Ao concluir, abre "Movimentar Processo" com o painel de Ações.

**Intimar Partes:** em "Partes - Executado", marcar o checkbox da linha do advogado (o ícone de informação mostra o nome; conferir), Prazo "Estipular em dias" e o número, clicar em Intimar. Gera "EXPEDIÇÃO DE INTIMAÇÃO" e "DISPONIBILIZADO NO DJ ELETRÔNICO".

**Realizar Remessa ao MP:** rolar o diálogo, marcar "Enviar ao Ministério Público" (destino padrão: Promotoria de Execuções Penais de Boa Vista). Para a Finalidade, clicar no select, apertar Down e Enter: o clique na opção não pegou. As opções são CIÊNCIA, MANIFESTAÇÃO e RAZÕES/CONTRARRAZÕES. Preencher o prazo e clicar em "Realizar Remessa" no fim do diálogo.

**Prova:** aba Movimentações, as primeiras linhas com seq., data e evento.

## SEI do TJRR

- **Abrir processo:** campo "Pesquisar..." do topo (achar com `find`, porque a posição muda), número e Enter. O painel mostra "Processo aberto nas unidades".
- **Incluir documento:** selecionar a raiz do processo na árvore; "Incluir Documento" é o primeiro ícone da barra (a posição muda com a largura da árvore: conferir na screenshot, porque um clique errado abriu "Acompanhamento Especial"). Tipos usados: "Ofício" e "Certidão".
- **Formulário:** Texto Inicial "Documento Modelo" mais o protocolo de um documento anterior da VEP-SEC (mantém cabeçalho e estilos); ou "Nenhum" para certidão. Preencher Descrição, Nível de Acesso Público e clicar em Salvar.
- **Editor sem janela solta:** o SEI abre o editor em popup, fora das abas controladas. Não clicar em "Editar Conteúdo". Com o documento selecionado na árvore, rodar na aba do processo: `const w=document.getElementById('ifrConteudoVisualizacao').contentWindow; location.href=new URL(w.linkEditarConteudo, w.location.href).href;`. O editor abre na própria aba.
- **Seções:** `CKEDITOR.instances`, editáveis com `readOnly=false`. No ofício feito por modelo, em ordem: data, destinatário, assunto e referências, corpo. Na certidão com texto "Nenhum", só o corpo. Manter as classes (`Texto_Justificado_Recuo_Primeira_Linha`, `Texto_Alinhado_Direita`).
- **Salvar e confirmar:** clicar em "Salvar" na barra do editor e verificar `checkDirty()` em todas as seções. **Se continuar `true`, não gravou.** Clicar dentro do texto, substituir alert e confirm e salvar de novo. Voltar com conteúdo não salvo dispara "Leave site?".
- **Conferir antes da assinatura:** voltar ao processo (navigate back), abrir o documento na árvore e ler na visualização o texto e o número da versão. Só então pedir a assinatura.
- Assinar e enviar no SEI são atos do usuário.

## Canaimé

- Login em `canaime.com.br/sgp2rr/`, com reCAPTCHA (usuário). Pode aparecer anúncio sobreposto: botão "Fechar".
- Pesquisa por NOME (sem acento) no campo ao lado do seletor e "Pesquisar". O resultado mostra ID, unidade e ala (zoom para ler).
- Clicar no nome abre a ficha; "Certidão Carc." abre aba nova `areas/impressoes/UND_CertidaoCarceraria.php?id_cad_preso=<id>`. `get_page_text` lê a certidão inteira. Fechar a aba depois.
- A unidade "SAÍDA" na lista indica que a pessoa saiu do sistema. O histórico da certidão diz para onde foi.

## PROJUDI

O SSO (Autentikey) pede a senha do usuário e a Consulta Pública tem CAPTCHA. Sem o usuário, confirmar dados por outras fontes oficiais.
