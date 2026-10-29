# Passos 5 e 6 — Modelo lógico, normalização e dicionário

Marco M2. A entrega do passo 5 é o modelo lógico: o desenho em `entregas/03-logico.pdf` (ou `.png`) e este texto em `entregas/03-logico.md`.
O desenho parte do modelo conceitual e mostra tabelas, colunas, chave primária e chaves estrangeiras. Não é outro DER. Pode ser feito no brModelo (modelo lógico) ou no Visual Paradigm Online. Se a normalização achar violação, corrijam o desenho e o texto.

## 5. Modelo lógico

|Relacionamento no DER|Cardinalidade|Vira|Onde fica a FK ou a tabela associativa|
|-|-|-|-|
|Jogador — Escolher/Escolhido — Tema|1:N 	o jogador escolhe um tema e pode escolher jogar novamente ou outros|Chave estrangeira|`Jogador.id_Tema` referencia `Tema.id_Tema`. Substitui o atributo textual `Tema_escolhido`.|
|Tema — Contido/Conter — Pergunta|1:N (um Tema contém de 1 a 10 Perguntas; cada Pergunta pertence a um Tema)|Chave estrangeira|`Pergunta.id_Tema` referencia `Tema.id_Tema`.|
|Pergunta — Contido/Conter — Dificuldade|N:N, cada grupo de perguntas terá uma dificuldade diferente|Chave estrangeira|`Pergunta.id_Dificuldade` referencia `Dificuldade.id_Dificuldade`.|
