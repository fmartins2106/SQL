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


select * from aluno.turmas limit 3

select * from aluno.alunos limit 5

select 
	table_schema as "nome da schema",
	table_name as "NOme da tabela"
from information_schema.tables 
where 
	TABLE_TYPE = 'BASE TABLE'
and TABLE_SCHEMA not in ('pg_catalog','information_schema')
order by table_schema, table_name



select * from professor.professores limit 5

update professor.professores
set data_nascimento = '1999-03-12'
where nome = 'Carlos'
and cpf = '123.456.789-00'


select * from aluno.alunos limit 10

update aluno.alunos
set data_nascimento = '2008-08-08'
where cpf  = '539.143.444-44'
and nome = 'Maria'


update aluno.alunos 
set data_nascimento = '2007-01-23'
where nome = 'Maria'
and sobrenome  = 'Marta'

update aluno.alunos 
set data_nascimento  = '2004-03-02'
where nome = 'Maria'
and sobrenome = 'Maria'


update aluno.alunos
set nome = 'Maria'
where CPF = '055.094.005.-98'
and sobrenome = 'Maria'

update aluno.alunos 
set nome = 'MAria'
where cpf = '390.333.333-93'
and sobrenome = 'sobrenome'

create schema if not exists endereco

create table endereco.enderecos(
	id SERIAL primary key,
	Logradouro varchar(50) not null,
	endereco varchar(100) not null,
	numero varchar(30) not null,
	complemento varchar(50),
	bairro varchar(100) not null,
	cpf varchar(8) not null,
	id_cidade int,
	constraint FK_cidade foreign key (id_cidade) references endereco.cidades(id)
);

alter table professor.professores add column email varchar(100)

alter table servidor.servidores add column email varchar(100);


create table endereco.cidades(
	id SERIAL primary key,
	nome varchar(100) not null,
	uf varchar(2) not null
);








insert into aluno.alunos(nome,sobrenome,turma_id,data_nascimento,cpf)
values 
	('Jonas','Amaral',8,'2008-11-30','569.123.456-44'),
	('Joana','Pereira',9,'2023-07-22','569.123.436-34'),
	('Fernando','Dos Santos',10,'2011-09-12','569.232.456-44'),
	('João','Pereira',9,'2011-11-05','569.113.426-43'),
	('Mari','Martins',8,'2012-04-12','569.111.156-14'),
	('Maria','Da Silva',10,'2010-05-02','539.143.444-44');

select * from aluno.alunos limit 4

select
	a.id,
	a.nome || ' ' || a.sobrenome as "Nome completo",
	REPLACE(TO_CHAR(a.data_nascimento ,'dd/MM/yyyy'),'-','/') as "Data de nascimento",
	DATE_PART('YEAR',AGE(NOW(), a.data_nascimento)) as "Idade",
	a.cpf,
	t.id as "Id da turma",
	t.nome as "Nome da turma",
	t.periodo,
	t.id_professor,
	p.nome as "NOme do professor"
from aluno.alunos a
inner join aluno.turmas t
on t.id = a.turma_id 
inner join professor.professores p
on t.id_professor = p.id  
order by "Nome completo" desc



select * from aluno.turmas limit 3

select * from professor.professores p sores limit 3



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


select datname from pg_database 
select datname from pg_database
select datname from pg_database
select datname from pg_database
select datname from pg_database
select datname from pg_database
select datname from pg_database
select datname from pg_database

select
	table_schema as "NOme da schema",
	table_name as "NOme da tabela"
from	
	information_schema.tables
	where TABLE_TYPE = 'BASE TABLE'
	and TABLE_SCHEMA not in ('pg_catalog','information_schema')
order by table_schema,table_name


select datname from pg_database

create schema if not exists comida;
create schema if not exists alimento;

create table servirdor.funcao(
	id SERIAL primary key,
	NOME VARCHAR(100) not null,
	SOBRENOME VARCHAR(100) not null,
	data_funcao DATE,
	id_servidor int
constraint fk_servidor foreign key (id_servidor) references servidor.servidores(id)
);

alter table aluno.alunos add column aaa int

alter table aluno.alunos add column asss int

alter table aluno.alunos drop column asss


-Deletar todaslinhas da tabela(mas não deleta a tabela)-
truncate table Desenhos


-deletar uma linha inteira-
DELETE FROM Desenho WHERE id_desenhos = 3;


-deletar tabela-
DROP TABLE IF EXISTS pessoa.pessoa;
                                   















