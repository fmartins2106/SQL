SELECT
PP.BusinessEntityID,
Title,
FirstName,
MiddleName,
LastName,
EmailAddress,
PEA.BusinessEntityID,
PhoneNumber
FROM Person.Person  AS PP
INNER JOIN Person.EmailAddress AS PEA
ON PP.BusinessEntityID = PEA.BusinessEntityID
INNER JOIN Person.PersonPhone AS APP
ON PEA.BusinessEntityID = APP.BusinessEntityID


SELECT
pp.firstname,
pp.MiddleName,
pp.LastName,
pea.PhoneNumber,
from person.person as pp
inner join Person.EmailAddress as pea
ON pp.BusinessEntityID = pea.BusinessEntityID
inner join person.PersonPhone as app
on pea.BusinessEntityID = app.BusinessEntityID