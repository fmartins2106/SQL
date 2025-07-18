select concat ('Fernando','Martins') /* concatenação */

SELECT 
BusinessEntityID,
Title,
FirstName,
MiddleName,
LastName,
Title+FirstName+MiddleName+LastName as "Nome completo",
CONCAT(Title,' ',FirstName,' ',MiddleName,' ',LastName) as [CONCAT()], /* Não deixa trazer valores nulos mas da um espaço quando for nulo */
CONCAT_WS(' ',Title,FirstName,MiddleName,LastName, TRY_CAST(GETDATE() AS DATE)) as [CONCAT_WS()], /* Também não deixa valores nulos, melhor opção. Não deixa espaços em branco */Suffix,
EmailPromotion,
ModifiedDate
FROM person.person

