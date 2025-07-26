-- WINDOW FUNCTION

SELECT ROW_NUMBER() OVER ( order by FirstName,MiddleName,LastName) as ORDEM,
    * FROM Person.Person

select ROW_NUMBER() over(PARTITION BY FirstName,MiddleName,LastName order by FirstName,MiddleName,LastName ) as ORDEM,
* from Person.Person
