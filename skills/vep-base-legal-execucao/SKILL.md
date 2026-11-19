---
name: vep-base-legal-execucao
description: Consulta por data do fato para a VEP de Boa Vista/RR: frações de progressão (art. 112 LEP) e livramento (art. 83 CP), hediondez, reincidência, detração e prescrição. Usar antes de conferir ou cadastrar frações no SEEU.
---

# Base legal da execução por data do fato

Versão 0.1 (19/11/2026), conferida em fontes nesta data (lista no fim). Consultada pela `vep-conferencia-cadastro`, `vep-guia-nova`, `vep-acordao` e `vep-progressao`: se uma delas divergir desta base, vale esta e a divergência vai ao usuário. Lei ou precedente novo: atualizar aqui, com a data.

## Como usar

1. Fixar a **data do fato** de cada crime (denúncia e título condenatório). Ela escolhe a janela.
2. Aplicar a lei da janela. Lei posterior só se for mais benéfica (CF, art. 5º, XL); se tiver pontos melhores e piores, levar ao usuário.
3. O "Sugerir" do SEEU é ponto de partida, não prova. Se o SEEU não oferecer a fração da janela (ex.: 1/6 de 2026, percentuais da Lei 15.358/2026), avisar o usuário antes de salvar.
4. Caso fora desta base (crime não listado, lei nova, ADI julgada, base com mais de 6 meses): pesquisar em fonte oficial antes de concluir. O Planalto bloqueia acesso automatizado; usar o texto atualizado da Câmara (www2.camara.leg.br, versão "normaatualizada") ou do Senado.

## 1. Progressão (art. 112 da LEP)

VGA = violência à pessoa ou grave ameaça.

| Janela (data do fato) | Crime comum | Hediondo ou equiparado |
|---|---|---|
| A. até 28/03/2007 | 1/6 | 1/6 (Súmula 471/STJ; o SEEU destaca esses hediondos com 1/6) |
| B. 29/03/2007 a 22/01/2020 (Lei 11.464/2007) | 1/6 | 2/5 primário; 3/5 reincidente específico |
| C. 23/01/2020 a 24/03/2026 (Lei 13.964/2019) | 16% primário sem VGA (I); 20% reincidente sem VGA (II); 25% primário com VGA (III); 30% reincidente em crime com VGA (IV) | 40% primário (V); 50% resultado morte, comando de organização criminosa para hediondo ou milícia (VI); 60% reincidente específico (VII); 70% reincidente específico com morte (VIII) |
| D. 25/03/2026 a 07/05/2026 (Lei 15.358/2026) | como C | 70% primário (V); 75% resultado morte, comando de organização criminosa ultraviolenta, milícia ou feminicídio de primário (VI, a a d); 80% reincidente específico (VII); 85% reincidente específico com morte (VIII) |
| E. a partir de 08/05/2026 (Lei 15.402/2026) | 1/6 primário sem VGA (caput); 25% primário com VGA (I); 30% reincidente com VGA, genérico inclusive (II); 20% reincidente em crime diverso (III); o IV (30%) continua em vigor | como D |

Regras por janela:
- **B**: o reincidente não específico em hediondo fica em 2/5, não 3/5 (Tema 1.084/STJ, REsp 1.918.338/MT: retroage o art. 112, V). Regra geral da janela: comparar a fração da Lei 8.072/1990 com a do Pacote para a mesma situação e aplicar a menor. Sem vedação de livramento por resultado morte (a vedação é de 2020 e não retroage).
- **C**: reincidente genérico em crime com VGA = 25% (o IV pede reincidência em crime com VGA; no SEEU, VGA com "Reincidente Comum" sugere 25% e com "Reincidente Específico", 30%). Reincidente não específico em hediondo = 40%, ou 50% com resultado morte (Tema 1.084). Feminicídio de primário com fato de 10/10/2024 em diante: 55%, vedado o livramento (VI-A, Lei 14.994/2024). Homicídio qualificado consumado e feminicídio anterior a 10/10/2024: conferir se o juízo enquadra no VI, a (resultado morte); na dúvida, levar ao usuário.
- **D**: a Lei 15.358/2026 não tratou do reincidente não específico em hediondo: 70%, pela lógica do Tema 1.084; levar ao usuário se o SEEU sugerir outro valor. Em vigor em 25/03/2026; fato de 24/03/2026: conferir a publicação.
- **E**: os incisos I a III foram renumerados; citar o inciso pela redação da janela. 1/6 é mais gravoso que 16% e não retroage; a exclusão dos crimes do Título XII do CP (Estado Democrático de Direito) é benéfica e retroage. ADIs 7966 e 7967 pendentes; a cautelar de 09/05/2026 só alcança as execuções do 8 de janeiro no STF.
- **Todas**: tráfico privilegiado (art. 33, § 4º, da Lei 11.343/2006) é comum (art. 112, § 5º, da LEP; SV 63). Falta grave interrompe e reinicia a contagem sobre a pena remanescente (§ 6º). O exame criminológico (§ 1º, Lei 14.843/2024) não é fração e não entra na conferência do cadastro.

