# Passo 4 — Modelo conceitual

Marco M1. A entrega deste passo é o modelo conceitual: o desenho em `entregas/02-conceitual.pdf` (ou `.png`) e as tabelas abaixo.

É um DER na notação de Chen, no brModelo ou no Visual Paradigm Online. Entidades, atributos, relacionamentos e cardinalidades. Ainda não aparecem tabela, chave estrangeira nem tipo de coluna: isso é o modelo lógico, no passo 5.

## Entidades

|Entidade|Atributos|Identificador|
|-|-|-|
|temas|Nome e tipo do tema, id do tema|Id\_tema|
|dificuldade|id da dificuldade, pontuação, nome da dificuldade|Id\_dificuldade|
|pergunta|Alternativas, respostas, id da pergunta, id do tema e id da dificuldade|id da pergunta, id do tema e id da dificuldade|
|usuário|Nome, pontuação, id do usuário|Id\_usuário|

## Relacionamentos

Uma frase por linha, ligada a um requisito. Cardinalidade dos dois lados, mínimo e máximo.

|Relacionamento|Cardinalidade|Justificativa|Requisito|
|-|-|-|-|
|Jogador->tema|1->N|o jogador pode escolher jogar novamente|RF\_01|
|tema->pergunta|1->10|cada tema terá 10 perguntas|RN\_01|
|Pergunta->dificuldade|1->1|cada pergunta terá uma dificuldade diferente|RN\_02|
|dificuldade->jogador|1->1|a dificuldade determina a pontuação do jogador|RN\_03|

O diagrama e esta tabela descrevem o mesmo modelo. Toda entidade do desenho está na tabela.

