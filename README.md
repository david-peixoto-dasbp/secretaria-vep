# Secretaria VEP

Skills do cartório da Vara de Execução Penal de Boa Vista/RR (Regime Fechado e Semiaberto), separadas do vep-brain.

## Normas

A Portaria que orienta os procedimentos da Secretaria fica em `normas/portaria-vigente.pdf` (texto em `.txt`). Versões anteriores e o passo a passo da troca estão em `normas/`.

## Skills

| Skill | Para que serve |
|---|---|
| `skills/vep-retorno-conclusao` | Cumpre no SEEU as decisões que voltam em Retorno de Conclusão: progressão, livramento (concedido ou indeferido), extinção, remição, retificação, OS 001/2026 e lembretes. Versão 2.5 (30/10/2026), nome interno vep-progressao. |
| `skills/vep-triagem-expedientes` | Lê uma lista de processos no SEEU a partir da última decisão e agrupa por expediente a fazer, conforme a Portaria vigente, sem alterar nada. |
| `skills/vep-conclusao-urgente` | Junta certidão do Canaimé e Relatório da Situação Processual Executória e envia concluso com urgência (Portaria, art. 14), sob plano, aprovação e prova. |
| `skills/vep-conferir-alvara` | Confere em lote, sem alterar nada, se alvarás de soltura do SEEU foram cumpridos, cruzando cada processo com a certidão carcerária do Canaimé. |
| `skills/vep-certidao-alvara-bnmp` | Dá baixa em alvarás pendentes no BNMP, emitindo a certidão de cumprimento após comprovar a saída no Canaimé. |
| `skills/vep-grupos-digito` | Separa processos pelo 7º algarismo entre Roni (1 e 2), Diego (3 e 4), Silvio (0 e 5), Riba (6 e 8) e Andreia (7 e 9). |
| `skills/vep-cadastro-remicao` | Cadastra no SEEU, pela tela nova de remição (manual CNJ de 27/10/2026), os incidentes de remição e de dias perdidos declarados nas decisões que voltaram da conclusão, com helpers em `scripts/`. |
| `skills/vep-produtividade-gabinete` | Levanta no SEEU a produtividade do gabinete (minutas por assessor, mês, área e tipo) e entrega planilha .xlsx com conferência de totais e gráficos. |

## Como usar

Copie a pasta da skill para `.claude/skills/` do Sistema VEP (ou suba o SKILL.md em Configurações > Skills no claude.ai). A vep-retorno-conclusao roda no SEEU pelo Chrome, no perfil Analista, sempre sob plano, aprovação e prova (Res. CNJ 615/2025).
