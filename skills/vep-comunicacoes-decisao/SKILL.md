---
name: "vep-comunicacoes-decisao"
description: "Faz no SEEU as comunicações de uma decisão da VEP de Boa Vista/RR depois dos cadastros: atestado de pena, remessas ao MP, à Defensoria e à unidade prisional, intimação de advogado, remessa sem retorno de conclusão, lembrete na capa e aviso de BNMP, sob plano, aprovação e prova."
---

# Comunicações da decisão

Desmembrada da vep-retorno-conclusao 2.5 (itens E, F, G, L e M). Sempre a última etapa do retorno. Regras comuns e técnicas: `vep-retorno-conclusao`.

## Padrões

Prazos: salvo prazo da lei ou da decisão, **5 dias, em dobro para a Defensoria** (Portaria, art. 6º, caput e § 2º). A versão 2.5 usava MP 3 e Defensoria 6 na ciência de progressão: confirmar com o usuário se a decisão não fixar prazo.

| Destino | Padrão |
|---|---|
| MP | Realizar Remessa, CIÊNCIA; vista ao MP já aberta: não remeter de novo |
| Defesa sem advogado (ou sem defesa cadastrada) | Realizar Remessa à Defensoria, CIÊNCIA; vista já aberta: não remeter de novo |
| Defesa com advogado | Intimar Partes, caixa Advogado (conferir se já saiu automática na assinatura) |
| Unidade prisional | **sempre** remessa específica da decisão, mesmo com vista aberta: Outras Remessas, tipo DEPEN, destino pela certidão carcerária (última anotação, coluna UND). Fechado ou semiaberto: CIÊNCIA - DIRETOR DA UNIDADE. Aberto ou benefício com força de alvará: DECISÃO DE BENEFÍCIO PARA CUMPRIMENTO |
| Monitorado eletronicamente | destino Central de Monitoramento Eletrônico |
| Extinção | ver `vep-extincao-pena` (duas remessas) |
| Preso em outro estado / ofícios | com o usuário; lembrete se pedir |

## Atestado de pena

Aba Informações Adicionais, "Anexar Atestado de Pena à Movimentação", botão "Atestado de Pena" **de dentro do diálogo** (o homônimo da capa só emite o relatório em aba nova). Conferir o PDF (regime, remidos, data-base, previsões). O usuário assina, uma assinatura por vez. Prova: "JUNTADA DE RELATÓRIO DE ATESTADO DE PENA". Indeferimento sem mudança de cálculo: sem atestado, salvo pedido ou ordem. Entrega anual e no início/reinício: Portaria, art. 5º.

## Remessas com Retorno de Conclusão

Capa, "Analisar Conclusão Retornada", Realizar Remessa (*). Marcar os blocos (os checkboxes habilitam os campos; clique real), escolher finalidades e destino, **prazos por último** (o SEEU volta os prazos ao padrão quando outro campo muda). Lupa do destino em Outras Remessas: `a.searchButton`; comparar o nome sem diferenciar maiúsculas ("Penitenciária Agrícola Monte Cristo - Masculino"). Reconferir e Realizar Remessa. Prova: "REMETIDOS OS AUTOS PARA ...". Helpers `__abrirRemessa` / `__preencherRemessa`: se não devolver a janela, achar o frame com `input[name=tipoRemessa]`; conferir no modal o número do processo antes de enviar.

## Remessa ou intimação sem Retorno de Conclusão

Na lista de movimentações, o "..." da linha (ex.: a juntada recém-feita) abre: Arquivar Processo, Carta Precatória Eletrônica, Emitir Minuta Expressa, Enviar Concluso, Gerar Movimento BNMP, Interromper Prazo, Intimar Oficial, **Intimar Partes**, Ordenar Cumprimentos, Ordenar Expedição BNMP3, Redistribuir, **Realizar Remessa**, Suspender, Transitar em Julgado. Achar o item pelo texto da folha (`children.length === 0`). Realizar Remessa: mesmo modal, com Orientações/Observações. Intimar Partes: Partes - Executado, caixa **Advogado**, prazo, Intimar. Concluso para outro assunto não bloqueia. Prova: "REMETIDOS OS AUTOS PARA MINISTÉRIO PÚBLICO" e "EXPEDIÇÃO DE INTIMAÇÃO Para advogados...".

## Lembrete na capa

Botão "Novo Lembrete" (input) no bloco de lembretes: Ativação (hoje), Assunto curto em maiúsculas (ex.: "COMUNICAR DECISÃO SEQ. 113 A PAULO AFONSO-BA"), conteúdo pelo CKEditor (`conteudoEditor`) com o que fazer, a decisão e os destinatários, Salvar. Aceita mais de um lembrete ativo. Prova: "LEMBRETE ATIVO" com o novo assunto.

## BNMP

A aba BNMP3 só redireciona ao sistema do BNMP. Progressão, regressão ou mudança da situação prisional: avisar o usuário para atualizar o BNMP 3.0 (Portaria, art. 29).
