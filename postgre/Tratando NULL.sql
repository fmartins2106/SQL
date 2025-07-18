SELECT 
    "BusinessEntityID",
    "FirstName",

    -- ISNULL no SQL Server vira COALESCE no PostgreSQL
    COALESCE("MiddleName", '0') AS "MiddleName",

    -- COALESCE aceita vários argumentos no PostgreSQL também
    COALESCE("Title", "MiddleName", "Suffix", "FirstName") AS "colasesce()",

    "LastName",

    -- ISNULL => COALESCE
    COALESCE("Title", '') AS "Title",
    COALESCE("Suffix", '') AS "Sulffix",
    COALESCE("AdditionalContactInfo", '') AS "AddicionalConcactInfo",

    -- TRY_CONVERT(varchar(10), ModifiedDate, 103) → TO_CHAR em formato dd/mm/yyyy
    TO_CHAR("ModifiedDate", 'DD/MM/YYYY') AS "ModifiedDate"

FROM person.person
WHERE "Suffix" IS NOT NULL;

SELECT
cp.conta_pagar_id,
cp.fornecedor_id,
cp.descricao,
cp.valor,
    COALESCE(TO_CHAR(cp.data_pagamento,'DD/MM/YYYY'),'Sem data definida') as "Data de pagamento"
from empresa.contas_pagar cp


select
venda_id,
total,
forma_pagamento,
    COALESCE(funcionario_id,0) as "Código funcionário"
from empresa.vendas
order by venda_id


select * from empresa.vendas limit 30



SELECT 
    TABLE_NAME AS "NOME TABELAS"
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'empresa'
    and table_type = 'BASE TABLE'

select * from empresa.departamentos
limit 2

select * from empresa.contas_pagar limit 3

SELECT * FROM empresa.transportadoras

