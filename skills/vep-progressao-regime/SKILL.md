---
name: "vep-progressao-regime"
description: "Cumpre no SEEU a decisão de progressão de regime da VEP de Boa Vista/RR (concedida ou indeferida): confere a data-base, ajusta a Alteração de Data-Base, altera o incidente pendente e confere o RSPE, sob plano, aprovação e prova."
---

# Progressão de regime (concedida ou indeferida)

Desmembrada da vep-retorno-conclusao 2.5 (itens B, C e D). Regras comuns, leitura, plano e técnicas de tela: `vep-retorno-conclusao`. Remição na mesma decisão: cadastrar antes, pela `vep-cadastro-remicao`. Comunicações depois, pela `vep-comunicacoes-decisao`.

## Conferência da decisão (antes do plano)

- **Data da progressão**: data prevista no RSPE menos os dias remidos deve bater com a data-base da decisão.
- **Frações**: pela data do fato de cada crime (anterior a 23/01/2020: 1/6 comum; Pacote Anticrime: 16 a 70%; hediondo com reincidência genérica: 40%). Frações erradas no cadastro: `vep-retificacao-condenacao`.
- **Conduta**: falta grave reabilita 1 ano depois do fato; a data-base não pode cair em período de conduta MÁ (conferir na certidão a data da reclassificação para BOA).
- **Lapso**: desconfiar de data-base em período em que o apenado estava solto, com processo arquivado aguardando captura, ou com não apresentação e mandado de prisão; conferir os Eventos antes de aceitar a data da calculadora.
- **Remições já cadastradas** com referência posterior à nova data-base: incluir no plano a alteração da Data Final (ver `vep-cadastro-remicao`, remições antigas).
- Divergência: processo fora da leva, `vep-devolucao-magistrado` quando o usuário mandar.

## Atos

**1. Data-base.** Incidente "ALTERAÇÃO DE DATA-BASE DE PROGRESSÃO DE REGIME/LIVRAMENTO CONDICIONAL" cadastrado como **Fixo** trava a data-base e o SEEU ignora a nova progressão: Alterar para **Dinâmico**, Salvar. Decisão que fixa nova data-base: Incidentes Concedidos, Adicionar, esse incidente, Tipo Progressão de Regime, Concedido Sim, data da decisão, juiz, Data Início = nova data-base, Dinâmico, observação citando a decisão. Prova: "Incidente N ... cadastrado/alterado".

**2. Incidente da decisão.** Primeiro a aba **Incidentes Pendentes**: quase sempre já existe FIXAÇÃO/ALTERAÇÃO DE REGIME pendente. Abrir e alterar; não criar outro (confirm de duplicidade, `ehIncidenteDoMesmoTipo = true`).
- **Concedida**: Concedido Juiz = Sim; Data de Decisão; Juiz; Novo Regime; Data Início = data-base; Motivo = Progressão de Regime; Observação. Só campos visíveis (Local de Apresentação e Revogação ocultos não se aplicam). No aberto, "Cumprido?" fica Não até a unidade informar a soltura. Botão **Salvar** (não "Salvar e Adicionar Medidas"). Sem pendente: Incidentes Concedidos, Adicionar, FIXAÇÃO/ALTERAÇÃO DE REGIME.
- **Indeferida**: Concedido Juiz (select P/S/N) = **Não**; Motivo do Indeferimento = Objetivo ou Subjetivo; Data de Decisão (no **subjetivo**, dia 1º do mês da decisão, Portaria, art. 20, parágrafo único); Juiz; Observação curta. Salvar. A tela de "Condições de cumprimento do Regime Semiaberto" que abre depois: não cadastrar nada; Voltar funciona. Prova: incidente em Não-Concedidos e alerta de Incidente de Ofício some.
- Nunca deixar pendente um incidente que a decisão decidiu.

**3. RSPE** (somente leitura): regime, saldo de remidos, data-base, datas recalculadas, conta das frações (fração x pena remanescente na data-base, menos remidos). O SEEU abate a pena cumprida antes da data-base primeiro das condenações de fração menor. Data-base continua antiga: voltar ao ato 1. Não bateu: parar e avisar.

## Depois

- Concedida: atestado de pena e comunicações (`vep-comunicacoes-decisao`). Progressão ao aberto: certidão de cumprimento do alvará, Redistribuir e BNMP ficam com o usuário (Portaria, art. 29).
- Indeferida sem mudança de cálculo: sem atestado, salvo pedido ou ordem; só remessa à unidade e ciência das partes sem vista aberta.
- Saída temporária deferida: não cadastrar incidente. Semiaberto harmonizado: não cadastrar (Portaria, art. 27, §§ 4º e 5º).
