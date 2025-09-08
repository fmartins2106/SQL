#BANCO DE DADOS E-COMMERCE

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

CREATE TABLE cargos
(
    id_cargo        INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_cargo      VARCHAR(100)  NOT NULL CHECK ( nome_cargo <> '' ),
    salario_cargo   DECIMAL(7, 2) NOT NULL,
    id_departamento INTEGER       NOT NULL,
    status_cadastro BOOLEAN       NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_departamento_cargos FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento)
);

CREATE TABLE departamento
(
    id_departamento   INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_departamento VARCHAR(50) NOT NULL CHECK ( nome_departamento <> '' ),
    status_cadastro   BOOLEAN     NOT NULL DEFAULT TRUE
);


CREATE TABLE cliente
(
    id_cliente      INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_pessoa       INTEGER NOT NULL UNIQUE,
    status_cadastro BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE cartao
(
    id_cartao        INTEGER AUTO_INCREMENT PRIMARY KEY,
    numero_cartao    VARCHAR(255) NOT NULL CHECK ( numero_cartao <> '' ),
    codigo_seguranca VARCHAR(3)   NOT NULL CHECK ( codigo_seguranca <> '' ),
    validade         DATE         NOT NULL,
    id_cliente       INTEGER      NOT NULL,
    status_cadastro  BOOLEAN      NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_cliente_cartao FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE telefone
(
    id_telefone     INTEGER AUTO_INCREMENT PRIMARY KEY,
    tipo_telefone   VARCHAR(30) NOT NULL CHECK ( tipo_telefone <> '' ),
    ddd             VARCHAR(3)  NOT NULL CHECK ( ddd <> '' ),
    numero_telefone VARCHAR(9)  NOT NULL CHECK ( numero_telefone <> '' ),
    id_cliente      INTEGER     NOT NULL,
    status_cadastro BOOLEAN     NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_cliente_telefone FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);


# ENDERECO

CREATE TABLE endereco
(
    id_endereco     INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_logradouro   INTEGER      NOT NULL,
    endereco        VARCHAR(100) NOT NULL CHECK ( endereco <> '' ),
    cep             VARCHAR(8)   NOT NULL CHECK ( cep <> '' ),
    bairro          VARCHAR(50)  NOT NULL CHECK ( bairro <> '' ),
    id_cidade       INTEGER      NOT NULL,
    id_uf           INTEGER      NOT NULL,
    id_cliente      INTEGER      NOT NULL,
    status_cadastro BOOLEAN      NOT NULL DEFAULT TRUE,
    CONSTRAINT FK_logradouro_endereco FOREIGN KEY (id_logradouro) REFERENCES logradouro (id_logradouro),
    CONSTRAINT FK_cidade_endereco FOREIGN KEY (id_cidade) REFERENCES cidades (id_cidade),
    CONSTRAINT FK_uf_endereco FOREIGN KEY (id_uf) REFERENCES uf (id_uf),
    CONSTRAINT FK_cliente_endereco FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);


CREATE TABLE logradouro
(
    id_logradouro   INTEGER AUTO_INCREMENT PRIMARY KEY,
    logradouro      VARCHAR(50) NOT NULL UNIQUE CHECK ( logradouro <> '' ),
    status_cadastro BOOLEAN     NOT NULL DEFAULT TRUE
);

CREATE TABLE cidades
(
    id_cidade       INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_cidade     VARCHAR(100) NOT NULL CHECK ( nome_cidade <> '' ),
    status_cadastro BOOLEAN      NOT NULL DEFAULT TRUE
);

CREATE TABLE uf
(
    id_uf           INTEGER AUTO_INCREMENT PRIMARY KEY,
    uf              VARCHAR(2) NOT NULL UNIQUE CHECK ( uf <> '' ),
    status_cadastro BOOLEAN    NOT NULL DEFAULT TRUE
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
    CONSTRAINT FK_cliente_venda FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT FK_funcionario_venda FOREIGN KEY (id_vendedor) REFERENCES funcionario (matricula),
    CONSTRAINT FK_endereco_venda FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco),
    CONSTRAINT FK_transportadora_produto_venda FOREIGN KEY (id_transportadora) REFERENCES transportadora (id_transportadora)
);

CREATE TABLE produto_venda
(
    id_produto_venda INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_venda         INTEGER       NOT NULL,
    id_produto       INTEGER       NOT NULL,
    quantidade_venda INTEGER       NOT NULL,
    preco_unitario   DECIMAL(7, 2) NOT NULL,
    desconto         DECIMAL(7, 2) NOT NULL,
    CONSTRAINT FK_venda_produto_venda FOREIGN KEY (id_venda) REFERENCES venda (id_venda),
    CONSTRAINT FK_produto_produto_venda FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

CREATE TABLE fornecedor
(
    id_fornecedor   INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(100) NOT NULL CHECK ( nome_fornecedor <> '' ),
    cnpj            VARCHAR(14)  NOT NULL UNIQUE CHECK ( cnpj <> '' ),
    id_endereco     INTEGER      NOT NULL,
    CONSTRAINT FK_endereco_fornecedor FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
);

CREATE TABLE transportadora
(
    id_transportadora   INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_transportadora VARCHAR(100) NOT NULL,
    cnpj                VARCHAR(14)  NOT NULL UNIQUE CHECK ( cnpj <> '' ),
    id_endereco         INTEGER      NOT NULL,
    CONSTRAINT FK_endereco_transportadora FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
);


/*
 Sua modelagem ficou bem estruturada e já cobre muitos pontos importantes de um e-commerce. 🚀
Mas olhando com calma, eu faria alguns ajustes/refinamentos para deixá-la mais normalizada e prática no dia a dia:

✅ Pontos positivos

Separou pessoa, cliente e funcionário (bom para herdar dados comuns).

Usou tabelas de apoio (cargos, departamento, categoria_produto, logradouro, cidades, uf).

Criou relacionamento n:N entre venda e produtos com a tabela produto_venda.

Adicionou transportadora, fornecedor e vínculos com endereço.

Incluiu status_cadastro e data_cadastro para auditoria.

🔎 Pontos de atenção e melhorias sugeridas

Tabela endereco

Você está ligando endereco direto ao cliente (id_cliente), mas também usa endereço em fornecedor, transportadora e até na venda.
👉 Sugestão: transformar endereco em entidade independente, sem FK direta de cliente.
A relação poderia ser:

cliente_endereco (id_cliente, id_endereco, tipo_endereco) → permite cliente ter vários endereços (cobrança, entrega, etc.).

fornecedor e transportadora continuam ligados direto a endereco.

Cartão e telefone

Estão ligados apenas ao cliente. Isso está correto. Mas e se o sistema evoluir para aceitar mais de um dono por cartão (caso compartilhado)? Nesse caso, poderia ter uma tabela associativa cliente_cartao.
👉 Por enquanto está ok, só fica atento a essa possibilidade.

Tabela venda

Agora está bem melhor com id_cliente, id_vendedor, id_endereco e id_transportadora.

Mas o campo valor_total, valor_imposto e valor_frete podem ser redundantes. Você poderia calcular dinamicamente a partir de produto_venda.
👉 Se quiser manter no banco, boa prática é atualizar via trigger ou lógica da aplicação para evitar inconsistência.

produto_venda

Está correta, mas faltou um campo para possíveis descontos por produto (desconto_unitario).

E talvez subtotal (quantidade * preço - desconto).

Integridade de dados

Em telefone.numero_telefone você limitou a 9 caracteres. Hoje há celulares com 9 dígitos + fixos com 8 → seria melhor VARCHAR(10 ou 11).

Em cpf e cnpj você está guardando apenas números, mas na prática pode ser interessante armazenar formatado (000.000.000-00 / 00.000.000/0000-00).
👉 Solução: ou guarda só números (como fez), e formata na aplicação, ou aumenta o tamanho para permitir pontuação.

Escalabilidade da venda

Se futuramente quiser implementar parcelamento, pode criar uma tabela pagamento ligada à venda, em vez de atrelar apenas a cartão.

 */