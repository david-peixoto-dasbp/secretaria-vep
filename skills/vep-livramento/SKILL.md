---
name: "vep-livramento"
description: "Cumpre no SEEU a decisão de livramento condicional da VEP de Boa Vista/RR (concedido ou indeferido): data-base, progressão concomitante, incidente de livramento, condições e conferência, sob plano, aprovação e prova."
---

# Livramento condicional (concedido ou indeferido)

Desmembrada da vep-retorno-conclusao 2.5 (itens C e K, orientações CGJ/SEEU nº 6 e nº 10; validada no 1000915-20.2022, seq. 106 a 114, e nos indeferimentos do 1000455-38.2019 e do 5000058-23.2022). Regras comuns, leitura, plano e técnicas: `vep-retorno-conclusao`.

## Concedido (ordem dos atos)

1. **Data-base retificada pela decisão**: Incidentes Concedidos, Adicionar, ALTERAÇÃO DE DATA-BASE DE PROGRESSÃO DE REGIME/LIVRAMENTO CONDICIONAL, **um incidente por Tipo** (Progressão de Regime e Livramento Condicional), Concedido Sim, data da decisão, juiz, Data Início = nova data-base, **Dinâmico**, observação citando a decisão. O incidente antigo fica como histórico.
2. **Progressão também deferida** (mesmo que o livramento prevaleça): FIXAÇÃO/ALTERAÇÃO DE REGIME, Aberto, Progressão de Regime, Data Início = data da decisão, Cumprido = Não, botão **Salvar**.
3. **Livramento**: pendente, se houver; senão Incidentes Concedidos, Adicionar, LIVRAMENTO CONDICIONAL. Concedido Sim, data da decisão, juiz, Data Início = data da decisão, **Data Fim = término da pena** (capa, Dados da Pena, "Término") quando o período de prova corre até o término, Cumprido = Não, marcar todas as guias (`selection`), observação com as condições. Botão **Salvar e Adicionar Medidas** abre "Condições de cumprimento do Livramento Condicional".
4. **Condições** (Adicionar Medida, só as da decisão; período em anos, meses e dias do início ao término):
   - "obter ocupação lícita" = **Obter ocupação lícita, dentro de prazo razoável se for apto para o trabalho** (periodicidade em branco);
   - "comunicar mensalmente ao juízo a ocupação" = **Comparecimento em juízo**, Local = Juízo, periodicidade 30;
   - "não mudar do território da comarca" = **Proibição de ausentar-se**, Tipo = Comarca, periodicidade em branco.
   Cada uma com observação citando a decisão. Campos: `codTipoMedida`, `dataInicio` e período; comparecimento com `codTipoDestinatario` Juízo, periodicidade 30 e `flagConsiderarSabadoDomingo` falso; proibição com `tipoProibicaoAusencia` Comarca; gravar cada uma em `btnConfirmar`. Validado de novo no 1001488-87.2024 (11/11/2026, Regime Aberto). "Erro geral": reabrir as condições pelo incidente (Incidentes Concedidos, número, link "Condições de cumprimento do Livramento Condicional"); não usar Voltar.
5. Conferir o RSPE e o atestado (regime, término). Comunicações pela `vep-comunicacoes-decisao`: unidade DECISÃO DE BENEFÍCIO PARA CUMPRIMENTO; MP ciência; advogado já intimado na assinatura. Atestado por último; assinatura pela regra comum da `vep-retorno-conclusao` (regra 3).
6. Ficam com o usuário: carta de livramento, cerimônia (Portaria, art. 17, § 1º), comunicações, BNMP (art. 29), Finalizar Conclusão. Recusa do liberando: certificar e fazer conclusão (art. 17, § 3º).

## Indeferido

1. Abrir o LIVRAMENTO CONDICIONAL pendente (Incidentes Pendentes). Concedido Juiz = **Não**; Motivo = Indeferimento Objetivo ou Subjetivo; Data de Decisão (subjetivo: dia 1º do mês da decisão, Portaria, art. 20, parágrafo único); Juiz; Observação curta. Salvar.
2. Abre "Condições de cumprimento do Livramento Condicional": **não cadastrar nada e não clicar em Voltar** (aviso nativo trava a aba); sair reabrindo a capa pelo `location.href` do frame.
3. Prova: incidente em Não-Concedidos; alerta de ofício some. Validado de novo no 0002076-29.2015 (11/11/2026): `concedidoJuiz` N, `motivoIndeferimento` Subjetivo, guias marcadas.
4. Efeito colateral conhecido: a capa passa a mostrar "Medidas Diversas da Prisão: Há 1 Tipo(s) de Medida(s) sem medida alternativa ou monitoração eletrônica cadastrada(s)". Não mexer; avisar no encerramento.
5. Sem mudança de cálculo: sem atestado; remessa à unidade e ciência das partes.

## Atenção

Falta grave nos 60 meses anteriores (livramento) leva ao não concedido subjetivo com certidão: `vep-falta-grave-incidente` (Portaria, art. 16, § 1º, II e III). Livramento com lapso vencido e sem decisão: `vep-lapso-vencido-concluso`.