## 2. Livramento condicional (art. 83 do CP)

- Mais de 1/3: não reincidente em crime doloso, com bons antecedentes (I). Mais de 1/2: reincidente em crime doloso (II). Mais de 2/3: hediondo, equiparado, tráfico de pessoas (Lei 13.344/2016) ou terrorismo, se não for reincidente específico em crimes dessa natureza (V).
- Primário com maus antecedentes: a lei é omissa; levar ao usuário.
- Reincidente genérico com crime atual hediondo: 2/3, sem vedação (o V exige especificidade).
- Vedações por data do fato: de 23/01/2020, hediondo com resultado morte (art. 112, VI, a, e VIII); de 10/10/2024, feminicídio de primário (VI-A); de 25/03/2026, também comando de organização criminosa ultraviolenta (VI, b), feminicídio (VI, d) e os crimes de domínio social estruturado e de favorecimento (Lei 15.358/2026, art. 2º, § 4º, III).
- No SEEU: Comum Primário 1/3, Comum Reincidente 1/2, Hediondo 2/3 ou Vedado. Hediondo com reincidência específica no campo de livramento impede o cálculo do benefício (é o efeito da vedação do art. 83, V).
- Guias com primário numa e reincidente noutra: há dois entendimentos (cada guia com a sua fração, ou todas a 1/2). O campo Manter fração do desmembramento escolhe entre eles (Orientação CGJ/SEEU nº 6); seguir o entendimento do juízo e, na dúvida, levar ao usuário.

## 3. Natureza do crime (Lei 8.072/1990)

Rol taxativo. Conferir a data em que o dispositivo entrou no rol ("Incluído pela Lei nº ...") contra a data do fato: inclusão posterior não retroage; exclusão retroage. Na tabela do desmembramento do SEEU, escolher o inciso exato (as colunas Violência, Milícia, Organização Criminosa e Hediondo mudam com ele; há itens "(Após 23.01.2020)").

| Crime | Natureza |
|---|---|
| Tráfico (Lei 11.343/2006, art. 33, caput e § 1º) | equiparado |
| Tráfico privilegiado (art. 33, § 4º) | comum, em qualquer data (SV 63) |
| Associação para o tráfico (art. 35) | comum |
| Arts. 34, 36 e 37 da Lei de Drogas | conferir caso a caso |
| Homicídio qualificado (CP, art. 121, § 2º) | hediondo para fato a partir de 07/09/1994 (Lei 8.930/1994) |
| Feminicídio | hediondo como qualificadora a partir de 10/03/2015 (Lei 13.104/2015); como crime autônomo (art. 121-A), a partir de 10/10/2024 |
| Latrocínio (art. 157, § 3º, morte) | hediondo desde 1990 |
| Roubo com restrição de liberdade (§ 2º, V), arma de fogo (§ 2º-A, I), arma de uso restrito ou proibido (§ 2º-B) ou lesão grave (§ 3º) | hediondo para fato a partir de 23/01/2020; antes, comum |
| Roubo com outras majorantes (concurso de pessoas, arma branca etc.) | comum |
| Extorsão com restrição da liberdade, lesão grave ou morte (art. 158, § 3º) | hediondo a partir de 23/01/2020 (antes, só a qualificada pela morte) |
| Extorsão mediante sequestro (art. 159) | hediondo desde 1990 |
| Estupro e estupro de vulnerável (arts. 213 e 217-A) | hediondos (antes da Lei 12.015/2009, estupro e atentado violento ao pudor, mesmo simples, já eram) |
| Furto com explosivo (art. 155, § 4º-A) | hediondo a partir de 23/01/2020 |
| Posse ou porte de arma de uso proibido (Lei 10.826/2003, art. 16) | hediondo a partir de 23/01/2020 |
| Posse ou porte de arma de uso restrito (art. 16) e figuras do § 1º com arma de uso permitido | hediondo pela Lei 13.497/2017 (fatos de 27/10/2017 em diante), mas o Pacote restringiu ao uso proibido e a jurisprudência aplica a retroatividade benéfica (STJ, Informativo 684, para arma de uso permitido com numeração suprimida). Levar ao usuário antes de mudar |
| Comércio ilegal e tráfico internacional de arma (arts. 17 e 18) | hediondo a partir de 23/01/2020 |
| Organização criminosa (Lei 12.850/2013, art. 2º) | hediondo só se direcionada a crime hediondo ou equiparado, fato a partir de 23/01/2020 |
| Domínio social estruturado e favorecimento (Lei 15.358/2026) | hediondo a partir de 25/03/2026 |
| Tortura (Lei 9.455/1997) e terrorismo (Lei 13.260/2016) | equiparados |

