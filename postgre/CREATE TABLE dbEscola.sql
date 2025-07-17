CREATE TABLE professor.disciplinas(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL 
);

CREATE SCHEMA IF NOT EXISTS administracao
CREATE SCHEMA IF NOT EXISTS vendas
CREATE SCHEMA IF NOT EXISTS pereciveis
CREATE SCHEMA IF NOT EXISTS eletrodomesticos
CREATE SCHEMA IF NOT EXISTS carnes
CREATE SCHEMA IF NOT EXISTS aluno

CREATE TABLE aluno.notas(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    CPF VARCHAR(14) NOT NULL
);

CREATE TABLE aluno.alunos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    data_nascimento DATE,
    CPF VARCHAR(100),
);

CREATE TABLE aluno.alunos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    data_nascimento DATE,
    CPF VARCHAR(14),
);


CREATE TABLE aluno.alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) not NULL,
    data_nascimento DATE,
    CPF VARCHAR(14) not null
);

CREATE SCHEMA IF NOT EXISTS professor
CREATE SCHEMA IF NOT EXISTS professor
CREATE SCHEMA IF NOT EXISTS professor

CREATE TABLE professor.professores(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    CPF VARCHAR(14) not null
);

CREATE TABLE professor.professores(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    CPF VARCHAR(14) NOT NULL,
)

CREATE TABLE professor.professores(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    id_disciplina int,
    CONSTRAINT FK_disciplina FOREIGN KEY (id_disciplina) REFERENCES professor.disciplinas(id)
);

CREATE TABLE professor.professores(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) not null,
    sobrenome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    id_disciplina INT,
    CONSTRAINT FK_disciplina_id FOREIGN KEY (id_disciplina) REFERENCES professor.disciplinas(id)
);

CREATE SCHEMA IF NOT EXISTS disciplina
CREATE SCHEMA IF NOT EXISTS disciplina
CREATE SCHEMA IF NOT EXISTS disciplina
CREATE SCHEMA IF NOT EXISTS disciplina
CREATE SCHEMA IF NOT EXISTS disciplina
CREATE SCHEMA IF NOT EXISTS disciplina
CREATE SCHEMA IF NOT EXISTS disciplina
CREATE SCHEMA IF NOT EXISTS disciplina
CREATE SCHEMA IF NOT EXISTS disciplina
CREATE SCHEMA IF NOT EXISTS disciplina





SELECT 
    table_schema AS "Schema",
    table_name AS "Nome da Tabela"
FROM 
    information_schema.tables
WHERE 
    table_type = 'BASE TABLE'
    AND table_schema NOT IN ('pg_catalog', 'information_schema') -- ignora schemas internos
ORDER BY 
    table_schema, table_name;


SELECT
    table_schema as "Schema",
    table_name as "Nome da tabela",
FROM
    information_schema.TABLES
WHERE
    TABLE_TYPE = 'BASE TABLE'
    AND table_schema NOT IN ('pg_catalog','information_schema')
ORDER BY
    table_schema, table_name;

SELECT
    table_schema as "Schema",
    table_name as "Nome da tabela",
FROM
    information_schema.TABLES
WHERE
    TABLE_TYPE = 'BASE TABLE'
    AND table_schema not in ('pg_catalog',information_schema)
ORDER BY
    table_schema,table_name;

SELECT
    table_schema as "Schema",
    table_name as "Nome da tabela",
FROM 
    information_schema.TABLES
WHERE 
    TABLE_TYPE = 'BASE TABLE'
    AND TABLE_SCHEMA NOT IN ('pg_catalog',information_schema)
ORDER BY 
    table_schema,table_name;

SELECT
    table_schema as "Schema",
    table_name as "Nome das tabelas"
FROM 
    information_schema.tables
WHERE
    TABLE_TYPE = 'BASE TABLE'
    AND TABLE_SCHEMA NOT IN ('pg_catalog',information_SCHEMA)
ORDER BY table_schama,table_name


CREATE DATABASE "dbDataBase"
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TEMPLATE = template0
    ENCODING = 'UTF-8'


 /* Criando uma tabela manual */
