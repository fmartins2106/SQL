


SELECT
    LTRIM('                        DevDjo é o melhor                                   '),
    RTRIM('                        DevDjo é o melhor                                   '),
    TRIM('                        DevDjo é o melhor                                   '),
    UPPER('                        DevDjo é o melhor                                   '),
    LOWER('                        DevDjo é o MELHOR                                   ')


SELECT
    CONCAT_WS(SPACE(1), 'extração de relatório', TRY_CONVERT(varchar(10),GETDATE(),108),TRY_CONVERT(varchar(10),GETDATE(),103)) as [DR EXTRACAO],
    PP.BusinessEntityID,   UPPER(FirstName) as FirstName,
    LOWER(MiddleName) as MiddleName,
    LastName,
    EmailAddress,
    FirstName +SPACE(30)+ LastName as NomeCompleto,
    CONCAT(FirstName,SPACE(30), LastName) as[CONCAT],
    FORMAT(GETDATE(), 'dd/MM/yyyy', 'pt-BR') as [Format],
    CONCAT_WS(SPACE(15),FirstName,MiddleName, PP.ModifiedDate) as [CONCAT_WS]
from person.Person AS PP
join person.EmailAddress as PEA
ON PP.BusinessEntityID = PEA.BusinessEntityID