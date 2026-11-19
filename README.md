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
| `skills/vep-produtividade-gabinete` | Levanta no SEEU a produtividade do gabinete (minutas por assessor, mês, área e tipo) e entrega planilha .xlsx com conferência de totais e gráficos. |
| `skills/vep-acordao` | Cadastra no SEEU o acórdão juntado que altere a pena (nova pena de Apelação Criminal, desmembramento e frações), confere o cálculo, certifica, junta o atestado de pena e dá ciência às partes (Portaria, arts. 30 e 31). Versão 0.4 (12/11/2026). |
| `skills/vep-guia-nova` | Confere guia de execução nova ou definitiva e dá o encaminhamento da Portaria (arts. 21, 22, 24, 27, 28 e 30); a conferência dos dados da pena vai para a vep-conferencia-cadastro; devolve a guia só nos casos graves. Versão 0.3 (19/11/2026). |
| `skills/vep-conferencia-cadastro` | Análise inicial do cadastro da pena (tempo, regime, capitulação, características, frações, detração) contra sentença, acórdão e guia: relatório para aprovação, retificação e certidão de saneamento; devolve a guia só nos casos graves; data-base inicial na primeira entrada; certidão com pendência de análise de juntada, a única do processo. Versão 0.5 (19/11/2026), testada no 1001247-45.2026.8.23.0010. |
| `skills/vep-base-legal-execucao` | Consulta por data do fato: frações do art. 112 da LEP e do art. 83 do CP, hediondez, reincidência, detração e prescrição; usada pelas skills que conferem ou cadastram frações. Versão 0.1 (19/11/2026). |

## Como usar

Copie a pasta da skill para `.claude/skills/` do Sistema VEP (ou suba o SKILL.md em Configurações > Skills no claude.ai). A vep-retorno-conclusao roda no SEEU pelo Chrome, no perfil Analista, sempre sob plano, aprovação e prova (Res. CNJ 615/2025).
