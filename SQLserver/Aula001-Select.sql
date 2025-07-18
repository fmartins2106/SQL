SELECT * from Person.Person where FirstName = 'Pete'

SELECT BusinessEntityID,
        PersonType,
        Title,
        FirstName,
        MiddleName,
        LastName,
        ModifiedDate
from Person.Person
WHERE FirstName = 'Ken'
AND MiddleName = 'L'