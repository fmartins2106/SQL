SELECT * from Person.Person;

SELECT top 1000 * 
from Person.Person;

SELECT top 100 
BusinessEntityID,
PersonType,
FirstName,
Title,
LastName
from Person.Person
WHERE Title = 'Mr.'
ORDER BY LastName;

SELECT TOP 1000
BusinessEntityID as [ID PESSOA],
FirstName as [Primeiro nome],
LastName as [último nome],
Title as [Sexo],
ModifiedDate as [Data da última modificação]
from Person.Person;

SELECT top 1500
BusinessEntityID,
Title,
FirstName,
MiddleName,
LastName,
ModifiedDate
from Person.Person
where Title = 'Mrs.'
ORDER BY LastName DESC;


SELECT TOP 1000
BusinessEntityID AS [ID Pessoa],
Title AS [Sexo],
FirstName AS [Primeiro nome],
LastName AS [Último Nome],
ModifiedDate  AS [Data da modificação]
from Person.Person
where Title = 'Mr.'
order by FirstName DESC;


SELECT DISTINCT
FirstName
from Person.Person
ORDER BY FirstName DESC;


select 
BusinessEntityID,
FirstName,
LastName,
Title,
EmailPromotion,
ModifiedDate
from Person.Person
WHERE Title = 'Mr.'
ORDER BY FirstName DESC;

SELECT
BusinessEntityID,
FirstName,
LastName
from Person.Person
ORDER BY BusinessEntityID
OFFSET 50 ROWS
FETCH NEXT 10 ROWS ONLY;


SELECT
BusinessEntityID,
FirstName,
LastName
from Person.Person
ORDER BY BusinessEntityID
OFFSET 50 ROWS
FETCH NEXT 15 ROWS ONLY;

SELECT
BusinessEntityID,
FirstName,
LastName
from Person.Person
ORDER BY BusinessEntityID
OFFSET 54 ROWS
FETCH NEXT 50 ROWS ONLY;

SELECT
BusinessEntityID
FirstName,
LastName
from Person.Person
ORDER BY FirstName
OFFSET 59 ROWS

FETCH NEXT 40 ROWS ONLY;

SELECT DISTINCT
BusinessEntityID,
FirstName, 
LastName
from Person.Person
ORDER BY FirstName
OFFSET 50 ROWS
FETCH NEXT 40 ROWS ONLY;


SELECT
BusinessEntityID,
FirstName,
LastName
from Person.Person
ORDER BY FirstName
OFFSET 50 ROWS
FETCH NEXT 19 ROWS ONLY;

SELECT
BusinessEntityID,
FirstName,
MiddleName,
LastName
from Person.Person
ORDER BY BusinessEntityID
OFFSET 100 ROWS
FETCH NEXT 40 ROWS ONLY;

SELECT TOP 100 * from Person.Person ;

SELECT DISTINCT 
BusinessEntityID,
FirstName,
MiddleName,
LastName,
Title
from Person.Person
where Title = 'Mr.'
order BY FirstName;

SELECT TOP 100 
BusinessEntityID,
Title,
FirstName,
LastName
FROM Person.Person;

SELECT top 100 * from Person.Person; 

select DISTINCT 
BusinessEntityID,
FirstName,
LastName,
Title
from Person.Person
where Title = 'Mr.'
ORDER BY LastName DESC;

select DISTINCT
BusinessEntityID,
FirstName,
LastName,
Title
from Person.Person
ORDER BY BusinessEntityID
OFFSET 50 ROWS 
FETCH NEXT 10 ROWS ONLY;


SELECT DISTINCT
BusinessEntityID,
Title,
FirstName,
MiddleName,
LastName
from Person.Person
ORDER BY BusinessEntityID
OFFSET 40 ROWS
FETCH NEXT 10 ROWS ONLY;


SELECT TOP 100 
BusinessEntityID AS [Código],
Title AS [Sexo],
FirstName AS [Primeiro nome],
LastName AS [Último nome]
from Person.Person 
ORDER BY FirstName;

