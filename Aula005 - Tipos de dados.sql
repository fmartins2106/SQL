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

 SELECT * FROM person.person
 where BusinessEntityID > 100;

select * from person.person
where BusinessEntityID in (2,3,44,5555,333,2222,334,1288)

select * from person.Person
where BusinessEntityID not in (2,3,4,5,6)

 select 
 BusinessEntityID,
 FirstName,
 LastName
 from Person.Person
 where (BusinessEntityID >= 100 AND BusinessEntityID <= 120)
 ORDER BY BusinessEntityID DESC;


 