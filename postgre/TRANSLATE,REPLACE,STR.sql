

SELECT
    REPLACE('A melhor seleção do mundo é o Brasil ?', 'ç', 'c'),
    TRANSLATE('A melhor seleção do mundo é o Brasil ?', 'ça é ?', 'ca e !');

    SELECT
    "BusinessEntityID",
    CAST("RateChangeDate" AS DATE) AS "RateChangeDate",
    CAST("Rate" AS VARCHAR(10)) AS "RATE2",
    "Rate",
    TO_CHAR("Rate", 'FM999990.00') AS "STR",
    "PayFrequency"
FROM "HumanResources"."EmployeePayHistory";



SELECT * from empresa.funcionarios limit 23


SELECT
    nome || ' ' || sobrenome,
    data_nascimento,
    DATE_PART('YEAR',AGE(NOW(), data_nascimento)) as "Idade",
    (NOW()::DATE - data_nascimento) as "Total de dias desde o nascimento",
    LENGTH("nome") AS "Total de caracteres do nome"
from empresa.funcionarios 


select * from empresa.clientes limit 23


SELECT
    nome,
    tipo_pessoa,
    cnpj_cpf,
    POSITION('@' IN "email") AS "Posição do @",
    RIGHT("email", LENGTH("email") - POSITION('@' in "email")) as Dominimo,
    LEFT("email", LENGTH("email") - POSITION('@' IN "email")-1) as "UserName"
from empresa.clientes


SELECT
    replace(desconto::TEXT, '.', ',')
from empresa.vendas

SELECT
    REPLACE(v.desconto::TEXT, '.',',') AS DESCONTO,
    REPLACE(v.data_venda::TEXT, '-','/') AS ,
    CONCAT_WS(' | ', c.nome,v.forma_pagamento) as "Nome Cliente | Forma de pagamento"
from empresa.vendas v
inner join empresa.clientes c
on v.cliente_id = c.cliente_id


select * from empresa.vendas limit 3
