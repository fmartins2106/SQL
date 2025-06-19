/* Operadores de comparação 
= (igualdade) 
<> (diferente) 
< (Menor que)
<= (Menor igual que)
> (Menor que)
>= (Maior igual que)

*/
 SELECT * FROM Person.Person 
 WHERE FirstName = 'gigi';

 SELECT * FROM Person.Person
 where FirstName <> 'gigi';

 SELECT * FROM Person.Person 
 where BusinessEntityID > 10

 SELECT * FROM Person.Person
 where BusinessEntityID > 10

 select * from Person.Person
 where BusinessEntityID >= 50


 select 
 BusinessEntityID,
 FirstName,
 LastName
 from Person.Person
 where (BusinessEntityID >= 100 AND BusinessEntityID <= 120)
 ORDER BY BusinessEntityID DESC;

 