---
name: "vep-devolucao-magistrado"
description: "Quando a decisão da VEP de Boa Vista/RR diverge dos dados do SEEU (data-base, conduta, lapso, eventos), certifica os fatos sem opinar e devolve concluso ao magistrado que decidiu, sem lançar nada, só com ordem do usuário."
---

# Divergência: certificar e devolver ao magistrado

Desmembrada da vep-retorno-conclusao 2.5 (item H; validada no 1000038-46.2023 e no 1002048-63.2023). Só com ordem expressa do usuário. Nada é lançado no SEEU. Regras comuns e técnicas: `vep-retorno-conclusao`.

## Quando

Divergência apontada na conferência (`vep-progressao-regime`, `vep-livramento`, `vep-cadastro-remicao`), por exemplo: data-base fixada antes da reclassificação da conduta para BOA; data-base em período solto ou com processo arquivado aguardando captura; data prevista menos remidos não bate; total da remição diverge entre fundamentação e dispositivo.

## Atos

1. **Certidão** (Juntar Documento, JUNTADA DE CERTIDÃO, Tipo do Arquivo Certidão, Digitar Texto, desmarcar "gerar pendência no menu Análise de Juntadas"), endereçada "para apreciação de Vossa Excelência antes do cumprimento da decisão de mov. N": fatos com datas e movimentos (decisão, certidão carcerária, Eventos), **sem opinar sobre o mérito**; fechar com "faço os autos conclusos para apreciação". Sem travessão. O usuário assina.
2. Capa, "Analisar Conclusão Retornada", **Enviar Concluso (*)**: Tipo DECISÃO; Conclusão pessoal para = magistrado da decisão (conferir o nome; o SEEU pode trazer outro preenchido); Urgente = Não; Assessor = Não; Enviar imediatamente. Antes de clicar, neutralizar `confirm`/`alert` em todos os frames. Prova: "CONCLUSOS PARA DECISÃO" e pendência "Pré-Analisar Conclusão" na capa.
3. O "Retorno de Conclusão" anterior continua na capa: Finalizar Conclusão Pendente é do usuário.
