/* Case, when, then, else e end */
select 
PersonType,
NameStyle,
Title,
CASE Title
when 'Ms.' then 'Senhora'
when 'Mr.' then 'Senhor'
else ''
end as Titulo,
FirstName,
MiddleName,
LastName,
FirstName + ' '+MiddleName+' '+LastName as 'Nome completo'
from person.person


select 
pp.BusinessEntityID,
LoginID,
OrganizationLevel,
JobTitle,
BirthDate,
CASE MaritalStatus
    WHEN 'S' THEN 'Solteiro'
    WHEN 'm' THEN 'Casado'
    Else 'Não localizado'
END AS MaritalStatus,
CASE Gender
    WHEN 'M' THEN 'Masculino'
    WHEN 'F' THEN 'Feminimo'
END AS Gender,
PersonType,
NameStyle,
Title,
FirstName,
MiddleName,
CASE
    WHEN (MiddleName = 'E' OR MiddleName = 'A') THEN 'VOGAIS'
    WHEN (MiddleName = 'e' OR MiddleName = 'A') AND Title IS NOT NULL THEN 'VOGAIS_2'
    ELSE 'TUDO JUNTO' 
    END AS MiddleName_diferente,
LastName,
Rate,
CASE 
    WHEN Rate < 12.000 THEN (Rate * 3)
    WHEN Rate BETWEEN 12.000 and 20.000 THEN Rate * 1.1
    WHEN Rate > 20.000 THEN Rate * 0.1
    ELSE 0
END AS [Comparação Numeral],
pea.EmailAddress,
ppp.PhoneNumber,
ppp.PhoneNumberTypeID,
FirstName+' '+MiddleName+' '+LastName as 'Nome completo'
from person.person AS pp
join person.EmailAddress as pea
on pp.BusinessEntityID = pea.BusinessEntityID
join person.PersonPhone as ppp
on pp.BusinessEntityID = ppp.BusinessEntityID
left join HumanResources.Employee as HRE
on HRE.BusinessEntityID = pp.BusinessEntityID
left join HumanResources.EmployeePayHistory as hreph
on hreph.BusinessEntityID = pp.BusinessEntityID
