---
name: "vep-grupos-digito"
description: "Separa processos pelo 7º algarismo do número CNJ entre Roni, Diego, Silvio, Riba e Andreia. Usar também quando pedirem os processos de uma dessas pessoas."
---

# Classificar processos por responsável

## Regra
O dígito é o 7º algarismo do número CNJ, ou seja, o último antes do hífen.
Exemplo: em 1000063-88.2025.8.23.0010 o dígito é 3, então o processo é do Diego.

## Grupos, nesta ordem
1. Roni: dígitos 1 e 2
2. Diego: dígitos 3 e 4
3. Silvio: dígitos 0 e 5
4. Riba: dígitos 6 e 8
5. Andreia: dígitos 7 e 9

## Como interpretar o pedido
- "Separe por grupo" ou pedido semelhante: entregar todos os grupos.
- "Processos do Diego", "me dê os da Andreia" ou pedido semelhante: entregar apenas os processos daquela pessoa, sem perguntar o critério.
- Lista de referência: a enviada na mensagem ou, se não houver, a lista mais recente da conversa. Se não houver nenhuma lista, pedir os números.

## Passos
1. Não consultar sistemas para classificar.
2. Tirar duplicados e avisar quais foram retirados.
3. Separar números fora do padrão NNNNNNN-DD.AAAA.J.TR.OOOO em "Não classificados", sem corrigi-los.
4. Ler o dígito e colocar cada processo no grupo, em ordem crescente.
5. Ao entregar todos os grupos, conferir se a soma é igual ao total recebido. Para listas grandes, usar um script.

## Entrega
- Um bloco de código por pessoa, com um número completo por linha.
- Título com o nome e a quantidade, por exemplo: **Diego (11 processos)**.
- Grupo vazio aparece com a palavra "Nenhum".
- Resposta curta, sem travessão.