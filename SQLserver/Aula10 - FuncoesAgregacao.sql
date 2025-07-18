
/* 
COUNT : CONTAGEM
MIN: MINIMO
MAX: MAXIMO
SUM: SOMA
AVG: MEDIA
 */

 USE AdventureWorks2019
 go

 select count (*) from person.person
 SELECT COUNT(*) from Sales.SalesPerson 

/* Conta quantos nomes tempos na tabela */
SELECT COUNT(*) AS CONTADOR,
    FirstName,
    MiddleName
    from person.person
    GROUP BY FirstName,
             MiddleName


SELECT COUNT(*) AS CONTADOR,
    FirstName,
    MiddleName
    from person.person
    WHERE MiddleName is not NULL
    GROUP BY FirstName,
             MiddleName



/* Verificando maior e menor valor de um campo inteiro */
SELECT MIN(BusinessEntityID) as Minimo
from person.person; 

SELECT Max(BusinessEntityID) as Minimo
FROM person.person; 




SELECT MIN(BusinessEntityID) as Minimo,
MIN(ModifiedDate)  as 'Data Modificada'
from person.person 

SELECT MIN(BusinessEntityID) as Minimo,
MAX(ModifiedDate)  as 'Data Modificada Max'
FROM person.person 

/* Soma de todas as colunas */
SELECT SUM(BusinessEntityID) as SOMA
from person.person

select AVG(BusinessEntityID)
from person.Person

select * from HumanResources.Department

select * from HumanResources.EmployeeDepartmentHistory
WHERE StartDate >= '2009-01-14'

select * from HumanResources.EmployeeDepartmentHistory
where StartDate BETWEEN '2001-01-01' and '2009-01-'

select * from HumanResources.EmployeeDepartmentHistory
where StartDate BETWEEN '2001-01-01' and '2009-01-14'
ORDER BY StartDate

select * from HumanResources.EmployeePayHistory

select RateChangeDate,
    SUM(Rate) as Rate,
    MAX(Rate) as 'MAX'
from HumanResources.EmployeePayHistory
GROUP BY RateChangeDate

select COUNT(*) as contador,
    FirstName
    from person.person
    group by FirstName
    HAVING COUNT(*) > 20 /* Contando os primeiros nomes que tem contagem maior que 20 */

select AVG(Rate) as rate,
    RateChangeDate
from HumanResources.EmployeePayHistory
GROUP BY RateChangeDate
HAVING AVG(Rate) < 10.000


select SUM(Rate) as rate,
    RateChangeDate
from HumanResources.EmployeePayHistory
GROUP BY RateChangeDate
HAVING AVG(Rate) < 10.000


select 
SUM(Rate) as 'SOMA',
MIN(Rate) as 'MÍNIMO',
MAX(Rate) as 'MÁXIMO',
COUNT(Rate) as 'COUNT',
AVG(Rate) as 'MÉDIA'
from HumanResources.EmployeePayHistory

