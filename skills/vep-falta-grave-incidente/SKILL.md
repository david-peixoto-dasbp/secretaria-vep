---
name: "vep-falta-grave-incidente"
description: "Aplica no SEEU o art. 16, § 1º, I a III, da Portaria da VEP de Boa Vista/RR (antiga OS 001/2026): falta grave nos 12 meses (progressão) ou 60 meses (livramento), incidente não concedido subjetivo, certidão e ciência às partes, sob plano, aprovação e prova."
---

# Falta grave no período de análise (art. 16, § 1º, da Portaria)

Desmembrada da vep-retorno-conclusao 2.5 (item J, OS nº 001/2026, DJE 8180, 25/09/2026; validada no 1001196-10.2021, movs. 400 a 403). A Portaria vigente incorporou a regra: **progressão, 12 meses; livramento, 60 meses**, contados da data do fato, falta reconhecida ou em apuração (art. 16, § 1º, I e II). A OS falava em 12 meses para ambos: prevalece a Portaria. Regras comuns e técnicas: `vep-retorno-conclusao`.

Quando usar: ao instruir progressão ou livramento (de ofício ou a pedido) e houver falta grave no período, ou quando a decisão mandar proceder na forma do art. 16, § 1º, III (ou da OS 001/2026).

## Atos

1. **Conferir antes**: incidente do mesmo lapso já decidido pelo juiz (ex.: não concedido subjetivo com "Tempo Indeferimento 6 meses") e o que está concluso. Concluso sobre outro assunto (ex.: indulto) não impede; não mexer nele. Falta: aba Incidentes Concedidos (HOMOLOGAÇÃO DE FALTA GRAVE, data do fato) e movimentação da audiência de justificação ou da decisão.
2. **Juntada pelo link da pendência** "Instaurar Incidente de Ofício (...)" da capa: abre Juntar Documento com Tipo Movimento INCIDENTE DE EXECUÇÃO PENAL e o incidente já preenchido. Atribuir a `window.top.location.href` a URL do frame (página principal, para o `file_upload`). Arquivos, nesta ordem: (a) certidão pela lupa Tipo do Arquivo = Certidão, Digitar Texto, `CKEDITOR.instances.conteudoEditor.setData(html)`, Continuar, Salvar; (b) se a decisão citar a OS, cópia dela por `file_upload` (PDF copiado para `/home/claude`), Descrição "Documentos Diversos". Selecionar a certidão e **Mover Acima**. Desmarcar "gerar pendência no menu Análise de Juntadas". O SEEU cria o incidente pendente na assinatura. O usuário assina.
3. **Certidão**: falta grave, data do fato, situação (reconhecida ou em apuração) e as movimentações que a comprovam (art. 16, § 1º, III); sem travessão.
4. **Incidente não concedido**: abrir o pendente criado (Incidentes Pendentes, número, Alterar): Indeferimento Subjetivo, Data da Decisão = dia 1º do mês em que a certidão foi lavrada (Portaria, art. 20, parágrafo único), juiz titular, Observação "Não concedido na forma do art. 16, § 1º, III, da Portaria, falta grave de DD/MM/AAAA (mov. N). Certidão no mov. N." O alerta de ofício some.
5. **Ciência às partes**, sem outra tramitação do incidente (art. 16, § 1º, III), pela `vep-comunicacoes-decisao`: MP CIÊNCIA e advogado por Intimar Partes ou Defensoria CIÊNCIA. Prazo de 5 dias, em dobro para a Defensoria (art. 6º).
6. Impugnação da parte: vista à contraparte e conclusão.

Sem falta grave no período: vista sucessiva à defesa e ao MP e conclusão (art. 16, § 1º, IV), que é rotina de instrução, não deste fluxo.
