# Passos 1 a 3 — Contexto, minimundo e requisitos

Marco M1. Copiem para `entregas/01-contexto.md`.

## 1. Introdução e contexto

Em um parágrafo: o que é o Tech Trivia e qual o objetivo deste banco.
  O Paragon Quiz, é um quiz com questões de multipla escolha sobre diferentes assuntos da area de tecnologia e programação, tanto para os estudantes da area quanto para aqueles que possuem interesse em ingressar, o banco guarda as alternativas selecionadas, nivel de dificuldade além de sortear e corrigir as questões

Escopo. Listem só o que o banco faz e o que fica de fora.

| O banco faz |                                         | O banco não faz |
|1. Guardar questões, alternativas e o gabarito         |1. Não guarda referências|
|2. Classifica cada questão por assunto e dificuldade   |2. Não permite buscar por palavra-chave
|3. Mostra a correção da questão                        |3. Não gera questões de forma autonoma
|4. Sorteia a questão                                   |4. Não guarda o historico de perguntas
|5. Guarda o nome do usuario e o ranking

Usuários. Quem usa o sistema e o que cada um faz com os dados. Não criem tabela de usuário se nenhum requisito pedir cadastro, senha ou sessão.

| Usuário | O que faz |
| Estudantes da area | Podem testar seus conhecimentos do curso |
| Estudantes do ensino médio que possuem interesse| Pode responder questões para avaliar se querem fazer o curso de programção|
| Jogador | Irá jogar o Quiz, respondendo as perguntas |
| Os responsaveis pelo Quiz | Quem cadastra e elabora novas perguntas

## 2. Minimundo

> Somos um grupo da Universidade de Cruzeiro do Sul, que tem como objetivo criar um quiz para testar o conhecimento de participantes em diversos temas, cada um, tendo um grupo de dez questões neles, com varios tipos de perguntas. Ao acessar o quiz pelo site, o usuário se depara com uma tela com o nome do quiz, e um campo para inserir seu nome obrigatoriamente. Em seguida, na próxima tela, o usuário pode escolher entre quatro temas oferecidos devendo escolher um deles para continuar. Após escolher o tema, começa as perguntas, cada uma definida por, ou um grupo de quatro alternativas com apenas uma resposta correta, ou as questões de verdadeiro ou falso, onde o usuário precisa escolher entre um ou outro com base no enunciado ou em seus conhecimentos, ambas de acordo como o tema escolhido, após responder as dez perguntas o usuário acumula pontos dependendo das suas respostas e é colocado em um ranking.

## 3. Requisitos e regras de negócio

| Código | Texto do requisito   | Tipo|
| RD01| Cada tema tem suas prorpias perguntas       | Regra de negocio |
| RD02-RFN02| Não possui dois temas iguais         | Regra de negocio |
| RD03| Apenas uma alternativa correta              | Regra de negocio |
| RF01, RF02| Sorteia e corriges as questões        | Funcional        |
| RF03| Futuramente queremos adcionar mais questões e mais variações | Funcional |
| RD04| Registro de nome e ranking do jogador       | Regras de negocio|
| RNF01 | Criado com PostGris 4                     | Não Funcional    |
