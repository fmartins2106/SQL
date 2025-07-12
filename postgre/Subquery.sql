



select * from empresa.funcionarios limit 2

SELECT * FROM empresa.transportadoras limit 2


select * from empresa.fornecedores limit 2

select * from empresa.compras limit 2

SELECT TABLE_NAME AS "NOME DAS TABELAS"
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'empresa'
    and table_type = 'BASE TABLE'



select TABLE_NAME AS "NOME DA TABELA"
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'empresa'
    and table_type = 'BASE TABLE'


SELECT
    nome,
    contato,
    "UserName",
    "Endereço"
    FROM(
        SELECT 
            nome,
            contato,
            REPLACE(telefone,')',') ') as "Telefone",
            email,
            POSITION('@' IN "email") as "Posição do @",
            LEFT("email",POSITION('@' IN "email")-1) as "UserName",
            RIGHT("email",length("email") - POSITION('@' IN "email")),
            CONCAT_WS(' | ',endereco,cidade,estado, pais) as "Endereço",
            REPLACE(TO_CHAR(data_cadastro,'dd/MM/yyyy'),'-','/') as "Data cadastro",
            DATE_PART('YEAR', AGE(now(), data_cadastro)) as "Tempo de cadastro",
            (NOW()::DATE - data_cadastro) as "Total de dias"
        FROM empresa.fornecedores
    ) AS "Tabela de fornecedores"
ORDER BY nome


SELECT * FROM EXTRACT('YEAR' FROM CURRENT_DATE)

SELECT 
    CASE EXTRACT(DOW FROM NOW())
        WHEN 0 THEN 'Domingo'
        WHEN 1 THEN 'Segunda-Feira'
        WHEN 2 THEN 'Terça-Feira'
        WHEN 3 THEN 'Quarta-Feira'
        WHEN 4 THEN 'Quinta-Feira'
        WHEN 5 THEN 'Sexta-Feira'
        WHEN 6 THEN 'Sábado'
    end as "Dia da semana"




SELECT * FROM empresa.fornecedores limit 3


SELECT 
    "BusinessEntityID",
    "LoginID",
    "Título do trabalho",
    "BirthDate",
    "DIF em dias",
    "MaritalStatus",
    "Gender",
    "HireDate",
    "Ano de Contratação",
    "VacationHours",
    "SickLeaveHours",
    "ModifiedDate"
FROM (
    SELECT 
        "BusinessEntityID",
        "LoginID",
        "JobTitle" AS "Título do trabalho",
        "BirthDate",
        (CURRENT_DATE - "BirthDate") AS "DIF em dias",
        "MaritalStatus",
        "Gender",
        "HireDate",
        EXTRACT(YEAR FROM "HireDate") AS "Ano de Contratação",
        "VacationHours",
        "SickLeaveHours",
        CAST("ModifiedDate" AS DATE) AS "ModifiedDate"
    FROM "HumanResources"."Employee"
) AS "DEVDOJO"
-- WHERE "Ano de Contratação" = 2009
ORDER BY "BirthDate";


