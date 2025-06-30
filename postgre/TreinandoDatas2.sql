select now() /*data completa com milisecundos e fusohorario  */

select now()

SELECT
    EXTRACT(YEAR FROM NOw()) AS ano,
    EXTRACT(month from now()) as mês,
    EXTRACT(DAY from now()) as dia,
    extract(HOUR FROM NOW()) as HORA,
    EXTRACT(minute from now()) as minuto,
    extract(second from now()) as segundos


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

SELECT NOW()

SELECT
    EXTRACT(MONTH FROM NOW()) AS "Mês"


select 
    EXTRACT(YEAR FROM NOW()) AS ANO

SELECT
    extract(YEAR FROM NOW()) AS ANO

SELECT
    EXTRACT(DAY FROM NOW()) AS DIA,
    EXTRACT(MONTH FROM NOW()) AS MÈS,
    EXTRACT(YEAR FROM NOW()) AS ANO,
    EXTRACT(HOUR FROM NOW()) AS HORA,
    EXTRACT(MINUTE FROM NOW()) AS MINUTOS,
    EXTRACT(SECOND FROM NOW()) AS SEGUNDOS


SELECT
    TO_CHAR(NOW(),'MONTH') AS NOME_DO_MES

SELECT
    TO_CHAR(NOW(), 'MONTH') AS NOME_DO_MES

SELECT
    to_char(now(),'month') as "nome do mes"

SELECT
    to_char(now(),'month') as "nome do mês"


SELECT
    TO_CHAR(NOW(),'MONTH') AS NOME_DO_MES

SELECT
    TO_CHAR(NOW(),'MONTH') as nome_do_mes


SELECT
    TO_CHAR(NOW(),'MONTH') AS Mes_do_ano,
    EXTRACT(YEAR FROM NOW()) AS ANO

SELECT
    to_char(now(),'month') as mes_do_ano,
    EXTRACT(YEAR FROM NOW()) AS ANO

SELECT
    EXTRACT(DAY from now()) as Dia,
    to_char(NOW(), 'MONTH') AS MES,
    EXTRACT(YEAR FROM NOW()) AS ANO


SELECT
    EXTRACT(DAY FROM NOW()) AS DIA,
    TO_CHAR(NOW(), 'MONTH') AS MES,
    EXTRACT(YEAR FROM NOW()) AS ANO

SELECT
    (NOW():: DATE - DATE '1985-06-21') "TOTAL DE DIAS"

SELECT
    (NOW():: DATE - DATE '1985-06-21') AS TOTAL_DIAS;

SELECT
    (NOW():: DATE - DATE '2024-01-20') AS TOTAL_DIAS;

SELECT
    (NOW():: DATE - DATE '2024-10-10') AS TOTAL_DIAS;


SELECT
    (NOW():: DATE - DATE '01-11-2024') AS TOTAL_DIAS;





SELECT
    (NOW():: DATE - DATE '1985-01-01') As total_dias;

SELECT
(NOW():: DATE - DATE '1986-01-01') AS TOTAL_DE_DIAS;

SELECT
    (NOW()::DATE - DATE '1900-09-01') AS TOTAL_DIAS


SELECT (NOW():: DATE - DATE '1990-09-10') AS TOTAL_DATAS

SELECT(NOW():: DATE - DATE '2020-10-09') AS TOTAL_DIAS

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
    DATE_PART('YEAR',AGE(NOW(), '2024-01-01')) AS ANOS_TOTAIS

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

select TABLE_NAME AS "NOME DA TABELA"
from information_SCHEMA.TABLES
where table_schema = 'empresa'
and table_type = 'BASE TABLE'


SELECT TABLE_NAME AS "NOME DAS TABELAS"
from information_schema.TABLES
where table_schema = 'empresa'
AND table_type = 'BASE TABLE'

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


SELECT
    nome || ' ' || sobrenome,
    DATE_PART('YEAR',age(now(), data_nascimento)) as "Idade"
