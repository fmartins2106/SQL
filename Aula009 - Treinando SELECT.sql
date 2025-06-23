

select * from empresa.funcionarios
where funcionario_id in (13,2,3,4,5,6,7)
order by funcionario_id;


select * from empresa.funcionarios f 
where funcionario_id in (2,3,44,55)


select * from empresa.funcionarios f 
limit 50


select count(*)  
from empresa.funcionarios f

select count(*)
from empresa.clientes c 


select count (*)
from empresa.emails e 


select 
c.cliente_id,
c.data_cadastro,
c.tipo_pessoa,
c.email,
c.endereco,
c.nome,
v.data_venda,
v.forma_pagamento,
v.total,
v.venda_id,
v.desconto
from empresa.clientes c 
inner join empresa.vendas v
on v.cliente_id = c.cliente_id
order by v.total desc

select * from empresa.vendas v 

select * from empresa.clientes c 

select 
funcionario_id,
nome,
sobrenome,
email,
salario
from empresa.funcionarios
where nome ilike '__a%'
order by nome desc


select * from information_schema.columns
where table_schema = 'empresa'
and table_name   = 'funcionarios'


select 
nome,
sobrenome,
salario,
email 
from empresa.funcionarios
where (salario >= 3000 and salario <= 4000)
order by salario desc





select
nome,
sobrenome,
salario,
data_nascimento
from empresa.funcionarios f 
order by sobrenome;

select
nome,
sobrenome,
salario,
data_nascimento
from empresa.funcionarios f 
where (funcionario_id > 50 and f.funcionario_id < 55);


select
funcionario_id,
nome,
sobrenome,
data_nascimento
from empresa.funcionarios f 
where (funcionario_id >= 40);


select 
f.nome,
f.sobrenome,
f.funcionario_id
from empresa.funcionarios f 
where   f.nome ilike 'Ricardo'
order by f.funcionario_id  desc 
offset 4
limit 3


select 
nome,
sobrenome,
salario,
cpf
from empresa.funcionarios
where nome ilike 'ricardo'
and funcionario_id > 100
order by sobrenome desc



select * from empresa.funcionarios f 
where f.nome ilike 'ricardo'


select 
funcionario_id,
nome,
sobrenome
from empresa.funcionarios
order by funcionario_id
offset 300
limit 400

select *
from empresa.funcionarios f 
where funcionario_id in (312,302,313,314)
order by f.funcionario_id; 

select
funcionario_id,
nome,
sobrenome,
email,
salario
from empresa.funcionarios f 
order by salario

select
funcionario_id,
nome,
sobrenome,
email,
salario
from empresa.funcionarios f  
order by salario
offset 444
limit 30;


select 
f.nome ,
f.sobrenome,
f.cargo,
f.cpf,
f.funcionario_id,
f.telefone 
from empresa.funcionarios f 
where f.cargo = 'Cargo_1'
order by f.nome desc

select * from information_schema."columns" c 
where TABLE_SCHEMA = 'empresa'
and TABLE_NAME = 'auditorias';


select 
nome,
sobrenome,
email,
cargo,
cpf
from empresa.funcionarios
where nome ilike 'a%'
order by nome 

select *
from empresa.entregas as e  
limit 5;


select
nome  as "PRIMEIRO NOME",
sobrenome as "SEGUNDO NOME",
funcionario_id  as "ID FUNCIONARIOS"
from empresa.funcionarios

select 
from empresa.funcionarios f 




-- 1. Funcionarios (10 campos)
CREATE TABLE funcionarios (
    funcionario_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    cpf CHAR(11) UNIQUE,
    email VARCHAR(150),
    telefone VARCHAR(20),
    cargo VARCHAR(50),
    salario NUMERIC(12,2),
    data_admissao DATE
);

-- 2. Departamentos (5 campos)
CREATE TABLE departamentos (
    departamento_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    gerente_id INT,
    data_criacao DATE
);

-- 3. Projetos (10 campos)
CREATE TABLE projetos (
    projeto_id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,
    orcamento NUMERIC(15,2),
    status VARCHAR(20),
    gerente_id INT,
    cliente_id INT,
    prioridade INT
);

-- 4. Clientes (10 campos)
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    tipo_pessoa VARCHAR(20),
    cnpj_cpf CHAR(14),
    endereco VARCHAR(255),
    cidade VARCHAR(100),
    estado CHAR(2),
    telefone VARCHAR(20),
    email VARCHAR(150),
    data_cadastro DATE
);

-- 5. Fornecedores (10 campos)
CREATE TABLE fornecedores (
    fornecedor_id SERIAL PRIMARY KEY,
    nome VARCHAR(150),
    contato VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(150),
    endereco VARCHAR(255),
    cidade VARCHAR(100),
    estado CHAR(2),
    pais VARCHAR(50),
    data_cadastro DATE
);

