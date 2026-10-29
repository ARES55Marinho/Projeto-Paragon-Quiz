# Passos 5 e 6 — Modelo lógico, normalização e dicionário

Marco M2. A entrega do passo 5 é o modelo lógico: o desenho em `entregas/03-logico.pdf` (ou `.png`) e este texto em `entregas/03-logico.md`.
O desenho parte do modelo conceitual e mostra tabelas, colunas, chave primária e chaves estrangeiras. Não é outro DER. Pode ser feito no brModelo (modelo lógico) ou no Visual Paradigm Online. Se a normalização achar violação, corrijam o desenho e o texto.

## 5. Modelo lógico

|Relacionamento no DER|Cardinalidade|Vira|Onde fica a FK ou a tabela associativa|
|-|-|-|-|
|Jogador — Escolher/Escolhido — Tema|1:N 	o jogador escolhe um tema e pode escolher jogar novamente ou outros|Chave estrangeira|`Jogador.id_Tema` referencia `Tema.id_Tema`. Substitui o atributo textual `Tema_escolhido`.|
|Tema — Contido/Conter — Pergunta|1:N (um Tema contém de 1 a 10 Perguntas; cada Pergunta pertence a um Tema)|Chave estrangeira|`Pergunta.id_Tema` referencia `Tema.id_Tema`.|
|Pergunta — Contido/Conter — Dificuldade|N:N, cada grupo de perguntas terá uma dificuldade diferente|Chave estrangeira / tabela associativa|`Pergunta.id_Dificuldade` referencia `Dificuldade.id_Dificuldade`.|
|Pergunta — Alternativa|1:N|Chave estrangeira|`Alternativa.id_Pergunta` referencia `Pergunta.id_Pergunta`.|



## Normalização

|ID|Dependência|Requisito|
|-|-|-|
|DF1|`Jogador.id_jogador → Jogador.Nome, Jogador.Rank, Jogador.Pontos, Jogador.id_Tema`|O identificador de um jogador determina seus dados e o tema que escolheu.|
|DF2|`Tema.id_Tema → Tema.Nome_Tema`|O identificador de um tema determina seu nome.|
|DF3|`Pergunta.id_Pergunta → Pergunta.Texto_Pergunta, Pergunta.Alternativas, Pergunta.id_Tema, Pergunta.id_Dificuldade, Pergunta.Resposta`|O identificador de uma pergunta determina seus dados, seu tema e sua dificuldade.|
|DF4|`Dificuldade.id_Dificuldade → Dificuldade.Nome_Dificuldade, Dificuldade.Valor_pontos`|O identificador da dificuldade determina seu nome e a pontuação associada.|
|DF5|`Alternativa.id_Alternativa → id_Pergunta, Texto_Alternativa, Correta`|O identificador determina a pergunta associada, o texto e se a alternativa é correta.|



|Forma|Por que o esquema atende|Tabela em que isso aparece|
|-|-|-|
|1FN|Cada coluna contém um único valor. As alternativas foram separadas em registros individuais na tabela Alternativa, evitando armazenar várias alternativas em uma única coluna.|`Alternativa e Pergunta`|
|2FN|As tabelas propostas usam uma única coluna como chave primária; portanto, não há chave primária composta e não se aplica dependência parcial de parte da chave.|`Jogador`, `Tema`, `Pergunta`, `Dificuldade` e, se criada, `Alternativa`.|
|3FN|Os atributos não-chave dependem da chave primária da própria tabela. Os dados do tema e da dificuldade ficam em tabelas próprias e são referenciados por FKs, evitando repetir seus nomes e pontuações em cada pergunta ou jogador.|Todas as tabelas.|


## 6. Dicionário de dados

### Tabela: Jogador
|Coluna|Tipo e tamanho|Nulo|Restrição|Descrição|
|-|-|-|-|-|
|`id_jogador`|int4|NOT NULL|PK|Identificador único do jogador.|
|`Nome`|VARCHAR(80)|NOT NULL|—|Nome do jogador.|
|`Rank`|numeric|NOT NULL|CHECK (`Rank` >= 0)|Posição ou classificação do jogador.|
|`Pontos`|numeric|NOT NULL|DEFAULT 0; CHECK (`Pontos` >= 0)|Quantidade de pontos do jogador.|
|`id_Tema`|varchar|NOT NULL|FK → `Tema.id_Tema`|Tema escolhido pelo jogador.|

### Tabela: Tema
|Coluna|Tipo e tamanho|Nulo|Restrição|Descrição|
|-|-|-|-|-|
|`id_Tema`|VARCHAR(80)|NOT NULL|PK|Identificador único do tema.|
|`Nome_Tema`|VARCHAR(100)|NOT NULL|—|Nome do tema.|


### Tabela: Pergunta
|Coluna|Tipo e tamanho|Nulo|Restrição|Descrição|
|-|-|-|-|-|
|`id_Pergunta`|int4|NOT NULL|PK|Identificador único da pergunta.|
|`Texto_Pergunta`|VARCHAR(300)|NOT NULL|—|Enunciado da pergunta.|
|`id_Tema`|VARCHAR(80)|NOT NULL|FK → `Tema.id_Tema`|Tema ao qual a pergunta pertence.|
|`id_Dificuldade`|VARCHAR(80)|NOT NULL|FK → `Dificuldade.id_Dificuldade`|Dificuldade associada à pergunta.|
|`id_Alternativa`|VARCHAR(80)|NOT NULL|FK → `Alternativas.id_Alternativa`|Alternativa associada á pergunta.|

### Tabela: Dificuldade
|Coluna|Tipo e tamanho|Nulo|Restrição|Descrição|
|-|-|-|-|-|
|`id_Dificuldade`|VARCHAR(80)|NOT NULL|PK|Identificador único da dificuldade.|
|`Nome_Dificuldade`|VARCHAR(80)|NOT NULL|—|Nome ou nível da dificuldade.|
|`Valor_pontos`|numeric|NOT NULL|CHECK (`Valor_pontos` >= 0)|Pontuação atribuída à dificuldade.|

### Tabela: Alternativas
|Coluna|Tipo e tamanho|Nulo|Restrição|Descrição|
|-|-|-|-|-|
|`id_Alternativa`|INT(80)|NOT NULL|PK|Identificador único da alternativa.|
|`alternativa_a`|VARCHAR(100)|NOT NULL|—|Alternativa A, (podendo ser verdadeiro ou falso).|
|`alternativa_b`|VARCHAR(100)|NOT NULL|—|Alternativa B, (podendo ser verdadeiro ou falso).|
|`alternativa_c`|VARCHAR(100)|NULL|—|Alternativa C.|
|`alternativa_d`|VARCHAR(100)|NULL|—|Alternativa D.|
|`Resposta`|numeric|NOT NULL|-|Resposta correta da pergunta.|





