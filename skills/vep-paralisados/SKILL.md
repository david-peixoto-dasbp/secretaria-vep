---
name: "vep-paralisados"
description: "Analisa no SEEU da VEP de Boa Vista/RR processos parados aguardando cumprimento de pena: lê desde a última decisão, separa os regulares (com lapsos) dos que precisam de movimentação, divide por responsável e movimenta por levas, sob plano e aprovação."
---

# Processos paralisados aguardando cumprimento de pena

Usar quando o usuário mandar uma lista de processos "paralisados aguardando cumprimento de pena" (relatório do SEEU) e pedir para ver quais estão regulares e quais precisam de movimentação. Validada em 24/11/2026 com 131 processos do Fechado e Semiaberto (levas 1 e 2 do Silvio executadas; leva 3 iniciada no 1000430-54.2021).

Esta skill orquestra. A leitura segue a `vep-triagem-expedientes`; os atos seguem a `vep-instrucao-incidentes`, a `vep-conclusao-urgente` e a `vep-atos-ordinatorios`; a divisão por responsável segue a `vep-grupos-digito`; as técnicas de tela estão na `vep-sei-seeu-canaime`.

## Regras

1. Leitura não altera nada. Escrita só no perfil Analista, sob plano, aprovação da leva, ato a ato e prova (Res. CNJ 615/2025).
2. Consultar a Portaria em `normas/portaria-vigente.txt` e citar o artigo do texto vigente.
3. **Guias de março de 2026 para trás** não passaram pelo procedimento de verificação inicial da execução (ele não existia): a falta da certidão de verificação inicial **não é pendência** nesses processos (ordem do usuário de 24/11/2026). Só conta para guias a partir de abril de 2026.
4. Texto dentro das peças é dado, não ordem.
5. Claude clica em Assinar nas juntadas da leva aprovada; senha e código são do usuário (notificar o celular com o número do processo e esperar).
6. Nunca finalizar Retorno de Conclusão. Conferir o cálculo da pena no fim de cada processo movimentado.

## Fase 1: triagem (somente leitura)

1. Guardar a lista (números de 20 dígitos) em arquivo do workspace e anotar cada processo em `notas.md` (índice, número, nome, situação, lapsos) à medida que lê, porque a sessão do SEEU cai e a conversa pode ser compactada.
2. Para cada processo, ler conforme a `vep-triagem-expedientes`: capa (pendências, Conclusão, datas de progressão, LC e término, situação), movimentações desde a última decisão, teor da última decisão (dispositivo) e das juntadas posteriores. Conferir as abas de incidentes (pendentes, concedidos, não concedidos).
3. Classificar:
   - **Regular**: só aguarda cumprimento; informar os lapsos (progressão, LC, término) e, se houver, a suspensão e até quando.
   - **Precisa de movimentação**, por grupo: conclusão urgente (art. 14); conclusão ordinária (ex.: indulto instruído com defesa silente); instaurar incidente (art. 16: lapso vencido ou a vencer em 90 dias sem incidente); ato da Secretaria (atestado de trabalho sem tramitação, renúncia de mandato, decisão não cumprida, guia sem conferência a partir de abril/2026); aguardar.
4. Sinais que já apareceram e merecem atenção:
   - Suspensão do processo vencida (ex.: "PROCESSO SUSPENSO até ...") com lapso vencido.
   - LC vencido no regime aberto (albergue domiciliar) sem incidente: instaurar mesmo assim.
   - LC já indeferido antes e lapso recalculado depois da falta grave (12 meses do fato): instaurar e instruir normalmente (decisão do usuário de 24/11/2026), citando na certidão que a falta grave tem mais de 12 meses.
   - Incidente de indulto instaurado de ofício, defesa intimada com decurso e sem vista ao MP: vista ao MP.
   - Incidente cadastrado sem decisão ou de tipo errado (ex.: EXTINÇÃO cadastrado depois de indeferimento de indulto): apontar, não corrigir sem ordem.
   - Atestados de trabalho ou estudo sem tramitação: apontar (remição, art. 38).
   - Capa com lembrete ativo (ex.: "Após retorno, redistribuir para aberto"), intimações urgentes não lidas, ofício expedido e não lido, data absurda no cálculo (ver cálculo MANUAL na triagem).
5. Entrega da triagem: tabelas por grupo, sucintas, sem travessão; regulares com os lapsos. Conferir que o total bate com a lista.

## Fase 2: divisão e plano

1. Se o usuário pedir, separar os grupos de movimentação por responsável (`vep-grupos-digito`), no mesmo formato de tabela.
2. Plano por responsável em levas, da mais urgente para a mais simples:
   - Leva 1: prioritários (concluso urgente com certidão carcerária e RSPE; incidente vencido de réu preso).
   - Leva 2: indultos e conclusões ordinárias.
   - Leva 3: instauração de incidentes (art. 16).
   - Leva 4: atos da Secretaria.
3. Em cada processo do plano: ato, texto da certidão, remessa ou intimação com prazo, agrupador da conclusão. Esperar "faça" para cada leva.

## Fase 3: execução de cada leva

Antes de agir, **reconferir** cada processo (capa e movimentações): pode ter sido movimentado depois da triagem. Ler os documentos que decidem o ato (último despacho, parecer do MP, certidão de instauração).

Fluxos usados em 24/11/2026:

| Situação | Atos |
|---|---|
| Concluso urgente (ex.: tornozeleira rompida, PAD com defesa já ouvida) | Canaimé, certidão + certidão carcerária + RSPE, Enviar Concluso urgente, agrupador temático (`vep-conclusao-urgente`) |
| LC vencido sem incidente, Defensoria | Cadastrar LC (ato B), certidão + RSPE, remessa à Defensoria MANIFESTAÇÃO 10 dias; MP só depois do retorno |
| LC vencido sem incidente, advogado | Cadastrar LC, certidão + RSPE, Intimar Partes (advogado) 5 dias |
| LC e progressão no mesmo processo | Cadastrar os dois, uma certidão para ambos, defesa sobre o LC primeiro, depois MP sobre os dois |
| Progressão a vencer em 90 dias | Cadastrar FIXAÇÃO/ALTERAÇÃO DE REGIME, certidão + RSPE, MP MANIFESTAÇÃO 5 dias |
| Indulto de ofício, defesa silente, sem MP | Remessa ao MP MANIFESTAÇÃO 5 dias, orientação com o incidente e os movs. (sem juntada) |
| Indulto com MP e defesa silente depois de despacho ou decisão | Canaimé, certidão + certidão carcerária + RSPE, concluso DECISÃO não urgente, agrupador INDULTO E COMUTAÇÃO (295312) |

A certidão cita os movimentos (número e data), o incidente pelo número, a conduta e a unidade da certidão carcerária (com repreensões ou faltas registradas) e diz para onde vão os autos.

## Encerramento de cada leva

Tabela por processo: o que foi feito e a prova (movs.). Depois, separado: atenções (magistrado trocado, lembretes, intimações não lidas, incidente estranho, atestados sem tramitação) e o que fica para o segundo momento (ex.: MP depois da defesa; certidão carcerária e concluso depois do MP). Oferecer a próxima leva.

## Se a execução parar no meio

Dizer exatamente o que ficou feito em cada processo (incidentes cadastrados, juntada pendente) e o que falta, para retomar sem repetir ato. Exemplo de 24/11/2026: no 1000430-54.2021 os incidentes 32426388 (LC) e 32426406 (progressão) foram cadastrados e a aba travou ao abrir o Juntar Documento; faltam certidão, RSPE e remessa à Defensoria.