-- 6. Produtos (10 campos)
CREATE TABLE produtos (
    produto_id SERIAL PRIMARY KEY,
    nome VARCHAR(150),
    descricao TEXT,
    categoria VARCHAR(50),
    preco NUMERIC(12,2),
    estoque INT,
    fornecedor_id INT,
    peso NUMERIC(8,2),
    altura NUMERIC(8,2),
    largura NUMERIC(8,2)
);

-- 7. Vendas (10 campos)
CREATE TABLE vendas (
    venda_id SERIAL PRIMARY KEY,
    cliente_id INT,
    funcionario_id INT,
    data_venda TIMESTAMP,
    total NUMERIC(15,2),
    status VARCHAR(20),
    forma_pagamento VARCHAR(50),
    desconto NUMERIC(10,2),
    observacoes TEXT,
    endereco_entrega VARCHAR(255)
);

-- 8. ItensVenda (10 campos)
CREATE TABLE itens_venda (
    item_id SERIAL PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario NUMERIC(12,2),
    desconto NUMERIC(10,2),
    subtotal NUMERIC(15,2),
    imposto NUMERIC(10,2),
    codigo_barras VARCHAR(50),
    garantia INT
);

-- 9. Estoque (10 campos)
CREATE TABLE estoque (
    estoque_id SERIAL PRIMARY KEY,
    produto_id INT,
    quantidade INT,
    data_entrada TIMESTAMP,
    data_saida TIMESTAMP,
    localizacao VARCHAR(100),
    lote VARCHAR(50),
    validade DATE,
    fornecedor_id INT,
    custo_unitario NUMERIC(12,2)
);

-- 10. Pagamentos (10 campos)
CREATE TABLE pagamentos (
    pagamento_id SERIAL PRIMARY KEY,
    venda_id INT,
    data_pagamento DATE,
    valor_pago NUMERIC(15,2),
    forma_pagamento VARCHAR(50),
    status VARCHAR(20),
    referencia VARCHAR(100),
    observacoes TEXT,
    funcionario_id INT,
    cliente_id INT
);

-- 11. ContasPagar (10 campos)
CREATE TABLE contas_pagar (
    conta_pagar_id SERIAL PRIMARY KEY,
    fornecedor_id INT,
    descricao VARCHAR(255),
    valor NUMERIC(15,2),
    data_vencimento DATE,
    data_pagamento DATE,
    status VARCHAR(20),
    forma_pagamento VARCHAR(50),
    observacoes TEXT,
    funcionario_id INT
);

-- 12. ContasReceber (10 campos)
CREATE TABLE contas_receber (
    conta_receber_id SERIAL PRIMARY KEY,
    cliente_id INT,
    descricao VARCHAR(255),
    valor NUMERIC(15,2),
    data_vencimento DATE,
    data_pagamento DATE,
    status VARCHAR(20),
    forma_pagamento VARCHAR(50),
    observacoes TEXT,
    funcionario_id INT
);

-- 13. Transportadoras (10 campos)
CREATE TABLE transportadoras (
    transportadora_id SERIAL PRIMARY KEY,
    nome VARCHAR(150),
    telefone VARCHAR(20),
    email VARCHAR(150),
    endereco VARCHAR(255),
    cidade VARCHAR(100),
    estado CHAR(2),
    pais VARCHAR(50),
    contato VARCHAR(100),
    data_cadastro DATE
);

-- 14. Entregas (10 campos)
CREATE TABLE entregas (
    entrega_id SERIAL PRIMARY KEY,
    venda_id INT,
    transportadora_id INT,
    data_entrega DATE,
    status VARCHAR(20),
    endereco_entrega VARCHAR(255),
    rastreamento VARCHAR(100),
    observacoes TEXT,
    funcionario_id INT,
    cliente_id INT
);

-- 15. Funcionarios_Departamentos (5 campos) -- tabela para relacionamento muitos-para-muitos
CREATE TABLE funcionarios_departamentos (
    funcionario_id INT,
    departamento_id INT,
    data_inicio DATE,
    data_fim DATE,
    PRIMARY KEY (funcionario_id, departamento_id)
);

-- 16. Metas (5 campos)
CREATE TABLE metas (
    meta_id SERIAL PRIMARY KEY,
    descricao VARCHAR(255),
    valor_meta NUMERIC(15,2),
    data_inicio DATE,
    data_fim DATE
);