from empresa.funcionarios

SELECT * FROM empresa.funcionarios
limit 20


SELECT
c.funcionario_id,
c.nome ||' ' || c.sobrenome as "Nome Completo",
c.data_nascimento,
    DATE_PART('year', age(NOW(), c.data_nascimento)) as "Idade"
from empresa.funcionarios c
order by "Idade" desc


select DATE_TRUNC('MONTH',NOW()) + INTERVAL '1 MONTH' - INTERVAL '1 DAY' as eomonth

select DATE_TRUNC('MONTH',NOW()) + INTERVAL '1 MONTH' - INTERVAL
'1 DAY' AS eomonth

select DATE_TRUNC('MONTH',NOW()) + INTERVAL '4 MONTH' - INTERVAL
'1 DAY' as eomnth_neg;

select DATE_TRUNC('MONTH', NOW()) + INTERVAL '1MONTH' - INTERVAL
'1 DAY' AS "ÚLTIMO DIA DO MÊS"

select DATE_TRUNC('MONTH', NOW()) + INTERVAL '1 MONTH' - INTERVAL
'1 DAY' AS ULTIMO_DIA_MES

SELECT DATE_TRUNC('MONTH', NOW()) + INTERVAL '1 MONTH' - INTERVAL
'1 DAY' AS ULTIMO_DIA_DO_MES

SELECT DATE_TRUNC('MONTH', NOW()) + INTERVAL '1 MONTH' - INTERVAL
'1 DAY' as "último dia do mês"

SELECT DATE_TRUNC('MONTH',NOW()) + INTERVAL '1 MONTH' - INTERVAL
'1 DAY' AS "ÚLTIMO DIA DO MÊS"

SELECT DATE_TRUNC('MONTH', DATE '2020-02-22') + INTERVAL '1 MONTH' - INTERVAL '1 DAY' AS "último dia do mês de fevereiro"


SELECT 
    DATE_TRUNC('MONTH', DATE '2020-01-08') + INTERVAL '1 MONTH' -
    INTERVAL '1 DAY' AS "ULTIMO DIA DO MES"

SELECT
    DATE_TRUNC('MONTH', DATE '2024-02-02') + INTERVAL '1 MONTH' -
    INTERVAL '1 DAY' AS "último dia do mês"




SELECT DATE_TRUNC('MONTH', DATE '2024-02-20') + INTERVAL '1 MONTH' -
INTERVAL '1 DAY' AS "Último dia do mês de vefereiro"


select DATE_TRUNC('MONTH', DATE '2024-06-03') + INTERVAL '1MONTH' -
INTERVAL '1 DAY' AS "ÚLTIMO DIA DO MÊS DE JUNHO 2024"


SELECT DATE_TRUNC('MONTH',NOW()) + INTERVAL '1 MONTH' - INTERVAL
'1 DAY' AS "ÚLTIMO DIA DO MÊS"


SELECT DATE_TRUNC('MONTH', DATE '2024-01-02') + INTERVAL '3 MONTH' - 
INTERVAL  '1 DAY' AS "Teste"


SELECT
c.fornecedor_id,
f.nome,
CASE
    when c.funcionario_id is null THEN 'Comprador não informado'
    else c.funcionario_id::TEXT
    end as "Comprador",
    DATE_TRUNC('MONTH', c.data_compra) + INTERVAL '3 MONTH' - INTERVAL  '1 DAY' as "Data da próxima compra"
from empresa.compras c
inner join empresa.fornecedores f
on f.fornecedor_id = c.fornecedor_id


SELECT MAKE_TIMESTAMP(1991,3,1,12,00,23) /* DATA MANUAL */


select * from empresa.fornecedores 
LIMIT 30


select * from empresa.compras
limit 32


select * from empresa.funcionarios
limit 30

SELECT * FROM EMPRESA.CLIENTES
LIMIT 30


select * from empresa.fornecedores



select * from empresa.funcionarios


SELECT * from empresa.vendas
limit 3