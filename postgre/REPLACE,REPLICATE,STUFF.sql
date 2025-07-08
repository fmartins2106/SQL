-- 
-- REPLACE: substitui um trecho de texto por outro.
-- REPEAT: repete uma string pelo número de vezes indicado.
-- OVERLAY: equivalente ao STUFF do SQL Server. Insere um texto em uma posição específica, substituindo parte do original.
-- LPAD(string, comprimento_total, caractere_de_preenchimento)Objetivo: Preencher uma string à esquerda até que ela atinja um determinado comprimento, usando um caractere ou texto especificado
--
SELECT
    REPLACE('DevDojo é brabo demais', 'brabo', 'bolado') AS "DevDojoBolado",
    REPEAT('0', 10) AS "REPLICATE",
    overlay('DevDojo brabo demais!' placing 'bolado' from 9 for 5) AS "STUFF";


SELECT
    pp."BusinessEntityID",
    LPAD(pp."BusinessEntityID"::text, LENGTH((SELECT MAX("BusinessEntityID")::text FROM person."Person")), '0') AS "CONCAT",
    LENGTH(pp."BusinessEntityID"::text) AS "tamanho",
    "PersonType",
    "Title",
    "FirstName",
    "MiddleName",
    "LastName",
    pp."ModifiedDate",
    pea."BusinessEntityID" AS "EmailEntityID",
    "EmailAddress",
    REPLACE("EmailAddress", '@', '\|/') AS "REPLACE"
FROM person."Person" pp
JOIN person."EmailAddress" pea ON pp."BusinessEntityID" = pea."BusinessEntityID";


SELECT
    ssod."SalesOrderDetailID",
    "CarrierTrackingNumber",
    ssod."ProductID",
    pp."ProductNumber",
    pp."Name",
    REPLACE(pp."Name", '-', ' - ') AS "REPLACE",
    
    -- Encontrando a posição do padrão usando expressão regular
    POSITION(SUBSTRING(pp."Name" FROM ' [0-9A-Za-z]-[0-9A-Za-z]') IN pp."Name") AS "POSIÇÃO",

    -- STUFF com regex simulando a substituição
    CASE
        WHEN pp."Name" ~ '[0-9A-Za-z]-[0-9A-Za-z]' THEN
            REGEXP_REPLACE(pp."Name", '([0-9A-Za-z])-([0-9A-Za-z])', '\1 - \2')
        ELSE
            pp."Name"
    END AS "STUFF_2",

    "UnitPrice",
    "LineTotal",
    ssod."ModifiedDate"
FROM sales."SalesOrderDetail" ssod
LEFT JOIN production."Product" pp ON ssod."ProductID" = pp."ProductID"
ORDER BY ssod."SalesOrderDetailID";


SELECT * from empresa.clientes limit 3


select
    nome,
    REPLACE(endereco, ',' , '-') as "endereço",
    REPLACE(TO_CHAR(data_cadastro,'YYYY-MM-DD'),'-','/') as "Data do cadastro"
from empresa.clientes 