-- 17. Avaliacoes (10 campos)
CREATE TABLE avaliacoes (
    avaliacao_id SERIAL PRIMARY KEY,
    funcionario_id INT,
    data_avaliacao DATE,
    nota INT,
    comentario TEXT,
    avaliador_id INT,
    departamento_id INT,
    projeto_id INT,
    status VARCHAR(20),
    tipo_avaliacao VARCHAR(50)
);

-- 18. Ferias (5 campos)
CREATE TABLE ferias (
    ferias_id SERIAL PRIMARY KEY,
    funcionario_id INT,
    data_inicio DATE,
    data_fim DATE,
    status VARCHAR(20)
);

-- 19. Cargos (5 campos)
CREATE TABLE cargos (
    cargo_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    salario_minimo NUMERIC(12,2),
    salario_maximo NUMERIC(12,2)
);

-- 20. Logs (20 campos)
CREATE TABLE logs (
    log_id SERIAL PRIMARY KEY,
    usuario_id INT,
    acao VARCHAR(255),
    data_hora TIMESTAMP,
    ip VARCHAR(50),
    pagina VARCHAR(255),
    detalhes TEXT,
    status VARCHAR(50),
    tipo_acao VARCHAR(50),
    duracao INT,
    navegador VARCHAR(100),
    sistema_operacional VARCHAR(100),
    versao_app VARCHAR(50),
    dispositivo VARCHAR(100),
    localizacao VARCHAR(255),
    erro_codigo INT,
    erro_descricao TEXT,
    responsavel_id INT,
    observacoes TEXT,
    categoria VARCHAR(50)
);

-- 21. Emails (10 campos)
CREATE TABLE emails (
    email_id SERIAL PRIMARY KEY,
    remetente VARCHAR(150),
    destinatario VARCHAR(150),
    assunto VARCHAR(255),
    corpo TEXT,
    data_envio TIMESTAMP,
    status VARCHAR(50),
    prioridade INT,
    tipo_email VARCHAR(50),
    resposta_para VARCHAR(150)
);

-- 22. Permissoes (5 campos)
CREATE TABLE permissoes (
    permissao_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    nivel_acesso INT,
    ativo BOOLEAN
);

-- 23. Usuarios (10 campos)
CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    login VARCHAR(50) UNIQUE,
    senha VARCHAR(255),
    email VARCHAR(150),
    ativo BOOLEAN,
    data_cadastro TIMESTAMP,
    ultimo_login TIMESTAMP,
    tipo_usuario VARCHAR(50),
    tentativa_login INT
);

-- 24. LogsAcesso (10 campos)
CREATE TABLE logs_acesso (
    log_acesso_id SERIAL PRIMARY KEY,
    usuario_id INT,
    data_hora TIMESTAMP,
    ip VARCHAR(50),
    dispositivo VARCHAR(100),
    sistema_operacional VARCHAR(100),
    navegador VARCHAR(100),
    status_login VARCHAR(50),
    tentativas INT,
    localizacao VARCHAR(255)
);

-- 25. Auditorias (10 campos)
CREATE TABLE auditorias (
    auditoria_id SERIAL PRIMARY KEY,
    tabela VARCHAR(100),
    operacao VARCHAR(50),
    data_hora TIMESTAMP,
    usuario_id INT,
    dados_anteriores TEXT,
    dados_novos TEXT,
    descricao TEXT,
    chave_primaria VARCHAR(100),
    ip VARCHAR(50)
);

-- 26. HistoricoSalarios (10 campos)
CREATE TABLE historico_salarios (
    historico_id SERIAL PRIMARY KEY,
    funcionario_id INT,
    salario_anterior NUMERIC(12,2),
    salario_novo NUMERIC(12,2),
    data_alteracao DATE,
    motivo TEXT,
    aprovado_por INT,
    data_aprovacao DATE,
    observacoes TEXT,
    documento VARCHAR(255)
);

-- 27. Reclamacoes (10 campos)
CREATE TABLE reclamacoes (
    reclamacao_id SERIAL PRIMARY KEY,
    cliente_id INT,
    descricao TEXT,
    data_reclamacao DATE,
    status VARCHAR(20),
    resposta TEXT,
    data_resposta DATE,
    funcionario_id INT,
    prioridade INT,
    categoria VARCHAR(50)
);

-- 28. Treinamentos (10 campos)
CREATE TABLE treinamentos (
    treinamento_id SERIAL PRIMARY KEY,
    nome VARCHAR(150),
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,
    local VARCHAR(255),
    instrutor VARCHAR(150),
    max_participantes INT,
    status VARCHAR(20),
    observacoes TEXT
);

