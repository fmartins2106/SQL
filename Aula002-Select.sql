/* Solicitando os 1000 primeiros registros */
select TOP 100 * from Person.Person

/* Ordedenando por ordem crescente. */
SELECT TOP 1000 * 
from Person.Person
ORDER BY FirstName DESC;

/* Ordenando por ordem crescente. */
SELECT TOP 1000 *
from Person.Person
ORDER BY FirstName ASC;

select top 1000 *
from Person.Person;


SELECT top 1000 * 
from Person.Person 
ORDER BY FirstName, LastName DESC; /* Ordena pelo nome por ordem crescente e último nome por ordem descrecente */

SELECT top 1000
BusinessEntityID,
PersonType,
Title,
FirstName,
MiddleName,
LastName
from Person.Person
ORDER BY FirstName, /* Ordenando por ordem alfabetica */
LastName DESC; /* Ordenando por ordem descrecente. */


SELECT top 1000
BusinessEntityID as [ID PESSOA],
PersonType       as [TIPO PESSOA],
Title            as [TITULO],
FirstName        as [PRIMEIRO NOME],
MiddleName       as [NOME DO MEIO],
LastName         as [ÚLTIMO NOME]
from Person.Person
WHERE Title = 'Mr.'
ORDER BY FirstName,
LastName DESC;


SELECT DISTINCT /* Remover os duplicados */  
/* BusinessEntityID as [ID PESSOA],
PersonType       as [TIPO PESSOA],
Title            as [TITULO], */
FirstName        as [PRIMEIRO NOME]
/* MiddleName       as [NOME DO MEIO],
LastName         as [ÚLTIMO NOME] */
from Person.Person;

SELECT DISTINCT TOP 1000 
FirstName,
MiddleName,
LastName
from Person.Person
WHERE Title = 'Mr.'
AND MiddleName = 'M.'
order by FirstName,MiddleName;

SELECT top 100 *
from Person.Person
order BY FirstName,
MiddleName,
LastName

SELECT --top 1000
BusinessEntityID,
PersonType,
Title,
FirstName,
MiddleName,
LastName,
ModifiedDate
from Person.Person
ORDER BY BusinessEntityID
OFFSET 50 ROWS /* Elimina as 5 primeiras linhas da tabela (OBS: Desta forma não se pode usar o TOP quando se esta usando o OFFSET) */

SELECT --top 1000
BusinessEntityID,
PersonType,
Title,
FirstName,
MiddleName,
LastName,
ModifiedDate
from Person.Person
ORDER BY BusinessEntityID
OFFSET 50 ROWS /* Ignora as 50 primeiras linhas */
FETCH NEXT 10 ROWS ONLY /*Este comando executa as proxima;s 10 linhas somente  */


SELECT top 1000
BusinessEntityID,
FirstName,
LastName
from Person.Person
ORDER By LastName;

select top 1000
BusinessEntityID,
FirstName,
MiddleName,
LastName,
Title
from Person.Person
WHERE Title = 'Mr.'
ORDER BY LastName




