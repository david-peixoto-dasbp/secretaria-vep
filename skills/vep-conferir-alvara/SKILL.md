---
name: "vep-conferir-alvara"
description: "Confere em lote, sem alterar nada, se alvarás de soltura do SEEU foram cumpridos, cruzando cada processo com a certidão carcerária do Canaimé."
---

# Conferir cumprimento de alvarás (SEEU x Canaimé)

Somente leitura nos dois sistemas. Nunca movimentar, juntar ou assinar.

## Acesso
- Usar Claude in Chrome. Se houver mais de um navegador, perguntar qual; o login e o reCAPTCHA são sempre do usuário.
- SEEU: https://seeu.pje.jus.br/seeu/ com perfil Analista Judiciário.
- Canaimé: abrir direto https://canaime.com.br/sgp2rr/areas/index_areas.php depois que o usuário logar.

## Economia de tokens
- Testar o fluxo em 1 processo e depois rodar em lote por JavaScript.
- Guardar os dados em window e devolver uma linha curta por processo. A saída de cada chamada corta perto de 1.200 caracteres; retornos com URL e query string são bloqueados, então não devolver href.
- Nunca usar variavel global chamada top; envolver o código em função async.

## Etapa 1: SEEU
- Busca: clicar na lupa do topo, digitar o número, esperar 2,5 s, clicar na primeira sugestão (Enter falha às vezes), esperar 4 s. Fazer até 8 processos por browser_batch.
- Conteúdo: document.getElementById('mainFrame').contentWindow.document.getElementById('userMainFrame').contentWindow.document.
- Extrair número, juízo, sentenciado, mãe e linhas de movimento com /soltura/i. Conferir se o número da tela é o pedido; se não for, a busca não carregou ou o processo não existe.
- Data de referência: "Alvará de Soltura expedido em dd/mm/aaaa" mais recente.

## Etapa 2: Canaimé (fetch na própria aba)
Base: /sgp2rr/areas/unidades/. Páginas em iso-8859-1, com parte do histórico em UTF-8 duplicado; corrigir com decodeURIComponent(escape(s)) repetido.
1. Pesquisa: pesquisa_resultadoVULGO.php?busca1=nome&busca2=NOME&busca3=&Submit2=Pesquisar (busca1=mae também funciona). O id vem dos links Ficha_Menu.php?id_cad_preso=ID.
2. Certidão: em menu_cadastro.php?id_cad_preso=ID, seguir o link "Certidão Carc.".
3. Histórico: linhas tr com unidade, data, histórico e conduta. Situação em "Situação Atual".
4. Identidade: exigir nome e mãe. Homônimos ou mãe divergente: abrir as certidões candidatas e escolher a que cita o número do processo. Nome acentuado pode falhar na busca; repetir sem acento e pela mãe.

## Etapa 3: Classificação
Comparar as linhas com data igual ou posterior à expedição:
- Cumprido: registro de soltura, liberação, fim de monitoração ou apresentação em unidade do aberto. A só decisão de progressão, extinção ou livramento não conta.
- Já estava fora: sem registro posterior, mas liberação anterior, assinatura mensal na CABV/CPFBV, livramento ou extinção.
- Verificar: "permanece recolhido" após a expedição, ou nenhum registro compatível.
- Sem alvará no SEEU: nenhuma movimentação com alvará; olhar etiquetas do processo.
- Não localizado: indicar em qual sistema.
Apontar também fatos posteriores relevantes: regressão, falta grave, nova prisão, transferência. Ler a íntegra das linhas em Verificar antes de afirmar qualquer coisa.

## Entrega
Quadro curto agrupado por categoria, com os casos de Verificar primeiro. Informar que a classificação é automática e deve ser confirmada na certidão antes de qualquer ato. Não usar travessão.