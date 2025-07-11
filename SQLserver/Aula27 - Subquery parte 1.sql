
SELECT BusinessEntityID,
        LoginID,
        [Título do trabalho],
        BirthDate,
        [DIF em dias],
        MaritalStatus,
        Gender,
        HireDate,
        [Ano de Contratação],
        VacationHours,
        SickLeaveHours,
        ModifiedDate
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
        from HumanResources.Employee 
    ) AS DEVDOJO
/*     WHERE [Ano de contratação] = 2009 */    
    ORDER BY BirthDate