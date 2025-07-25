SELECT GETDATE() as [GETDATE()],
        DATEPART(HOUR, GETDATE()) AS HORA,
        DATEPART(MINUTE,GETDATE()) AS MINUTO,
        DATEPART(YEAR, GETDATE()) AS ANO,

        YEAR(GETDATE()) AS ANOSOZINHO,
        MONTH(GETDATE()) AS MESSOZINHO,
        DAY(GETDATE()) AS DIASOZINHO,

        DATEPART(MICROSECOND,SYSDATETIME()) AS [MICROSECOND],
        DATEPART(NANOSECOND,SYSDATETIME()) AS NANO,

        DATENAME(MONTH, GETDATE()) AS NOME_DO_MES,
        DATENAME(DAY, GETDATE()) AS DIA_DO_MES
