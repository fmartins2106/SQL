-- lojas fisicas
--FUNCIONARIO -> DEPARTAMENTO -> DIRETORIA
--ENDERECO
--PESSOA
--CLIENTE




create table DB_ENDERECO
(
    id_endereco   integer generated always as identity primary key,
    id_pessoa     int         not null,
    Id_logradouro smallint    not null,
    endereco      varchar(80) not null check (endereco <> ''),
    numero        int         not null,
    complemento   varchar(40),
    cep           varchar(9)  not null check (cep <> ''),
    constraint CHECK_cep check (cep <> ''),
    constraint FK_logradouro foreign key (id_logradouro) references DB_LOGRADOURO (id_logradouro),
    constraint FK_pessoa foreign key (id_pessoa) references DB_PESSOA (id_pessoa)
);

alter table DB_ENDERECO alter column cep type varchar(9);

create table DB_LOGRADOURO
(
    id_logradouro        INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descricao_logradouro varchar(40) unique not null check (descricao_logradouro <> '')
);

create table DB_TIPO_TELEFONE
(
    id_tipo_telefone INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo_telefone    varchar(15) not null unique check (tipo_telefone <> '')

);

create table DB_TELEFONE
(
    ID_TELEFONE      integer generated always as identity primary key,
    id_pessoa        int        not null,
    id_tipo_telefone int        not null,
    ddd              varchar(3) not null,
    telefone         varchar(9) not null,
    constraint check_ddd check (ddd <> ''),
    constraint check_telefone check (telefone <> ''),
    constraint FK_id_pessoa foreign key (id_pessoa) references DB_PESSOA (id_pessoa),
    constraint FK_tp_telefone foreign key (id_tipo_telefone) references DB_TIPO_TELEFONE (id_tipo_telefone)
);

CREATE TABLE DB_DIRETORIA
(
    id_diretoria  integer generated always as identity PRIMARY KEY,
    cod_diretoria VARCHAR(5) UNIQUE,
    diretoria     varchar(30) UNIQUE,
    CONSTRAINT checkDiretoria CHECK ( cod_diretoria <> ''),
    CONSTRAINT checkCodDiretoria check ( cod_diretoria <> '')
);

alter table DB_DIRETORIA alter column cod_diretoria type varchar(5);
alter table DB_DIRETORIA alter column diretoria type varchar(30);
alter table DB_DIRETORIA  add constraint unique_cod_diretoria UNIQUE(cod_diretoria);
alter table DB_DIRETORIA  add constraint unique_diretoria UNIQUE(diretoria);





CREATE TABLE DB_DEPARTAMENTO
(
    id_departamento  smallint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cod_departamento varchar(5)         not null CHECK ( cod_departamento <> ''),
    departamento     varchar(30) unique not null check ( departamento <> ''),
    cod_diretoria    varchar(5)         not null check ( cod_diretoria <> ''),
    constraint FK_cod_diretoriao FOREIGN KEY (cod_diretoria) references DB_DIRETORIA (cod_diretoria)
);
-- Remover a constraint antiga
ALTER TABLE DB_DEPARTAMENTO
DROP CONSTRAINT FK_cod_diretoria;

-- 2. Criar novamente com ON UPDATE CASCADE
ALTER TABLE DB_DEPARTAMENTO
ADD CONSTRAINT FK_cod_diretoria
FOREIGN KEY (cod_diretoria)
REFERENCES DB_DIRETORIA (cod_diretoria)
ON DELETE SET NULL
ON UPDATE CASCADE;



CREATE TABLE DB_CARGO
(
    id_cargo integer generated always as identity PRIMARY KEY,
    cargo    varchar(40) UNIQUE CHECK ( cargo <> '')
);

CREATE TABLE DB_TIPO_FUNCIONARIO
(
    id_nivel_funcionario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo_funcionario     varchar(20) UNIQUE not null CHECK ( tipo_funcionario <> '' )
);


CREATE TABLE DB_FUNCIONARIO
(
    matricula            integer generated always as identity (START WITH 1000) PRIMARY KEY,
    id_pessoa            int            not null,
    data_admissao        DATE           not null,
    data_demissao        DATE,
    salario              numeric(12, 2) not null check (salario > 1510),
    id_cargo             smallint       not null,
    id_departamento      smallint       not null,
    id_nivel_funcionario smallint       not null,
    constraint FK_id_pessoa FOREIGN KEY (id_pessoa) references DB_PESSOA (id_pessoa),
    constraint FK_idCargo FOREIGN KEY (id_cargo) references DB_CARGO(id_cargo),
    constraint FK_idFuncionario FOREIGN KEY (id_nivel_funcionario) references DB_TIPO_FUNCIONARIO (id_nivel_funcionario)
);

    alter table DB_FUNCIONARIO add
    constraint FK_id_departamento_funcionario FOREIGN KEY (id_departamento) references DB_DEPARTAMENTO(id_departamento);

CREATE TABLE DB_PRODUTO
(
    id_produto   INTEGER GENERATED ALWAYS AS IDENTITY (start with 1000) PRIMARY KEY,
    nome_produto varchar(100)          not null unique check ( nome_produto <> ''),
    preco        NUMERIC(12, 2) UNIQUE NOT NULL CHECK ( preco >= 50 )
);

