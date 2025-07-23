create table funcionario(
	id SERIAL primary key,
	nome VARCHAR(100) not null,
	data_nascimento DATE

);


alter table funcionario add column idade int check(idade >= 18 and idade <= 120);


alter table funcionario drop column idade

insert into funcionario(nome, data_nascimento)
values
	('João Mendes','1985-01-19'),
	('Maria da silva','1999-12-10')
	

	select * from funcionario limit 10	
	
	
ALTER TABLE funcionario
ADD COLUMN criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP;



create table funcionario(
	id SERIAL primary key, 
	nome VARCHAR(100) not null,
	data_nascimento DATE,
	cpf VARCHAR(14) unique not null,
	telefone varchar(9) not null,check,
	email varchar(100) not null,
	
constraint CH_CHECK_IDADE check(extract('YEAR' from AGE(data_nascimento) < 18);
);


select * from funcionario limit 10


select
	nome,
	data_nascimento,
	DATE_PART('YEAR',AGE(NOW(),data_nascimento))
from funcionario
order by idade;



select
	table_name as "nome da tabela"
from
	information_schema.tables
where
	table_type = 'BASE TABLE'
and
	TABLE_SCHEMA not in ('pg_catalog','information_schema')
order by table_name


drop table funcionario








