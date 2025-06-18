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