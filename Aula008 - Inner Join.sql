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
