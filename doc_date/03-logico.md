# Passos 5 e 6 — Modelo lógico, normalização e dicionário

Marco M2. A entrega do passo 5 é o modelo lógico: o desenho em `entregas/03-logico.pdf` (ou `.png`) e este texto em `entregas/03-logico.md`.
O desenho parte do modelo conceitual e mostra tabelas, colunas, chave primária e chaves estrangeiras. Não é outro DER. Pode ser feito no brModelo (modelo lógico) ou no Visual Paradigm Online. Se a normalização achar violação, corrijam o desenho e o texto.

## 5. Modelo lógico

|Relacionamento no DER|Cardinalidade|Vira|Onde fica a FK ou a tabela associativa|
|-|-|-|-|
|Jogador — Escolher/Escolhido — Tema|1:N 	o jogador escolhe um tema e pode escolher jogar novamente ou outros|Chave estrangeira|`Jogador.id_Tema` referencia `Tema.id_Tema`. Substitui o atributo textual `Tema_escolhido`.|
|Tema — Contido/Conter — Pergunta|1:N (um Tema contém de 1 a 10 Perguntas; cada Pergunta pertence a um Tema)|Chave estrangeira|`Pergunta.id_Tema` referencia `Tema.id_Tema`.|
|Pergunta — Contido/Conter — Dificuldade|N:N, cada grupo de perguntas terá uma dificuldade diferente|Chave estrangeira / tabela associativa|`Pergunta.id_Dificuldade` referencia `Dificuldade.id_Dificuldade`.|


## Normalização

|ID|Dependência|Requisito|
|-|-|-|
|DF1|`Jogador.id_jogador → Jogador.Nome, Jogador.Rank, Jogador.Pontos, Jogador.id_Tema`|O identificador de um jogador determina seus dados e o tema que escolheu.|
|DF2|`Tema.id_Tema → Tema.Nome_Tema`|O identificador de um tema determina seu nome.|
|DF3|`Pergunta.id_Pergunta → Pergunta.Texto_Pergunta, Pergunta.Alternativas, Pergunta.id_Tema, Pergunta.id_Dificuldade, Pergunta.Resposta`|O identificador de uma pergunta determina seus dados, seu tema e sua dificuldade.|
|DF4|`Dificuldade.id_Dificuldade → Dificuldade.Nome_Dificuldade, Dificuldade.Valor_pontos`|O identificador da dificuldade determina seu nome e a pontuação associada.|


|Forma|Por que o esquema atende|Tabela em que isso aparece|
|-|-|-|
|1FN|Os atributos devem conter valores atômicos. `Alternativas` pode representar várias opções; se guardar várias alternativas juntas em um único campo, será necessário separá-las em registros próprios.|`Pergunta`; recomenda-se criar a tabela `Alternativa` se cada pergunta tiver várias opções.|
|2FN|As tabelas propostas usam uma única coluna como chave primária; portanto, não há chave primária composta e não se aplica dependência parcial de parte da chave.|`Jogador`, `Tema`, `Pergunta`, `Dificuldade` e, se criada, `Alternativa`.|
|3FN|Os atributos não-chave dependem da chave primária da própria tabela. Os dados do tema e da dificuldade ficam em tabelas próprias e são referenciados por FKs, evitando repetir seus nomes e pontuações em cada pergunta ou jogador.|Todas as tabelas.|
