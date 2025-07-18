

select * from HumanResources.Employee
where birthDate in (SELECT min(birthDate) from HumanResources.Employee);



select * from HumanResources.Employee
where HireDate in (SELECT MAX(HireDate) from HumanResources.Employee);


SELECT ISNULL(( SELECT TOP 1 PhoneNumber from Person.PersonPhone as PPP
    WHERE PPP.BusinessEntityID = PP.BusinessEntityID), '') as [PhoneNumber],
    HRE.* from person.person PP
    JOIN HumanResources.Employee AS HRE 
    ON PP.BusinessEntityID = HRE.BusinessEntityID;