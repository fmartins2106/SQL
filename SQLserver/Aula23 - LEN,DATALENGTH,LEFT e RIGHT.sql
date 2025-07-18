/* 
    LEN: RETORNARÁ A QUANTIDADE DE CARACTERES | RETORNO SEMPRE DO TIPO INTEIRO;
    DATALENGTH: RETORNARÁ A QUANTIDADE DE BYTES.
    LEFT(Nome_Coluna,tamanho) : retorno nvarchar |varchar
    RIGHT(Nome_Coluna): retorno nvarchar | varchar
     */

 SELECT LEN('DEVDOJO')


 SELECT
    LEN('DEVJOVO') AS [LEN], /*  CONTA ESPAÇOS A ESQUERDA */
    DATALENGTH('DEVJOGO  ') AS [DATALENGTH], /* CONTA ESPAÇÕS A DIREITA */
    LEFT('O melhor canal do YouTube é o DevDojo, brabo demais',8) as [LEFT],
    LEFT('O melhor canal do YouTube é o DevDojo, brabo demais',LEN('O melhor canal do YouTube é o DevDojo, brabo demais')/2) AS MetadeEsquerda,
    RIGHT('O melhor canal do YouTube é o DevDojo, brabo demais',8),
    LEFT(561,1),
    RIGHT(GETDATE(),50)


SELECT
    BusinessEntityID,
    LEN(EmailAddress) as [LEN],
    CHARINDEX('@', EmailAddress) as [posição_@],
    LEFT(EmailAddress,CHARINDEX('@',EmailAddress)-1) as UserName,
    EmailAddress,
    RIGHT(EmailAddress,LEN(EmailAddress) - CHARINDEX('@',EmailAddress)) AS Domino
from person.EmailAddress
ORDER BY BusinessEntityID