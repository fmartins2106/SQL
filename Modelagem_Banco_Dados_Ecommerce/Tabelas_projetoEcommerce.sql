CREATE TABLE departamento
(
    id_departamento   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_departamento VARCHAR(50) NOT NULL CHECK ( nome_departamento <> '' ),
    status_cadastro   BOOLEAN     NOT NULL DEFAULT TRUE
);


CREATE TABLE cargos
(
    id_cargo        INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_cargo      VARCHAR(100)  NOT NULL CHECK ( nome_cargo <> '' ),
    salario_cargo   DECIMAL(7, 2) NOT NULL,
    id_departamento INTEGER       NOT NULL,
    status_cadastro BOOLEAN       NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_departamento_cargos FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento)
);


CREATE TABLE pessoa
(
    id_pessoa       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
    matricula       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
    id_cliente      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_pessoa       INTEGER NOT NULL UNIQUE,
    status_cadastro BOOLEAN NOT NULL DEFAULT TRUE
);


CREATE TABLE telefone
(
    id_telefone     INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo_telefone   VARCHAR(30) NOT NULL CHECK ( tipo_telefone <> '' ),
    ddd             VARCHAR(3)  NOT NULL CHECK ( ddd <> '' ),
    numero_telefone VARCHAR(9)  NOT NULL CHECK ( numero_telefone <> '' ),
    id_pessoa       INTEGER     NOT NULL,
    status_cadastro BOOLEAN     NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_cliente_telefone FOREIGN KEY (id_pessoa) REFERENCES pessoa (id_pessoa)
);


#
ENDERECO

CREATE TABLE uf
(
    id_uf           INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    uf              VARCHAR(2) NOT NULL UNIQUE CHECK ( uf <> '' ),
    status_cadastro BOOLEAN    NOT NULL DEFAULT TRUE
);


CREATE TABLE cidades
(
    id_cidade       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_cidade     VARCHAR(100) NOT NULL CHECK ( nome_cidade <> '' ),
    status_cadastro BOOLEAN      NOT NULL DEFAULT TRUE
);

CREATE TABLE logradouro
(
    id_logradouro   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    logradouro      VARCHAR(50) NOT NULL UNIQUE CHECK ( logradouro <> '' ),
    status_cadastro BOOLEAN     NOT NULL DEFAULT TRUE
);


CREATE TABLE endereco
(
    id_endereco     INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
    id_cliente_endereco INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente          INTEGER NOT NULL,
    id_endereco         INTEGER NOT NULL,
    CONSTRAINT FK_id_cliente_cliente_endereco FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT FK_id_endereco_cliente_endereco FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
);


CREATE TABLE fornecedor
(
    id_fornecedor   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_fornecedor VARCHAR(100) NOT NULL CHECK ( nome_fornecedor <> '' ),
    cnpj            VARCHAR(14)  NOT NULL UNIQUE CHECK ( cnpj <> '' ),
    id_endereco     INTEGER      NOT NULL,
    status_cadastro BOOLEAN      NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_endereco_fornecedor FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
);

CREATE TABLE transportadora
(
    id_transportadora   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_transportadora VARCHAR(100) NOT NULL,
    cnpj                VARCHAR(14)  NOT NULL UNIQUE CHECK ( cnpj <> '' ),
    id_endereco         INTEGER      NOT NULL,
    status_cadastro     BOOLEAN      NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_endereco_transportadora FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
);


CREATE TABLE categoria_produto
(
    id_categoria    INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    categoria       VARCHAR(100) NOT NULL UNIQUE CHECK ( categoria <> '' ),
    status_cadastro BOOLEAN      NOT NULL DEFAULT TRUE
);

CREATE TABLE produtos
(
    id_produto         INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
    id_tipo_pagamento INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo_pagamento    VARCHAR(20) UNIQUE NOT NULL CHECK (tipo_pagamento <> '' ),
    status_cadastro   BOOLEAN            NOT NULL DEFAULT TRUE
);



CREATE TABLE chave_pix
(
    id_pix     INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente INTEGER      NOT NULL,
    chave_pix  VARCHAR(100) NOT NULL UNIQUE CHECK ( chave_pix <> '' ),
    CONSTRAINT FK_cliente_chave_pix FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE cartao
(
    id_cartao        INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
    id_venda          INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
    id_produto_venda INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_venda         INTEGER       NOT NULL,
    id_produto       INTEGER       NOT NULL,
    quantidade_venda INTEGER       NOT NULL,
    preco_unitario   DECIMAL(7, 2) NOT NULL,
    desconto         DECIMAL(7, 2) NOT NULL,
    status_cadastro  BOOLEAN       NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_venda_produto_venda FOREIGN KEY (id_venda) REFERENCES venda (id_venda),
    CONSTRAINT FK_produto_produto_venda FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);



