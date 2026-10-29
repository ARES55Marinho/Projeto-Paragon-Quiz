# Passos 5 e 6 — Modelo lógico, normalização e dicionário

Marco M2. A entrega do passo 5 é o modelo lógico: o desenho em `entregas/03-logico.pdf` (ou `.png`) e este texto em `entregas/03-logico.md`.
O desenho parte do modelo conceitual e mostra tabelas, colunas, chave primária e chaves estrangeiras. Não é outro DER. Pode ser feito no brModelo (modelo lógico) ou no Visual Paradigm Online. Se a normalização achar violação, corrijam o desenho e o texto.

## 5. Modelo lógico

|Relacionamento no DER|Cardinalidade|Vira|Onde fica a FK ou a tabela associativa|
|-|-|-|-|
|Jogador — Escolher/Escolhido — Tema|1:N 	o jogador escolhe um tema e pode escolher jogar novamente ou outros|Chave estrangeira|`Jogador.id_Tema` referencia `Tema.id_Tema`. Substitui o atributo textual `Tema_escolhido`.|
|dificuldade|id da dificuldade, pontuação, nome da dificuldade|Id\_dificuldade|
|pergunta|Alternativas, respostas, id da pergunta, id do tema e id da dificuldade|id da pergunta, id do tema e id da dificuldade|
|usuário|Nome, pontuação, id do usuário|Id\_usuário|
