select now() /*data completa com milisecundos e fusohorario  */

select now()

SELECT
    EXTRACT(YEAR FROM NOw()) AS ano,
    EXTRACT(month from now()) as mês,
    EXTRACT(DAY from now()) as dia,
    extract(HOUR FROM NOW()) as HORA,
    EXTRACT(minute from now()) as minuto,
    extract(second from now()) as segundos

select
    extract(year from now()),
    EXTRACT(month from now()),
    EXTRACT(day from now())

SELECT
    EXTRACT(DAY FROM NOW()),
    EXTRACT(MONTH FROM NOW()),
    extract(YEAR FROM NOW())

SELECT
    CASE extract(DOW FROM NOW())   
        WHEN 1 THEN 'Segunda-feira'
        when 2 then 'Terça-feira'
        when 3 then 'Quarta-feira'
    end as "Dia da semana"

SELECT
    CASE EXTRACT (DOW FROM NOW())
        WHEN 0 THEN 'Domingo'
        WHEN 1 THEN 'Segunda-feira'
        WHEN 2 THEN 'Terça-feira'
        WHEN 3 THEN 'Quarta-feira'
        WHEN 4 THEN 'Quinta-feira'
        WHEN 5 THEN 'Sexta-feira'
        WHEN 6 THEN 'Sabádo'
    end 


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
    TO_CHAR(NOW(), 'MONTH') AS "MES"

SELECT
    to_char(now(), 'month') as mes

SELECT  
    TO_CHAR(NOW(), 'MONTH')


SELECT
    CASE EXTRACT(DOW FROM NOW())
        WHEN 1 THEN 'Segunda-feira'
        WHEN 2 THEN 'Terça-feira'
    end as "Dia da semana"



SELECT 
  CASE EXTRACT(DOW FROM NOW())
    WHEN 0 THEN 'domingo'
    WHEN 1 THEN 'segunda-feira'
    WHEN 2 THEN 'terça-feira'
    WHEN 3 THEN 'quarta-feira'
    WHEN 4 THEN 'quinta-feira'
    WHEN 5 THEN 'sexta-feira'
    WHEN 6 THEN 'sábado'
  END AS dia_em_portugues;


SELECT
    CASE EXTRACT(DOW FROM NOW())
        WHEN 0 THEN 'DOMINGO'
        WHEN 1 THEN 'SEGUNDA-FEIRA'
        WHEN 2 THEN 'TERÇA-FEIRA'
        WHEN 3 THEN 'QUARTA-FEIRA'
        WHEN 4 THEN 'QUINTA-FEIRA'
        WHEN 5 THEN 'SEXTA-FEIRA'
        WHEN 6 THEN 'SABÁDO'
    END AS "Dia da semana"

SELECT
    CASE EXTRACT(DOW FROM NOW())
        WHEN 0 THEN 'DOMINGO'
        WHEN 1 THEN 'SEGUNDA-FEIRA'
        WHEN 2 THEN 'TERÇA-FEIRA'
        WHEN 3 THEN 'QUARTA-FEIRA'    
        WHEN 4 THEN 'QUINTA-FEIRA'
        WHEN 5 THEN 'SEXTA-FEIRA'
        WHEN 6 THEN 'SÁBADO'
    END AS "Dia da semana"
 

SELECT 
    TO_CHAR(now(), 'MONTH') AS "Mês"
        


SELECT
    TO_CHAR(NOW(), 'DAY') AS DIA


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
    extract(DAY FROM NOW()) AS DIA,
    TO_CHAR(NOW(), 'MONTH') AS MES,
    EXTRACT(YEAR FROM NOW()) AS ANO


SELECT
    extract(YEAR FROM now()),
    TO_CHAR(NOW(), 'MONTH'),
    EXTRACT(DAY FROM NOW())




SELECT
    CASE EXTRACT(DOW FROM NOW())
        WHEN 0 THEN 'DOMINGO'
        WHEN 1 THEN 'SEGUNDA-FEIRA'
        WHEN 2 THEN 'TERÇA-FEIRA'
    END AS "Dia da semana"


SELECT
    (NOW():: DATE - DATE '1985-06-21') "TOTAL DE DIAS"

SELECT
    (NOW():: DATE - DATE '1985-06-21') AS TOTAL_DIAS;

SELECT
    (NOW():: DATE - DATE '2024-01-20') AS TOTAL_DIAS;

select
    (now():: date - date '2025-02-02') as T0TAL_DIAS


SELECT
    (now():: date - date '2021-01-02') as "TOTAL DE DIAS"

SELECT
    (NOW():: DATE - DATE '2021-01-02') AS "TOTAL DE DIAS"

SELECT
    (NOW():: DATE - DATE '2021-01-01') AS "TOTAL DE DIAS"

SELECT
    (NOW()::DATE - DATE '2025-01-01') AS "Total de dias"

SELECT
    (NOW():: DATE - DATE '2024-11-01') AS "TOTAL DE DIAS DE ESTUDO EM JAVA"



SELECT
    (NOW():: DATE - DATE '2024-02-02') AS "Total de dias"


