---
name: "vep-retificacao-condenacao"
description: "Retifica no SEEU o desmembramento da condenação ativa (circunstâncias, reincidência, frações) quando a decisão da VEP de Boa Vista/RR manda, e certifica as novas datas do RSPE, sob plano, aprovação e prova."
---

# Retificação de condenação e certidão das novas datas

Desmembrada da vep-retorno-conclusao 2.5 (itens R e D2; validada no 1000056-77.2017). Regras comuns e técnicas: `vep-retorno-conclusao`. Executar antes de remição e de incidentes da mesma decisão.

Base: decisão judicial no caso concreto. Retificação por acórdão só com remessa direta do tribunal (Portaria, art. 31); acórdão em execução provisória: art. 30, § 1º. Reincidência apurada na distribuição: art. 22.

## Retificar o desmembramento

1. Capa, aba Processos Criminais, [Abrir Tudo]. Abrir o desmembramento marcado **ATIVA** (havendo Apelação Criminal ativa, é ela, não a originária), Alterar.
2. Marcar as circunstâncias da decisão (violência ou grave ameaça, reincidente comum, reincidente específico) e clicar **Sugerir** (sem Sugerir o SEEU calcula como primário).
3. Conferir as frações sugeridas com a decisão antes de Salvar. Mapa do SEEU, pós-Pacote: sem VGA e reincidente comum = 20% (art. 112, II); com VGA e reincidente comum = 25% (III); com VGA e "Reincidente Específico" = 30% (IV); livramento do reincidente = 1/2 "Comum Reincidente". Fatos anteriores a 23/01/2020: 1/6, salvo ordem diversa. Valores do `select` usados em 11/11/2026: `fracaoProgressaoRegime` 11 = 60% (art. 112, VII); `fracaoLivramentoCondicional` 5 = 1/1, que veda o livramento (0168775-88.2007, com "Reincidente Específico" marcado); 1 = 1/6 Comum e, no livramento, 1 = 1/3 Comum Primário (1001000-69.2023).
4. Prova: reabrir cada desmembramento e ler os campos salvos.
5. Conferir o RSPE. O SEEU abate a pena cumprida antes da data-base primeiro das condenações de fração menor: uma fração retificada pode não pesar na conta. Com mais de uma condenação, cada uma guarda a sua fração: no 0168775-88.2007 o livramento continuou em 2048 pela condenação por homicídio. Avisar o usuário.

## Certidão (quando a decisão manda certificar)

1. Capa, Juntar Documento: Tipo Movimento JUNTADA DE **CERTIDÃO**; desmarcar "gerar pendência no menu Análise de Juntadas"; Tipo do Arquivo pela lupa = Certidão; Digitar Texto (CKEditor: `CKEDITOR.instances[...].setData(html)`); Continuar; Salvar.
2. Texto: o que foi retificado e as novas datas do RSPE. Sem travessão.
3. Assinatura pela regra comum da `vep-retorno-conclusao` (regra 3). A certidão sai com sigilo "Segredo" mesmo em processo público: está correto, não alterar.
4. Depois: ciência às partes pela `vep-comunicacoes-decisao`.
