select * from empresa.clientes
limit 30;

select * from empresa.vendas
limit 30

select
c.cliente_id,
c.nome,
c.tipo_pessoa,
v.data_venda,
v.status,
v.forma_pagamento,
v.total
from empresa.clientes c
inner join empresa.vendas v 
ON v.cliente_id = c.cliente_id
where v.status = 'Finalizada'
and v.data_venda BETWEEN '2020-01-02'  and '2025-12-31'
ORDER By v.total desc;


select COUNT(*) from empresa.vendas;


select 
v.cliente_id as "Código do cliente",
c.nome as "Nome do cliente",
v.status as "Status da venda",
SUM(v.total) as "Total de vendas 2025"
from empresa.vendas v
inner join empresa.clientes c 
on c.cliente_id = v.cliente_id
WHERE v.status = 'Finalizada'
and v.data_venda BETWEEN '2025-01-01' and '2025-12-31' 
GROUP by v.cliente_id,c.nome,v.status
order by "Código do cliente" desc


select * from empresa.vendas
limit 30

select * from empresa.clientes
limit 40


/* SCHEMA PARA SABER AS TABELAS DE UM BANCO DE DADOS */
select table_name  as "Nome das tabelas"
from information_SCHEMA.TABLES
WHERE table_schema  = 'empresa'
 and table_type = 'BASE TABLE'

select table_name  as "Nome das tableas"
from informatioN_SCHEMA.TABLES
where table_schema = 'empresa'
and table_type = 'BASE TABLE'


select table_name  as "Nome das tabelas"
from information_SCHEMA.TABLES
where table_schema = 'empresa'
and table_type = 'BASE TABLE'


select table_name as "Nome das tabelas"
from information_SCHEMA.TABLES
where TABLE_schema = 'empresa'
and TABLE_type = 'BASE TABLE'


SELECT TABLE_NAME AS "Nome das tableas"
from information_SCHEMA.TABLES
where TABLE_schema = 'empresa'
and table_type = 'BASE TABLE'

SELECT TABLE_NAME AS "Nome das tabelas"
from information_SCHEMA.TABLES 
WHERE table_schema = 'empresa'
and TABLE_type = 'BASE TABLE'


select * from empresa.vendas
limit 30

SELECT
v.venda_id as "Código da venda",
v.cliente_id  as "Código do cliente",
v.data_venda as "Data da venda",
v.status as "Status da venda",
v.forma_pagamento as "Forma de pagamento",
case 
    when v.funcionario_id is NULL then 'Não é funcionário'
    end as "Código Funcionário"
from empresa.vendas v
order by "Código da venda";

SELECT
v.venda_id as "Código da venda",
v.cliente_id as "Código do cliente",
v.data_venda as "Data da venda",
v.status as "Status da venda",
CASE
    when v.funcionario_id is NULL then '----'
    end as "Código do funcionário"
from empresa.vendas v
order by "Código da venda"


select COUNT(*)
from empresa.funcionarios f 


select * from empresa.funcionarios
limit 30 

select * from empresa.departamentos
limit 50

select * from empresa.transportadoras
limit 40

select * from empresa.produtos
limit 40

select * from empresa.funcionarios
limit 40

select * from INFORMATION_SCHEMA.COLUMNS
where table_schema = 'empresa'
and table_name = 'funcionarios'

select 
f.nome,
f.sobrenome,
f.nome ||' '|| sobrenome as "Nome completo",
f.data_nascimento,
CASE 
    when AGE(CURRENT_DATE,f.data_nascimento) < INTERVAL '18 years' THEN 'Menor de idade' 
    else 'Maior de idade'
    END AS classificacao
from empresa.funcionarios f
ORDER BY f.data_nascimento desc;


INSERT INTO empresa.funcionarios (
    funcionario_id,
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
) VALUES (
    1001,                                      -- funcionario_id (ajuste conforme necessário)
    'Lucas',
    'Ferreira',
    DATE '2008-07-10',                         -- data_nascimento (17 anos em 2025)
    '123.456.789-00',
    'lucas.ferreira@email.com',
    '(11) 91234-5678',
    2467,                                      -- cargo_id (use um ID válido existente)
    879,                                       -- departamento_id (use um ID válido existente)
    1500.00,                                   -- salário (compatível com menor aprendiz, por exemplo)
    CURRENT_DATE                               -- data_admissao (data atual)
);

ALTER TABLE empresa.funcionarios
ALTER COLUMN cpf TYPE VARCHAR(14);