SELECT conname
FROM pg_constraint
WHERE conrelid = 'db_produto'::regclass
  AND contype = 'u';

ALTER TABLE db_produto DROP CONSTRAINT db_produto_preco_key;


CREATE TABLE DB_CLIENTE
(
    id_cliente   INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 100) PRIMARY KEY,
    id_pessoa    integer not null,
    data_criacao DATE default CURRENT_DATE,
    constraint FK_id_pessoa_cliente FOREIGN KEY (id_pessoa) references DB_PESSOA (id_pessoa)
);

CREATE TABLE DB_VENDA
(
    id_venda   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    documento  varchar(15) UNIQUE NOT NULL CHECK ( documento <> '' ),
    id_cliente int                NOT NULL,
    data_venda TIMESTAMP default now(),
    total      numeric(12, 2)     not null,
    constraint FK_id_cliente_venda FOREIGN KEY (id_cliente) references DB_CLIENTE (id_cliente)
);

SELECT  * FROM DB_VENDA;

CREATE TABLE DB_PRODUTO_VENDA
(
    id_produto_venda INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_venda         INTEGER        NOT NULL,
    id_produto       integer        not null,
    preco_unitario   numeric(12, 2) not null,
    quantidade       integer        not null,
    constraint fk_id_Venda_produto FOREIGN KEY (id_venda) REFERENCES DB_VENDA (id_venda),
    constraint fk_id_produto_venda FOREIGN KEY (id_produto) references DB_PRODUTO (id_produto)
);
select * from db_produto;

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (21, 1001, 3989.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (21, 1002, 1999.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (22, 1003, 849.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (22, 1004, 279.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (3, 1005, 479.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (13, 1006, 299.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (14, 1007, 1249.99, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (14, 1008, 849.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (15, 1009, 439.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (15, 1010, 599.00, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (16, 1011, 2299.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (16, 1012, 259.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (17, 1013, 1299.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (17, 1014, 499.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (18, 1015, 2399.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (18, 1016, 429.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (19, 1017, 349.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (19, 1018, 589.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (20, 1019, 999.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (20, 1020, 1999.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (21, 1011, 79.90, 3);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (21, 1012, 899.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (22, 1011, 149.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (22, 1014, 679.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (23, 1011, 3899.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (23, 1014, 4399.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (24, 1014, 449.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (24, 1015, 349.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (25, 1015, 2799.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (25, 1011, 229.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (26, 1015, 189.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (26, 1016, 159.99, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (27, 1016, 249.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (27, 1016, 329.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (28, 1017, 134.50, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (28, 1017, 175.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (29, 1017, 299.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (29, 1019, 179.99, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (30, 1010, 89.00, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (30, 1010, 349.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (31, 1010, 399.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (31, 1010, 149.99, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (32, 1019, 499.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (32, 1010, 84.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (33, 1018, 199.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (33, 1011, 289.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (34, 1011, 239.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (34, 1011, 169.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (35, 1011, 179.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (35, 1014, 899.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (36, 1014, 74.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (36, 1014, 159.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (37, 1014, 199.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (37, 1014, 98.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (38, 1014, 132.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (38, 1013, 64.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (39, 1013, 449.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (39, 1013, 109.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (40, 1013, 219.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (40, 1013, 189.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (41, 1011, 329.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (41, 1011, 259.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (42, 1011, 549.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (42, 1011, 189.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (43, 1011, 379.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (43, 1011, 499.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (44, 1012, 62.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (44, 1012, 119.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (45, 1009, 88.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (45, 1009, 74.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (46, 1009, 168.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (46, 1009, 3989.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (47, 1009, 1999.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (47, 1009, 849.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (48, 1009, 279.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (48, 1009, 479.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (49, 1009, 299.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (49, 1009, 1249.99, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (50, 1009, 849.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (50, 1009, 439.90, 1);

-- Map de preços para os produtos 1001 a 1020
]

select * from db_produto_venda;

DO $$
DECLARE
    v RECORD;
    p RECORD;
    num_itens INT;
    valor_restante NUMERIC(12,2);
BEGIN
    FOR v IN SELECT * FROM DB_VENDA LOOP
        num_itens := FLOOR(2 + RANDOM() * 3); -- entre 2 e 4 produtos
        valor_restante := v.total;

        FOR i IN 1..num_itens LOOP
            SELECT id_produto, preco
            INTO p
            FROM DB_PRODUTO
            ORDER BY RANDOM()
            LIMIT 1;

            INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
            VALUES (
                v.id_venda,
                p.id_produto,
                p.preco,
                1
            );

            valor_restante := valor_restante - p.preco;
            EXIT WHEN valor_restante <= 0;
        END LOOP;
    END LOOP;
END $$;

-- 1001 = 3989.00
-- 1002 = 1999.90
-- 1003 = 849.90
-- 1004 = 279.90
-- 1005 = 479.90
-- 1006 = 299.00
-- 1007 = 1249.99
-- 1008 = 849.00
-- 1009 = 439.90
-- 1010 = 599.00
-- 1011 = 2299.00
-- 1012 = 259.00
-- 1013 = 1299.90
-- 1014 = 499.00
-- 1015 = 2399.90
-- 1016 = 429.00
-- 1017 = 349.90
-- 1018 = 589.90
-- 1019 = 999.00
-- 1020 = 1999.00

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (11, 1001, 3989.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (11, 1002, 1999.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (12, 1003, 849.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (12, 1004, 279.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (13, 1005, 479.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (13, 1006, 299.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (14, 1007, 1249.99, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (14, 1008, 849.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (15, 1009, 439.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (15, 1010, 599.00, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (16, 1011, 2299.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (16, 1012, 259.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (17, 1013, 1299.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (17, 1014, 499.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (18, 1015, 2399.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (18, 1016, 429.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (19, 1017, 349.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (19, 1018, 589.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (20, 1019, 999.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (20, 1020, 1999.00, 1);

-- Agora ciclo para preencher 100 registros (repetindo produtos e vendas com pequenas variações)
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (21, 1001, 3989.00, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (21, 1002, 1999.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (22, 1003, 849.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (22, 1004, 279.90, 3);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (23, 1005, 479.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (23, 1006, 299.00, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (24, 1007, 1249.99, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (24, 1008, 849.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (25, 1009, 439.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (25, 1010, 599.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (26, 1011, 2299.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (26, 1012, 259.00, 3);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (27, 1013, 1299.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (27, 1014, 499.00, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (28, 1015, 2399.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (28, 1016, 429.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (29, 1017, 349.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (29, 1018, 589.90, 3);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (30, 1019, 999.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (30, 1020, 1999.00, 2);

-- Repete mais 60 registros similarmente para completar 100 no total
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (31, 1001, 3989.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (31, 1002, 1999.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (32, 1003, 849.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (32, 1004, 279.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (33, 1005, 479.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (33, 1006, 299.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (34, 1007, 1249.99, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (34, 1008, 849.00, 3);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (35, 1009, 439.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (35, 1010, 599.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (36, 1011, 2299.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (36, 1012, 259.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (37, 1013, 1299.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (37, 1014, 499.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (38, 1015, 2399.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (38, 1016, 429.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (39, 1017, 349.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (39, 1018, 589.90, 1);


INSERT INTO DB_PESSOA (nome, cpf, sexo, email) VALUES
('Fernando Martins', '12345678121', 'M', 'fernando@gmail.com'),
('Ana Souza', '22345678122', 'F', 'ana.souza@email.com'),
('Carlos Oliveira', '32345678123', 'M', 'carlos.oliveira@email.com'),
('Mariana Lima', '42345678124', 'F', 'mariana.lima@email.com'),
('João Silva', '52345678125', 'M', 'joao.silva@email.com'),
('Patrícia Machado', '62345678126', 'F', 'patricia.Machado@email.com'),
('Ricardo Alves', '72345678127', 'M', 'ricardo.alves@email.com'),
('Juliana Fernandes', '82345678128', 'F', 'juliana.fernandes@email.com'),
('Roberto Silva', '92345678129', 'M', 'roberto.Silva@email.com'),
('Carla Martins', '10345678130', 'F', 'carla.Martins@email.com'),
('Paulo Mendes', '11345678131', 'M', 'paulo.mendes@email.com'),
('Aline Silva', '12345678132', 'F', 'aline.Silva@email.com'),
('Marcelo Ribeiro', '13345678133', 'M', 'marcelo.ribeiro@email.com'),
('Bruna Castro', '14345678134', 'F', 'bruna.castro@email.com'),
('André Barros', '15345678135', 'M', 'andre.barros@email.com'),
('Sofia Amaral', '16345678136', 'F', 'sofia.Amaral@email.com'),
('Felipe Nascimento', '17345678137', 'M', 'felipe.nascimento@email.com'),
('Larissa Rocha', '18345678138', 'F', 'larissa.rocha@email.com'),
('Diego Carvalho', '19345678139', 'M', 'diego.carvalho@email.com'),
('Gabriela Freitas', '20345678140', 'F', 'gabriela.freitas@email.com'),
('Lucas Martins', '21345678141', 'M', 'lucas.martins@email.com'),
('Amanda Dias', '22345678142', 'F', 'amanda.dias@email.com'),
('Rafael Machado', '23345678143', 'M', 'rafael.Machado@email.com'),
('Bianca Silva', '24345678144', 'F', 'bianca.silva@email.com'),
('Eduardo Souza', '25345678145', 'M', 'eduardo.souza@email.com'),
('Camila Lima', '26345678146', 'F', 'camila.lima@email.com'),
('Vinícius Silva', '27345678147', 'M', 'vinicius.Silva@email.com'),
('Isabela Rocha', '28345678148', 'F', 'isabela.rocha@email.com'),
('Matheus Oliveira', '29345678149', 'M', 'matheus.oliveira@email.com'),
('Fernanda Carvalho', '30345678150', 'F', 'fernanda.carvalho@email.com'),
('Gustavo Barros', '31345678151', 'M', 'gustavo.barros@email.com'),
('Letícia Ribeiro', '32345678152', 'F', 'leticia.ribeiro@email.com'),
('Thiago Martins', '33345678153', 'M', 'thiago.martins@email.com'),
('Marina Dias', '34345678154', 'F', 'marina.dias@email.com'),
('Bruno Freitas', '35345678155', 'M', 'bruno.freitas@email.com'),
('Tatiana Amaral', '36345678156', 'F', 'tatiana.Amaral@email.com'),
('Fábio Mendes', '37345678157', 'M', 'fabio.mendes@email.com'),
('Natália Castro', '38345678158', 'F', 'natalia.castro@email.com'),
('Anderson Nascimento', '39345678159', 'M', 'anderson.nascimento@email.com'),
('Júlia Ribeiro', '40345678160', 'F', 'julia.ribeiro@email.com'),
('Leandro Souza', '41345678161', 'M', 'leandro.souza@email.com'),
('Priscila Lima', '42345678162', 'F', 'priscila.lima@email.com'),
('Alexandre Dias', '43345678163', 'M', 'alexandre.dias@email.com'),
('Carolina Martins', '44345678164', 'F', 'carolina.martins@email.com'),
('Diego Martins', '45345678165', 'M', 'diego.Martins@email.com'),
('Renata Oliveira', '46345678166', 'F', 'renata.oliveira@email.com'),
('Marcelo Amaral', '47345678167', 'M', 'marcelo.Amaral@email.com'),
('Sabrina Silva', '48345678168', 'F', 'sabrina.Silva@email.com'),
('Ricardo Alves', '49345678169', 'M', 'ricardo.alves@email.com');

INSERT INTO DB_PESSOA (nome, cpf, sexo, email) VALUES
('Fernando Martins', '00100100101', 'M', 'fernando@gmail.com'),
('Ana Souza', '00100100102', 'F', 'ana.souza@email.com'),
('Carlos Oliveira', '00100100103', 'M', 'carlos.oliveira@email.com'),
('Mariana Lima', '00100100104', 'F', 'mariana.lima@email.com'),
('João Silva', '00100100105', 'M', 'joao.silva@email.com'),
('Patrícia Machado', '00100100106', 'F', 'patricia.Machado@email.com'),
('Ricardo Alves', '00100100107', 'M', 'ricardo.alves@email.com'),
('Juliana Fernandes', '00100100108', 'F', 'juliana.fernandes@email.com'),
('Roberto Silva', '00100100109', 'M', 'roberto.Silva@email.com'),
('Carla Martins', '00100100110', 'F', 'carla.Martins@email.com'),
('Paulo Mendes', '00100100111', 'M', 'paulo.mendes@email.com'),
('Aline Silva', '00100100112', 'F', 'aline.Silva@email.com'),
('Marcelo Ribeiro', '00100100113', 'M', 'marcelo.ribeiro@email.com'),
('Bruna Castro', '00100100114', 'F', 'bruna.castro@email.com'),
('André Barros', '00100100115', 'M', 'andre.barros@email.com'),
('Sofia Amaral', '00100100116', 'F', 'sofia.Amaral@email.com'),
('Felipe Nascimento', '00100100117', 'M', 'felipe.nascimento@email.com'),
('Larissa Rocha', '00100100118', 'F', 'larissa.rocha@email.com'),
('Diego Carvalho', '00100100119', 'M', 'diego.carvalho@email.com'),
('Gabriela Freitas', '00100100120', 'F', 'gabriela.freitas@email.com'),
('Lucas Martins', '00100100121', 'M', 'lucas.martins@email.com'),
('Amanda Dias', '00100100122', 'F', 'amanda.dias@email.com'),
('Rafael Machado', '00100100123', 'M', 'rafael.Machado@email.com'),
('Bianca Silva', '00100100124', 'F', 'bianca.silva@email.com'),
('Eduardo Souza', '00100100125', 'M', 'eduardo.souza@email.com'),
('Camila Lima', '00100100126', 'F', 'camila.lima@email.com'),
('Vinícius Silva', '00100100127', 'M', 'vinicius.Silva@email.com'),
('Isabela Rocha', '00100100128', 'F', 'isabela.rocha@email.com'),
('Matheus Oliveira', '00100100129', 'M', 'matheus.oliveira@email.com'),
('Fernanda Carvalho', '00100100130', 'F', 'fernanda.carvalho@email.com'),
('Gustavo Barros', '00100100131', 'M', 'gustavo.barros@email.com'),
('Letícia Ribeiro', '00100100132', 'F', 'leticia.ribeiro@email.com'),
('Thiago Martins', '00100100133', 'M', 'thiago.martins@email.com'),
('Marina Dias', '00100100134', 'F', 'marina.dias@email.com'),
('Bruno Freitas', '00100100135', 'M', 'bruno.freitas@email.com'),
('Tatiana Amaral', '00100100136', 'F', 'tatiana.Amaral@email.com'),
('Fábio Mendes', '00100100137', 'M', 'fabio.mendes@email.com'),
('Natália Castro', '00100100138', 'F', 'natalia.castro@email.com'),
('Anderson Nascimento', '00100100139', 'M', 'anderson.nascimento@email.com'),
('Júlia Ribeiro', '00100100140', 'F', 'julia.ribeiro@email.com'),
('Leandro Souza', '00100100141', 'M', 'leandro.souza@email.com'),
('Priscila Lima', '00100100142', 'F', 'priscila.lima@email.com'),
('Alexandre Dias', '00100100143', 'M', 'alexandre.dias@email.com'),
('Carolina Martins', '00100100144', 'F', 'carolina.martins@email.com'),
('Diego Martins', '00100100145', 'M', 'diego.Martins@email.com'),
('Renata Oliveira', '00100100146', 'F', 'renata.oliveira@email.com'),
('Marcelo Amaral', '00100100147', 'M', 'marcelo.Amaral@email.com'),
('Sabrina Silva', '00100100148', 'F', 'sabrina.Silva@email.com'),
('Ricardo Alves', '00100100149', 'M', 'ricardo.alves@email.com');

INSERT INTO DB_LOGRADOURO(descricao_logradouro)
VALUES
  ('Avenida'),
  ('Rua'),
  ('Estrada'),
  ('Quadra'),
  ('Vila'),
  ('Travessa'),
  ('Alameda'),
  ('Largo'),
  ('Praça'),
  ('Beco'),
  ('Rodovia'),
  ('Rua de Pedestre'),
  ('Via'),
  ('Chácara'),
  ('Condomínio');

INSERT INTO DB_ENDERECO (id_pessoa, id_logradouro, endereco, numero, complemento, cep) VALUES
(1, 1, 'Paulista', 1000, 'Apto 101', '01310-000'),
(2, 2, 'Domingos', 205, NULL, '04512-300'),
(3, 3, 'Bela Vista', 30, 'Casa', '04001-050'),
(4, 4, 'Alvorada', 78, NULL, '05045-900'),
(5, 5, 'Jardim das Flores', 150, 'Bloco B', '02222-333'),
(6, 6, 'Vinte e Cinco de Março', 420, NULL, '01525-000'),
(7, 7, 'Boa Vista', 210, 'Fundos', '02012-450'),
(8, 8, 'Liberdade', 89, NULL, '01503-040'),
(9, 9, 'Praça da Sé', 1, 'Sala 5', '01001-000'),
(10, 10, 'Alameda Santos', 400, NULL, '01419-001'),
(11, 11, 'Estrada Velha', 2100, NULL, '06512-789'),
(12, 12, 'Rua das Flores', 77, 'Apto 202', '04101-010'),
(13, 13, 'Via das Nações', 1500, NULL, '01311-222'),
(14, 14, 'Chácara Santo Antônio', 95, NULL, '04705-100'),
(15, 15, 'Condomínio Verde', 10, 'Casa 12', '04707-456'),
(16, 1, 'Paulista', 1234, 'Cobertura', '01311-999'),
(17, 2, 'Domingos', 999, NULL, '04512-301'),
(18, 3, 'Bela Vista', 58, NULL, '04002-000'),
(19, 4, 'Alvorada', 150, 'Bloco A', '05045-901'),
(20, 5, 'Jardim das Flores', 85, NULL, '02222-334'),
(21, 6, 'Vinte e Cinco de Março', 430, NULL, '01526-000'),
(22, 7, 'Boa Vista', 222, NULL, '02012-451'),
(23, 8, 'Liberdade', 95, 'Sala 2', '01503-041'),
(24, 9, 'Praça da Sé', 2, NULL, '01002-000'),
(25, 10, 'Alameda Santos', 401, NULL, '01419-002'),
(26, 11, 'Estrada Velha', 2150, 'Casa', '06512-790'),
(27, 12, 'Rua das Flores', 78, NULL, '04101-011'),
(28, 13, 'Via das Nações', 1550, 'Apto 303', '01311-223'),
(29, 14, 'Chácara Santo Antônio', 120, NULL, '04705-101'),
(30, 15, 'Condomínio Verde', 15, NULL, '04707-457'),
(31, 1, 'Paulista', 2345, NULL, '01312-000'),
(32, 2, 'Domingos', 111, 'Casa', '04512-302'),
(33, 3, 'Bela Vista', 60, NULL, '04003-000'),
(34, 4, 'Alvorada', 200, 'Sala 1', '05045-902'),
(35, 5, 'Jardim das Flores', 170, NULL, '02222-335'),
(36, 6, 'Vinte e Cinco de Março', 440, NULL, '01527-000'),
(37, 7, 'Boa Vista', 230, 'Apto 1', '02012-452'),
(38, 8, 'Liberdade', 96, NULL, '01503-042'),
(39, 9, 'Praça da Sé', 3, NULL, '01003-000'),
(40, 10, 'Alameda Santos', 405, 'Bloco C', '01419-003'),
(41, 11, 'Estrada Velha', 2200, NULL, '06512-791'),
(42, 12, 'Rua das Flores', 80, 'Casa', '04101-012'),
(43, 13, 'Via das Nações', 1600, NULL, '01311-224'),
(44, 14, 'Chácara Santo Antônio', 130, 'Apto 2', '04705-102'),
(45, 15, 'Condomínio Verde', 20, NULL, '04707-458'),
(46, 1, 'Paulista', 2400, 'Sala 4', '01312-001'),
(47, 2, 'Domingos', 115, NULL, '04512-303'),
(48, 3, 'Bela Vista', 65, NULL, '04004-000'),
(49, 4, 'Alvorada', 210, 'Casa', '05045-903');

select * from db_pessoa limit 555;


INSERT INTO DB_TIPO_TELEFONE (tipo_telefone) VALUES
('Celular'),
('Residencial'),
('Comercial'),
('Recado'),
('Fax');


INSERT INTO DB_TELEFONE (id_pessoa, id_tipo_telefone, ddd, telefone) VALUES
(1, 1, '11', '912345678'),
(1, 2, '11', '34567890'),
(2, 1, '21', '987654321'),
(3, 3, '31', '33334444'),
(4, 1, '41', '912398765'),
(5, 2, '51', '33445566'),
(6, 1, '61', '999887766'),
(7, 3, '71', '98761234'),
(8, 1, '81', '912347890'),
(9, 4, '85', '33447788'),
(10, 5, '91', '33441122');


INSERT INTO DB_DIRETORIA (cod_diretoria, diretoria) VALUES
('DIR01', 'Diretoria Financeira'),
('DIR02', 'Diretoria Comercial'),
('DIR03', 'Diretoria de Recursos Humanos'),
('DIR04', 'Diretoria de Tecnologia'),
('DIR05', 'Diretoria de Operações');

INSERT INTO DB_DIRETORIA (cod_diretoria, diretoria) VALUES
('DIR06', 'Diretoria Jurídica'),
('DIR07', 'Diretoria de Marketing'),
('DIR08', 'Diretoria de Qualidade'),
('DIR09', 'Diretoria de Pesquisa'),
('DIR10', 'Diretoria de Atendimento'),
('DIR11', 'Diretoria de Segurança'),
('DIR12', 'Diretoria de Sustentabilidade'),
('DIR13', 'Diretoria de Comunicação'),
('DIR14', 'Diretoria de Planejamento'),
('DIR15', 'Diretoria de Compras');



INSERT INTO DB_DEPARTAMENTO (cod_departamento, departamento, cod_diretoria) VALUES
('DEP01', 'Contabilidade', 'DIR01'),
('DEP02', 'Vendas', 'DIR02'),
('DEP03', 'Recrutamento', 'DIR03'),
('DEP04', 'Desenvolvimento', 'DIR04'),
('DEP05', 'Logística', 'DIR05');

INSERT INTO DB_DEPARTAMENTO (cod_departamento, departamento, cod_diretoria) VALUES
('DEP06', 'Assessoria Jurídica', 'DIR06'),
('DEP07', 'Marketing Digital', 'DIR07'),
('DEP08', 'Controle de Qualidade', 'DIR08'),
('DEP09', 'Pesquisa Científica', 'DIR09'),
('DEP10', 'Suporte ao Cliente', 'DIR10'),
('DEP11', 'Segurança do Trabalho', 'DIR11'),
('DEP12', 'Meio Ambiente', 'DIR12'),
('DEP13', 'Relações Públicas', 'DIR13'),
('DEP14', 'Planejamento Estratégico', 'DIR14'),
('DEP15', 'Compras Corporativas', 'DIR15');


INSERT INTO DB_CARGO (cargo) VALUES
('Analista Financeiro'),
('Gerente de Vendas'),
('Assistente de RH'),
('Desenvolvedor Java'),
('Coordenador de Logística');

INSERT INTO DB_CARGO (cargo) VALUES
('Advogado'),
('Analista de Marketing'),
('Inspetor de Qualidade'),
('Pesquisador'),
('Atendente'),
('Supervisor de Segurança'),
('Analista Ambiental'),
('Assessor de Comunicação'),
('Analista de Planejamento'),
('Comprador');


INSERT INTO DB_TIPO_FUNCIONARIO (tipo_funcionario) VALUES
('Estagiário'),
('Júnior'),
('Pleno'),
('Sênior'),
('Coordenador'),
('Gerente'),
('Diretor');

INSERT INTO DB_FUNCIONARIO
(id_pessoa, data_admissao, data_demissao, salario, id_cargo, id_departamento, id_nivel_funcionario)
VALUES
(1, '2020-01-15', NULL, 2500.00, 1, 1, 3),
(2, '2021-03-20', NULL, 1800.00, 2, 2, 2),
(3, '2019-07-10', NULL, 1600.00, 3, 3, 2),
(4, '2022-05-05', NULL, 3500.00, 4, 4, 4),
(5, '2018-09-30', NULL, 2200.00, 5, 5, 3),
(6, '2021-11-12', NULL, 1550.00, 1, 1, 1),
(7, '2020-04-01', NULL, 2800.00, 2, 2, 4),
(8, '2023-02-14', NULL, 3100.00, 3, 3, 5),
(9, '2017-12-23', NULL, 4000.00, 4, 4, 6),
(10, '2022-08-18', NULL, 1700.00, 5, 5, 2),
(11, '2019-10-09', NULL, 1900.00, 1, 1, 3),
(12, '2020-06-16', NULL, 1600.00, 2, 2, 2),
(13, '2018-03-21', NULL, 2200.00, 3, 3, 4),
(14, '2021-01-29', NULL, 3500.00, 4, 4, 5),
(15, '2023-04-11', NULL, 2800.00, 5, 5, 3),
(16, '2020-09-05', NULL, 1700.00, 1, 1, 2),
(17, '2019-02-19', NULL, 2500.00, 2, 2, 4),
(18, '2022-11-25', NULL, 3000.00, 3, 3, 5),
(19, '2017-05-14', NULL, 4500.00, 4, 4, 7),
(20, '2021-12-31', NULL, 2100.00, 5, 5, 3);



INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Notebook Dell Inspiron 15', 3989.00);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Smartphone Samsung Galaxy A54', 1999.90);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Monitor LG 24" Full HD', 849.90);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Teclado Mecânico Redragon Kumara', 279.90);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Mouse Logitech MX Master 3', 479.90);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Headset HyperX Cloud Stinger', 299.00);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Cadeira Gamer ThunderX3', 1249.99);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Impressora HP Ink Tank 416', 849.00);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('HD Externo Seagate 2TB', 439.90);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('SSD Kingston 1TB NVMe', 599.00);




INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Câmera Canon EOS Rebel T100', 2299.00);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Roteador TP-Link Archer C6 AC1200', 259.00);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Tablet Samsung Galaxy Tab A8', 1299.90);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Kindle 11ª Geração com luz embutida', 499.00);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Placa de Vídeo NVIDIA GeForce RTX 3060', 2399.90);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Fonte Corsair 650W 80 Plus Bronze', 429.00);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Memória RAM Corsair Vengeance 16GB', 349.90);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Gabinete Gamer Cooler Master com RGB', 589.90);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Placa-Mãe ASUS B550M', 999.00);

INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Bicicleta Caloi Vulcan Aro 29', 1999.00);

INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Tornozeleira Esportiva Nike', 79.90);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Tênis Adidas Ultraboost Masculino', 899.00);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Mochila HP para notebook 15.6"', 149.90);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Relógio Smartwatch Xiaomi Amazfit', 679.00);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Drone DJI Mini 2 Fly More Combo', 3899.00);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Console PlayStation 5 1TB', 4399.90);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Controle DualSense PS5', 449.00);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Jogo Elden Ring - PS5', 349.90);
INSERT INTO DB_PRODUTO (nome_produto, preco) VALUES ('Xbox Series S 512GB', 2799.00);

INSERT INTO DB_PRODUTO(nome_produto, preco)
VALUES
('Kit Churrasco Inox 5 Peças', 229.90),
('Liquidificador Turbo 800W', 189.90),
('Relógio Masculino Digital Resistente à Água', 159.99),
('Tênis Corrida Leve e Flexível', 249.90),
('Smartwatch com Monitor Cardíaco', 329.90),
('Cafeteira Elétrica 15 Cafés', 134.50),
('Trena Digital a Laser 40m', 175.00),
('Jogo de Panelas Antiaderente 7 Peças', 299.90),
('Ventilador de Mesa 40cm', 179.99),
('Kit Jardinagem 4 Ferramentas com Luvas', 89.00),
('Fritadeira Air Fryer 4L', 349.90),
('Cadeira de Escritório Ergonômica', 399.90),
('Fone Bluetooth Intra-Auricular', 149.99),
('Bicicleta Infantil Aro 16', 499.90),
('Caixa de Som Bluetooth 20W', 189.90),
('Torradeira Inox com 6 Níveis', 112.00),
('Luminária de Mesa Articulada LED', 89.90),
('Teclado Mecânico Gamer RGB', 269.90),
('Mochila Executiva para Notebook 15.6"', 149.90),
('Chaleira Elétrica 1.8L Inox', 129.90),
('Aquecedor Elétrico Portátil 1500W', 289.90),
('Impressora Multifuncional Wi-Fi', 499.00),
('Caixa Organizadora com Tampa 50L', 84.90),
('Mesa Dobrável com Regulagem de Altura', 199.00),
('Furadeira/Parafusadeira Bateria 12V', 289.90),
('Roteador Dual Band AC1200', 239.00),
('Kit Ferramentas 50 Peças com Maleta', 169.90),
('Churrasqueira Portátil a Carvão', 179.00),
('Guarda-Roupa 2 Portas Correr com Espelho', 899.00),
('Abajur de Quarto com Cúpula de Tecido', 74.90),
('Purificador de Água com Torneira', 159.90),
('Patins In-Line Ajustável com Rodas de Gel', 199.90),
('Toalha de Banho 100% Algodão 2 unid.', 98.00),
('Capacete Ciclismo com Luz LED Traseira', 132.00),
('Relógio de Parede Retrô Vintage', 64.00),
('Carrinho de Bebê Dobrável com Cinto 5 Pontas', 449.90),
('Jogo de Lençol Casal Microfibra 4 Peças', 109.90),
('Aspirador de Pó Vertical 1000W', 219.90),
('Tapete Antiderrapante para Sala 2x1,5m', 189.00),
('Batedeira Planetária 8 Velocidades', 329.90),
('Aparelho de Jantar 20 Peças Porcelana', 259.90),
('Colchão Casal D33 Espuma Selada', 549.00),
('Tênis Casual Feminino Conforto', 189.90),
('Mini Projetor Portátil HDMI', 379.90),
('Fechadura Digital com Senha e Cartão', 499.90),
('Jogo de Copos de Vidro 6 Peças', 62.00),
('Máquina de Cortar Cabelo Recarregável', 119.90),
('Organizador de Temperos Giratório 12 Potes', 88.90),
('Repetidor de Sinal Wi-Fi', 74.90),
('Aquecedor Elétrico Compacto para Banheiro', 168.00);


-- Inserts na tabela DB_CLIENTE com os 30 últimos id_pessoa
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (20);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (21);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (22);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (23);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (24);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (25);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (26);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (27);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (28);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (29);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (30);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (31);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (32);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (33);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (34);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (35);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (36);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (37);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (38);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (39);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (40);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (41);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (42);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (43);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (44);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (45);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (46);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (47);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (48);
INSERT INTO DB_CLIENTE (id_pessoa) VALUES (49);



-- Vendas
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1001', 104, 4599.80);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1002', 101, 269.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1003', 102, 999.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1004', 103, 3899.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1005', 104, 1149.80);


-- Produtos da venda 1 (id_venda = 1)
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (3, 1002, 3989.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (3, 1002, 479.90, 1);

-- Produtos da venda 2 (id_venda = 2)
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (4, 1002, 269.90, 1);

-- Produtos da venda 3 (id_venda = 3)
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (3, 1003, 999.00, 1);

-- Vendas
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1001', 100, 5988.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1002', 101, 1129.80);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1003', 102, 2799.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1004', 103, 499.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1005', 104, 4399.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1006', 105, 229.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1007', 106, 1999.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1008', 107, 979.70);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1009', 108, 598.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1010', 109, 1149.80);

--------------------

    INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2000', 110, 2150.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2001', 111, 3475.45);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2002', 112, 4200.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2003', 113, 2599.99);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2004', 114, 3100.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2005', 115, 2233.10);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2006', 116, 2900.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2007', 117, 3725.75);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2008', 118, 4980.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2009', 119, 2199.50);

INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2010', 120, 2390.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2011', 121, 4100.10);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2012', 122, 3899.99);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2013', 123, 2300.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2014', 124, 2790.45);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2015', 125, 5020.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2016', 126, 3150.75);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2017', 127, 2855.10);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2018', 128, 4399.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2019', 129, 2780.00);

____________________________

INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2000', 100, 2150.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2001', 101, 3475.45);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2002', 102, 4200.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2003', 103, 2599.99);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2004', 104, 3100.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2005', 105, 2233.10);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2006', 106, 2900.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2007', 107, 3725.75);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2008', 108, 4980.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2009', 109, 2199.50);

INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2010', 110, 2390.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2011', 111, 4100.10);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2012', 112, 3899.99);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2013', 113, 2300.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2014', 114, 2790.45);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2015', 115, 5020.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2016', 116, 3150.75);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2017', 117, 2855.10);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2018', 118, 4399.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA2019', 119, 2780.00);

INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3020', 120, 3180.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3021', 121, 2955.50);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3022', 122, 3433.20);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3023', 123, 2600.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3024', 124, 3000.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3025', 125, 4099.99);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3026', 126, 5000.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3027', 127, 2180.25);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3028', 128, 3770.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3029', 129, 2822.10);

INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3030', 101, 2210.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3031', 101, 2499.99);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3032', 102, 3800.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3033', 103, 2222.22);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3034', 104, 4567.89);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3035', 105, 4200.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3036', 106, 3350.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3037', 107, 2980.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3038', 108, 3240.40);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3039', 109, 2111.00);

INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3040', 110, 4199.99);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3041', 111, 3050.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3042', 112, 2700.10);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3043', 113, 3920.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3044', 114, 2660.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3045', 115, 3188.88);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3046', 116, 4444.44);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3047', 117, 3999.99);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3048', 118, 2890.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3049', 119, 2133.30);


--------------------


-- Vendas
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1001', 100, 5988.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1002', 101, 1129.80);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1003', 102, 2799.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1004', 103, 499.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1005', 104, 4399.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1006', 105, 229.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1007', 106, 1999.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1008', 107, 979.70);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1009', 108, 598.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1010', 109, 1149.80);


INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (12, 1003, 3989.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (3, 1002, 1999.90, 1);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (22, 1003, 849.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (32, 1004, 279.90, 1);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (3, 1029, 2799.00, 1);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (4, 1014, 499.90, 1);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (5, 1030, 4399.90, 1);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (6, 1014, 229.90, 1);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (7, 1009, 1999.00, 1);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (3013, 1002, 399.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (3013, 1003, 579.80, 1);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (3011, 1016, 299.00, 2);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (3011, 1010, 599.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade) VALUES (3011, 1011, 549.80, 1);

INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3011', 110, 4599.50);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3012', 111, 2599.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3013', 112, 899.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3014', 113, 1299.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3015', 114, 3499.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3016', 115, 799.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3017', 116, 1499.80);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3018', 117, 1099.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3019', 118, 3999.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA3020', 119, 689.90);

INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA22021', 120, 1599.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA22022', 121, 1799.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA22023', 122, 2299.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA22024', 123, 1099.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA22025', 124, 799.99);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA22026', 125, 1499.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA22027', 126, 2999.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA22028', 127, 3899.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA22029', 128, 679.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA22030', 129, 1199.90);

INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1031', 111, 1599.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1032', 101, 349.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1033', 102, 2999.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1034', 103, 4999.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1035', 104, 1899.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1036', 105, 749.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1037', 106, 3499.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1038', 107, 999.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1039', 108, 2799.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1040', 109, 899.90);


INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1041', 110, 2599.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1042', 111, 1499.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1043', 112, 679.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1044', 113, 1199.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1045', 114, 3399.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1046', 115, 499.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1047', 116, 799.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1048', 117, 1599.90);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1049', 118, 1799.00);
INSERT INTO DB_VENDA (documento, id_cliente, total) VALUES ('VENDA1050', 119, 2399.00);


select * from db_venda;