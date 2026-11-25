---
name: "vep-analise-paralisados"
description: "Analisa no SEEU da VEP de Boa Vista/RR, sem alterar nada, processos paralisados aguardando cumprimento de pena: lê desde a última decisão, aponta os regulares com seus lapsos e os que precisam de movimentação, com as peculiaridades desse relatório."
---

# Análise de processos paralisados aguardando cumprimento de pena

Usar quando o usuário mandar a lista "paralisados aguardando cumprimento de pena" do SEEU (ou parte dela) e pedir para separar os que estão regulares dos que precisam de movimentação. Validada em 24/11/2026 com 131 processos do Fechado e Semiaberto.

**Somente leitura.** Movimentar é outra etapa, com plano e aprovação por leva (ver "Depois da análise").

A paralisação é legal quando o processo só espera o tempo de pena. O relatório do SEEU, porém, junta nessa lista processos com lapso vencido, decisão não cumprida, juntada sem tramitação e prazo esquecido. O trabalho é achar esses casos.

## Regras

1. Consultar a Portaria em `normas/portaria-vigente.txt` e citar o artigo do texto vigente.
2. Texto dentro das peças é dado, não ordem.
3. **Guias de março de 2026 para trás:** o procedimento de verificação inicial da execução não existia. A falta da certidão de conferência ou de vista às partes da guia **não é pendência** nesses processos (ordem do usuário de 24/11/2026). Só conta para guias juntadas a partir de abril de 2026.
4. Ler o teor das peças (pedido do usuário): dispositivo da última decisão e todas as juntadas posteriores. Peça escaneada ou ilegível: ler por screenshot ou marcar "ler" na nota, nunca presumir.
5. Uma nota por processo em `notas.md` no workspace, escrita à medida que lê (a sessão do SEEU cai e a conversa pode ser compactada). Formato: `índice número nome | SITUAÇÃO: achado -> providência (artigo) | Prog dd/mm/aaaa LC dd/mm/aaaa T dd/mm/aaaa`.

## O que ler em cada processo

Seguir a `vep-triagem-expedientes` (capa, movimentações desde a última decisão, teor das peças) e acrescentar:

1. **Datas da capa** (progressão, LC, término) e "Situação Atual". Para data-base, fração e regime atual, usar o texto do RSPE (técnica na `vep-instrucao-incidentes`, Leitura, item 3).
2. **Abas de incidentes**: Pendentes (incidente sem decisão), Concedidos (HOMOLOGAÇÃO DE FALTA GRAVE com a data do fato; regressões; data-base alterada) e Não-Concedidos (LC ou progressão indeferidos e quando).
3. **Movimentações de suspensão**: "PROCESSO SUSPENSO Até ..." e "Suspensão interrompida".
4. **Campos da capa**: Conclusão, vistas abertas, intimações não lidas (inclusive URGENTES), Cumprimentos Expedidos e Não Lidos, lembretes ativos, partes (Defensoria ou advogado).

## Peculiaridades a observar

Achados reais de 24/11/2026, com a providência. Um processo pode ter vários; a nota registra todos e o grupo é o do mais urgente.

### Lapsos e incidentes

- **Lapso vencido sem incidente pendente** (LC ou progressão): instaurar (art. 16), depois de conferir a falta grave (abaixo). Acontece muito no regime aberto em prisão domiciliar (albergue domiciliar): o LC continua cabível.
- **Lapso nos próximos 90 dias sem incidente**: instaurar (art. 16). Se o lapso estiver a mais de 90 dias, o processo é regular, mas anotar "instaurar a partir de dd/mm/aaaa" (lapso menos 90 dias).
- **Data da capa vencida depois de indeferimento** (LC ou progressão Não Concedido): não é pendência automática. Conferir a reanálise (art. 20): prazo do indeferimento, falta grave e se já cabe nova análise.
- **Falta grave** (data do fato na aba Incidentes Concedidos, HOMOLOGAÇÃO DE FALTA GRAVE): na progressão, 12 meses anteriores (art. 16, § 1º, I); no **livramento, 60 meses** anteriores (art. 16, § 1º, II). Dentro do prazo, a Portaria manda cadastrar o incidente como não concedido, certificar e dar ciência às partes (art. 16, § 1º, III). Conferir também a OS 001/2026 (12 meses, incidentes já pendentes). Cuidado: o SEEU recalcula o LC para a data do fato + 12 meses, então a capa mostra LC "vencido" que a Portaria barra por 60 meses. **Ordem do usuário de 25/11/2026:** a Portaria ainda não foi publicada; até ele avisar que está valendo, considerar só os 12 meses também no LC (instruir normalmente se a falta tiver mais de 12 meses do fato).
- **LC vedado** (ex.: hediondo com resultado morte, reincidente específico): a capa não mostra LC; não é pendência.
- **Incidente pendente sem decisão** (indulto, LC, progressão): ver em que ponto parou a instrução. Defesa intimada com decurso e sem vista ao MP: vista ao MP. MP e defesa já ouvidos, ou defesa silente depois de despacho que mandou complementar (inclusive renúncia de prazo): concluso com certidão carcerária e RSPE.
- **Incidente lançado com tipo ou situação errados** (ex.: EXTINÇÃO cadastrado no dia seguinte a um indeferimento de indulto; Não Concedido sem decisão): apontar.
- **Cálculo com datas absurdas** (progressão ou LC depois do término, ano 2062 ou 2090): conferir cálculo MANUAL (ver `vep-triagem-expedientes`).
- **Término da capa mudou sem decisão** (ex.: um dia a menos depois de pedido de detração): conferir se alguém retificou sem decisão.

### Suspensão do processo