Outras inclusões recentes (Leis 14.811/2024, 15.134/2025 e 15.159/2025, entre outras): conferir no texto atualizado da Lei 8.072/1990.

## 4. Reincidência

- **Existência (CP, art. 63):** novo crime praticado depois do trânsito em julgado de condenação anterior por crime. Comparar sempre a data do fato novo com a data do trânsito anterior. Contravenção anterior não gera reincidência em crime. Condenação anterior pelo art. 28 da Lei de Drogas não gera reincidência nem maus antecedentes (STJ, EREsp 1.624.564/SP; Jurisprudência em Teses, ed. 45).
- **Período depurador (art. 64, I):** mais de 5 anos entre o cumprimento ou a extinção da pena anterior e o novo fato, computado o período de prova do sursis ou do livramento não revogados: não há reincidência (só mau antecedente). Art. 64, II: crimes militares próprios e políticos não contam.
- **Juízo da execução:** reconhece a reincidência ainda que a sentença não a mencione (STJ, EREsp 1.738.968/MG e Tema 1.208). Portaria, art. 22: cadastrar e dar ciência às partes.
- **Específica:** aferir para cada dispositivo; nunca transportar a conclusão de um para outro.

| Finalidade | Base | Correspondência exigida |
|---|---|---|
| Fração agravada em hediondo | art. 112, VII e VIII, LEP | crime atual e anterior hediondos ou equiparados |
| Fração agravada com VGA (janelas C e D) | art. 112, IV, LEP | crime atual e anterior com VGA |
| Vedação do livramento | art. 83, V, CP | reincidência específica em hediondo ou equiparado |

- **Tráfico privilegiado:** condenação anterior ou atual por tráfico privilegiado não gera reincidência específica em hediondo (SV 63; STF, Rcl 87.875, 2026). O apenado continua reincidente genérico: 20% ou 25% na janela C, 1/2 no livramento, sem vedação.
- **Documento:** sem prova do trânsito, da extinção ou da natureza do crime anterior (certidão de antecedentes, guia ou cópia do título anterior), não presumir; pedir ao usuário.

## 5. Detração (CP, art. 42)

- Computa-se a prisão provisória (flagrante, temporária, preventiva) e a internação. No SEEU, cada período é um evento de prisão e de soltura na aba Eventos, com as datas da sentença, da guia, do auto de prisão ou do alvará.
- A detração feita na sentença para fixar o regime (CPP, art. 387, § 2º) não dispensa o evento.
- Prisão por outro processo só se computa para crime anterior a ela (sem crédito para crime futuro).
- Datas divergentes entre sentença, guia e eventos: prevalece o título; sem documento, pedir ao usuário.

## 6. Prescrição da pretensão punitiva (só indício)

A secretaria aponta indício; quem declara é o juiz. Não descadastrar nada.
- **Pena de cada crime isoladamente** (art. 119); na continuidade, sem o acréscimo (Súmula 497/STF). A reincidência não aumenta o prazo da punitiva (Súmula 220/STJ); o acréscimo de 1/3 do art. 110, caput, é só da executória.
- **Prazos (art. 109) pela pena aplicada:** acima de 12 anos, 20; acima de 8 até 12, 16; acima de 4 até 8, 12; acima de 2 até 4, 8; de 1 até 2, 4; abaixo de 1 ano, 3 (2 anos para fatos anteriores a 06/05/2010).
- **Metade (art. 115):** menor de 21 anos na data do fato ou maior de 70 na data da sentença; salvo crime com violência sexual contra a mulher, para fatos a partir de 04/07/2025 (Lei 15.160/2025).
- **Retroativa (art. 110, § 1º):** pena com trânsito para a acusação ou recurso dela improvido. Fato até 05/05/2010: conta também o período entre o fato e o recebimento da denúncia; fato a partir de 06/05/2010 (Lei 12.234/2010): não.
- **Marcos (art. 117):** recebimento da denúncia; pronúncia; confirmação da pronúncia; publicação da sentença ou do acórdão condenatório, inclusive o acórdão que só confirma a condenação (STF, HC 176.473/RR; STJ, Tema 1.100).
- **Contar cada intervalo:** recebimento a sentença; sentença a acórdão; último marco ao trânsito.

## Fontes conferidas em 19/11/2026

SV 63 do STF (2025); STF, HC 176.473/RR e Rcl 87.875; STJ, EREsp 1.738.968/MG, Tema 1.208, Tema 1.084 (REsp 1.918.338/MT), Tema 1.100, EREsp 1.624.564/SP e Informativo 684; Leis 12.234/2010, 14.994/2024, 15.160/2025, 15.358/2026 e 15.402/2026 (ADIs 7966 e 7967; cautelar de 09/05/2026 restrita ao 8 de janeiro).