CREATE DATABASE "dbEmpresa"
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TEMPLATE = template0
    ENCODING = 'UTF-8'

/* Consultar todas as tabelas */
SELECT datname from pg_database;
select datname from pg_database
select datname from pg_database
select datname from pg_database
select datname from pg_database
select datname from pg_database
select datname from pg_database


/* Criando uma schema */
CREATE SCHEMA IF NOT EXISTS "professor";
CREATE SCHEMA IF NOT EXISTS "escola";
CREATE SCHEMA IF NOT EXISTS "escolas";
CREATE SCHEMA IF NOT EXISTS "comida";
CREATE SCHEMA IF NOT EXISTS "alimento"

/* Criando uma tabela */
CREATE TABLE professor(
    id SERIAL PRIMARY KEY,
    nome varchar(50) not null,
    sobrenome varchar(100) not null,
    data_nascimento DATE,
    CPF VARCHAR(14) not null
);


/* Criar BANCO DE DADOS manual */
CREATE DATABASE "dbEmpresa"
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TEMPLATE = template0
    ENCODING = 'UTF-8'

/*verificando tabelas cadastradas  */
SELECT datname from pg_database

CREATE TABLE professor(
    id SERIAL PRIMARY KEY,
    nome varchar(50) not null,
    sobrenome varchar(100) not null,
    data_nascimento DATE,
    CPF VARCHAR(14) not null
);


CREATE TABLE aluno.alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) not NULL,
    data_nascimento DATE,
    CPF VARCHAR(14) not null
);

CREATE TABLE aluno.notas(
    id_notas SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    ano_letivo INT,
    disciplina_id INT,
    numero_avaliacao INT,
    nota NUMERIC(5,2),
    CONSTRAINT FK_aluno FOREIGN KEY (aluno_id) REFERENCES aluno.alunos(id),
    CONSTRAINT FK_disciplina FOREIGN KEY (disciplina_id) REFERENCES professor.disciplinas(id)
);


CREATE TABLE aluno.notas(
    id_notas SERIAL PRIMARY KEY,
    id_aluno int not null,
    ano_letivo not null,
    disciplina_id int not null,
    numero_avaliacao int not null,
    notas NUMERIC(5,2),
    CONSTRAINT FK_aluno FOREIGN KEY (id_aluno) REFERENCES aluno.alunos(id),
    CONSTRAINT FK_disciplina FOREIGN KEY (disciplina_id) REFERENCES professor.disciplina(id)
);


CREATE TABLE professor.disciplinas(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL 
);
CREATE SCHEMA IF NOT EXISTS professor;

ALTER TABLE aluno.notas DROP COLUMN notas
ALTER TABLE nome_da_tabela ADD COLUMN notas
ALTER TABLE aluno.notas ADD COLUMN nota NUMERIC(5,2)

ALTER TABLE aluno.notas DROP COLUMN notas
ALTER TABLE aluno.notas DROP COLUMN notas
ALTER TABLE aluno.notas DROP COLUMN notas
ALTER TABLE aluno.notas DROP COLUMN notas
ALTER TABLE aluno.notas DROP COLUMN notas
ALTER TABLE aluno.notas DROP COLUMN notas

ALTER TABLE aluno.notas ADD COLUMN notas
ALTER TABLE aluno.notas ADD COLUMN notas
ALTER TABLE aluno.notas ADD COLUMN notas
ALTER TABLE aluno.notas ADD COLUMN notas


CREATE TABLE aluno.notas


CREATE TABLE aluno.notas (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    ano_letivo INT,
    disciplina VARCHAR(100),
    numero_avaliacao INT,
    nota NUMERIC(5,2),
    CONSTRAINT fk_aluno FOREIGN KEY (aluno_id) REFERENCES aluno.alunos(id)
);


CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER,
    data_pedido DATE NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE pedidos(
    id SERIAL PRIMARY KEY,
    id_produto INT,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    data_nascimento DATE,
    CPF VARCHAR(14),
CONSTRAINT FK_pedidos FOREIGN KEY (id_produto) REFERENCES empresa.vendas(id);
);

