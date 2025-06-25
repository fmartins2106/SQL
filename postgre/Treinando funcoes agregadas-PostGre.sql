select * from empresa.cargos 
limit 450

select count(*) from empresa.auditorias a 

-- fazendo maximo, minimo, soma e media de um campo em especifico.

select MIN(v.total) as minimo from empresa.vendas v  

select MAX( v.total ) as maximo from empresa.vendas v 

select SUM(v.total) as soma from empresa.vendas v

select AVG(v.total)  as media from empresa.vendas v  


-- utilização do group by

select count(*) as contador,
c.nome,
c.tipo_pessoa
from empresa.clientes c 
group by c.nome,c.tipo_pessoa ; 


select 
v.cliente_id,
c.nome,
SUM(v.total) as soma_vendas
from empresa.vendas v
inner join empresa.clientes c 
on c.cliente_id = v.cliente_id
group by v.cliente_id ,c.nome
order by v.cliente_id 


select
c.cliente_id,
c.nome,
sum(v.total)  as soma_vendas
from empresa.vendas v
inner join empresa.clientes c 
on c.cliente_id = v.cliente_id
where (v.data_venda >= '2000-01-01' and v.data_venda  <= '2025-01-01')
group by c.cliente_id,c.nome
order by c.nome desc



select COUNT(*) as contador,
f.nome,
f.sobrenome
from empresa.funcionarios f
where f.nome is not null
group by f.nome, f.sobrenome

select * from empresa.funcionarios f 
where f.data_admissao between '1996-01-01' and '2010-01-01'
order by f.data_admissao





select * from 
limit 40


select * from empresa.funcionarios f  







select * from empresa.vendas v 
limit 40



DO $$
DECLARE
    i INT := 1;
    nomes TEXT[] := ARRAY[
        'Ana','João','Carlos','Mariana','Lucas','Fernanda','Ricardo','Patrícia','Rafael','Juliana',
        'Mateus','Camila','Bruno','Larissa','Gabriel','Letícia','Thiago','Amanda','Fábio','Bianca',
        'Sérgio','Cláudia','Roberto','Renata','Vinícius','Isabela','Eduardo','Vanessa','Daniel','Tatiane'
    ];
    sobrenomes TEXT[] := ARRAY[
        'Silva','Souza','Oliveira','Santos','Pereira','Lima','Carvalho','Ferreira','Costa','Gomes',
        'Ribeiro','Martins','Araújo','Almeida','Nascimento','Barbosa','Rocha','Dias','Moura','Teixeira',
        'Freitas','Pinto','Monteiro','Batista','Campos','Rezende','Macedo','Andrade','Farias','Assis'
    ];
BEGIN
    WHILE i <= 500 LOOP
        INSERT INTO empresa.funcionarios (
            nome, 
            sobrenome, 
            data_nascimento, 
            cpf, 
            email, 
            telefone, 
            cargo_id, 
            departamento_id, 
            salario, 
            data_admissao
        )
        VALUES (
            -- nome e sobrenome aleatórios
            nomes[ceil(random() * array_length(nomes, 1))],
            sobrenomes[ceil(random() * array_length(sobrenomes, 1))],

            -- data_nascimento entre 1960-01-01 e 2000-12-31
            date '1960-01-01' + (trunc(random() * (365 * 40)))::INT,

            -- CPF fictício (11 números formatados sem pontos e traços)
            lpad((trunc(random() * 100000000000))::TEXT, 11, '0'),

            -- email gerado com nome.sobrenome + i
            lower(
                nomes[ceil(random() * array_length(nomes, 1))] || '.' ||
                sobrenomes[ceil(random() * array_length(sobrenomes, 1))] ||
                i || '@emailfalso.com'
            ),

            -- telefone fictício (ex.: (41)98888-1234)
            '(' || (10 + trunc(random() * 90))::TEXT || ')' ||
            (90000 + trunc(random() * 9999))::TEXT || '-' ||
            (1000 + trunc(random() * 8999))::TEXT,

            -- cargo_id entre 1 e 10
            trunc(random() * 9 + 1)::INT,

            -- departamento_id entre 1 e 10
            trunc(random() * 9 + 1)::INT,

            -- salario entre 1500,00 e 20000,00
            round((random() * (20000 - 1500) + 1500)::NUMERIC, 2),

            -- data_admissao entre 2000-01-01 e 2024-12-31
            date '2000-01-01' + (trunc(random() * (365 * 24)))::INT
        );
        i := i + 1;
    END LOOP;
END $$;

SET default_transaction_read_only = off;

SET transaction read write;


SELECT * FROM empresa.cargos;

SELECT * FROM empresa.departamentos;


DO $$
DECLARE
    i INT := 1;
    nomes TEXT[] := ARRAY[
        'Ana','João','Carlos','Mariana','Lucas','Fernanda','Ricardo','Patrícia','Rafael','Juliana',
        'Mateus','Camila','Bruno','Larissa','Gabriel','Letícia','Thiago','Amanda','Fábio','Bianca',
        'Sérgio','Cláudia','Roberto','Renata','Vinícius','Isabela','Eduardo','Vanessa','Daniel','Tatiane'
    ];
    sobrenomes TEXT[] := ARRAY[
        'Silva','Souza','Oliveira','Santos','Pereira','Lima','Carvalho','Ferreira','Costa','Gomes',
        'Ribeiro','Martins','Araújo','Almeida','Nascimento','Barbosa','Rocha','Dias','Moura','Teixeira',
        'Freitas','Pinto','Monteiro','Batista','Campos','Rezende','Macedo','Andrade','Farias','Assis'
    ];
BEGIN
    WHILE i <= 500 LOOP
        INSERT INTO empresa.funcionarios (
            nome, 
            sobrenome, 
            data_nascimento, 
            cpf, 
            email, 
            telefone, 
            cargo_id, 
            departamento_id, 
            salario, 
            data_admissao
        )
        VALUES (
            -- Nome e sobrenome aleatórios
            nomes[ceil(random() * array_length(nomes, 1))],
            sobrenomes[ceil(random() * array_length(sobrenomes, 1))],

            -- Data de nascimento aleatória entre 1960 e 2000
            date '1960-01-01' + (trunc(random() * (365 * 40)))::INT,

            -- CPF fictício (11 dígitos)
            lpad((trunc(random() * 100000000000))::TEXT, 11, '0'),

            -- Email gerado
            lower(
                nomes[ceil(random() * array_length(nomes, 1))] || '.' ||
                sobrenomes[ceil(random() * array_length(sobrenomes, 1))] ||
                i || '@emailfalso.com'
            ),

            -- Telefone fictício
            '(' || (10 + trunc(random() * 90))::TEXT || ')' ||
            (90000 + trunc(random() * 9999))::TEXT || '-' ||
            (1000 + trunc(random() * 8999))::TEXT,

            -- cargo_id válido entre 2467 e 2477
            (trunc(random() * 11) + 2467)::INT,

            -- departamento_id válido entre 879 e 888
            (trunc(random() * 10) + 879)::INT,

            -- Salário entre 1.500,00 e 20.000,00
            round((random() * (20000 - 1500) + 1500)::NUMERIC, 2),

            -- Data de admissão aleatória entre 2000 e 2024
            date '2000-01-01' + (trunc(random() * (365 * 24)))::INT
        );

        i := i + 1;
    END LOOP;
END $$;



