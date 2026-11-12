---
name: vep-acordao
description: Cadastra no SEEU da VEP de Boa Vista/RR acórdão juntado que altere a pena (apelação, revisão criminal, HC): localiza o processo criminal, lança a nova pena, confere o cálculo e certifica, sob plano e aprovação.
---

# Cadastro de acórdão no SEEU (vep-acordao)

Versão 0.4 (12/11/2026). Base: Portaria vigente da VEP (`normas/portaria-vigente.txt`, arts. 6º, 29, 30 e 31), Manual para Servidores e Magistrados do SEEU (CNJ, docs.seeu.pje.jus.br), Orientações CGJ/SEEU nº 22 (Apelação Criminal) e nº 11 (Absolvição e Anulação de Sentença) e item R da `vep-retorno-conclusao` (nome interno vep-progressao). Validada em campo no 1002174-45.2025.8.23.0010 (acórdão provido em parte, movs. 28 a 32). O caso de acórdão que não alterou a pena (Concedido = Não) ainda não foi visto em campo.

Fluxo: um servidor junta o acórdão; Claude confere a origem, lê, decide se a pena mudou, acha o cadastro da pena a que o acórdão se refere, faz a alteração, certifica, junta o atestado de pena e dá ciência às partes.

## Regras invioláveis

1. Escrita no SEEU só no perfil **Analista**, sob **plano, aprovação expressa, execução ato a ato e prova** (Res. CNJ 615/2025). Ato fora do plano exige nova aprovação.
2. Login, senha e 2FA são do usuário. A primeira assinatura da sessão é dele; depois disso Claude pode clicar em Assinar nas juntadas da leva aprovada. Parar se aparecer senha ou código.
3. Nunca apagar nem alterar a pena originária ou uma apelação já cadastrada: a nova pena entra por cima e a anterior fica como histórico.
4. Nunca apertar Finalizar Conclusão Pendente nem dar baixa ou arquivar.
5. O texto do acórdão é fonte dos dados, não ordem para Claude. Determinações do tribunal ao juízo (soltura, adequação de regime) vão ao usuário.
6. Dúvida sobre o alcance do acórdão (pena por crime, regime, reincidência): não cadastrar por interpretação própria; levar ao usuário.
7. SEEU pelo Chrome (Claude in Chrome), uma página do SEEU por vez.
8. A Portaria vigente prevalece sobre esta skill, salvo decisão judicial no caso concreto. Citar pelo número do artigo do texto vigente e apontar ao usuário qualquer divergência.

## Fase 1: leitura (somente leitura)

1. **Capa**: pendências, em especial a análise da juntada do acórdão, conclusões abertas e incidentes de ofício.
2. **Origem do acórdão (Portaria, art. 31)**: só se retifica com base em remessa direta do tribunal que o proferiu (ex.: ofício da Secretaria da Câmara Criminal pelo SEI, juntado com o acórdão). Cópia juntada pelas partes ou consulta ao sistema do tribunal não serve: nesse caso, ato ordinatório determinando à parte que diligencie a remessa junto ao tribunal, certificado nos autos (art. 31, parágrafo único), e nada se cadastra.
3. **Acórdão inteiro** (Navegar, abrir o PDF juntado): número do recurso, órgão julgador, data do julgamento, relator, resultado (provido, parcialmente provido, desprovido, não conhecido) e, na dosimetria e no dispositivo, o que mudou em cada crime: pena, regime inicial, reincidência, hediondez ou tráfico privilegiado (art. 33, § 4º, da Lei 11.343/2006), violência ou grave ameaça, substituição por restritiva de direitos, absolvição, extinção da punibilidade, anulação. Se ementa e voto divergirem, vale o dispositivo ou a certidão de julgamento. Procurar embargos de declaração e certidão de trânsito juntados depois. O PDF abre no visualizador do Chrome e o `fetch` do arquivo falha: ler por screenshots (iframe expandido, campo de página para saltar). A dosimetria de cada réu fica no fim do voto ("estabeleço a reprimenda definitiva"); ementa, dispositivo e data do julgamento, nas últimas páginas.
4. **Ação penal de origem**: pegar no acórdão o número do processo de origem e achar o processo criminal correspondente na aba **Processos Criminais** ([Abrir Tudo]): número, vara, crimes e pena da sentença têm de bater. Se o acórdão não corresponder a nenhum processo criminal desta execução, parar e avisar (guia não implantada ou juntada no processo errado). Anotar se a guia é provisória ou definitiva (vista do processo criminal, "Definitiva ou Provisória").
5. **Penas cadastradas**: para o processo criminal achado, anotar todas as penas (Originária, Apelação Criminal, outras), qual está **ATIVA** e os desmembramentos (tipificação, data do fato, pena, frações, violência, reincidência).
6. **Já cadastrado?** Se já existe pena de Apelação Criminal ativa com os valores do acórdão, não há o que lançar: informar ao usuário e não duplicar.
7. **RSPE antes** (anotar para a certidão): pena total, regime, data-base, término, datas de progressão e livramento, remidos.
8. Movimentações desde a juntada do acórdão: guia retificadora, embargos, decisão do juiz sobre o acórdão. Partes: defesa por advogado ou Defensoria.

