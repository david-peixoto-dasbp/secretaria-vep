---
name: vep-saneamento-alvaras-bnmp
description: Saneia no BNMP os alvarás de soltura pendentes da VEP de Boa Vista/RR cobrados pela CGJ (lista em PDF) ou achados no filtro: confere o status, comprova a saída no Canaimé e emite as certidões de cumprimento, sob aprovação.
---

# Saneamento de alvarás pendentes no BNMP

Validada em 25/11/2026 no SEI 0026352-64.2025.8.23.8000 (Despacho 2977208/2026 da CGJ/SAD, 60 alvarás): 55 já cumpridos, 5 certidões emitidas. Formulário da certidão: skill `vep-certidao-alvara-bnmp`. Técnicas de tela: skill `vep-sei-seeu-canaime`. Base: Portaria vigente, art. 29 (a Secretaria atualiza a situação prisional no BNMP 3.0).

## Regras

1. Consulta é livre. **Certidão só depois de o usuário aprovar a lista**, com a data e o responsável de cada uma.
2. Login, senha e reCAPTCHA são do usuário (PDPJ, Canaimé e a janela Finalizar Peça).
3. Navegador: perguntar se ele está no trabalho ou em casa. No trabalho, o BNMP pode abrir no Edge (deviceId `741b9961-6ad0-4bfb-872f-48e59cfcdf77`) ou no Chrome do trabalho, conforme ele pedir. No Edge, a janela Finalizar Peça não vem preenchida: ele digita usuário e senha e clica em Concluir.
4. Não corrigir outras peças da pessoa (guias, cautelares, mandados). Só relatar.

## Fase 1: a lista

PDF do anexo da CGJ (colunas: processo, tipo, nome, RJI, CPF, órgão, status).

```bash
pdftotext -layout lista.pdf - | tr '\f' '\n' \
 | grep -oE '^[0-9]{20}\s+Alvará de Soltura\s+.+?\s{2,}[0-9]{9}-[0-9]{2}'
```

O `tr '\f'` é obrigatório: sem ele a primeira linha de cada página se perde. Conferir que o total bate com `grep -c 'Alvará de Soltura'`. Sem PDF, a lista sai do próprio BNMP (Fase 2, varredura).

## Fase 2: status no BNMP (só leitura)

1. Abrir `https://bnmp.pdpj.jus.br/pecas`. Para reaproveitar a autenticação, substituir `XMLHttpRequest.prototype.open/setRequestHeader/send` e guardar cabeçalhos e corpo da chamada `light-filter`; depois clicar em próxima página e voltar. A saída do JS com o token é bloqueada: guardar em `window` e devolver só o que interessa.
2. Guardar o corpo-base com `numeroIndividuo: null` **antes** da primeira consulta própria (se o fetch também estiver interceptado, a consulta seguinte sobrescreve o corpo capturado).
3. Por pessoa: POST `/v2/api/pecas/light-filter?page=0&size=200` com `numeroIndividuo` = RJI **só com dígitos** e `pessoaAtiva: null`. Retorno zero: buscar por `nomePessoa`, porque o RJI pode ter mudado na unificação.
4. Classificar pelo alvará do processo da lista (`descricaoTipoPeca` = "Alvará de Soltura"):
   - "Cumprido" com certidão Ativo: saneado;
   - "Pendente de Cumprimento": pendente;
   - "Ativo" em alvará antigo (BNMP 2.0) não é pendência.
5. Varredura geral: mesmo endpoint, `size=500`, páginas 0 a 19 (para em 10 mil peças), filtrando "Alvará de Soltura" + "Pendente". Separar os da lista dos expedidos depois do despacho e informar o usuário.

## Fase 3: saída no Canaimé (só leitura)

Login do usuário em `canaime.com.br/sgp2rr/`; fechar o anúncio pelo botão "Fechar".

- A pesquisa fica no frame `window.frames[0].frames[0].frames[1].frames[0]` (`pesquisa.php`). Pelo fetch desse frame: GET `pesquisa_resultadoVULGO.php` com `busca1=nome`, `busca2=<nome sem acento>` e `busca3` vazio. Os IDs vêm em `id_cad_preso`.
- Certidão: GET `/sgp2rr/areas/impressoes/UND_CertidaoCarceraria.php` com `id_cad_preso`. No texto, cada lançamento é a unidade, a data (linha própria) e o histórico. Ler "Situação Atual" e os lançamentos a partir de alguns meses antes do alvará.
- Mais de um ID para o mesmo nome (cadastro antigo com unidade SAÍDA, irmão gêmeo, homônimo): ler todos e usar o que tem o processo.
- Marcas de saída: "Foi LIBERADO", "posto em liberdade", "Deixou de ser monitorado" (CME), "Deu entrada nesta CABV ... foi liberado", transferência para a CABV ou prisão domiciliar no aberto, extinção da pena ou da punibilidade.

## Fase 4: plano para aprovação

| Situação | Data da Soltura | Observações |
|---|---|---|
| Saída igual ou posterior ao alvará, mesmo processo | data real da saída | vazio |
| Saída anterior ao alvará (liberado sem alvará; alvará expedido depois só para regularizar o status) | data do alvará: o BNMP recusa data anterior ("Data anterior à expedição do alvará") | "Soltura efetivada em DD/MM/AAAA, conforme certidao carceraria do Canaime (motivo). Alvara expedido posteriormente para regularizacao do status no BNMP." |
| Canaimé cita outro número de processo | data real | registrar o processo citado ("decisao do processo SEEU nº ...") |
| Permanece recolhido, nova prisão sem soltura ou cadastro não localizado | não emitir | levar ao usuário |

Responsável pela Comunicação: diretor da unidade de onde saiu (DIRETOR DA PAMC, DA CPBV, DO CPP, DO CME, DA CABV, DA CPFBV). Quem já estava no aberto e teve a pena extinta: CABV. Quem saiu da monitoração: CME.

Apresentar uma tabela (interno, processo, alvará, saída no Canaimé, data a lançar, responsável, observação) e esperar o "ok".

## Fase 5: emissão

Seguir o formulário da `vep-certidao-alvara-bnmp` (`/pecas/nova-peca/incluir/tipo/certidao-cumprimento-alvara-soltura/rji/<RJI só dígitos>`). Ordem que funcionou:

1. Nº do Alvará (se a lista não abrir, clicar de novo) → Data da Soltura → Observações → lupa do Teor.
2. Órgão: buscar DEPARTAMENTO PENITENCIARIO DO ESTADO DE RORAIMA, escolher o resultado, marcar o rádio na árvore e Confirmar.
3. Responsável (texto livre) → rolar → Próximo → conferir a Revisão (alvará, processo, responsável, data, observação) → Finalizar Peça.
4. Para várias pessoas, preparar cada certidão na **sua própria aba** até a janela Finalizar Peça e avisar o usuário uma vez: ele assina aba por aba.

## Fase 6: conferência

- Aba que foi para `/pessoas/visualizar/<id>`: certidão emitida. Ler o texto da página: certidão ATIVO e alvará CUMPRIDO.
- Aba que continua no formulário: **não foi concluída** (aconteceu em 25/11/2026). Avisar.
- Relatar o status da pessoa ("Em Liberdade", "Preso Condenado em Execução Definitiva", "Em acompanhamento de medidas diversas") e as peças que o mantêm (guias, cautelares de outro juízo), sem alterar.
- Fechar as abas conferidas.

## Entrega

Curta e sem travessão: quantos da lista já estavam saneados; tabela das certidões emitidas (interno, processo, nº da certidão, data lançada e data real); os não emitidos e o motivo; os pendentes expedidos depois do despacho.
