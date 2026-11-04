---
name: vep-certidao-alvara-bnmp
description: Dá baixa em alvarás de soltura pendentes no BNMP da VEP de Boa Vista/RR, emitindo a Certidão de Cumprimento após comprovar a saída na certidão carcerária do Canaimé.
---

# Certidão de cumprimento de alvará no BNMP

Escrita em sistema nacional: só para os processos aprovados pelo usuário. Nunca digitar senha nem resolver reCAPTCHA. Clicar em Concluir somente com autorização expressa do usuário nesta conversa.

## Quando emitir
Emitir só se a certidão carcerária comprovar saída com data igual ou posterior ao alvará, de preferência citando o número do processo. Saída anterior ao alvará, "permanece recolhido", nova prisão, trecho sem o processo ou cadastro não localizado: não emitir, apresentar ao usuário para decidir.

## Levantar os dados (somente leitura)
1. Abrir `https://bnmp.pdpj.jus.br/pecas` no Chrome (Claude in Chrome), órgão logado VARA DE EXECUÇÃO PENAL.
2. A lista vem de POST `/v2/api/pecas/light-filter?page=N&size=500`, que falha a partir de 10 mil peças. Em ordem decrescente, costuma bastar. Para reaproveitar os cabeçalhos, capturar uma chamada da própria página.
3. Status do alvará: "Pendente de Cumprimento" ou "Cumprido". Usar `numeroProcesso`, `numeroPeca` e `numeroIndividuo` (RJI). `dataExpedicao` pode aparecer um dia antes na tela; conferir a data do alvará no SEEU em caso de dúvida.
4. Se a pessoa tiver mais de um alvará pendente, parar e perguntar.

## Preencher
Ir direto a `https://bnmp.pdpj.jus.br/pecas/nova-peca/incluir/tipo/certidao-cumprimento-alvara-soltura/rji/<RJI>` e aguardar a carga completa.

| Campo | Conteúdo |
|---|---|
| Nº do Alvará | Selecionar o pendente; se a lista não abrir, clicar de novo e conferir se o formulário expandiu |
| Teor do Documento | Clicar na lupa, que preenche o texto padrão |
| Data da Soltura | Data da saída na certidão carcerária |
| Órgão Responsável | Buscar DEPARTAMENTO PENITENCIARIO DO ESTADO DE RORAIMA, escolher o resultado, marcar o órgão na árvore e Confirmar |
| Responsável pela Comunicação | DIRETOR da unidade de saída: DA PAMC, DA CPBV, DO CME, DO CPP, DA CPFBV, DA CABV |

Avançar em Próximo. Na Revisão, ler número do alvará, processo, responsável e data antes de seguir. O formulário muda de altura conforme a foto; localizar os botões pelo texto, não por posição fixa.

## Finalizar
1. Finalizar Peça abre a janela de assinatura, com login e senha preenchidos pelo próprio Chrome.
2. Concluir, se autorizado. Caso contrário, deixar a janela aberta e pedir o clique ao usuário.
3. Conferir se a tela foi para `/pessoas/visualizar/<id>` e se a peça consta como Ativo. Se continuar no formulário, a certidão não foi emitida.

## Conferência
O alvará passa a "Cumprido". O status da pessoa nem sempre vira "Em Liberdade": outras peças podem mantê-la como preso em execução provisória ou em medidas diversas. Relatar esses casos, sem corrigir por conta própria.

## Entrega
Lista por servidor (grupos da skill vep-grupos-digito) com processo, interno, data e status da pessoa, mais os casos não emitidos e o motivo. Avisar que a comunicação da unidade prisional pode precisar ser juntada aos autos. Resposta curta, sem travessão.

Fontes: Manual do BNMP 3.0 (seção 13) e prática da vara observada nas certidões de novembro de 2026.
