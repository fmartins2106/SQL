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

SELECT TABLE_NAME AS "Nome das tabelas"
from information_schema.tables
where TABLE_SCHEMA = 'empresa'
and TABLE_TYPE = 'BASE TABLE'


select * from empresa.produtos limit 100

select * from empresa.fornecedores limit 20

SELECT
    produto_id,
    nome_produto,
    fornecedor_id,
    nome_fornecedor
    FROM(
        SELECT
            p.produto_id,
            p.nome AS nome_produto,
            p.descricao,
            p.categoria,
            p.preco,
            p.estoque,
            f.fornecedor_id,
            f.nome AS nome_fornecedor
        FROM empresa.produtos p
        inner join empresa.fornecedores f
            ON p.fornecedor_id = f.fornecedor_id
        order by f.nome desc
    ) AS "Table de produtos"


from empresa.funcionarios


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


SELECT
    nome,
    tipo_pessoa,
    cnpj_cpf,
    cidade,
    data_cadastro
from empresa.clientes
where data_cadastro = (SELECT min(data_cadastro) from empresa.clientes)

UNION all

SELECT
    nome,
    tipo_pessoa,
    cnpj_cpf,
    cidade,
    data_cadastro
from empresa.clientes
where data_cadastro = (SELECT max(data_cadastro) from empresa.clientes);


SELECT TABLE_NAME AS "NOME DA TABELA"
FROM INFORMATION_SCHEMA.tables
WHERE TABLE_SCHEMA = 'empresa'
AND TABLE_TYPE = 'BASE TABLE'

SELECT * from empresa.funcionarios limit 2

SELECT
    nome || ' ' || sobrenome as "Nome completo",
    cpf,
    email,
    LEFT("email",POSITION('@' IN "email") - length("email")-1) as UserName,
    RIGHT("email",LENGTH("email") - POSITION('@' IN "email")),
    REPLACE(TO_CHAR(data_nascimento,'dd/MM/yyyy'),'-','/') as "Data nascimento",
    DATE_PART('YEAR',AGE(NOW(),data_nascimento))  as "IDADE",
    (NOW()::DATE - data_nascimento) as "Total de dias desde a data de nascimento",
    data_admissao,
    CONCAT_WS(' | ', 
    CAST(DATE_PART('YEAR',AGE(NOW(), data_admissao))AS INT ) || 'ANOS',
    CAST(DATE_PART('MONTH',AGE(NOW(),data_admissao)) AS INT ) || 'MESES') as "Total tempo de casa"
FROM empresa.funcionarios
WHERE data_nascimento = (SELECT max(data_nascimento) FROM empresa.funcionarios )


UNION ALL

SELECT
    nome || ' '|| sobrenome,
    cpf,
    email,
    LEFT("email",POSITION('@' IN "email")-1) AS UserName,
    RIGHT("email",LENGTH("email") - POSITION('@' IN "email")) as "Dominio",
    REPLACE(TO_CHAR(data_nascimento,'dd/MM/yyyy'),'-','/') as "Data nascimento",
    DATE_PART('YEAR',AGE(NOW(), data_nascimento)) as "IDADE",
    (NOW()::DATE - data_nascimento) as "Total de dias desde a data de nascimento",
    data_admissao,
    CONCAT_WS(' | ',CAST(DATE_PART('YEAR',AGE(NOW(),data_admissao)) as INT) || 'ANOS' ,
                    CAST(DATE_PART('MONTH',AGE(NOW(),data_admissao))as INT) || 'MESES' )
FROM empresa.funcionarios
WHERE data_nascimento = (SELECT min(data_nascimento) from empresa.funcionarios)


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

UPDATE empresa.produtos
SET fornecedor_id = 512
WHERE produto_id = 18;

UPDATE empresa.produtos
SET fornecedor_id = 513
WHERE produto_id = 2;

UPDATE empresa.produtos
SET fornecedor_id = 515
WHERE produto_id = 114;

UPDATE empresa.produtos
SET fornecedor_id = 515
WHERE produto_id = 103;

select * from empresa.produtos order by fornecedor_id

UPDATE empresa.produtos
SET fornecedor_id = 516
WHERE produto_id = 201;