-- 29. Feedbacks (10 campos)
CREATE TABLE feedbacks (
    feedback_id SERIAL PRIMARY KEY,
    funcionario_id INT,
    data_feedback DATE,
    comentario TEXT,
    avaliador_id INT,
    departamento_id INT,
    projeto_id INT,
    tipo_feedback VARCHAR(50),
    status VARCHAR(20),
    prioridade INT
);

-- 30. Contratos (10 campos)
CREATE TABLE contratos (
    contrato_id SERIAL PRIMARY KEY,
    cliente_id INT,
    data_inicio DATE,
    data_fim DATE,
    valor NUMERIC(15,2),
    status VARCHAR(20),
    tipo_contrato VARCHAR(50),
    descricao TEXT,
    representante VARCHAR(150),
    data_assinatura DATE
);


DO $$
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.funcionarios (nome, sobrenome, data_nascimento, cpf, email, telefone, cargo, salario, data_admissao)
        VALUES (
            'Funcionario_' || i,
            'Sobrenome_' || i,
            DATE '1980-01-01' + (i * INTERVAL '7 days'),
            lpad(i::text, 11, '0'),
            'email_' || i || '@empresa.com',
            '119' || lpad((10000000 + i)::text, 8, '0'),
            'Cargo_' || (i % 10),
            (3000 + (i * 50)),
            CURRENT_DATE - (i * INTERVAL '5 days')
        );
    END LOOP;
END $$;

TRUNCATE TABLE empresa.funcionarios RESTART IDENTITY CASCADE;
TRUNCATE TABLE empresa.departamentos RESTART IDENTITY CASCADE;
TRUNCATE TABLE empresa.projetos RESTART IDENTITY CASCADE;
-- Repita para todas as tabelas que quiser limpar


