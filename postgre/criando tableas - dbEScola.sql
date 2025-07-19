create DATABASE dbEscola
with OWNER  = fmartins
LC_COLLATE = 'C'
LC_CTYPE = 'C'
TEMPLATE = template0
ENCODING = 'UTF8';

ALTER USER fmartins WITH SUPERUSER;

create schema if not exists aluno

create schema if not exists professor

create schema if not exists servidor

create table aluno.alunos(
	id SERIAL primary key,
	nome VARCHAR(50) not NULL,
	sobrenome VARCHAR(100) not NULL,
	turma_id int not null,
	data_nascimento DATE not NULL,
	CPF VARCHAR(14) not null,
constraint fk_turma foreign key (turma_id) references aluno.turmas(id)
);

create table aluno.turmas(
	id SERIAL primary key,
	nome VARCHAR(50) not null,
	perido VARCHAR(15) not null
);


alter table aluno.turmas drop column perido

alter table aluno.turmas add column periodo varchar(15) not null


//colocando valores nas tabelas
insert into aluno.turmas (nome,periodo,id_professor)
values
	  ('5 série a','matutino',1),
	  ('1 séria a','vespertino',2),
	  ('1 série b','vespertino',2),
	  ('2 série a','matutino',1),
	  ('3 série a','matutuno',3);

select *
from aluno.turmas
order by id

update aluno.turmas
set id_professor = 4
where nome = '5 série a'
and id = 7




alter table aluno.alunos 
alter column id set not null

alter table professor.professores 
alter column id set not null

alter table aluno.turmas 
alter column id set not null

alter table servidor.servidores
alter column id set not null





alter table aluno.turmas add column id_professor int not null,
add constraint FK_Professor foreign key (id_professor) references professor.professores

create table professor.professores(
	id SERIAL primary key,
	nome VARCHAR(50) not null,
	sobrenome VARCHAR(100) not null,
	data_nascimento DATE,
	CPF VARCHAR(14)	
);

INSERT INTO professor.professores (nome, sobrenome, data_nascimento, CPF) VALUES
('Carlos', 'Silva', '1975-03-12', '123.456.789-00'),
('Ana', 'Souza', '1980-07-25', '987.654.321-11'),
('Marcos', 'Oliveira', '1990-01-30', '456.789.123-22'),
('Juliana', 'Pereira', '1985-11-15', '321.654.987-33'),
('Ricardo', 'Almeida', '1978-06-05', '789.123.456-44');


select * from professor.professores limit 5

update professor.professores
set data_nascimento = '1999-03-12'
where nome = 'Carlos'
and cpf = '123.456.789-00'




create table servidor.servidores(
	id SERIAL primary key,
	nome VARCHAR(50) not null,
	sobrenome VARCHAR(100) not null,
	data_nascimento DATE,
	id_funcao int not null,
	CPF VARCHAR(14) not null,
	data_adimissao date not null,
	contratacao_temporario boolean not null, 
	constraint FK_servirdor foreign key (id_funcao) references servidor.funcoes(id)
);

create table servidor.funcoes(
	id SERIAL primary key,
	nome VARCHAR(100)	
);

select datname from pg_database

select datname from pg_database
select datname from pg_database
select datname from pg_database


select
	table_schema as "Nome da schema",
	table_name as "NOme da tabela"
from 
	information_schema.tables 
where 
	table_tyPE = 'BASE TABLE'
	and TABLE_SCHEMA not in ('pg_catalog','information_schema')
order by table_schema,table_name 


select
	table_schema as "NOme da schema",
	table_name as "Nome da tabela"
from information_schema.tables 
where TABLE_TYPE = 'BASE TABLE'
and TABLE_SCHEMA not in ('pg_catalog','information_schema')
order by table_schema, table_name



select 
	TABLE_SCHEMA as "NOME DA SCHEMA",
	TABLE_name as "NOME DA TABELA"
from INFORMATION_SCHEMA.tables 
WHERE TABLE_TYPE = 'BASE TABLE'
and TABLE_SCHEMA  not IN ('pg_catalog','information_schema')
order by table_schema,table_name