## Fase 2: efeito do acórdão e cadastro correspondente

| Resultado | Cadastro no SEEU |
|---|---|
| Pena, regime, reincidência, hediondez ou violência alterados | Portaria, art. 30, § 1º: juntar e, independentemente de conclusão, retificar o cálculo em estrita observância aos termos do acórdão. Nova Pena, Tipo de Pena **APELAÇÃO CRIMINAL**, com os dados do acórdão, **Concedido = Sim** e desmembramento de cada crime (Orientação 22). A apelação passa a ser a pena ATIVA |
| Absolvição parcial (um ou mais crimes) | Nova Pena APELAÇÃO CRIMINAL com a pena que restou e desmembramento só dos crimes mantidos |
| Absolvição total, extinção da punibilidade ou anulação da sentença | Nova Pena APELAÇÃO CRIMINAL com 0 anos, 0 meses e 0 dias, regime **INDEFINIDO**, observação dizendo o motivo, sem desmembramento (Orientação 11). Se for guia única, baixa da parte e arquivamento ficam com o usuário. Se o apenado estiver preso por essa guia, alerta urgente ao usuário (soltura depende do juiz) |
| Nova sentença após anulação, em execução com mais de uma guia | Nova Pena tipo **NOVA PENA APÓS NULIDADE**, com a nova sentença e desmembramento |
| Desprovido, não conhecido, sentença mantida, ou provimento só em ponto que não toca a pena privativa (multa, custas, bens) | **Execução provisória e acórdão da Câmara Criminal pelo SEI (Portaria, art. 30, caput e § 2º):** a Secretaria está dispensada da juntada; a juntada do acórdão e da certidão de trânsito cabe ao Setor de Distribuição, junto com a guia definitiva. O padrão do usuário de 12/11/2026 (cadastrar como não concedido) diverge disso nesse caso: apontar a divergência e perguntar antes de cadastrar. **Execução definitiva, ou se o usuário mandar:** Nova Pena APELAÇÃO CRIMINAL com os mesmos dados da sentença e **Concedido = Não** (manual do SEEU: Sim = recurso provido; Não = negado provimento). A pena originária continua **ATIVA** e o cálculo não muda. Certidão pelo modelo 2 |
| Revisão criminal, HC, REsp ou RE que mude a pena | Mesma lógica, com o tipo próprio do select: REVISÃO CRIMINAL, HABEAS CORPUS, RECURSO ESPECIAL ou RECURSO EXTRAORDINÁRIO |
| Substituição por restritiva de direitos | Fora desta versão: levar ao usuário (Orientações 24 e 26) |
| Acórdão de agravo em execução (falta grave, remição, progressão) | Não é alteração de pena: não usar esta skill; levar ao usuário |

## Fase 3: conferência antes do plano

