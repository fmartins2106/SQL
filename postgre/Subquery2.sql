SELECT * 
FROM HumanResources.Employee
WHERE birthdate = (SELECT MIN(birthdate) FROM HumanResources.Employee);


SELECT * 
FROM HumanResources.Employee
WHERE hiredate = (SELECT MAX(hiredate) FROM HumanResources.Employee);

SELECT
    nome,
    sobrenome,
    data_nascimento,
    DATE_PART('YEAR',AGE(NOW(),data_nascimento)) as "Idade"
FROM empresa.funcionarios
WHERE data_nascimento = (SELECT MAX(data_nascimento) from empresa.funcionarios)

UNION ALL

SELECT
    nome,
    sobrenome,
    data_nascimento,
    DATE_PART('YEAR',AGE(NOW(),data_nascimento)) as "Idade"
FROM empresa.funcionarios
WHERE data_nascimento = (SELECT min(data_nascimento) from empresa.funcionarios)

select * from empresa.clientes limit 4

select
    nome,
    tipo_pessoa
    cnjp_cpf,
    cidade,
    data_cadastro
from empresa.clientes
WHERE data_cadastro = (SELECT MIN(data_cadastro) from empresa.clientes)

UNION ALL

select
    nome,
    tipo_pessoa
    cnjp_cpf,
    cidade,
    data_cadastro
from empresa.clientes
WHERE data_cadastro = (SELECT max(data_cadastro) from empresa.clientes)



select* from empresa.funcionarios
WHERE data_nascimento = (SELECT MAX(data_nascimento) FROM empresa.funcionarios)
union all
select * from empresa.funcionarios
WHERE data_nascimento = (SELECT MIN(data_nascimento) from empresa.funcionarios);

select * from empresa.funcionarios limit 3

SELECT TABLE_NAME AS "Nome da tabela"
    FROM information_schema.TABLES
    WHERE TABLE_SCHEMA = 'empresa'
    and table_type = 'BASE TABLE'


SELECT
    ComprasFor.fornecedor_id,
    ComprasFor."Nome empresa e contato",
    ComprasFor.email,
    ComprasFor."Funcionário ID"
    FROM(
        SELECT
            c.compra_id,
            c.fornecedor_id,
            f.nome ||  ' -Contato:' || f.contato as "Nome empresa e contato",
            CASE
                WHEN c.funcionario_id IS NULL THEN 'Funcinário não informado'
                ELSE c.funcionario_id::Text
            end as "Funcionário ID",
            REPLACE(TO_CHAR(c.data_compra, 'dd/MM/yyyy'),'-','/') as "Data da compra",
            DATE_PART('MONTH',AGE(NOW(),c.data_compra)) as "Meses desde a compra",
            c.total,
            c.status,
            f.email,
            POSITION('@' IN f.email) as "Posição do @",
            LEFT(f.email,POSITION('@' in f.email) -1) as "UserName",
            RIGHT(f.email, length(f.email) - POSITION('@' in f.email)) as "Dominio"
        from empresa.compras c
        inner join empresa.fornecedores f
            on c.fornecedor_id = f.fornecedor_id    
    ) as ComprasFor
    GROUP BY ComprasFor.fornecedor_id,
        ComprasFor."Nome empresa e contato",
        ComprasFor.email,
        ComprasFor."Funcionário ID"
    order by ComprasFor.fornecedor_Id


SELECT * FROM empresa.fornecedores limit 10

select * from empresa.compras limit 10


SELECT 
    COALESCE((
        SELECT PhoneNumber 
        FROM Person.PersonPhone AS PPP
        WHERE PPP.BusinessEntityID = PP.BusinessEntityID
        LIMIT 1
    ), '') AS "PhoneNumber",
    HRE.*
FROM Person.Person PP
JOIN HumanResources.Employee AS HRE 
  ON PP.BusinessEntityID = HRE.BusinessEntityID;

UPDATE empresa.compras
SET fornecedor_id = 512
WHERE compra_id = 1;

UPDATE empresa.compras
SET fornecedor_id = 513
WHERE compra_id = 2;

UPDATE empresa.compras
SET fornecedor_id = 524
WHERE compra_id = 3;

UPDATE empresa.compras
SET fornecedor_id = 515
WHERE compra_id = 4;

UPDATE empresa.compras
SET fornecedor_id = 516
WHERE compra_id = 5;