DO $$
DECLARE
    nomes TEXT[] := ARRAY['João','Maria','Carlos','Ana','Fernanda','Pedro','Lucas','Juliana','Gabriel','Amanda','Rafael','Patrícia','Ricardo','Camila','Gustavo','Larissa','Bruno','Isabela','Felipe','Mariana'];
    sobrenomes TEXT[] := ARRAY['Silva','Souza','Oliveira','Santos','Lima','Pereira','Ferreira','Almeida','Costa','Gomes','Ribeiro','Martins','Barbosa','Carvalho','Rocha','Melo','Dias','Teixeira','Araújo','Moreira'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.funcionarios (nome, sobrenome, data_nascimento, cpf, email, telefone, cargo, salario, data_admissao)
        VALUES (
            nomes[ floor(random() * array_length(nomes, 1))::int + 1 ],
            sobrenomes[ floor(random() * array_length(sobrenomes, 1))::int + 1 ],
            DATE '1970-01-01' + (trunc(random() * 15000)::int) * INTERVAL '1 day',
            lpad(i::text, 11, '0'),
            'email' || i || '@empresa.com',
            '1199' || lpad((100000 + i)::text, 6, '0'),
            'Cargo_' || (i % 10),
            (3000 + (i * 50)),
            CURRENT_DATE - (i * INTERVAL '5 days')
        );
    END LOOP;
END $$;

SELECT * FROM empresa.funcionarios;

select * from empresa.departamentos;

select * from empresa.ferias;

select * from empresa.funcionarios;

select * from empresa.estoque;

select
nome,
sobrenome,
salario,
data_nascimento
from empresa.funcionarios
order by nome
limit 100;


select 
nome,
sobrenome,
salario
from empresa.funcionarios
order by sobrenome desc;

select 
nome
sobrenome,
salario
from empresa.funcionarios
order by salario;








INSERT INTO empresa.departamentos (nome, descricao, gerente_id, data_criacao)
VALUES
('TI', 'Tecnologia da Informação', 1, '2017-01-01'),
('RH', 'Recursos Humanos', 2, '2017-01-01'),
('Financeiro', 'Setor Financeiro', 3, '2017-01-01'),
('Marketing', 'Departamento de Marketing', 4, '2017-01-01'),
('Vendas', 'Departamento de Vendas', 5, '2017-01-01');


DO $$
DECLARE
    status_arr TEXT[] := ARRAY['Em andamento', 'Concluído', 'Cancelado', 'Pausado'];
    prioridades INT[] := ARRAY[1,2,3,4,5];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.projetos (nome, descricao, data_inicio, data_fim, orcamento, status, gerente_id, cliente_id, prioridade)
        VALUES (
            'Projeto_' || i,
            'Descrição do projeto ' || i,
            CURRENT_DATE - (i * INTERVAL '30 days'),
            CURRENT_DATE + ((i % 12) * INTERVAL '30 days'),
            100000 + (i * 1000),
            status_arr[ floor(random() * array_length(status_arr, 1))::int + 1 ],
            (i % 20) + 1,
            (i % 500) + 1,
            prioridades[ floor(random() * array_length(prioridades, 1))::int + 1 ]
        );
    END LOOP;
END $$;

DO $$
DECLARE
    tipos TEXT[] := ARRAY['Jurídica', 'Física'];
    cidades TEXT[] := ARRAY['São Paulo','Rio de Janeiro','Belo Horizonte','Curitiba','Porto Alegre','Fortaleza','Salvador','Brasília','Manaus','Recife'];
    estados TEXT[] := ARRAY['SP','RJ','MG','PR','RS','CE','BA','DF','AM','PE'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.clientes (nome, tipo_pessoa, cnpj_cpf, endereco, cidade, estado, telefone, email, data_cadastro)
        VALUES (
            'Cliente_' || i,
            tipos[ floor(random() * array_length(tipos, 1))::int + 1 ],
            lpad(i::text, 14, '0'),
            'Rua ' || i,
            cidades[ floor(random() * array_length(cidades, 1))::int + 1 ],
            estados[ floor(random() * array_length(estados, 1))::int + 1 ],
            '11' || lpad((10000000 + i)::text, 8, '0'),
            'cliente' || i || '@email.com',
            CURRENT_DATE - (i * INTERVAL '3 days')
        );
    END LOOP;
END $$;
DO $$
DECLARE
    cidades TEXT[] := ARRAY[
        'São Paulo','Rio de Janeiro','Belo Horizonte','Curitiba','Porto Alegre',
        'Salvador','Fortaleza','Brasília','Manaus','Recife',
        'Goiânia','Belém','Campinas','São Luís','São Gonçalo',
        'Maceió','Duque de Caxias','Natal','Teresina','Campo Grande',
        'João Pessoa','São Bernardo do Campo','Nova Iguaçu','Santo André','Osasco',
        'São José dos Campos','Jaboatão dos Guararapes','Ribeirão Preto','Uberlândia','Contagem',
        'Aracaju','Feira de Santana','Cuiabá','Joinville','Aparecida de Goiânia',
        'Londrina','Ananindeua','Niterói','Belford Roxo','Caxias do Sul'
    ];
    estados TEXT[] := ARRAY[
        'SP','RJ','MG','PR','RS','BA','CE','DF','AM','PE',
        'GO','PA','MA','PB','PI','MS','SE','SC','ES','RJ'
    ];
    paises TEXT[] := ARRAY[
        'Brasil','Argentina','Chile','Uruguai','Paraguai','Bolívia','Peru','Colômbia','Equador','Venezuela'
    ];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.fornecedores (nome, contato, telefone, email, endereco, cidade, estado, pais, data_cadastro)
        VALUES (
            'Fornecedor_' || i,
            'Contato_' || i,
            '11' || lpad((10000000 + i)::text, 8, '0'),
            'fornecedor' || i || '@email.com',
            'Avenida ' || i,
            cidades[ floor(random() * array_length(cidades, 1))::int + 1 ],
            estados[ floor(random() * array_length(estados, 1))::int + 1 ],
            paises[ floor(random() * array_length(paises, 1))::int + 1 ],
            CURRENT_DATE - (i * INTERVAL '10 days')
        );
    END LOOP;
END $$;


DO $$
DECLARE
    categorias TEXT[] := ARRAY[
        'Informática', 'Escritório', 'Limpeza', 'Móveis', 'Eletrônicos',
        'Alimentos', 'Bebidas', 'Moda', 'Calçados', 'Esportes',
        'Brinquedos', 'Saúde', 'Beleza', 'Automotivo', 'Construção',
        'Jardinagem', 'Papelaria', 'Telefonia', 'Fotografia', 'Instrumentos Musicais'
    ];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.produtos (nome, descricao, categoria, preco, estoque, fornecedor_id, peso, altura, largura)
        VALUES (
            'Produto_' || i,
            'Descrição do produto ' || i,
            categorias[ floor(random() * array_length(categorias, 1))::int + 1 ],
            10 + (i * 5),
            50 + (i % 100),
            (i % 500) + 1,
            0.5 + (random() * 5),
            5 + (random() * 10),
            10 + (random() * 5)
        );
    END LOOP;
END $$;

DO $$
DECLARE
    codigos_barras TEXT[];
BEGIN
    -- Gerar uma lista de códigos de barras fictícios
    codigos_barras := ARRAY[
        '7891234567890', '7891234567891', '7891234567892', '7891234567893', '7891234567894',
        '7891234567895', '7891234567896', '7891234567897', '7891234567898', '7891234567899'
    ];
    
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.itens_venda (
            venda_id, produto_id, quantidade, preco_unitario, desconto, subtotal, imposto, codigo_barras, garantia
        )
        VALUES (
            (i % 500) + 1,
            (i % 500) + 1,
            (1 + (random() * 20))::int,
            10 + (random() * 200),
            (random() * 15)::numeric(10,2),
            50 + (random() * 1000),
            (random() * 18)::numeric(10,2),
            codigos_barras[ floor(random() * array_length(codigos_barras, 1))::int + 1 ],
            (i % 24) + 1
        );
    END LOOP;
END $$;

DO $$
DECLARE
    locais TEXT[] := ARRAY[
        'Depósito Central', 'Filial Norte', 'Filial Sul', 'Filial Leste', 'Filial Oeste',
        'Armazém A', 'Armazém B', 'Armazém C', 'Ponto de Venda 1', 'Ponto de Venda 2'
    ];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.estoque (
            produto_id, quantidade, data_entrada, data_saida, localizacao, lote, validade, fornecedor_id, custo_unitario
        )
        VALUES (
            (i % 500) + 1,
            20 + (i % 150),
            CURRENT_DATE - (i * INTERVAL '1 day'),
            NULL,
            locais[ floor(random() * array_length(locais, 1))::int + 1 ],
            'Lote_' || lpad(i::text, 5, '0'),
            CURRENT_DATE + ((i % 365) * INTERVAL '1 day'),
            (i % 500) + 1,
            10 + (random() * 100)
        );
    END LOOP;
END $$;



DO $$
DECLARE
    formas_pagamento TEXT[] := ARRAY['Dinheiro', 'Cartão de Crédito', 'Boleto', 'Transferência Bancária'];
    status_arr TEXT[] := ARRAY['Pago', 'Pendente', 'Cancelado', 'Em Análise'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.pagamentos (
            venda_id, data_pagamento, valor_pago, forma_pagamento, status, referencia, observacoes, funcionario_id, cliente_id
        )
        VALUES (
            (i % 500) + 1,
            CURRENT_DATE - (i * INTERVAL '1 day'),
            100 + (random() * 5000),
            formas_pagamento[ floor(random() * array_length(formas_pagamento, 1))::int + 1 ],
            status_arr[ floor(random() * array_length(status_arr, 1))::int + 1 ],
            'REF' || lpad(i::text, 8, '0'),
            'Observação do pagamento ' || i,
            (i % 500) + 1,
            (i % 500) + 1
        );
    END LOOP;
END $$;

DO $$
DECLARE
    status_arr TEXT[] := ARRAY['Pendente', 'Pago', 'Cancelado'];
    formas_pagamento TEXT[] := ARRAY['Dinheiro', 'Cartão', 'Boleto', 'Transferência'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.contas_pagar (
            fornecedor_id, descricao, valor, data_vencimento, data_pagamento, status, forma_pagamento, observacoes, funcionario_id
        )
        VALUES (
            (i % 500) + 1,
            'Conta a pagar número ' || i,
            100 + (random() * 1000),
            CURRENT_DATE + ((i % 30) * INTERVAL '1 day'),
            CASE WHEN random() < 0.7 THEN CURRENT_DATE + ((i % 25) * INTERVAL '1 day') ELSE NULL END,
            status_arr[ floor(random() * array_length(status_arr, 1))::int + 1 ],
            formas_pagamento[ floor(random() * array_length(formas_pagamento, 1))::int + 1 ],
            'Observação ' || i,
            (i % 500) + 1
        );
    END LOOP;
END $$;




DO $$
DECLARE
    status_arr TEXT[] := ARRAY['Pendente', 'Recebido', 'Cancelado'];
    formas_pagamento TEXT[] := ARRAY['Dinheiro', 'Cartão', 'Boleto', 'Transferência'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.contas_receber (
            cliente_id, descricao, valor, data_vencimento, data_pagamento, status, forma_pagamento, observacoes, funcionario_id
        )
        VALUES (
            (i % 500) + 1,
            'Conta a receber número ' || i,
            200 + (random() * 1500),
            CURRENT_DATE + ((i % 30) * INTERVAL '1 day'),
            CASE WHEN random() < 0.8 THEN CURRENT_DATE + ((i % 20) * INTERVAL '1 day') ELSE NULL END,
            status_arr[ floor(random() * array_length(status_arr, 1))::int + 1 ],
            formas_pagamento[ floor(random() * array_length(formas_pagamento, 1))::int + 1 ],
            'Observação ' || i,
            (i % 500) + 1
        );
    END LOOP;
END $$;



DO $$
DECLARE
    cidades TEXT[] := ARRAY[
        'São Paulo','Rio de Janeiro','Belo Horizonte','Curitiba','Porto Alegre',
        'Salvador','Fortaleza','Brasília','Manaus','Recife'
    ];
    estados TEXT[] := ARRAY['SP','RJ','MG','PR','RS','BA','CE','DF','AM','PE'];
    paises TEXT[] := ARRAY['Brasil','Argentina','Chile','Uruguai','Paraguai'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.transportadoras (
            nome, telefone, email, endereco, cidade, estado, pais, contato, data_cadastro
        )
        VALUES (
            'Transportadora_' || i,
            '11' || lpad((900000000 + i)::text, 8, '0'),
            'transp' || i || '@email.com',
            'Rua Transporte ' || i,
            cidades[ floor(random() * array_length(cidades, 1))::int + 1 ],
            estados[ floor(random() * array_length(estados, 1))::int + 1 ],
            paises[ floor(random() * array_length(paises, 1))::int + 1 ],
            'Contato_' || i,
            CURRENT_DATE - (i * INTERVAL '15 days')
        );
    END LOOP;
END $$;



DO $$
DECLARE
    status_arr TEXT[] := ARRAY['Em trânsito', 'Entregue', 'Cancelada', 'Pendente'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.entregas (
            venda_id, transportadora_id, data_entrega, status, endereco_entrega, rastreamento, observacoes, funcionario_id, cliente_id
        )
        VALUES (
            (i % 500) + 1,
            (i % 500) + 1,
            CURRENT_DATE + ((i % 10) * INTERVAL '1 day'),
            status_arr[ floor(random() * array_length(status_arr, 1))::int + 1 ],
            'Endereço entrega ' || i,
            'Rastreamento_' || i,
            'Observação ' || i,
            (i % 500) + 1,
            (i % 500) + 1
        );
    END LOOP;
END $$;


DO $$
DECLARE
    status_arr TEXT[] := ARRAY['Aprovado', 'Reprovado', 'Pendente'];
    tipos_avaliacao TEXT[] := ARRAY['Anual', 'Semestral', 'Trimestral'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.avaliacoes (
            funcionario_id, data_avaliacao, nota, comentario, avaliador_id, departamento_id, projeto_id, status, tipo_avaliacao
        )
        VALUES (
            (i % 500) + 1,
            CURRENT_DATE - ((i % 365) * INTERVAL '1 day'),
            (1 + (random() * 9))::int,
            'Comentário da avaliação ' || i,
            ((i + 10) % 500) + 1,
            ((i % 5) + 1),
            ((i % 500) + 1),
            status_arr[ floor(random() * array_length(status_arr, 1))::int + 1 ],
            tipos_avaliacao[ floor(random() * array_length(tipos_avaliacao, 1))::int + 1 ]
        );
    END LOOP;
END $$;



DO $$
DECLARE
    status_arr TEXT[] := ARRAY['Aprovada', 'Pendente', 'Cancelada'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.ferias (
            funcionario_id, data_inicio, data_fim, status
        )
        VALUES (
            (i % 500) + 1,
            CURRENT_DATE + ((i % 365) * INTERVAL '1 day'),
            CURRENT_DATE + ((i % 365 + 30) * INTERVAL '1 day'),
            status_arr[ floor(random() * array_length(status_arr, 1))::int + 1 ]
        );
    END LOOP;
END $$;

DO $$
DECLARE
    acoes TEXT[] := ARRAY['Login', 'Logout', 'Cadastro', 'Alteração', 'Exclusão'];
    status_arr TEXT[] := ARRAY['Sucesso', 'Falha'];
    tipos_acao TEXT[] := ARRAY['Usuário', 'Sistema'];
    navegadores TEXT[] := ARRAY['Chrome', 'Firefox', 'Edge', 'Safari'];
    sistemas_operacionais TEXT[] := ARRAY['Windows', 'Linux', 'MacOS'];
    categorias TEXT[] := ARRAY['Segurança', 'Operacional', 'Erro'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.logs (
            usuario_id, acao, data_hora, ip, pagina, detalhes, status, tipo_acao, duracao,
            navegador, sistema_operacional, versao_app, dispositivo, localizacao, erro_codigo,
            erro_descricao, responsavel_id, observacoes, categoria
        )
        VALUES (
            (i % 500) + 1,
            acoes[ floor(random() * array_length(acoes, 1))::int + 1 ],
            CURRENT_TIMESTAMP - ((i % 1000) * INTERVAL '1 minute'),
            '192.168.1.' || (i % 255),
            '/pagina' || (i % 20),
            'Detalhes da ação ' || i,
            status_arr[ floor(random() * array_length(status_arr, 1))::int + 1 ],
            tipos_acao[ floor(random() * array_length(tipos_acao, 1))::int + 1 ],
            (random() * 1000)::int,
            navegadores[ floor(random() * array_length(navegadores, 1))::int + 1 ],
            sistemas_operacionais[ floor(random() * array_length(sistemas_operacionais, 1))::int + 1 ],
            'v1.0.' || (i % 10),
            'Dispositivo ' || i,
            'Localização ' || i,
            CASE WHEN random() < 0.1 THEN (random() * 1000)::int ELSE NULL END,
            CASE WHEN random() < 0.1 THEN 'Erro exemplo ' || i ELSE NULL END,
            ((i + 10) % 500) + 1,
            'Observação ' || i,
            categorias[ floor(random() * array_length(categorias, 1))::int + 1 ]
        );
    END LOOP;
END $$;



DO $$
DECLARE
    status_arr TEXT[] := ARRAY['Enviado', 'Recebido', 'Erro'];
    prioridades INT[] := ARRAY[1, 2, 3, 4, 5];
    tipos_email TEXT[] := ARRAY['Comercial', 'Pessoal', 'Suporte'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.emails (
            remetente, destinatario, assunto, corpo, data_envio, status, prioridade, tipo_email, resposta_para
        )
        VALUES (
            'remetente' || i || '@empresa.com',
            'destinatario' || i || '@empresa.com',
            'Assunto do email ' || i,
            'Corpo do email número ' || i,
            CURRENT_TIMESTAMP - ((i % 1000) * INTERVAL '1 minute'),
            status_arr[ floor(random() * array_length(status_arr, 1))::int + 1 ],
            prioridades[ floor(random() * array_length(prioridades, 1))::int + 1 ],
            tipos_email[ floor(random() * array_length(tipos_email, 1))::int + 1 ],
            CASE WHEN random() < 0.3 THEN 'resposta' || i || '@empresa.com' ELSE NULL END
        );
    END LOOP;
END $$;


DO $$
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.permissoes (
            nome, descricao, nivel_acesso, ativo
        )
        VALUES (
            'Permissão_' || i,
            'Descrição da permissão ' || i,
            (i % 10) + 1,
            (random() > 0.2)
        );
    END LOOP;
END $$;



DO $$
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.funcionarios_departamentos (
            funcionario_id, departamento_id, data_inicio, data_fim
        )
        VALUES (
            (i % 500) + 1,
            ((i % 5) + 1),
            CURRENT_DATE - ((i % 100) * INTERVAL '1 day'),
            CASE WHEN random() < 0.3 THEN CURRENT_DATE + ((i % 50) * INTERVAL '1 day') ELSE NULL END
        );
    END LOOP;
END $$;


DO $$
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.metas (
            descricao, valor_meta, data_inicio, data_fim
        )
        VALUES (
            'Meta número ' || i,
            10000 + (random() * 50000),
            CURRENT_DATE - ((i % 60) * INTERVAL '1 day'),
            CURRENT_DATE + ((i % 90) * INTERVAL '1 day')
        );
    END LOOP;
END $$;



DO $$
DECLARE
    status_arr TEXT[] := ARRAY['Aprovado', 'Reprovado', 'Pendente'];
    tipos_avaliacao TEXT[] := ARRAY['Anual', 'Semestral', 'Trimestral'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.avaliacoes (
            funcionario_id, data_avaliacao, nota, comentario, avaliador_id, departamento_id, projeto_id, status, tipo_avaliacao
        )
        VALUES (
            (i % 500) + 1,
            CURRENT_DATE - ((i % 365) * INTERVAL '1 day'),
            (1 + (random() * 9))::int,
            'Comentário da avaliação ' || i,
            ((i + 10) % 500) + 1,
            ((i % 5) + 1),
            ((i % 500) + 1),
            status_arr[ floor(random() * array_length(status_arr, 1))::int + 1 ],
            tipos_avaliacao[ floor(random() * array_length(tipos_avaliacao, 1))::int + 1 ]
        );
    END LOOP;
END $$;



DO $$
DECLARE
    status_arr TEXT[] := ARRAY['Aprovada', 'Pendente', 'Cancelada'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.ferias (
            funcionario_id, data_inicio, data_fim, status
        )
        VALUES (
            (i % 500) + 1,
            CURRENT_DATE + ((i % 365) * INTERVAL '1 day'),
            CURRENT_DATE + ((i % 365 + 30) * INTERVAL '1 day'),
            status_arr[ floor(random() * array_length(status_arr, 1))::int + 1 ]
        );
    END LOOP;
END $$;



DO $$
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO empresa.cargos (
            nome, descricao, salario_minimo, salario_maximo
        )
        VALUES (
            'Cargo_' || i,
            'Descrição do cargo ' || i,
            1500 + (random() * 2000),
            3000 + (random() * 5000)
        );
    END LOOP;
END $$;



