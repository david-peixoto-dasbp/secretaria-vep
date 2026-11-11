# Secretaria VEP

Skills do cartório da Vara de Execução Penal de Boa Vista/RR (Regime Fechado e Semiaberto), separadas do vep-brain.

## Normas

A Portaria que orienta os procedimentos da Secretaria fica em `normas/portaria-vigente.pdf` (texto em `.txt`). Versões anteriores e o passo a passo da troca estão em `normas/`.

## Skills

| Skill | Para que serve |
|---|---|
| `skills/vep-retorno-conclusao` | Orquestrador do Retorno de Conclusão (v3.1, 11/11/2026): lê a decisão, classifica cada determinação e indica a skill que a cumpre, na ordem de execução, sob plano, aprovação e prova. |
| `skills/vep-progressao-regime` | Progressão de regime concedida ou indeferida: conferência da data-base, Alteração de Data-Base, incidente pendente e RSPE. |
| `skills/vep-livramento` | Livramento condicional concedido (data-base, progressão concomitante, incidente, condições) ou indeferido. |
| `skills/vep-extincao-pena` | Extinção da pena total, parcial ou com efeitos futuros: incidente, remessas e o que fica para trânsito e arquivamento. |
| `skills/vep-retificacao-condenacao` | Retifica o desmembramento ativo (circunstâncias, reincidência, frações) e certifica as novas datas do RSPE. |
| `skills/vep-falta-grave-incidente` | Portaria, art. 16, § 1º, I a III (antiga OS 001/2026): falta grave no período, incidente não concedido subjetivo, certidão e ciência. |
| `skills/vep-lapso-vencido-concluso` | Lapso vencido: certidão de lapso e certidão do Canaimé numa juntada e conclusão com o agrupador de incidente vencido. |
| `skills/vep-devolucao-magistrado` | Erro material ou divergência entre a decisão e o SEEU: certidão dos fatos, concluso urgente no agrupador da matéria e finalização da conclusão retornada, sem cadastrar nada. |
| `skills/vep-comunicacoes-decisao` | Última etapa: atestado de pena, remessas ao MP, Defensoria e unidade, intimação de advogado, lembrete e aviso de BNMP. |
| `skills/vep-triagem-expedientes` | Lê uma lista de processos no SEEU a partir da última decisão e agrupa por expediente a fazer, conforme a Portaria vigente, sem alterar nada. |
| `skills/vep-conclusao-urgente` | Junta certidão do Canaimé e Relatório da Situação Processual Executória e envia concluso com urgência (Portaria, art. 14), sob plano, aprovação e prova. |
| `skills/vep-conferir-alvara` | Confere em lote, sem alterar nada, se alvarás de soltura do SEEU foram cumpridos, cruzando cada processo com a certidão carcerária do Canaimé. |
| `skills/vep-certidao-alvara-bnmp` | Dá baixa em alvarás pendentes no BNMP, emitindo a certidão de cumprimento após comprovar a saída no Canaimé. |
| `skills/vep-grupos-digito` | Separa processos pelo 7º algarismo entre Roni (1 e 2), Diego (3 e 4), Silvio (0 e 5), Riba (6 e 8) e Andreia (7 e 9). |
| `skills/vep-cadastro-remicao` | Cadastra no SEEU, pela tela nova de remição (manual CNJ de 27/10/2026), os incidentes de remição e de dias perdidos declarados nas decisões que voltaram da conclusão, com helpers em `scripts/` (`fila-remicao.js` para lote com conferência antes de salvar). Ampliada em 11/11/2026: divergências, limite de 12 obras, remoção de duplicada. |
| `skills/vep-produtividade-gabinete` | Levanta no SEEU a produtividade do gabinete (minutas por assessor, mês, área e tipo) e entrega planilha .xlsx com conferência de totais e gráficos. |

## Como usar

Copie a pasta da skill para `.claude/skills/` do Sistema VEP (ou suba o SKILL.md em Configurações > Skills no claude.ai). As skills de SEEU rodam no SEEU pelo Chrome, no perfil Analista, sempre sob plano, aprovação e prova (Res. CNJ 615/2025).
