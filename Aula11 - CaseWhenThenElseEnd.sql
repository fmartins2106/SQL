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
MaritalStatus,
Gender,
PersonType,
NameStyle,
Title,
FirstName,
MiddleName,
LastName,
pea.EmailAddress,
ppp.PhoneNumber,
ppp.PhoneNumberTypeID
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
