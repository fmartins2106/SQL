/* 
ALL (SUBQUERY)
AND
OR
SOME | ANY (SUBQUERY)
BETWEEN
EXISTS (SUBQUERY)
IN | NOT IN
LIKE | NOT LIKE
 */

 SELECT * FROM Person.Person 
 where BusinessEntityID > 150
 AND FirstName <> 'lane'
 AND FirstName <> 'Aeron'
 AND MiddleName <> 'G'
 ORDER BY FirstName;


SELECT * FROM Person.Person
where Title = 'Mr.'
AND FirstName <> 'lane'
AND FirstName <> 'Aaron'
AND MiddleName <> 'G'
ORDER BY BusinessEntityID
OFFSET 50 ROWS 
FETCH NEXT 10 ROWS ONLY;

select * from Person.Person 
where Title = 'Mr.'
AND FirstName IN ('ken','roberto')
ORDER BY BusinessEntityID


SELECT * FROM Person.Person
where BusinessEntityID > 150
AND (FirstName <> 'Aaron' AND MiddleName <> 'G')
ORDER BY BusinessEntityID;


 SELECT * FROM Person.Person 
 where BusinessEntityID > 150
 AND (FirstName <> 'Aaron' AND MiddleName <> 'G')
 ORDER BY FirstName;

 SELECT * from Person.Person
 where BusinessEntityID > 200
 ORDER BY BusinessEntityID;

 SELECT
 BusinessEntityID,
 Title,
 FirstName,
 LastName
 from Person.Person 
 ORDER BY BusinessEntityID
OFFSET 40 ROWS
FETCH NEXT 100 ROWS ONLY;

SELECT * FROM Person.Person 
WHERE BusinessEntityID BETWEEN 100 and 200
ORDER BY BusinessEntityID DESC

SELECT * FROM Person.Person 
where BusinessEntityID BETWEEN 600 AND 800


SELECT * FROM Person.Person 
WHERE BusinessEntityID IN (1,2,3,4,567,789,7655)

SELECT * FROM Person.Person 
WHERE BusinessEntityID IN (1,2,5,100,34)

SELECT * FROM Person.Person 
WHERE BusinessEntityID IN (10,29,12,11,200,329)
ORDER BY BusinessEntityID;

SELECT * FROM Person.Person
where BusinessEntityID IN (2,3,4,3,2,4);

SELECT * FROM Person.Person
where FirstName NOT IN ('Maria','Aeron','Terri','Rob')


SELECT * FROM Person.Person 
WHERE FirstName NOT IN ('KEN', 'GIG','Aaron','A.')

SELECT * FROM Person.Person
Where FirstName NOT IN ('Roberto','Aeron','A.','Michael','Mark','Frank','Paul');


SELECT * FROM Person.Person
WHERE FirstName LIKE 'g%' /* like com porcentagem, traz qualquer nome com a letra G */


SELECT * FROM Person.Person
WHERE FirstName LIKE 'G%'

SELECT * FROM person.person
where LastName LIKE 'a%'

SELECT * FROM person.person
WHERE LastName LIKE 'S%'

SELECT * FROM Person.Person
WHERE FirstName LIKE 'g___' /* com underline tras a letra g mais 3 caracteres. */
ORDER BY FirstName

SELECT * FROM Person.Person
WHERE FirstName LIKE 'G__a' /* Não faz destinção o que tem no meio, so traz os nomes que tem primeira letra G e ultima a */
ORDER BY FirstName

SELECT * FROM Person.Person 
WHERE FirstName LIKE '___a'
ORDER BY FirstName

SELECT * FROM Person.Person 
WHERE FirstName LIKE '[ABCDEFG]___a' /* Outra forma de fazer pesquisa por letra inicial dos nomes */
ORDER BY FirstName

SELECT * FROM person.person
WHERE FirstName like '[abfdl]%'
ORDER BY FirstName

SELECT * FROM Person.Person 
WHERE FirstName LIKE '[^ABCDEFG]___a' 
ORDER BY FirstName  

SELECT top 100
BusinessEntityID AS [Código Pessoa],
Title  AS [Sexo],
FirstName AS [Primeiro nome],
MiddleName AS [Nome do meio],
LastName AS [Sobrenome]
from person.person
ORDER BY BusinessEntityID

