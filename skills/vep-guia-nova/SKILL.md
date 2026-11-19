---
name: vep-guia-nova
description: Confere no SEEU da VEP de Boa Vista/RR guia de execução nova ou definitiva, certifica e dá o encaminhamento da Portaria (art. 21, 22, 24, 27, 28 e 30), sob plano e aprovação.
---

# Conferência de guia nova no SEEU

Usar para processo recém-distribuído, guia nova juntada em execução em curso, guia de condenação anterior ou guia definitiva que converte a provisória. Versão 0.2 (19/11/2026): a conferência dos dados da pena, as retificações e a certidão de saneamento passaram para a `vep-conferencia-cadastro`; esta skill fica com o enquadramento na Portaria e o encaminhamento. Versão 0.1 (16/11/2026), montada a partir das certidões de conferência lavradas em 05, 10 e 11/11/2026 (1001320-17.2026, 1001335-83.2026, 1001355-74.2026, 1001380-87.2026, 1001385-12.2026) e da triagem de 16/11/2026; o fluxo completo ainda não foi validado em campo com esta skill. Cópia no repositório da Secretaria: `skills/vep-guia-nova`.

## Regras

1. Conferir antes `normas/portaria-vigente.txt` (artigos da versão de 05/11/2026). A Portaria prevalece, salvo decisão judicial no caso concreto.
2. Escrita só no perfil Analista, sob plano, aprovação expressa, ato a ato e prova (Res. CNJ 615/2025). Claude clica em Assinar nas juntadas da leva aprovada; senha e códigos são do usuário.
3. Ao fim, conferir o cálculo de pena e informar inconsistências.
4. Não cadastrar nada que dependa de interpretação nova sem levar ao usuário (ex.: hediondez discutível, prescrição).

## Fase 1. Leitura e conferência (somente leitura)

Documentos: sentença, acórdão, certidão de trânsito, decisão de recebimento da denúncia, guia, relatório de situação processual, certidão carcerária. Anotar o EP de cada um.

1. **Conferência dos dados da pena (art. 21, I e II):** pela `vep-conferencia-cadastro`, que faz o relatório para aprovação, as retificações, a conferência do cálculo e a certidão de saneamento. A divergência entre guia e título entra na certidão só como constatação; devolver a guia ao juízo da condenação (art. 21, § 1º) ou ao Setor de Distribuição (art. 21, § 2º) só com ordem do usuário no relatório.
2. **Base legal:** frações, hediondez, reincidência e prescrição pela `vep-base-legal-execucao`.
3. **Conversão de restritiva (art. 21, § 3º):** sem a restritiva já cumprida no cadastro, devolver ao juízo que converteu.
4. **Reincidência (art. 22):** apurada na conferência, pelas datas, mesmo se a sentença disser primário (salvo o período depurador do § 1º); cadastrada, segue a ciência às partes da Fase 3.
5. **Prescrição:** apurada na conferência; havendo indício, vista ao MP e à defesa e conclusão (Fase 3). Não declarar nem descadastrar nada.
6. **Execução provisória convertida (art. 30, § 2º):** a Distribuição junta acórdão e trânsito com a guia definitiva; conferir se o acórdão alterou a pena (se sim, `vep-acordao`).
7. **Situação prisional:** preso (unidade pela última anotação da certidão carcerária) ou solto (endereço). Capa com "Não existe data de início de cumprimento" indica apenado solto ou cadastro de prisão faltando.
8. **Outros processos do apenado:** execução já em curso exige soma ou unificação; não instaurar progressão nem extinção com cálculo incompleto.

## Fase 2. Plano

Por processo: inconsistências achadas e retificação proposta, texto da certidão, encaminhamento e destinatários. Aguardar "aprovo".

## Fase 3. Atos

1. **Retificações e certidão de saneamento:** já feitas pela `vep-conferencia-cadastro` (Fases 4 a 6); não repetir aqui.
2. **Devolução da guia** (art. 21, § 1º ou § 2º): só se o usuário tiver mandado no relatório.

3. **Encaminhamento conforme o regime e a situação:**

| Situação | Ato |
|---|---|
| Fechado, preso | Vista às partes para requererem o que entenderem de direito; sem requerimento, aguardar o lapso (art. 28) |
| Semiaberto, solto | Mandado de intimação para apresentar-se em 5 dias à Cadeia Pública de Boa Vista (homem) ou à Cadeia Pública Feminina (mulher) (art. 27); depois, art. 24, § 2º a § 5º |
| Semiaberto, preso | Vista às partes e comunicação à unidade |
| Aberto | É da Vara do Regime Aberto: mandado do art. 24 com o modelo do Anexo II (domiciliar) |
| Reincidência cadastrada | Ciência à defesa e ao MP (art. 22, § 2º); impugnação: vista à parte contrária e conclusão (§ 3º) |
| Indício de prescrição | Vista ao MP e à defesa e conclusão (`vep-atos-ordinatorios` C) |
| Guia com erro da condenação | Ofício de devolução ao juízo da condenação (art. 21, § 1º) |

4. **Atestado de pena:** emitir em até 60 dias do início ou reinício do cumprimento (art. 5º).
5. **Prova:** sequenciais da certidão, retificações e remessas; cálculo conferido.

## Entrega

Tabela com processo, apenado, inconsistências, retificações, encaminhamento e sequenciais. Apontar o que ficou para o usuário decidir.

## Técnicas de tela

- As mesmas da `vep-atos-ordinatorios` (remessa, intimação, concluso) e da `vep-instrucao-incidentes` (juntada com modelo e editor CKEditor, Salvar na prévia, nunca Voltar).
- Cálculo dos Requisitos Temporais: aba Informações Adicionais, clique real (não vem no `fetch`).
- Retornos de JS curtos, sem URL, `=`, `?` ou CPF.