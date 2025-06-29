select now() /*data completa com milisecundos e fusohorario  */

SELECT
    EXTRACT(YEAR FROM NOW()) AS ANO,
    EXTRACT(MONTH FROM NOW()) AS MES,
    EXTRACT(DAY FROM NOW()) AS DIA,
    EXTRACT(MINUTE FROM NOW()) AS MINUTO,
    EXTRACT(HOUR FROM NOW()) AS HORA

SELECT 
    EXTRACT(YEAR FROM NOW()) AS ANO

SELECT NOW()

SELECT
EXTRACT(CENTURY FROM NOW()) SELCULO,
    EXTRACT(YEAR FROM NOW()) AS ANO,
    EXTRACT(MONTH FROM NOW()) AS MES,
    EXTRACT(DAY FROM NOW()) AS DIA,
    EXTRACT(MINUTE FROM NOW()) AS MINUTO,
    EXTRACT(SECOND FROM NOW()) AS SECUNDO

SELECT
    TO_CHAR(NOW(),'MONTH') AS NOME_DO_MES

SELECT
    TO_CHAR(NOW(),'MONTH') as nome_do_mes


SELECT
    TO_CHAR(NOW(),'MONTH') AS Mes_do_ano,
    EXTRACT(YEAR FROM NOW()) AS ANO

SELECT
    (NOW():: DATE - DATE '1985-06-21') AS TOTAL_DIAS;

SELECT
    (NOW():: DATE - DATE '1985-01-01') As total_dias;

SELECT
(NOW():: DATE - DATE '1986-01-01') AS TOTAL_DE_DIAS;

SELECT
    nome,
    sobrenome,
    data_nascimento,
    DATE_PART('month', AGE(NOW(), data_nascimento)) AS DIF_MESES,
    DATE_PART('year', AGE(NOW(), data_nascimento)) as DIF_ANO,
    (NOW():: date - data_nascimento::date) as dif_dias
from empresa.funcionarios;

SELECT
    cliente_id,
    data_venda,
    DATE_PART('month',AGE(NOW(), data_venda)) as DIF_MESES,
    DATE_PART('year',AGE(NOW(), data_venda)) as DIF_ANO,
    total
from empresa.vendas;



SELECT
    v.cliente_id,
    v.venda_id,
    v.total,
    c.nome,
    v.data_venda,
    DATE_PART('MONTH', AGE(NOW(), data_venda)) as "DIFERENÇA MESES",
    DATE_PART('YEAR', AGE(NOW(), data_venda)) as "DIFERENÇA ANO"
from empresa.vendas v
inner join empresa.clientes c
on v.cliente_id = c.cliente_id
ORDER BY v.cliente_id


select 
    f.funcionario_id,
    f.nome,
    f.sobrenome,
    f.data_nascimento,
    f.cpf,
    DATE_PART('MONTH',AGE(NOW(), f.data_nascimento)) as "Diferença meses",
    DATE_PART('YEAR', AGE(NOW(), f.data_nascimento)) as "Diferença anos"
from empresa.funcionarios f


SELECT
    f.funcionario_id,
    f.nome,
    f.sobrenome,
    f.data_nascimento,
    f.cpf,
    DATE_PART('YEAR',age(now(), f.data_nascimento)) as "Idade"
from empresa.funcionarios f

select now()

select
    EXTRACT(YEAR FROM NOW()),
    EXTRACT(MONTH FROM NOW()),
    EXTRACT(DAY FROM NOW())

SELECT * FROM empresa.clientes
limit 3

select TABLE_NAME AS "NOME DAS TABELAS"
from information_SCHEMA.TABLES
where TABLE_SCHEMA = 'empresa'
and table_Type = 'BASE TABLE'

SELECT * FROM empresa.compras
limit 3


select
    c.fornecedor_id,
    f.nome,
    c.data_compra,
    DATE_PART('YEAR',age(NOW(), c.data_compra)) as "Diferença última compra(anos)",
    DATE_PART('MONTH', age(NOW(), c.data_compra)) as "Diferença última compra(mês)"
from empresa.compras c
inner join empresa.fornecedores f
on c.fornecedor_id = f.fornecedor_id
GROUP by c.fornecedor_id,f.nome,c.data_compra
order by f.nome;

select * from empresa.fornecedores



select * from empresa.funcionarios


SELECT * from empresa.vendas
limit 3