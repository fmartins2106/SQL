#BANCO DE DADOS E-COMMERCE

CREATE TABLE departamento
(
    id_departamento   INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_departamento VARCHAR(50) NOT NULL CHECK ( nome_departamento <> '' ),
    status_cadastro   BOOLEAN     NOT NULL DEFAULT TRUE
);


CREATE TABLE cargos
(
    id_cargo        INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_cargo      VARCHAR(100)  NOT NULL CHECK ( nome_cargo <> '' ),
    salario_cargo   DECIMAL(7, 2) NOT NULL,
    id_departamento INTEGER       NOT NULL,
    status_cadastro BOOLEAN       NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_departamento_cargos FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento)
);


CREATE TABLE pessoa
(
    id_pessoa       INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(50)        NOT NULL CHECK ( nome <> '' ),
    sobrenome       VARCHAR(50)        NOT NULL CHECK ( sobrenome <> ''),
    cpf             VARCHAR(11) UNIQUE NOT NULL CHECK ( cpf <> '' ),
    email           VARCHAR(50) UNIQUE NOT NULL CHECK ( email <> '' ),
    senha           VARCHAR(255)       NOT NULL CHECK ( senha <> '' ),
    status_cadastro BOOLEAN            NOT NULL DEFAULT TRUE,
    data_cadastro   TIMESTAMP          NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE funcionario
(
    matricula       INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_pessoa       INTEGER NOT NULL UNIQUE,
    id_cargo        INTEGER NOT NULL,
    data_admissao   DATE    NOT NULL,
    data_demissao   DATE,
    status_cadastro BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_pessoa_funcionario FOREIGN KEY (id_pessoa) REFERENCES pessoa (id_pessoa),
    CONSTRAINT FK_cargo_funcionario FOREIGN KEY (id_cargo) REFERENCES cargos (id_cargo)
);


CREATE TABLE cliente
(
    id_cliente      INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_pessoa       INTEGER NOT NULL UNIQUE,
    status_cadastro BOOLEAN NOT NULL DEFAULT TRUE
);


CREATE TABLE telefone
(
    id_telefone     INTEGER AUTO_INCREMENT PRIMARY KEY,
    tipo_telefone   VARCHAR(30) NOT NULL CHECK ( tipo_telefone <> '' ),
    ddd             VARCHAR(3)  NOT NULL CHECK ( ddd <> '' ),
    numero_telefone VARCHAR(9)  NOT NULL CHECK ( numero_telefone <> '' ),
    id_pessoa      INTEGER     NOT NULL,
    status_cadastro BOOLEAN     NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_cliente_telefone FOREIGN KEY (id_pessoa) REFERENCES pessoa (id_pessoa)
);


# ENDERECO

CREATE TABLE uf
(
    id_uf           INTEGER AUTO_INCREMENT PRIMARY KEY,
    uf              VARCHAR(2) NOT NULL UNIQUE CHECK ( uf <> '' ),
    status_cadastro BOOLEAN    NOT NULL DEFAULT TRUE
);


CREATE TABLE cidades
(
    id_cidade       INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_cidade     VARCHAR(100) NOT NULL CHECK ( nome_cidade <> '' ),
    status_cadastro BOOLEAN      NOT NULL DEFAULT TRUE
);

CREATE TABLE logradouro
(
    id_logradouro   INTEGER AUTO_INCREMENT PRIMARY KEY,
    logradouro      VARCHAR(50) NOT NULL UNIQUE CHECK ( logradouro <> '' ),
    status_cadastro BOOLEAN     NOT NULL DEFAULT TRUE
);


CREATE TABLE endereco
(
    id_endereco     INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_logradouro   INTEGER      NOT NULL,
    endereco        VARCHAR(100) NOT NULL CHECK ( endereco <> '' ),
    cep             VARCHAR(8)   NOT NULL CHECK ( cep <> '' ),
    bairro          VARCHAR(50)  NOT NULL CHECK ( bairro <> '' ),
    id_cidade       INTEGER      NOT NULL,
    id_uf           INTEGER      NOT NULL,
    status_cadastro BOOLEAN      NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_logradouro_endereco FOREIGN KEY (id_logradouro) REFERENCES logradouro (id_logradouro),
    CONSTRAINT FK_cidade_endereco FOREIGN KEY (id_cidade) REFERENCES cidades (id_cidade),
    CONSTRAINT FK_uf_endereco FOREIGN KEY (id_uf) REFERENCES uf (id_uf)
);

CREATE TABLE cliente_endereco
(
    id_cliente_endereco INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_cliente          INTEGER NOT NULL,
    id_endereco         INTEGER NOT NULL,
    CONSTRAINT FK_id_cliente_cliente_endereco FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT FK_id_endereco_cliente_endereco FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
);


CREATE TABLE fornecedor
(
    id_fornecedor   INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(100) NOT NULL CHECK ( nome_fornecedor <> '' ),
    cnpj            VARCHAR(14)  NOT NULL UNIQUE CHECK ( cnpj <> '' ),
    id_endereco     INTEGER      NOT NULL,
    status_cadastro BOOLEAN      NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_endereco_fornecedor FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
);

CREATE TABLE transportadora
(
    id_transportadora   INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_transportadora VARCHAR(100) NOT NULL,
    cnpj                VARCHAR(14)  NOT NULL UNIQUE CHECK ( cnpj <> '' ),
    id_endereco         INTEGER      NOT NULL,
    status_cadastro     BOOLEAN      NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_endereco_transportadora FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
);


CREATE TABLE categoria_produto
(
    id_categoria    INTEGER AUTO_INCREMENT PRIMARY KEY,
    categoria       VARCHAR(100) NOT NULL UNIQUE CHECK ( categoria <> '' ),
    status_cadastro BOOLEAN      NOT NULL DEFAULT TRUE
);

CREATE TABLE produtos
(
    id_produto         INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_produto       VARCHAR(100)  NOT NULL UNIQUE CHECK ( nome_produto <> '' ),
    id_categoria       INTEGER       NOT NULL,
    quantidade_estoque INTEGER       NOT NULL,
    preco              DECIMAL(7, 2) NOT NULL,
    id_fornecedor      INTEGER       NOT NULL,
    status_cadastro    BOOLEAN       NOT NULL DEFAULT TRUE,
    data_cadastro      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_categoria_prodto FOREIGN KEY (id_categoria) REFERENCES categoria_produto (id_categoria),
    CONSTRAINT FK_fornecedor_prodto FOREIGN KEY (id_fornecedor) REFERENCES fornecedor (id_fornecedor)
);


CREATE TABLE forma_pagamento
(
    id_tipo_pagamento INTEGER AUTO_INCREMENT PRIMARY KEY,
    tipo_pagamento    VARCHAR(20) UNIQUE NOT NULL CHECK (tipo_pagamento <> '' ),
    status_cadastro   BOOLEAN            NOT NULL DEFAULT TRUE
);



CREATE TABLE chave_pix
(
    id_pix     INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_cliente INTEGER      NOT NULL,
    chave_pix  VARCHAR(100) NOT NULL UNIQUE CHECK ( chave_pix <> '' ),
    CONSTRAINT FK_cliente_chave_pix FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE cartao
(
    id_cartao        INTEGER AUTO_INCREMENT PRIMARY KEY,
    tipo_cartao      VARCHAR(30)  NOT NULL CHECK ( tipo_cartao <> '' ),
    numero_cartao    VARCHAR(255) NOT NULL CHECK ( numero_cartao <> '' ),
    codigo_seguranca VARCHAR(3) CHECK ( codigo_seguranca <> '' ),
    bandeira         VARCHAR(30)  NOT NULL CHECK ( bandeira <> '' ),
    validade         DATE         NOT NULL,
    id_cliente       INTEGER      NOT NULL,
    status_cadastro  BOOLEAN      NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_cliente_cartao FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE venda
(
    id_venda          INTEGER AUTO_INCREMENT PRIMARY KEY,
    data_venda        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_cliente        INTEGER       NOT NULL,
    id_vendedor       INTEGER       NOT NULL,
    valor_total       DECIMAL(7, 2) NOT NULL,
    valor_imposto     DECIMAL(7, 2) NOT NULL,
    valor_frete       DECIMAL(7, 2) NOT NULL,
    data_cancelamento TIMESTAMP,
    id_endereco       INTEGER       NOT NULL,
    id_transportadora INTEGER       NOT NULL,
    status_venda      BOOLEAN       NOT NULL DEFAULT TRUE,
    id_tipo_pagamento INTEGER       NOT NULL,
    id_cartao         INTEGER,
    id_chave_pix      INTEGER,
    CONSTRAINT FK_cliente_venda FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT FK_funcionario_venda FOREIGN KEY (id_vendedor) REFERENCES funcionario (matricula),
    CONSTRAINT FK_endereco_venda FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco),
    CONSTRAINT FK_transportadora_venda FOREIGN KEY (id_transportadora) REFERENCES transportadora (id_transportadora),
    CONSTRAINT FK_tipo_pagamento_venda FOREIGN KEY (id_tipo_pagamento) REFERENCES forma_pagamento (id_tipo_pagamento),
    CONSTRAINT FK_cartao_venda FOREIGN KEY (id_cartao) REFERENCES cartao (id_cartao),
    CONSTRAINT FK_chave_pix_venda FOREIGN KEY (id_chave_pix) REFERENCES chave_pix (id_pix)
);

CREATE TABLE produto_venda
(
    id_produto_venda INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_venda         INTEGER       NOT NULL,
    id_produto       INTEGER       NOT NULL,
    quantidade_venda INTEGER       NOT NULL,
    preco_unitario   DECIMAL(7, 2) NOT NULL,
    desconto         DECIMAL(7, 2) NOT NULL,
    status_cadastro  BOOLEAN       NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_venda_produto_venda FOREIGN KEY (id_venda) REFERENCES venda (id_venda),
    CONSTRAINT FK_produto_produto_venda FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

SELECT * from venda;



INSERT INTO produto_venda (id_venda, id_produto, quantidade_venda, preco_unitario) VALUES
(194, 1, 2, 50.00),
(194, 2, 1, 30.00),
(195, 3, 1, 70.00),
(195, 4, 3, 20.00),
(196, 5, 2, 45.00),
(196, 1, 1, 50.00),
(197, 2, 2, 30.00),
(197, 3, 1, 70.00),
(198, 4, 1, 20.00),
(198, 5, 2, 45.00),
(199, 1, 3, 50.00),
(199, 2, 2, 30.00),
(200, 3, 1, 70.00),
(200, 4, 2, 20.00),
(201, 5, 1, 45.00),
(201, 1, 1, 50.00),
(202, 2, 2, 30.00),
(202, 3, 1, 70.00),
(203, 4, 1, 20.00),
(203, 5, 3, 45.00),
(204, 1, 2, 50.00),
(204, 2, 1, 30.00),
(205, 3, 2, 70.00),
(205, 4, 1, 20.00),
(206, 5, 1, 45.00),
(206, 1, 2, 50.00),
(207, 2, 1, 30.00),
(207, 3, 3, 70.00),
(208, 4, 2, 20.00),
(208, 5, 1, 45.00),
(209, 1, 1, 50.00),
(209, 2, 2, 30.00),
(210, 3, 1, 70.00),
(210, 4, 2, 20.00),
(211, 5, 1, 45.00),
(211, 1, 2, 50.00),
(212, 2, 1, 30.00),
(212, 3, 1, 70.00),
(213, 4, 3, 20.00),
(213, 5, 2, 45.00);

alter TABLE produto_venda ADD COLUMN desconto decimal(7,2);

INSERT INTO venda
(id_cliente, id_vendedor, valor_total, valor_imposto, valor_frete, id_endereco, id_transportadora, status_venda, id_tipo_pagamento, id_cartao, id_chave_pix, data_venda)
VALUES
(1, 31, 4999.90, 399.99, 50.00, 180, 31, TRUE, 74, NULL, 31, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(2, 32, 3999.00, 319.92, 40.00, 181, 32, TRUE, 74, NULL, 32, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(3, 33, 2799.90, 223.99, 35.00, 182, 33, TRUE, 74, NULL, 33, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(4, 34, 2599.90, 207.99, 30.00, 183, 34, TRUE, 74, NULL, 34, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(5, 35, 1299.90, 103.99, 20.00, 184, 35, TRUE, 74, NULL, 35, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(6, 36, 899.90, 71.99, 15.00, 185, 36, TRUE, 74, NULL, 36, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(7, 37, 79.90, 6.39, 10.00, 186, 37, TRUE, 74, NULL, 37, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(8, 38, 119.90, 9.59, 10.00, 187, 38, TRUE, 74, NULL, 38, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(9, 39, 199.90, 15.99, 12.00, 188, 39, TRUE, 74, NULL, 39, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(10, 40, 89.90, 7.19, 8.00, 189, 40, TRUE, 74, NULL, 40, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(11, 41, 149.90, 11.99, 10.00, 190, 31, TRUE, 74, NULL, 41, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(12, 42, 129.90, 10.39, 9.00, 191, 32, TRUE, 74, NULL, 42, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(13, 43, 249.90, 19.99, 15.00, 192, 33, TRUE, 74, NULL, 43, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(14, 44, 79.90, 6.39, 8.00, 193, 34, TRUE, 74, NULL, 44, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(15, 45, 49.90, 3.99, 5.00, 194, 35, TRUE, 74, NULL, 45, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(16, 46, 89.90, 7.19, 7.00, 195, 36, TRUE, 74, NULL, 46, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(17, 47, 59.90, 4.79, 6.00, 196, 37, TRUE, 74, NULL, 47, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(18, 48, 19.90, 1.59, 5.00, 197, 38, TRUE, 74, NULL, 48, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(19, 49, 199.90, 15.99, 12.00, 198, 39, TRUE, 74, NULL, 49, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(20, 50, 89.90, 7.19, 8.00, 199, 40, TRUE, 74, NULL, 50, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(21, 51, 9.90, 0.79, 2.00, 200, 31, TRUE, 74, NULL, 51, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(22, 52, 189.90, 15.19, 10.00, 201, 32, TRUE, 74, NULL, 52, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(23, 53, 299.90, 23.99, 15.00, 202, 33, TRUE, 74, NULL, 53, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(24, 54, 149.90, 11.99, 8.00, 203, 34, TRUE, 74, NULL, 54, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(25, 55, 399.90, 31.99, 20.00, 204, 35, TRUE, 74, NULL, 55, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(26, 56, 199.90, 15.99, 12.00, 205, 36, TRUE, 74, NULL, 56, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(27, 57, 1299.90, 103.99, 25.00, 206, 37, TRUE, 74, NULL, 57, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(28, 58, 4499.90, 359.99, 30.00, 207, 38, TRUE, 74, NULL, 58, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(29, 59, 39.90, 3.19, 5.00, 208, 39, TRUE, 74, NULL, 59, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY)),
(30, 60, 199.90, 15.99, 10.00, 209, 40, TRUE, 74, NULL, 60, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*2500) DAY));

INSERT INTO produto_venda (id_venda, id_produto, quantidade_venda, preco_unitario) VALUES
(1, 1, 2, 50.00),
(1, 2, 1, 30.00),
(2, 3, 1, 70.00),
(2, 4, 3, 20.00),
(3, 5, 2, 45.00),
(3, 1, 1, 50.00),
(4, 2, 2, 30.00),
(4, 3, 1, 70.00),
(5, 4, 1, 20.00),
(5, 5, 2, 45.00),
(6, 1, 3, 50.00),
(6, 2, 2, 30.00),
(7, 3, 1, 70.00),
(7, 4, 2, 20.00),
(8, 5, 1, 45.00),
(8, 1, 1, 50.00),
(9, 2, 2, 30.00),
(9, 3, 1, 70.00),
(10, 4, 1, 20.00),
(10, 5, 3, 45.00),
(11, 1, 2, 50.00),
(11, 2, 1, 30.00),
(12, 3, 2, 70.00),
(12, 4, 1, 20.00),
(13, 5, 1, 45.00),
(13, 1, 2, 50.00),
(14, 2, 1, 30.00),
(14, 3, 3, 70.00),
(15, 4, 2, 20.00),
(15, 5, 1, 45.00),
(16, 1, 1, 50.00),
(16, 2, 2, 30.00),
(17, 3, 1, 70.00),
(17, 4, 2, 20.00),
(18, 5, 1, 45.00),
(18, 1, 2, 50.00),
(19, 2, 1, 30.00),
(19, 3, 1, 70.00),
(20, 4, 3, 20.00),
(20, 5, 2, 45.00);



select * from cliente;
INSERT INTO cartao (tipo_cartao, numero_cartao, codigo_seguranca, bandeira, validade, id_cliente) VALUES
('Crédito', '4111111111111111', '123', 'Visa', '2027-12-31', 1),
('Débito', '5500000000000004', '456', 'Mastercard', '2026-11-30', 2),
('Crédito', '340000000000009', '789', 'Amex', '2028-10-31', 3),
('Crédito', '6011000000000004', '321', 'Discover', '2025-09-30', 4),
('Débito', '3530111333300000', '654', 'JCB', '2027-08-31', 5),
('Crédito', '3566002020360505', '987', 'JCB', '2026-07-31', 6),
('Débito', '4007000000027', '159', 'Visa', '2027-06-30', 7),
('Crédito', '5105105105105100', '753', 'Mastercard', '2028-05-31', 8),
('Crédito', '378282246310005', '852', 'Amex', '2025-04-30', 9),
('Débito', '6011111111111117', '951', 'Discover', '2026-03-31', 10),
('Crédito', '30569309025904', '147', 'Diners', '2027-02-28', 11),
('Débito', '38520000023237', '258', 'Diners', '2028-01-31', 12),
('Crédito', '4111111111111121', '369', 'Visa', '2027-12-31', 13),
('Débito', '5105105105105118', '741', 'Mastercard', '2026-11-30', 14),
('Crédito', '378734493671000', '852', 'Amex', '2028-10-31', 15),
('Crédito', '6011000990139424', '963', 'Discover', '2025-09-30', 16),
('Débito', '3530111333300017', '159', 'JCB', '2027-08-31', 17),
('Crédito', '3566002020360512', '753', 'JCB', '2026-07-31', 18),
('Débito', '4007000000028', '852', 'Visa', '2027-06-30', 19),
('Crédito', '5105105105105126', '951', 'Mastercard', '2028-05-31', 20),
('Crédito', '378282246310006', '147', 'Amex', '2025-04-30', 21),
('Débito', '6011111111111118', '258', 'Discover', '2026-03-31', 22),
('Crédito', '30569309025905', '369', 'Diners', '2027-02-28', 23),
('Débito', '38520000023238', '741', 'Diners', '2028-01-31', 24),
('Crédito', '4111111111111139', '852', 'Visa', '2027-12-31', 25),
('Débito', '5105105105105134', '963', 'Mastercard', '2026-11-30', 26),
('Crédito', '378734493671001', '159', 'Amex', '2028-10-31', 27),
('Crédito', '6011000990139425', '753', 'Discover', '2025-09-30', 28),
('Débito', '3530111333300024', '852', 'JCB', '2027-08-31', 29),
('Crédito', '3566002020360529', '951', 'JCB', '2026-07-31', 30);


INSERT INTO categoria_produto (categoria) VALUES
('Eletrônicos'),
('Informática'),
('Telefonia'),
('Eletrodomésticos'),
('Móveis'),
('Decoração'),
('Roupas Masculinas'),
('Roupas Femininas'),
('Calçados Masculinos'),
('Calçados Femininos'),
('Brinquedos'),
('Esportes e Fitness'),
('Beleza e Perfumaria'),
('Saúde e Cuidados Pessoais'),
('Alimentos e Bebidas'),
('Bebês e Crianças'),
('Livros'),
('Papelaria'),
('Ferramentas'),
('Automotivo'),
('Jardinagem'),
('Pet Shop'),
('Relógios e Acessórios'),
('Joias e Bijuterias'),
('Informática e Software'),
('Telefonia e Acessórios'),
('Instrumentos Musicais'),
('Games e Consoles'),
('Cinema e Música'),
('Viagem e Turismo');


INSERT INTO produtos (nome_produto, id_categoria, quantidade_estoque, preco, id_fornecedor) VALUES
('Smartphone Galaxy S25', 3, 50, 4999.90, 1),
('Notebook Dell Inspiron', 2, 30, 3999.00, 2),
('Televisor LG 55"', 1, 20, 2799.90, 3),
('Geladeira Brastemp Frost Free', 4, 10, 2599.90, 4),
('Sofá 3 Lugares Retrátil', 5, 15, 1299.90, 5),
('Cama Box Casal', 5, 20, 899.90, 6),
('Camiseta Masculina Polo', 7, 100, 79.90, 7),
('Vestido Feminino Casual', 8, 80, 119.90, 8),
('Tênis Masculino Esportivo', 9, 60, 199.90, 9),
('Sandália Feminina', 10, 70, 89.90, 10),
('Boneca Barbie Fashion', 11, 40, 149.90, 11),
('Bola de Futebol Oficial', 12, 50, 129.90, 12),
('Perfume Masculino XYZ', 13, 30, 249.90, 13),
('Suplemento Vitamínico', 14, 25, 79.90, 14),
('Café em Grãos 1kg', 15, 100, 49.90, 15),
('Fralda Descartável', 16, 200, 89.90, 16),
('Livro "Aprendendo SQL"', 17, 50, 59.90, 17),
('Caderno Universitário 200 folhas', 18, 150, 19.90, 18),
('Furadeira Elétrica', 19, 20, 199.90, 19),
('Óleo de Motor 5W30', 20, 30, 89.90, 20),
('Sementes de Tomate', 21, 100, 9.90, 21),
('Ração para Cães Adultos 10kg', 22, 50, 189.90, 22),
('Relógio de Pulso Masculino', 23, 25, 299.90, 23),
('Colar de Prata Feminino', 24, 15, 149.90, 24),
('Pacote de Software Office', 25, 40, 399.90, 25),
('Fone de Ouvido Bluetooth', 26, 60, 199.90, 26),
('Guitarra Elétrica', 27, 10, 1299.90, 27),
('Console PlayStation 5', 28, 15, 4499.90, 28),
('CD Álbum Top Hits', 29, 50, 39.90, 29),
('Mochila de Viagem 40L', 30, 20, 199.90, 30);


INSERT INTO produtos (nome_produto, id_categoria, quantidade_estoque, preco, id_fornecedor) VALUES
('Smartwatch Fit Pro', 3, 40, 899.90, 1),
('Tablet Samsung Galaxy Tab', 2, 25, 1499.90, 2),
('Televisor Sony 65"', 1, 15, 3999.90, 3),
('Micro-ondas Electrolux', 4, 20, 499.90, 4),
('Rack para TV 1,80m', 5, 10, 399.90, 5),
('Colchão Casal Espuma', 5, 15, 599.90, 6),
('Camisa Social Masculina', 7, 120, 99.90, 7),
('Saia Feminina Midi', 8, 60, 79.90, 8),
('Tênis Feminino Casual', 10, 50, 129.90, 9),
('Chuteira de Futebol', 12, 35, 189.90, 10),
('Boneco Action Figure', 11, 45, 129.90, 11),
('Mala de Viagem 60L', 30, 20, 299.90, 12),
('Perfume Feminino ABC', 13, 25, 199.90, 13),
('Kit Vitaminas Multimineral', 14, 30, 99.90, 14),
('Leite em Pó 1kg', 15, 80, 39.90, 15),
('Lenço Umidecido 50 un', 16, 150, 29.90, 16),
('Livro "Java para Iniciantes"', 17, 60, 69.90, 17),
('Agenda 2025', 18, 100, 24.90, 18),
('Parafusadeira Bosch', 19, 15, 349.90, 19),
('Bateria Automotiva 12V', 20, 25, 399.90, 20),
('Vasos de Planta Kit', 21, 50, 79.90, 21),
('Brinquedo Interativo Pet', 22, 40, 99.90, 22),
('Relógio Feminino Analógico', 23, 20, 249.90, 23),
('Pulseira de Prata', 24, 30, 99.90, 24),
('Pacote Antivirus Premium', 25, 35, 199.90, 25),
('Fone Gamer com LED', 26, 45, 249.90, 26),
('Teclado Mecânico RGB', 25, 30, 499.90, 27),
('Violão Acústico', 27, 15, 599.90, 28),
('Xbox Series X', 28, 10, 4399.90, 29),
('Headset Studio', 26, 25, 349.90, 30);





INSERT INTO cliente_endereco (id_cliente, id_endereco) VALUES
(1, 180),
(2, 181),
(3, 182),
(4, 183),
(5, 184),
(6, 185),
(7, 186),
(8, 187),
(9, 188),
(10, 189),
(11, 190),
(12, 191),
(13, 192),
(14, 193),
(15, 194),
(16, 195),
(17, 196),
(18, 197),
(19, 198),
(20, 199),
(21, 200),
(22, 201),
(23, 202),
(24, 203),
(25, 204),
(26, 205),
(27, 206),
(28, 207),
(29, 208),
(30, 209);






INSERT INTO fornecedor (nome_fornecedor, cnpj, id_endereco) VALUES
('Alfa Comércio Ltda', '111111000101', 180),
('Beta Distribuidora', '111111000202', 181),
('Gama Suprimentos', '1111111000303', 182),
('Delta Importações', '13211111000404', 183),
('Épsilon Materiais', '11331110505', 184),
('Zeta Logística', '1111331000606', 185),
('Eta Atacadista', '11113311000707', 186),
('Theta Produtos', '111111330808', 187),
('Iota Serviços', '1111111103309', 188),
('Kappa Equipamentos', '112211001010', 189),
('Lambda Comercial', '1112211001111', 190),
('Mi Distribuição', '1116611001212', 191),
('Ni Fornecimentos', '11771111001313', 192),
('Xi Soluções', '11111117701414', 193),
('Omicron Materiais', '16611111001515', 194),
('Pi Comércio', '11111117561616', 195),
('Rho Produtos', '11111111661717', 196),
('Sigma Atacadista', '11111144001818', 197),
('Tau Suprimentos', '11111114301919', 198),
('Upsilon Importadora', '11177111002020', 199),
('Phi Distribuidora', '11111151002121', 200),
('Chi Logística', '11111111005222', 201),
('Psi Materiais', '111111110055', 202),
('Omega Serviços', '1111111100255', 203),
('Aurora Comercial', '11111111002445', 204),
('Vênus Produtos', '11111111002636', 205),
('Marte Atacadista', '11111111005727', 206),
('Júpiter Suprimentos', '11115002828', 207),
('Saturno Distribuição', '141111002929', 208),
('Netuno Materiais', '111411003030', 209);



INSERT INTO telefone (tipo_telefone, ddd, numero_telefone, id_pessoa, status_cadastro) VALUES
('Celular', '11', '912345678', 241, TRUE),
('Celular', '21', '923456789', 242, TRUE),
('Residencial', '31', '334455667', 243, TRUE),
('Comercial', '41', '987654321', 244, TRUE),
('Celular', '51', '912233445', 245, TRUE),
('Residencial', '61', '334411223', 246, TRUE),
('Comercial', '71', '998877665', 247, TRUE),
('Celular', '81', '912345679', 248, TRUE),
('Residencial', '91', '334455668', 249, TRUE),
('Comercial', '11', '987654322', 250, TRUE),
('Celular', '21', '912233446', 251, TRUE),
('Residencial', '31', '334411224', 252, TRUE),
('Comercial', '41', '998877666', 253, TRUE),
('Celular', '51', '912345680', 254, TRUE),
('Residencial', '61', '334455669', 255, TRUE),
('Comercial', '71', '987654323', 256, TRUE),
('Celular', '81', '912233447', 257, TRUE),
('Residencial', '91', '334411225', 258, TRUE),
('Comercial', '11', '998877667', 259, TRUE),
('Celular', '21', '912345681', 260, TRUE),
('Residencial', '31', '334455670', 261, TRUE),
('Comercial', '41', '987654324', 262, TRUE),
('Celular', '51', '912233448', 263, TRUE),
('Residencial', '61', '334411226', 264, TRUE),
('Comercial', '71', '998877668', 265, TRUE),
('Celular', '81', '912345682', 266, TRUE),
('Residencial', '91', '334455671', 267, TRUE),
('Comercial', '11', '987654325', 268, TRUE),
('Celular', '21', '912233449', 269, TRUE),
('Residencial', '31', '334411227', 270, TRUE);


INSERT INTO forma_pagamento (tipo_pagamento) VALUES
('Cartão de Crédito'),
('Cartão de Débito'),
('PIX'),
('Boleto'),
('Dinheiro');

INSERT INTO cargos (nome_cargo, salario_cargo, id_departamento, status_cadastro) VALUES
('Analista de RH', 3500.00, 1, TRUE),
('Assistente Financeiro', 3000.00, 2, TRUE),
('Gerente Comercial', 7000.00, 3, TRUE),
('Analista de Marketing', 4000.00, 4, TRUE),
('Desenvolvedor Java', 6000.00, 5, TRUE),
('Coordenador Logístico', 5000.00, 6, TRUE),
('Advogado', 6500.00, 7, TRUE),
('Atendente', 2800.00, 8, TRUE),
('Comprador', 4500.00, 9, TRUE),
('Supervisor de Produção', 5500.00, 10, TRUE),
('Vendedor', 3500.00, 11, TRUE),
('Analista de Qualidade', 4000.00, 12, TRUE),
('Instrutor de Treinamento', 3800.00, 13, TRUE),
('Gerente de Projetos', 7500.00, 14, TRUE),
('Auditor Interno', 7000.00, 15, TRUE),
('Expedidor', 3000.00, 16, TRUE),
('Desenvolvedor Front-end', 5500.00, 17, TRUE),
('Suporte Técnico', 3200.00, 18, TRUE),
('Pesquisador', 6000.00, 19, TRUE),
('Coordenador de Pessoas', 5000.00, 20, TRUE),
('Operador', 2800.00, 21, TRUE),
('Motorista', 3000.00, 22, TRUE),
('Auxiliar de Almoxarifado', 2700.00, 23, TRUE),
('Servente', 2500.00, 24, TRUE),
('Engenheiro', 8000.00, 25, TRUE),
('Armazenista', 2700.00, 26, TRUE),
('Técnico de Manutenção', 3500.00, 27, TRUE),
('Analista de Planejamento', 4500.00, 28, TRUE),
('Controlador de Estoque', 3500.00, 29, TRUE),
('Administrador', 7000.00, 30, TRUE);


INSERT INTO funcionario (id_pessoa, id_cargo, data_admissao, status_cadastro) VALUES
(31, 5, '2025-09-09', TRUE),
(32, 17, '2025-09-09', TRUE),
(33, 3, '2025-09-09', TRUE),
(34, 11, '2025-09-09', TRUE),
(35, 25, '2025-09-09', TRUE),
(36, 6, '2025-09-09', TRUE),
(37, 18, '2025-09-09', TRUE),
(38, 1, '2025-09-09', TRUE),
(39, 20, '2025-09-09', TRUE),
(40, 10, '2025-09-09', TRUE),
(41, 7, '2025-09-09', TRUE),
(42, 12, '2025-09-09', TRUE),
(43, 14, '2025-09-09', TRUE),
(44, 4, '2025-09-09', TRUE),
(45, 15, '2025-09-09', TRUE),
(46, 16, '2025-09-09', TRUE),
(47, 2, '2025-09-09', TRUE),
(48, 18, '2025-09-09', TRUE),
(49, 19, '2025-09-09', TRUE),
(50, 20, '2025-09-09', TRUE),
(51, 21, '2025-09-09', TRUE),
(52, 22, '2025-09-09', TRUE),
(53, 23, '2025-09-09', TRUE),
(54, 24, '2025-09-09', TRUE),
(55, 25, '2025-09-09', TRUE),
(56, 26, '2025-09-09', TRUE),
(57, 27, '2025-09-09', TRUE),
(58, 28, '2025-09-09', TRUE),
(59, 29, '2025-09-09', TRUE),
(60, 30, '2025-09-09', TRUE);


select * from pessoa;

select * from departamento;

INSERT INTO funcionario (id_pessoa, id_cargo, data_admissao, status_cadastro) VALUES
(1, 1, '2025-09-09', TRUE),
(2, 5, '2025-09-09', TRUE),
(3, 3, '2025-09-09', TRUE),
(4, 4, '2025-09-09', TRUE),
(5, 10, '2025-09-09', TRUE),
(6, 5, '2025-09-09', TRUE),
(7, 2, '2025-09-09', TRUE),
(8, 6, '2025-09-09', TRUE),
(9, 3, '2025-09-09', TRUE),
(10, 4, '2025-09-09', TRUE),
(11, 3, '2025-09-09', TRUE),
(12, 2, '2025-09-09', TRUE),
(13, 1, '2025-09-09', TRUE),
(14, 3, '2025-09-09', TRUE),
(15, 5, '2025-09-09', TRUE),
(16, 6, '2025-09-09', TRUE),
(17, 2, '2025-09-09', TRUE),
(18, 5, '2025-09-09', TRUE),
(19, 1, '2025-09-09', TRUE),
(20, 4, '2025-09-09', TRUE),
(21, 3, '2025-09-09', TRUE),
(22, 6, '2025-09-09', TRUE),
(23, 5, '2025-09-09', TRUE),
(24, 2, '2025-09-09', TRUE),
(25, 3, '2025-09-09', TRUE),
(26, 4, '2025-09-09', TRUE),
(27, 1, '2025-09-09', TRUE),
(28, 5, '2025-09-09', TRUE),
(29, 3, '2025-09-09', TRUE),
(30, 10, '2025-09-09', TRUE);


INSERT INTO funcionario (id_pessoa, id_cargo, data_admissao, status_cadastro) VALUES
(241, 1, '2025-09-09', TRUE),
(242, 2, '2025-09-09', TRUE),
(243, 3, '2025-09-09', TRUE),
(244, 4, '2025-09-09', TRUE),
(245, 5, '2025-09-09', TRUE),
(246, 6, '2025-09-09', TRUE),
(247, 7, '2025-09-09', TRUE),
(248, 8, '2025-09-09', TRUE),
(249, 9, '2025-09-09', TRUE),
(250, 10, '2025-09-09', TRUE),
(251, 11, '2025-09-09', TRUE),
(252, 12, '2025-09-09', TRUE),
(253, 13, '2025-09-09', TRUE),
(254, 14, '2025-09-09', TRUE),
(255, 15, '2025-09-09', TRUE),
(256, 16, '2025-09-09', TRUE),
(257, 17, '2025-09-09', TRUE),
(258, 18, '2025-09-09', TRUE),
(259, 19, '2025-09-09', TRUE),
(260, 20, '2025-09-09', TRUE),
(261, 21, '2025-09-09', TRUE),
(262, 22, '2025-09-09', TRUE),
(263, 23, '2025-09-09', TRUE),
(264, 24, '2025-09-09', TRUE),
(265, 25, '2025-09-09', TRUE),
(266, 26, '2025-09-09', TRUE),
(267, 27, '2025-09-09', TRUE),
(268, 28, '2025-09-09', TRUE),
(269, 29, '2025-09-09', TRUE),
(270, 30, '2025-09-09', TRUE);


INSERT INTO pessoa (nome, sobrenome, cpf, email, senha, status_cadastro) VALUES
('Mariana','Silveira','12345678931','mariana.silveira@email.com','senha123',TRUE),
('Fernando','Almeida','12345678932','fernando.almeida@email.com','senha123',TRUE),
('Juliana','Costa','12345678933','juliana.costa@email.com','senha123',TRUE),
('Lucas','Pereira','12345678934','lucas.pereira@email.com','senha123',TRUE),
('Amanda','Lima','12345678935','amanda.lima@email.com','senha123',TRUE),
('Rafael','Cardoso','12345678936','rafael.cardoso@email.com','senha123',TRUE),
('Camila','Barbosa','12345678937','camila.barbosa@email.com','senha123',TRUE),
('Eduardo','Mendes','12345678938','eduardo.mendes@email.com','senha123',TRUE),
('Larissa','Ramos','12345678939','larissa.ramos@email.com','senha123',TRUE),
('Thiago','Alves','12345678940','thiago.alves@email.com','senha123',TRUE),
('Renata','Ferreira','12345678941','renata.ferreira@email.com','senha123',TRUE),
('Felipe','Martins','12345678942','felipe.martins@email.com','senha123',TRUE),
('Patrícia','Gomes','12345678943','patricia.gomes@email.com','senha123',TRUE),
('Bruno','Lima','12345678944','bruno.lima@email.com','senha123',TRUE),
('Sofia','Silva','12345678945','sofia.silva@email.com','senha123',TRUE),
('Carlos','Moura','12345678946','carlos.moura@email.com','senha123',TRUE),
('Beatriz','Santos','12345678947','beatriz.santos@email.com','senha123',TRUE),
('André','Cavalcanti','12345678948','andre.cavalcanti@email.com','senha123',TRUE),
('Denise','Rezende','12345678949','denise.rezende@email.com','senha123',TRUE),
('Victor','Tavares','12345678950','victor.tavares@email.com','senha123',TRUE),
('Carla','Farias','12345678951','carla.farias@email.com','senha123',TRUE),
('Gabriel','Barros','12345678952','gabriel.barros@email.com','senha123',TRUE),
('Aline','Melo','12345678953','aline.melo@email.com','senha123',TRUE),
('Rodrigo','Fonseca','12345678954','rodrigo.fonseca@email.com','senha123',TRUE),
('Mônica','Lopes','12345678955','monica.lopes@email.com','senha123',TRUE),
('Leonardo','Batista','12345678956','leonardo.batista@email.com','senha123',TRUE),
('Vanessa','Dias','12345678957','vanessa.dias@email.com','senha123',TRUE),
('Julio','Vieira','12345678958','julio.vieira@email.com','senha123',TRUE),
('Tatiane','Campos','12345678959','tatiane.campos@email.com','senha123',TRUE),
('Marcos','Rocha','12345678960','marcos.rocha@email.com','senha123',TRUE);


select * from cargos;

INSERT INTO cliente (id_pessoa, status_cadastro) VALUES
(1, TRUE),
(2, TRUE),
(3, TRUE),
(4, TRUE),
(5, TRUE),
(6, TRUE),
(7, TRUE),
(8, TRUE),
(9, TRUE),
(10, TRUE),
(11, TRUE),
(12, TRUE),
(13, TRUE),
(14, TRUE),
(15, TRUE),
(16, TRUE),
(17, TRUE),
(18, TRUE),
(19, TRUE),
(20, TRUE),
(21, TRUE),
(22, TRUE),
(23, TRUE),
(24, TRUE),
(25, TRUE),
(26, TRUE),
(27, TRUE),
(28, TRUE),
(29, TRUE),
(30, TRUE);


INSERT INTO cliente_endereco (id_cliente, id_endereco) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20),
(21,21),(22,22),(23,23),(24,24),(25,25),
(26,26),(27,27),(28,28),(29,29),(30,30);

select * from endereco;

INSERT INTO transportadora (nome_transportadora, cnpj, id_endereco) VALUES
('Transportadora Alpha','11111111111101',180),
('Transportadora Beta','11111111111102',189),
('Transportadora Gama','11111111111103',188),
('Transportadora Delta','11111111111104',188),
('Transportadora Epsilon','11111111111105',187),
('Transportadora Zeta','11111111111106',189),
('Transportadora Eta','11111111111107',196),
('Transportadora Theta','11111111111108',199),
('Transportadora Iota','11111111111109',197),
('Transportadora Kappa','11111111111110',199);




select
    table_schema,
    table_name
from information_schema.TABLES
where table_type = 'BASE TABLE'
and table_schema not in ('mysql','information_schema','performance_schema','sys')
order by table_name;




INSERT INTO departamento (nome_departamento) VALUES
('Recursos Humanos'),
('Financeiro'),
('Comercial'),
('Marketing'),
('Tecnologia da Informação'),
('Logística'),
('Jurídico'),
('Atendimento ao Cliente'),
('Compras'),
('Produção'),
('Vendas'),
('Qualidade'),
('Treinamento'),
('Projetos'),
('Auditoria'),
('Expedição'),
('Desenvolvimento'),
('Suporte Técnico'),
('Pesquisa e Desenvolvimento'),
('Gestão de Pessoas'),
('Operações'),
('Transportes'),
('Almoxarifado'),
('Serviços Gerais'),
('Engenharia'),
('Armazenagem'),
('Manutenção'),
('Planejamento'),
('Controle de Estoque'),
('Administração');


INSERT INTO pessoa (nome, sobrenome, cpf, email, senha) VALUES
('João', 'Silva', '12345678901', 'joao.silva@gmail.com', 'senha123'),
('Maria', 'Oliveira', '98765432100', 'maria.oliveira@yahoo.com', 'senha123'),
('Carlos', 'Souza', '32165498712', 'carlos.souza@hotmail.com', 'senha123'),
('Ana', 'Costa', '65498732145', 'ana.costa@gmail.com', 'senha123'),
('Pedro', 'Santos', '11122233344', 'pedro.santos@outlook.com', 'senha123'),
('Juliana', 'Ferreira', '55566677788', 'juliana.ferreira@gmail.com', 'senha123'),
('Ricardo', 'Mendes', '11223344556', 'ricardo.mendes@yahoo.com', 'senha123'),
('Fernanda', 'Alves', '99887766554', 'fernanda.alves@gmail.com', 'senha123'),
('Bruno', 'Gonçalves', '22334455667', 'bruno.goncalves@hotmail.com', 'senha123'),
('Patrícia', 'Martins', '33445566778', 'patricia.martins@gmail.com', 'senha123'),
('Gabriel', 'Barbosa', '44556677889', 'gabriel.barbosa@gmail.com', 'senha123'),
('Beatriz', 'Pereira', '55667788990', 'beatriz.pereira@yahoo.com', 'senha123'),
('Rodrigo', 'Azevedo', '66778899001', 'rodrigo.azevedo@gmail.com', 'senha123'),
('Camila', 'Cardoso', '77889900112', 'camila.cardoso@hotmail.com', 'senha123'),
('Felipe', 'Teixeira', '88990011223', 'felipe.teixeira@gmail.com', 'senha123'),
('Larissa', 'Ramos', '99001122334', 'larissa.ramos@gmail.com', 'senha123'),
('Thiago', 'Nunes', '10111213141', 'thiago.nunes@gmail.com', 'senha123'),
('Carolina', 'Lima', '12131415161', 'carolina.lima@gmail.com', 'senha123'),
('André', 'Batista', '14151617181', 'andre.batista@gmail.com', 'senha123'),
('Renata', 'Dias', '15161718191', 'renata.dias@hotmail.com', 'senha123'),
('Marcos', 'Vieira', '16171819202', 'marcos.vieira@gmail.com', 'senha123'),
('Tatiane', 'Campos', '17181920212', 'tatiane.campos@gmail.com', 'senha123'),
('Eduardo', 'Rocha', '18192021222', 'eduardo.rocha@gmail.com', 'senha123'),
('Aline', 'Moraes', '19202122232', 'aline.moraes@hotmail.com', 'senha123'),
('Rafael', 'Barros', '20212223242', 'rafael.barros@gmail.com', 'senha123'),
('Sabrina', 'Machado', '21222324252', 'sabrina.machado@gmail.com', 'senha123'),
('Fábio', 'Cavalcanti', '22232425262', 'fabio.cavalcanti@yahoo.com', 'senha123'),
('Mônica', 'Rezende', '23242526272', 'monica.rezende@gmail.com', 'senha123'),
('Leonardo', 'Tavares', '24252627282', 'leonardo.tavares@gmail.com', 'senha123'),
('Vanessa', 'Farias', '25262728292', 'vanessa.farias@gmail.com', 'senha123');


INSERT INTO uf (uf) VALUES
('SP'),('RJ'),('MG'),('ES'),('PR'),('SC'),('RS'),('BA'),('PE'),('CE'),
('GO'),('DF'),('MT'),('MS'),('PA'),('AM'),('RO'),('RR'),('AP'),('TO'),
('AC'),('AL'),('SE'),('PB'),('MA'),('PI'),('RN');

INSERT INTO cidades (nome_cidade) VALUES
('São Paulo'),('Rio de Janeiro'),('Belo Horizonte'),('Vitória'),('Curitiba'),('Florianópolis'),
('Porto Alegre'),('Salvador'),('Recife'),('Fortaleza'),('Goiânia'),('Brasília'),('Cuiabá'),
('Campo Grande'),('Belém'),('Manaus'),('Porto Velho'),('Boa Vista'),('Macapá'),('Palmas'),
('Rio Branco'),('Maceió'),('Aracaju'),('João Pessoa'),('São Luís'),('Teresina'),('Natal'),
('Joinville'),('Londrina'),('Niterói');


INSERT INTO forma_pagamento (tipo_pagamento) VALUES
('Cartão Crédito'),('Cartão Débito'),('Boleto'),('PIX'),
('PayPal'),('PicPay'),('MercadoPago'),('Cheque'),('Depósito');
SELECT * FROM logradouro;
INSERT INTO logradouro (logradouro) VALUES
('Rua'),('Avenida'),('BR'),('Travessa'),('estrada');

select * from uf;
INSERT INTO endereco (id_logradouro, endereco, cep, bairro, id_cidade, id_uf, status_cadastro) VALUES
(6, 'das Flores, 101', '01001001', 'Centro', 1, 118, TRUE),
(7, 'Avenida Brasil, 202', '01002002', 'Jardins', 2, 119, TRUE),
(8, 'BR-101, 303', '01003003', 'Industrial', 3, 120, TRUE),
(9, 'Travessa XV, 404', '01004004', 'Centro', 4, 121, TRUE),
(10, 'Estrada do Sol, 505', '01005005', 'Bela Vista', 5, 122, TRUE),
(6, 'das Palmeiras, 606', '01006006', 'Centro', 6, 123, TRUE),
(7, 'dos Jacarandás, 707', '01007007', 'Copacabana', 7, 124, TRUE),
(8, 'BR-116, 808', '01008008', 'Savassi', 8, 125, TRUE),
(9, 'Sete de Setembro, 909', '01009009', 'Meireles', 9, 126, TRUE),
(10, 'das Laranjeiras, 100', '01010010', 'Centro', 10, 127, TRUE),
(6, 'das Acácias, 111', '01011011', 'Jardim América', 11, 128, TRUE),
(7, 'das Orquídeas, 222', '01012012', 'Bela Vista', 12, 129, TRUE),
(8, 'BR-262, 333', '01013013', 'Industrial', 13, 130, TRUE),
(9, 'dos Pinheiros, 444', '01014014', 'Centro', 14, 131, TRUE),
(10, 'das Violetas, 555', '01015015', 'Jardim Paulista', 15, 132, TRUE),
(6, 'dos Girassóis, 666', '01016016', 'Centro', 16, 133, TRUE),
(7, 'das Rosas, 777', '01017017', 'Copacabana', 17, 134, TRUE),
(8, 'BR-040, 888', '01018018', 'Savassi', 18, 135, TRUE),
(9, 'dos Cravos, 999', '01019019', 'Meireles', 19, 136, TRUE),
(10, 'das Margaridas, 121', '01020020', 'Centro', 20, 137, TRUE),
(6, 'das Hortênsias, 131', '01021021', 'Jardim América', 21, 138, TRUE),
(7, 'dos Jasmins, 141', '01022022', 'Bela Vista', 22, 139, TRUE),
(8, 'BR-050, 151', '01023023', 'Industrial', 23, 140, TRUE),
(9, 'das Camélias, 161', '01024024', 'Centro', 24, 141, TRUE),
(10, 'dos Lírios, 171', '01025025', 'Jardim Paulista', 25, 142, TRUE),
(6, 'das Tulipas, 181', '01026026', 'Centro', 26, 143, TRUE),
(7, 'das Dálias, 191', '01027027', 'Copacabana', 27, 144, TRUE),
(8, 'BR-116, 201', '01028028', 'Savassi', 28, 118, TRUE),
(9, 'das Begônias, 211', '01029029', 'Meireles', 29, 119, TRUE),
(10, 'dos Cravos, 221', '01030030', 'Centro', 30, 120, TRUE);



INSERT INTO cidades (nome_cidade, status_cadastro) VALUES
('São Paulo', TRUE),
('Rio de Janeiro', TRUE),
('Belo Horizonte', TRUE),
('Curitiba', TRUE),
('Porto Alegre', TRUE),
('Salvador', TRUE),
('Fortaleza', TRUE),
('Recife', TRUE),
('Manaus', TRUE),
('Belém', TRUE),
('Goiânia', TRUE),
('Campinas', TRUE),
('São Luís', TRUE),
('Maceió', TRUE),
('Natal', TRUE),
('João Pessoa', TRUE),
('Teresina', TRUE),
('Aracaju', TRUE),
('Cuiabá', TRUE),
('Campo Grande', TRUE),
('Vitória', TRUE),
('Florianópolis', TRUE),
('Joinville', TRUE),
('Niterói', TRUE),
('São Bernardo do Campo', TRUE),
('Santo André', TRUE),
('São José dos Campos', TRUE),
('Ribeirão Preto', TRUE),
('Sorocaba', TRUE),
('Uberlândia', TRUE),
('Juiz de Fora', TRUE),
('Anápolis', TRUE),
('Londrina', TRUE),
('Maringá', TRUE),
('Caxias do Sul', TRUE),
('Blumenau', TRUE),
('Pelotas', TRUE),
('Canoas', TRUE),
('Porto Velho', TRUE),
('Macapá', TRUE),
('Boa Vista', TRUE),
('Palmas', TRUE),
('Rio Branco', TRUE),
('São João de Meriti', TRUE),
('Diadema', TRUE),
('Contagem', TRUE),
('Guarulhos', TRUE),
('Campina Grande', TRUE),
('Franca', TRUE),
('Itajaí', TRUE),
('Marília', TRUE),
('Caruaru', TRUE),
('Mogi das Cruzes', TRUE);