- A soma das penas por crime tem de dar a pena total do acórdão. Concurso formal ou crime continuado: seguir o modelo de desmembramento da pena originária; se não der, levar ao usuário.
- Frações pela data do fato de cada crime (anterior a 23/01/2020: 1/6 comum e, para hediondo com fato a partir de 29/03/2007, 2/5 ou 3/5; Pacote Anticrime: 16% a 70%; as alterações de 2026 no art. 112 da LEP não retroagem). Afastada a hediondez ou a reincidência, as frações caem; conferir o efeito esperado.
- Conferir também a tipificação já cadastrada na pena originária, mesmo no que o acórdão não mudou. Exemplo de campo: roubo com a majorante do § 2º, V (restrição da liberdade), fato a partir de 23/01/2020, é hediondo (Lei 8.072/1990, art. 1º, II, a): no SEEU é o item "§ 2º, V (Após 23.01.2020)", coluna Hediondo = Sim, 40% e 2/3; o genérico "§ 2º: Roubo agravado" não é hediondo e dá 25% e 1/3. Erro de cadastro anterior (padrão do usuário, 12/11/2026): cadastrar a nova pena da forma correta e dizer na certidão que a fração estava cadastrada de forma errada e que o equívoco só agora foi constatado. Levar ao plano para aprovação.
- Regime: o acórdão fixa regime inicial; se for mais brando que o regime atual do apenado, isso vai como alerta (adequação depende do juiz), não como cadastro de incidente.

## Fase 4: plano (enviar ao usuário e aguardar "aprovo")

Por processo: origem do acórdão (art. 31), acórdão (mov. N, recurso, órgão, data), processo criminal afetado (provisória ou definitiva), pena atual ativa, nova pena com cada desmembramento e frações, datas de trânsito (se houver), texto da certidão, RSPE antes e o que se espera depois, alertas, atestado de pena e ciência às partes.

## Fase 5: atos (nesta ordem, só os do plano)

**A. Vínculo e recurso.** Processos Criminais, clicar no processo criminal, botão **Alterar** no fim da página. Em "Sentença 1º Grau": Data de Trânsito em Julgado e Data de Trânsito em Julgado da Acusação, só se houver certidão nos autos. Em "Recurso da Ação Penal": Processo em Grau de Recurso = Sim (`processoEmGrauRecurso` S) e Defesa ou Acusação (`ehDefesaOuAcusacao` D, A ou B). A "Data de Trânsito Julgado do Processo" tem asterisco, mas em guia provisória salva em branco. Salvar ("Dados registrados com sucesso"). Prova: reabrir e ler os campos salvos.

**B. Nova pena.** Aba Processos Criminais, link **Nova Pena** abaixo do processo criminal. Tipo da Pena (`codTipoPenaExecucao`): PRINCIPAL, APELAÇÃO CRIMINAL (4), REVISÃO CRIMINAL, RECURSO ESPECIAL, RECURSO EXTRAORDINÁRIO, HABEAS CORPUS, NOVA PENA APÓS NULIDADE, CONVERTIDA, MEDIDA DE SEGURANÇA; escolhido o tipo, aparece o bloco Recurso. Campos:
- Tempo de Pena (anos, meses, dias); Juiz (texto livre: o relator); Regime (Fechado 3, Semiaberto 2, Aberto 1, Indefinido 0).
- Data de Início = data do acórdão, se alterou a pena, ou da sentença, se não alterou (manual de implantação: a data de início é a da sentença ou a do acórdão que proveu o recurso).
- Ano do Recurso; **Número do Recurso com no máximo 20 caracteres, só os dígitos** (com pontos e traços o SEEU devolve "Erro geral" e não grava).
- Recorrentes (MINISTÉRIO PÚBLICO, O RÉU, EX-OFÍCIO, MP E RÉU); Data de Trânsito do Recurso (só com certidão); Data de Decisão do Recurso; Órgão Julgador (Tribunal de Justica = 10); Câmara Julgadora (texto); Número do Acórdão (pode ficar em branco).
- **Concedido** (S se a pena privativa mudou; N se nada mudou).
- Observação curta, até uns 200 caracteres: "Acórdão Ap. Crim. nº ... (Câmara Criminal TJRR, j. DD/MM/AAAA, mov. N): ...".

