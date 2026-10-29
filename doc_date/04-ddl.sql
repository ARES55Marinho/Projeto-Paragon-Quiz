-- Passo 7 — Modelo físico
-- Equipe:
-- PostgreSQL. Por que este SGBD:
-- Contrato com Aplicativos para Web: os nomes abaixo são os acordados.
-- Banco vazio:
--   createdb tech_trivia
--   psql -d tech_trivia -v ON_ERROR_STOP=1 -f 04-ddl.sql
-- Só esquema e domínio fixo (idiomas, alternativas).
-- Categorias, publicadores, fontes e perguntas ficam no passo 8.

BEGIN;

-- TODO: CREATE TABLE, na ordem em que as FK permitem.
-- PK id_<tabela>. Nomes em português, minúsculos, sem acento, singular.
-- PK, FK, NOT NULL, UNIQUE e CHECK declarados aqui, como no dicionário.
CREATE TABLE tema (
    id_tema VARCHAR(80) PRIMARY KEY,
    nome_tema VARCHAR(100) NOT NULL
);

CREATE TABLE dificuldade (
    id_dificuldade VARCHAR(80) PRIMARY KEY,
    nome_dificuldade VARCHAR(80) NOT NULL,
    valor_pontos NUMERIC NOT NULL
        CHECK (valor_pontos >= 0)
);

CREATE TABLE alternativa (
    id_alternativa INTEGER PRIMARY KEY,
    alternativa_a VARCHAR(100) NOT NULL,
    alternativa_b VARCHAR(100) NOT NULL,
    alternativa_c VARCHAR(100),
    alternativa_d VARCHAR(100),
    resposta NUMERIC NOT NULL
);

CREATE TABLE jogador (
    id_jogador INTEGER PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    rank NUMERIC NOT NULL CHECK (rank >= 0),
    pontos NUMERIC NOT NULL DEFAULT 0 CHECK (pontos >= 0),
    id_tema VARCHAR(80) NOT NULL,

    CONSTRAINT fk_jogador_tema
        FOREIGN KEY (id_tema)
        REFERENCES tema(id_tema)
);

CREATE TABLE pergunta (
    id_pergunta INTEGER PRIMARY KEY,
    texto_pergunta VARCHAR(300) NOT NULL,
    id_tema VARCHAR(80) NOT NULL,
    id_dificuldade VARCHAR(80) NOT NULL,
    id_alternativa INTEGER NOT NULL,

    CONSTRAINT fk_pergunta_tema
        FOREIGN KEY (id_tema)
        REFERENCES tema(id_tema),

    CONSTRAINT fk_pergunta_dificuldade
        FOREIGN KEY (id_dificuldade)
        REFERENCES dificuldade(id_dificuldade),

    CONSTRAINT fk_pergunta_alternativa
        FOREIGN KEY (id_alternativa)
        REFERENCES alternativa(id_alternativa)
);

-- TODO: INSERT do domínio fixo.

COMMIT;