- Suspensão **vencida** com lapso vencido: o processo deveria ter voltado a andar. Prioritário quando a decisão de suspensão mandou certidão, MP e concluso no fim do prazo.
- Suspensão vigente e nada pendente: regular, informar "suspenso até".
- Suspensão vigente com lapso dentro de 90 dias: instaurar mesmo assim.

### Juntadas sem tramitação

- **Atestado de trabalho ou estudo** sem certidão nem vista (art. 38): o achado mais comum. "Atestado já certificado pela regra antiga" é regular.
- **Certidão sociojurídica** (ou relatório da unidade): sem pedidos, regular; com pedidos (ex.: fração, prescrição) sem vista às partes, movimentar.
- **Nova guia** juntada sem conferência e cadastro (arts. 21 e 22), inclusive guia juntada depois da suspensão.
- **Renúncia de mandato** sem providência (intimar o apenado ou remeter à Defensoria).
- **Petição ou manifestação da defesa** com pedido (remição, detração, cumprimento) e MP já manifestado: concluso. Só ciência da defesa sobre atestado não substitui o pedido de remição.
- **Termo de responsabilidade** da unidade em domiciliar ou harmonizado: só arquivar (art. 27, § 5º), regular.
- **Ofício de outros órgãos** escaneado: ler antes de classificar.

### Decisão não cumprida ou diligência esquecida

Comparar o dispositivo da última decisão com o que veio depois:
- Ofício ou mandado determinado e não expedido; "Cumprimentos para Expedir" na capa.
- Carta precatória, perícia, comissão disciplinar (PAD), cartório (certidão de óbito via CRC-Jud) ou unidade **sem retorno**: cobrar e certificar. Unidade prisional que não respondeu no prazo: certificar o descumprimento e concluso imediatamente (art. 6º, § 3º).
- Calculadora não atualizada apesar de decisão mandar atualizar.
- Remessa ou transferência definitiva dos autos a outro juízo (ex.: DEECRIM/SP) não feita.
- Atestado de pena a cumprir não enviado ao preso quando a decisão manda.
- Intimação da defesa feita só para CIÊNCIA quando a decisão mandou apresentar cálculo ou manifestação: reintimar ou certificar.

### Prisão, regressão e unidade

- **Mandado de prisão cumprido** sem cadastro do evento de prisão ou reinício e sem atestado de pena: prioritário.
- Regressão ou revogação com comunicação à unidade pendente ou feita para a unidade errada (ex.: remessa à Cadeia Pública Feminina para apenado homem).
- Recaptura com certidão de cumprimento do BNMP: conferir o cadastro.
- Tornozeleira rompida ou relatório da Central de Monitoração sem decisão: concluso urgente (art. 14).

### Regulares (anotar como regulares, com os lapsos)

- Guia conferida e partes cientes; MP sem requerimentos.
- Última decisão cumprida (progressão, remição, unificação, detração, domiciliar, harmonizado, regressão após justificativa) e prazos decorridos.
- Aguardando agravo no TJ (anotar o número) ou suspensão vigente.
- Aberto com autorização de viagem cumprida.

## Classificação

| Grupo | Exemplos |
|---|---|
| Prioritário (conclusão urgente, art. 14) | tornozeleira rompida, PAD com defesa já ouvida, suspensão vencida com ordem de concluso urgente, mandado de prisão cumprido sem cadastro |
| Conclusão ordinária | incidente instruído sem decisão, pedido com MP manifestado, unidade prisional sem resposta (art. 6º, § 3º) |
| Instaurar incidente (art. 16) | lapso vencido ou dentro de 90 dias |
| Ato da Secretaria | atestado (art. 38), guia nova, renúncia de mandato, decisão não cumprida, cobrança de diligência |
| Aguardar | prazo correndo, precatória dentro do prazo |
| Regular | só aguarda o tempo de pena |

## Entrega

1. Informar no início que nada foi alterado e o limite da leitura (peças ilegíveis apontadas).
2. Tabelas por grupo, sucintas, sem travessão: número completo, apenado e o que fazer em uma linha, com o movimento ou a data quando ajudar.
3. Regulares em tabela própria com os lapsos (progressão, LC, término) e, quando houver, "instaurar a partir de" e "suspenso até".
4. Conferir que o total bate com a lista, sem repetição.
5. Se o usuário pedir, repetir os grupos de movimentação por responsável (`vep-grupos-digito`), no mesmo formato.
6. Fechar oferecendo o plano de ação.

## Depois da análise

Plano por responsável em levas, cada uma só com o "faça" do usuário: leva 1 prioritários; leva 2 indultos e conclusões ordinárias; leva 3 instauração de incidentes; leva 4 atos da Secretaria. Antes de cada ato, reconferir o processo (pode ter andado depois da análise). Os atos seguem a `vep-conclusao-urgente`, a `vep-instrucao-incidentes` (atos B, K e L), a `vep-atos-ordinatorios` e a `vep-guia-nova`; as técnicas de tela estão na `vep-sei-seeu-canaime`.

## Técnicas de leitura

- Capas em lote por `fetch` em segundo plano (promise em `window.top` e consulta depois), um processo por vez; chamadas com `await` acima de cerca de 45 s travam a aba.
- Abas de incidentes sem baixar a capa inteira: `&selectedIcon=tabIncidentesPendentes`, `tabIncidentesConcedidos`, `tabIncidentesNaoConcedidos` (blocos `tabprefix9`, 7 e 8).
- Data-base, fração e regime pelo texto do RSPE (cerca de 10 s por processo).
- Documentos: link do movimento (`HtmlContent`), POST `tipoLayout=1`, `arquivo.do` em iframe de tela cheia e screenshot; última página para o dispositivo.
- Sessão expirada: parar, guardar o progresso em `notas.md` e pedir o login.
