-- lojas fisicas
--FUNCIONARIO -> DEPARTAMENTO -> DIRETORIA
--ENDERECO
--PESSOA
--CLIENTE


drop table if exists 

create table DB_PESSOA( 
	id_pessoa SERIAL primary key,
	nome varchar(100) not null,
	cpf varchar(11) unique not null check (cpf <> ''),
	sexo char(1) check(sexo <> ''),
	email varchar(50) not null,
	constraint check_email check(email <> ''),
	constraint check_cpf check(cpf ~ '^\d{11}$'),
	constraint check_sexo check(UPPER(SEXO) = 'M'or UPPER(SEXO) = 'F')
);

create table DB_ENDERECO(
	id_endereco SERIAL primary key,
	id_pessoa int not null,
	Id_logradouro smallint not null,
	endereco varchar(80) not null check(endereco <> ''),
	numero int not null,
	complemento varchar(40),
	cep varchar(8) not null check (cep <> ''),,
	constraint CHECK_cep check cep(cep <> ''),
	constraint FK_logradouro foreign key (id_logradouro) references DB_LOGRADOURO(id_logradouro),
	constraint FK_pessoa foreign key (id_pessoa) references DB_PESSOA(id_pessoa)
	);

create table DB_LOGRADOURO(
	id_logradouro SMALLINT PRIMARY KEY DEFAULT nextval('seq_id_logradouro'),
	descricao_logradouro varchar(40) unique not null check(descricao_logradouro <> '')
);

create table DB__TIPO_TELEFONE(
	id__tipo_telefone smallint primary key default nextval('seq_id_tipo_telefone'),
	tipo_telefone varchar(15) not null unique check(tipo_telefone <> '')
	
);

create table DB_TELEFONE( 
	ID_TELEFONE SERIAL primary key,
	id_pessoa int not null,
	id_tipo_telefone int not null,
	ddd varchar(3) not null,
	telefone varchar(9) not null,
	constraing check_ddd check(ddd <> ''),
	constraing check_telefone check(telefone <> ''),
	constraint FK_id_pessoa foreign key (id_pessoa) references DB_PESSOA(id_pessoa),
	constraint FK_tp_telefone foreign key (id_tipo_telefone) references DB_TIPO_TELEFONE(id_tipo_telefone)
);





