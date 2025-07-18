
SELECT  DEVDOJO.BusinessEntityID,
        (SELECT TOP 1 FirstName from person.person as PP 
            WHERE PP.BusinessEntityID = DEVDOJO.BusinessEntityID)   as "Primeiro nome",
        PEA.EmailAddress,
        LoginID,
        [Título do trabalho],
        BirthDate,
        [DIF em dias],
        MaritalStatus,
        Gender,
        CASE Gender
            WHEN 'F' then 'Feminino'
            WHEN 'M' then 'Masculino'
        end as [GENERO],
        HireDate,
        [Ano de Contratação],
        VacationHours,
        SickLeaveHours,
        DEVDOJO.ModifiedDate
    FROM(
        SELECT
             BusinessEntityID,
            /* NationalIDNumber */
            LoginID,
            OrganizationLevel,
            JobTitle AS [Título do trabalho],
            BirthDate,
            DATEDIFF(DAY,birthDate,GETDATE()) AS [DIF em dias],
            MaritalStatus,
            HireDate,
            YEAR(HireDate) as [Ano de contratação],
            Gender,
            VacationHours,
            SickLeaveHours,
            TRY_CAST(ModifiedDate AS DATE) AS ModifiedDate
        from HumanResources.Employee HRE 
    ) AS DEVDOJO
    JOIN person.EmailAddress as PEA
    ON DEVDOJO.BusinessEntityID = PEA.BusinessEntityID

/*     WHERE [Ano de contratação] = 2009 */    
    ORDER BY BirthDate

/* 
select * from person.Person
select * from person.EmailAddress */