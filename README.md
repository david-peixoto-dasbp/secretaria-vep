# Secretaria VEP

Skills do cartório da Vara de Execução Penal de Boa Vista/RR (Regime Fechado e Semiaberto), separadas do vep-brain.

## Skills

| Skill | Para que serve |
|---|---|
| `skills/vep-retorno-conclusao` | Cumpre no SEEU as decisões que voltam em Retorno de Conclusão: progressão, livramento (concedido ou indeferido), extinção, remição, retificação, OS 001/2026 e lembretes. Versão 2.5 (30/10/2026), nome interno vep-progressao. |
| `skills/vep-conferir-alvara` | Confere em lote, sem alterar nada, se alvarás de soltura do SEEU foram cumpridos, cruzando cada processo com a certidão carcerária do Canaimé. |
| `skills/vep-grupos-digito` | Separa processos pelo 7º algarismo entre Roni (1 e 2), Diego (3 e 4), Silvio (0 e 5), Riba (6 e 8) e Andreia (7 e 9). |

## Como usar

Copie a pasta da skill para `.claude/skills/` do Sistema VEP (ou suba o SKILL.md em Configurações > Skills no claude.ai). A vep-retorno-conclusao roda no SEEU pelo Chrome, no perfil Analista, sempre sob plano, aprovação e prova (Res. CNJ 615/2025).
