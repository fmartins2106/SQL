/* 
EXECEPT : Retornará os valores da primeira tablea/consulta que não estão na segunda consulta/tabela
INTERSECT : Retornará a intersção dos valores
 */

 
SELECT 'DEVDOJO' AS [NOME],
        'JAVA' AS [LINGUAGEM]
INTERSECT

SELECT 'Google' as [empresa],
        'Kotlin' as [Tipo]


SELECT 
    BusinessEntityID AS [COL2]
FROM person.Person
EXECEPT
SELECT
    BusinessEntityID AS [COL1]
from HumanResources.Employee


SELECT 
    BusinessEntityID AS [COL2],
    '' as FirstName
FROM person.Person
INTERSECT
SELECT
    BusinessEntityID AS [COL1],
     '' as FirstName
from HumanResources.Employee
order by [COL2]


SELECT 
    BusinessEntityID AS [COL2],
    FirstName
FROM person.Person
EXCEPT
SELECT
    BusinessEntityID AS [COL1],
     '' FirstName
from HumanResources.Employee
order by [COL2]         

