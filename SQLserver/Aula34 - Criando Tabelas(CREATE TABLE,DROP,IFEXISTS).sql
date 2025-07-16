CREATE DATABASE "dbCartoon"
    LC_COLLATE = 'en_US.utf8'  -- collation para ordenação
    LC_CTYPE = 'en_US.utf8'    -- collation para tipo de caractere
    TEMPLATE = template0       -- garante criação limpa
    ENCODING = 'UTF8';



/*  No PostgreSQL, não existe um COLLATE com nome "Latin1_General_BIN2".
Mas se você quiser diferenciar maiúsculas de minúsculas, use C como collation: */
CREATE DATABASE "dbCartoon"     -- Cria um novo banco de dados com o nome "dbCartoon"
    LC_COLLATE = 'C'            -- Define a collation (ordenação) binária: distingue maiúsculas de minúsculas e ignora regras linguísticas (mais rápido)
    LC_CTYPE = 'C'              -- Define o tipo de caracteres (classificação e transformação) como binário, também sensível a maiúsculas/minúsculas
    TEMPLATE = template0        -- Usa o template0 como base: um banco vazio e imutável (garante um banco limpo, sem dados ou configurações herdadas)
    ENCODING = 'UTF8';          -- Define a codificação de caracteres como UTF-8 (padrão usado por Java, Python, web etc – suporta acentos e emojis)


CREATE DATABASE "dbEscola"
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TEMPLATE = template0
    ENCODING = 'UTF-8';

CREATE DATABASE "dbEmpresa"
    LC_COLLATE = 'C'
    CL_CTYPE = 'C'
    TEMPLATE = template0
    ENCODING = 'UTF-8'

CREATE DATABASE "dbEmpresa"
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TEMPLATE = template0
    ENCODING = 'UTF-8'



/* Listar todos os bancos */
SELECT datname FROM pg_database;

SELECT datname from pg_database;
SELECT datname from pg_database;
SELECT datname from pg_database;
SELECT datname from pg_database;
SELECT datname from pg_database;
SELECT datname from pg_database;
SELECT datname from pg_database;
SELECT datname from pg_database;
SELECT datname from pg_database;
SELECT datname from pg_database;
SELECT datname from pg_database;
SELECT datname from pg_database;

CREATE DATABASE "bdEmpresa"
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TEMPLATE = template0
    ENCODING = 'UTF-8'

SELECT datname from pg_database;
select datname from pg_database;
SELECT  datname from pg_database;



DROP TABLE IF EXISTS Desenhos
DROP TABLE IF EXISTS Desenhos
DROP TABLE IF EXISTS desenho.desenho
DROP TABLE IF EXISTS desenho.desenho
DROP TABLE IF EXISTS desenho.desenho
DROP TABLE IF EXISTS desenho.desenho
DROP TABLE IF EXISTS desenho.desenho
DROP TABLE IF EXISTS desenho.desenho
DROP TABLE IF EXISTS desenho.desenho
DROP TABLE IF EXISTS desenho.personagens
DROP TABLE IF EXISTS desenho.personagens
DROP TABLE IF EXISTS desenho.personagens
DROP TABLE IF EXISTS desenho.personagens
DROP TABLE IF EXISTS desenho.personagens
DROP TABLE IF EXISTS desenho.personagens
DROP TABLE IF EXISTS desenho.personagens

CREATE DATABASE "dbEmpresa"
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TEMPLATE = template0
    ENCODING = 'UTF-8'

SELECT datname from pg_database;

DROP TABLE IF EXISTS desenho.personagem

SELECT * FROM empresa.funcionarios


/* CREATE TABLE SCHEMA.Nome_da_Tabela */
CREATE TABLE dbo.Desenhos(
    ID_Desenho TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Nome_Desenho VARCHAR(50) NOT NULL,
    Data_Lancamento DATE NOT NULL,
    Quantidade_Episodios SMALLINT NOT NULL,
)
GO


/* Exemplo prático: criando schemas e tabelas */
-- 1. Criar schema chamado cartoon
CREATE SCHEMA IF NOT EXISTS cartoon;

CREATE SCHEMA IF NOT EXISTS aluno
CREATE TABLE aluno.alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) not NULL,
    data_nascimento DATE,
    CPF VARCHAR(14) not null
);

-- 2. Criar tabela dentro do schema cartoon
CREATE TABLE cartoon.desenhos (
    id SERIAL PRIMARY KEY,          -- coluna de ID auto-incremento
    nome VARCHAR(50) NOT NULL,      -- nome do desenho (obrigatório)
    data_lancamento DATE            -- data de lançamento
);

-- 3. Criar tabela no schema padrão "public"
CREATE TABLE public.pessoas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- 4. Inserir dados em cada tabela
INSERT INTO cartoon.desenhos (nome, data_lancamento) VALUES ('Dragon Ball', '1986-02-26');
INSERT INTO public.pessoas (nome) VALUES ('Maria');

-- 5. Consultar dados, especificando o schema
SELECT * FROM cartoon.desenhos;
SELECT * FROM public.pessoas;