SELECT
    (NOW():: DATE - DATE '2020-10-10') AS "TOTAL DE DIAS"


SELECT 
    CASE extract(DOW FROM NOW())
        WHEN 0 THEN 'DOMINGO'
        WHEN 1 THEN 'SEGUNDA-FEIRA'
        WHEN 2 THEN 'TERÇA-FEIRA'
    END AS "Dia da semana"

select
    TO_CHAR(NOW(), 'MONTH') AS MES

SELECT
    (NOW():: DATE - DATE '2020-02-02') AS TOTAL_DIAS


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
nome || ' ' || sobrenome as "Nome Completo",
    DATE_PART('YEAR',age(now(), data_nascimento)) as Idade
from empresa.funcionarios


select * from empresa.funcionarios limit 30


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


SELECT
    nome || ' '|| sobrenome,
    DATE_PART('YEAR', AGE(NOW(),data_nascimento)) as "Idade"
from empresa.funcionarios
ORDER BY "Idade" desc

select
    nome,
    sobrenome,
    DATE_PART('YEAR', AGE(NOW(),data_nascimento)) as "Idade"
from empresa.funcionarios



select * FROM empresa.funcionarios
limit 20


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

select 
    TABLE_NAME AS "NOME DA TABELAS"
    FROM information_schema.TABLES
    where TABLE_SCHEMA = 'empresa'
    and table_type = 'BASE TABLE'

SELECT
    TABLE_NAME AS "NOME DAS TABLES"
    from information_schema.TABLES
    where TABLE_SCHEMA = 'empresa'
    and table_type = 'BASE TABLE'


SELECT
    table_name AS "Nome das tableas"
    from information_schema.TABLES
    where table_schema = 'empresa'
    and table_type = 'BASE TABLE'

SELECT
    TABLE_NAME AS "Nome da table"
    from information.schema_tables
    where 


SELECT * FROM empresa.compras
limit 3

select TABLE_NAME AS "NOME DA TABELA"
from information_SCHEMA.TABLES
where table_schema = 'empresa'
and table_type = 'BASE TABLE'


select table_name as "nome da tabela"
from information_schema.tables
where table_schema = 'empresa'
and table_type = 'BASE TABLE'

SELECT TABLE_NAME AS "NOME DA TABLEA"
FROM information_schema.tables
where table_schema = 'empresa'
and table_type = 'BASE TABLE'

select TABLE_NAME AS "NOME DA TABELA"
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'empresa'
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


select date_trunc('month', now()) + INTERVAL '1 MONTH' - INTERVAL
'1 DAY' AS "ÚLTIMO DIA DO MES"

SELECT DATE_TRUNC('MONTH',NOW()) + INTERVAL '1 MONTH' - INTERVAL
'1 DAY' AS "Último dia do mes"

SELECT
    DATE_TRUNC('MONTH',NOW())+ INTERVAL '1 MONTH' - INTERVAL
    '1 DAY' AS ULTIMO_DIA_MES


SELECT 
    DATE_TRUNC('MONTH', DATE '2020-01-08') + INTERVAL '1 MONTH' -
    INTERVAL '1 DAY' AS "ULTIMO DIA DO MES"

SELECT
    DATE_TRUNC('MONTH', DATE '2022-01-12') + INTERVAL '1 MONTH' -
    INTERVAL '1 DAY' AS "ULTIMO DIA DO MES"

SELECT
    DATE_TRUNC('MONTH', DATE '2020-09-19') + INTERVAL '1 MONTH'
    - INTERVAL '1 DAY' AS "último dia do mes"


SELECT
    DATE_PART('YEAR',AGE(NOW(), DATE '2020-02-02')) AS IDADE


select
    (now():: DATE - DATE '2021-01-19') as total_dias


SELECT
    TO_CHAR(NOW(),'DAY')

SELECT
    DATE_PART('YEAR',AGE(NOW(), DATE '2020-07-02')) AS IDADE,
    DATE_PART('MONTH',AGE(NOW(), DATE '2020-07-02')) AS MES


SELECT
    DATE_PART('MONTH',AGE(NOW(), DATE '2020-02-02')) AS TOTAL_ANOS

SELECT
    TO_CHAR(NOW(), 'MONTH') AS MES


SELECT
    DATE_PART('YEAR',AGE(NOW(), '2022-01-02')) AS TOTA_ANOS

SELECT
    (NOW():: DATE - DATE '2023-02-01' ) AS TOTAL_DIAS

SELECT
    CASE EXTRACT(DOW FROM NOW())
        WHEN 0 THEN 'DOMINGO'
        WHEN 1 THEN 'SEGUNDA'
        WHEN 2 THEN 'TERÇA-FEIRA'
    END AS "Dia da semana"



SELECT
    DATE_TRUNC('MONTH', DATE '2024-02-02') + INTERVAL '1 MONTH' -
    INTERVAL '1 DAY' AS "último dia do mês"


select
    date_trunc('month', DATE '2022-02-20') + INTERVAL '1 MONTH' -
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