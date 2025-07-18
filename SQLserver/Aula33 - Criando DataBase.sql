CREATE DATABASE dbCartoon
go

ALTER DATABASE dbCartoon
COLLATE Latin1_General_BIN2 /* Esse collate permite fazer consultas mais rápidas, porem, tem que faze distição de maiusculas e minusculas. */



/* Funlção do sistema */
SELECT DATABASEPROPERTYEX('AdventureWorks2019','Collation') as [Collate AdventureWorks2019],
       DATABASEPROPERTYEX('dbCartoon', 'Collation') as [Collate AdventureWorks2019]

select * from sys.DATABASES /* Visão do sistema. */

SELECT * FROM AdventureWorks2019.Person.Person
where FirstName = 'KEN'
