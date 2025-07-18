/* 
REPLACE:(Nome_coluna/Expressao, 'TextoParaProcurar', 'TextoQueSubstituira)
REPLICATE:(Expressao_para_replicarz/Nome_coluna,NumeroDeVezes) : retorno do tipo texto
STUFF:(Expressao/Nome_da_Coluna, posicaoInicial,tamanho,substituicao) 
 
 */

 SELECT
    REPLACE('DevDojo é brabo demais','brabo','bolado') as [DevDojoBolado],
    REPLICATE('0',10) AS [REPLICATE],
    STUFF('DevDojo brabo demais!',9,5,'bolado') AS [STUFF]


SELECT
    PP.BusinessEntityID,
    CONCAT(REPLICATE('0', LEN( (SELECT MAX(BusinessEntityID) FROM person.Person) ) - LEN(PP.BusinessEntityID) ), PP.BusinessEntityID) as CONCAT,
    LEN(pp.BusinessEntityID) as tamanho,
    PersonType,
    Title,
    FirstName,
    MiddleName,
    LastName,
    pp.ModifiedDate,
    PEA.BusinessEntityID,
    EmailAddress,
    REPLACE(EmailAddress, '@','\|/') as [REPLACE]
from person.Person PP
JOIN person.EmailAddress as PEA
    ON PP.BusinessEntityID = PEA.BusinessEntityID


SELECT
    SalesOrderDetailID,
    CarrierTrackingNumber,
    SSOD.ProductID,
    ProductNumber,
    PP.Name,
    REPLACE(PP.Name,'-',' - ') AS [REPLACE],
    PATINDEX(' %[0-9A-z]-[0-9A-z]%',PP.Name) AS POSIÇÃO,
    CASE
        WHEN PATINDEX(' %[0-9A-z]-[0-9A-z]%',PP.Name) > 0  THEN STUFF(PP.Name,(PATINDEX('%[0-9A-z]-[0-9A-z]%',PP.Name)+1), 1, ' - ')
        else PP.Name
    end as [STUFF_2],
    UnitPrice,
    LineTotal,
    SSOD.ModifiedDate
from sales.SalesOrderDetail as SSOD
LEFT JOIN Production.Product as PP
ON SSOD.ProductID = PP.ProductID
ORDER BY SalesOrderDetailID