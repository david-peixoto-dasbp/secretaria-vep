---
name: "vep-devolucao-magistrado"
description: "Quando a decisão da VEP de Boa Vista/RR tem erro material ou diverge dos dados do SEEU (cálculo de remição, data-base, conduta, lapso), certifica os fatos sem opinar, devolve concluso ao magistrado no agrupador da matéria e finaliza a conclusão retornada, sem cadastrar nada, só com ordem do usuário."
---

# Erro material ou divergência: certificar e devolver ao magistrado

Desmembrada da vep-retorno-conclusao 2.5 (item H; validada no 1000038-46.2023 e no 1002048-63.2023). Atualizada em 07/11/2026 com o fluxo de erro material (validado no 0012025-77.2015, movs. 401 e 402, e no 1002085-56.2024, movs. 35 e 36). Só com ordem expressa do usuário. **Nada é cadastrado** (nem remição, nem incidente) até a nova decisão. Regras comuns e técnicas: `vep-retorno-conclusao`.

## Quando

- **Erro material**: fundamentação, dispositivo e histórico com valores diferentes (ex.: fundamentação 56 + 8 = 64 dias e dispositivo 61; "Total geral 93" e dispositivo 113).
- **Divergência com os dados**: data-base antes da reclassificação da conduta para BOA; data-base em período solto ou com processo arquivado aguardando captura; data prevista menos remidos não bate.

## Antes do plano (só leitura)

1. Ler a decisão inteira: relatório (o que a parte pediu), fundamentação, dispositivo e Histórico de Remições.
2. Refazer a conta pelos documentos citados. Remição por trabalho: contar dia a dia nas folhas de frequência, só os dias que atendem ao critério da própria decisão (em 07/11/2026: no mínimo 4 horas), e anotar folha repetida, saída temporária, feriado e jornada menor. ENCCEJA: 1.600 h (fundamental) ou 1.200 h (médio) ÷ 12, dividido pelas 5 áreas, e arredondar só no total (Res. CNJ 391/2021, art. 3º, parágrafo único).
3. Dizer ao usuário qual valor é o correto pelos dados da decisão e de onde vem a diferença (ex.: o dispositivo copiou o pedido da Defesa, que omitiu um mês).
4. Ver juntadas posteriores à conclusão e não apreciadas (ex.: nova folha de frequência) e certificar.

## Plano (aprovação expressa)

Por processo: texto integral da certidão, tipo de conclusão, magistrado, urgência, agrupador e a finalização da conclusão retornada.

- **Urgência**: erro material vai com **Urgente = Sim** (ordem do usuário, 07/11/2026). O art. 14 da Portaria não lista essa hipótese: apontar a divergência no plano e seguir a ordem. Como não é caso do art. 14, não exige certidão carcerária nem RSPE (art. 14, parágrafo único), salvo pedido.
- **Agrupador**: o temático da matéria (remição: "REMIÇÃO (trabalho ou estudo, pura ou conjugada)"; data-base: "CÁLCULO, DETRAÇÃO E DATA-BASE"). Nunca os iniciados por "z.", nem "z. ERRO MATERIAL".

## Atos

1. **Certidão**: capa, Juntar Documento; Tipo Movimento CERTIDÃO (`idTipoDocumento` = 3, com `change`); lupa do Tipo do Arquivo, pesquisar "Certidão", primeira opção; botão "Digitar Texto"; `CKEDITOR.instances.conteudoEditor.setData(html)`; Continuar; Salvar; **desmarcar** "gerar pendência no menu Análise de Juntadas" depois do Salvar (volta marcado) e conferir `checked = false`.
   Texto: "CERTIFICO, para apreciação de Vossa Excelência antes do cumprimento da decisão de mov. N (data), que ...": só fatos, com valores e movimentos (o que diz cada parte da decisão; a contagem da Secretaria mês a mês; o pedido da parte; juntadas posteriores). Sem opinar sobre o mérito, sem travessão. Fechar com "Faço os autos conclusos para apreciação." e "Boa Vista/RR, data constante do sistema."
2. **Assinar** pela regra comum (primeira da sessão é do usuário; as demais, Claude clica em Assinar). Prova: "Dados registrados com sucesso", JUNTADA DE CERTIDÃO com o assinante. A certidão sai com sigilo "Segredo": não alterar.
3. **Enviar Concluso**: capa, link que começa com "**Analisar Conclusão Retornada**", "Enviar Concluso (*)". No diálogo (achar o frame com `select[name=idAgrupador]`): Tipo DECISÃO; responsável = magistrado da decisão (conferir; o SEEU pode trazer outro); `flagUrgente` = true; agrupador do plano; assessor "nao"; ENVIAR_IMEDIATAMENTE. Ler os valores, neutralizar `confirm`/`alert` em todos os frames e só então clicar em `enviarConclusoButton`, em comando separado da abertura. Prova: "CONCLUSOS PARA DECISÃO Responsável: ..." e "Pré-Analisar Conclusão ... URGENTE" na capa.
4. **Finalizar Conclusão Pendente**: capa, "Analisar Conclusão Retornada", esperar a tela "Movimentar Processo", botão "Finalizar Conclusão Pendente" por clique real. Prova: a pendência "Retorno de Conclusão" some da capa e fica só a "Pré-Analisar Conclusão".

## Armadilhas

- Regex `/Analisar Conclus/` também acha "**Pré**-Analisar Conclusão" e abre a pré-análise do gabinete: usar `^Analisar Conclusão Retornada`. Se abrir a pré-análise, sair sem tocar em nada.
- As telas demoram: esperar em laço (até ~15 s) pelo elemento antes de clicar, em vez de pausa fixa.
- Capa com "(Não Preso)" ou outra situação estranha: apontar no encerramento, sem mexer.

## Entrega

Tabela curta: processo, valor correto x valor da decisão, movimentos (certidão e conclusão), urgência, agrupador e conclusão retornada finalizada.