Antes de Salvar, neutralizar `confirm` e `alert`; Salvar por clique real. "Erro geral" não grava nada: conferir a aba antes de repetir. Ao salvar, o SEEU abre direto o Cadastro de Desmembramento. Prova na aba Processos Criminais: "XaYmZd - APELAÇÃO CRIMINAL - ATIVA" e a originária sem "ATIVA" (Concedido = Sim). Com Concedido = Não, a originária deve continuar ATIVA; se o SEEU mostrar outra coisa, parar e avisar antes de qualquer outro ato.

**C. Desmembramento** (não se aplica à pena zero). Na tela de desmembramento: Lei pelos atalhos [CP] [LCP] [Drogas] [Armas] [CTB] [ECA]; Artigo pela lupa, pesquisando pela descrição ("Roubo", "sinal identificador", "Corrup"); escolher a tipificação na tabela, que mostra as colunas Violência, Milícia, Organização Criminosa e Hediondo (escolher o inciso exato quando ele muda a hediondez); Data do Delito vem preenchida; marcar violência ou grave ameaça e reincidência conforme o acórdão e clicar **Sugerir** (sem Sugerir o SEEU calcula como primário, e o select de livramento guarda o valor do desmembramento anterior). Pena Imposta; Complemento com o concurso e o acórdão; "Continuar cadastrando" (ao lado do Salvar) marcado até o último crime; "Tempo Restante" mostra quanto falta distribuir. Conferir as frações sugeridas com a Fase 3 antes de Salvar. Mapa do SEEU pós-Pacote (da `vep-retorno-conclusao`): sem VGA e reincidente comum = 20%; com VGA e reincidente comum = 25%; com VGA e reincidente específico = 30%. Com Concedido = Não, replicar os desmembramentos da pena originária com os mesmos valores. Prova: reabrir cada desmembramento.

**D. Conferir o cálculo** (somente leitura). Aba Informações Adicionais, "Cálculo dos Requisitos Temporais": a nova pena entrou na soma, a anterior saiu, regime, data-base, término, progressão, livramento e remidos fazem sentido com o acórdão. Aba Eventos intacta. Se algo não bater, parar e avisar.

**E. Certidão.** Capa, Juntar Documento, Tipo Movimento CERTIDÃO (valor 3); Tipo do Arquivo pela lupa, pesquisar "Certidão" e marcar a primeira linha; "Digitar Texto" exige clique real; o editor `conteudoEditor` vem vazio (`CKEDITOR.instances.conteudoEditor.setData(html)`); Continuar; Salvar; depois do Salvar a caixa de pendência (`ckbsGerarPendenciaAnlaiseJuntada`) volta marcada: desmarcar. A primeira assinatura da sessão é do usuário. Sem travessão no texto.

Modelo 1 (acórdão alterou a pena):

> CERTIFICO que, em cumprimento ao acórdão juntado no mov. N (Apelação Criminal nº ..., [órgão julgador], julgado em DD/MM/AAAA), que [reduziu a pena do crime do art. ... de X para Y / alterou o regime inicial para ... / afastou a reincidência / absolveu o apenado], cadastrei no processo criminal nº ... a pena de APELAÇÃO CRIMINAL de XaYmZd, que passou a constar como ativa, com o desmembramento e as frações correspondentes. CERTIFICO, ainda, que, com o novo cadastro, o cálculo do SEEU passou a indicar término da pena em DD/MM/AAAA, progressão em DD/MM/AAAA e livramento condicional em DD/MM/AAAA (antes: DD/MM/AAAA, DD/MM/AAAA e DD/MM/AAAA).

Modelo 1 com correção de fração: acrescentar o parágrafo "CERTIFICO, ainda, que a pena originária do crime de ... estava cadastrada de forma equivocada, com ..., embora ...; o equívoco somente agora foi constatado, e a pena de apelação já foi cadastrada da forma correta, com ...".

Modelo 2 (acórdão não alterou a pena, quando cabível pela Fase 2):

> CERTIFICO que o acórdão juntado no mov. N (Apelação Criminal nº ..., [órgão julgador], julgado em DD/MM/AAAA) [negou provimento ao recurso / não conheceu do recurso] e manteve a pena fixada na sentença. CERTIFICO, ainda, que cadastrei o acórdão no processo criminal nº ... como APELAÇÃO CRIMINAL não concedida, permanecendo ativa a pena originária de XaYmZd, sem alteração no cálculo do SEEU (término da pena em DD/MM/AAAA).

**F. Atestado de pena** (padrão do usuário: sempre depois da certidão). Aba Informações Adicionais, link "Anexar Atestado de Pena à Movimentação", botão "Atestado de Pena" do diálogo; Maximizar e conferir no PDF pena total, regime, progressão, livramento e término; Assinar (depois da primeira assinatura do usuário, o "Confirme seu código" passa sozinho). Prova: "JUNTADA DE RELATÓRIO DE ATESTADO DE PENA".

**G. Ciência às partes** (Portaria, art. 30, § 1º: "dará ciência às partes da retificação"). Menu "..." (`img.contextMenu`) da linha do atestado, "Realizar Remessa". Marcar MP e Defensoria por clique real; Finalidade **CIÊNCIA**; orientação citando o acórdão, a certidão e o atestado; prazos por último: 5 dias (art. 6º), Defensoria em dobro, 10 dias (art. 6º, § 2º). Com advogado: Intimar Partes, caixa Advogado, 5 dias. Se o usuário pedir "vista" ou "manifestação", seguir a ordem dele e registrar no encerramento que a Portaria fala em ciência. Processo concluso para outro assunto não bloqueia (art. 30, § 1º: "independentemente de conclusão"). Prova: "REMETIDOS OS AUTOS PARA MINISTÉRIO PÚBLICO" e "... DEFENSORIA PÚBLICA".

## Alertas depois do cálculo (avisar; nada lançar sem ordem)

- Término já vencido ou em até 60 dias: urgente, possível excesso de execução; sugerir conclusão urgente (`vep-conclusao-urgente`).
- Progressão ou livramento vencidos ou a vencer em até 60 dias: sugerir o caminho do incidente vencido (`vep-retorno-conclusao`, item I).
- Regime do acórdão mais brando que o atual, ou absolvição com apenado preso: conclusão urgente para o juiz.
- Situação prisional alterada (Portaria, art. 29) ou mandado no BNMP com a pena antiga: avisar o usuário para atualizar o BNMP 3.0.
- Processo concluso para outro assunto (ex.: remição): avisar que o cálculo mudou depois da conclusão.

## Encerramento

Resposta curta: acórdão e efeito, pena cadastrada com seus sequenciais, RSPE antes e depois, certidão, atestado, remessas, alertas e o que fica com o usuário (análise da juntada do acórdão, Finalizar Conclusão, BNMP, baixa). Registrar nesta skill o que a tela real mostrou diferente do descrito.

## Técnicas de tela (resumo; detalhes na `vep-retorno-conclusao`)

- Conteúdo em `window.top.frames[1].frames[0]`. Capa: atribuir ao `location.href` desse frame `/seeu/visualizacaoProcesso.do?actionType=visualizar&numeroUnico=<20 dígitos>`. Nunca usar a barra de endereço.
- Diálogos nativos travam a extensão: antes de Salvar, trocar `confirm` e `alert` do frame por funções que registram a mensagem e retornam false; se algo for registrado, parar e perguntar. Não clicar em Voltar no editor de texto.
- PDF (acórdão, RSPE): abrir pelo painel Navegar, expandir o iframe com CSS `position:fixed` e ler por screenshots com zoom; restaurar o estilo ao terminar.
- A tela tem escala própria: coordenadas de `getBoundingClientRect` não batem com as da screenshot; para clicar, conferir na screenshot.
- Retornos do JS: trechos curtos, sem URL, `=` ou `?`.
- Modais: Maximizar; listar só campos visíveis (`offsetParent` não nulo).
