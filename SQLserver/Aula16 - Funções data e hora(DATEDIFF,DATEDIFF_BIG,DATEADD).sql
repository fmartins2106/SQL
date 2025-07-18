

SELECT GETDATE() AS HOJE, 
DATEDIFF(DAY,'1991-04-12',GETDATE()), /* TOTAL DE DIAS ATÉ HOJE */
DATEDIFF(HOUR, '1991-04-12 10:58:34', GETDATE()) AS HORAS,
DATEDIFF_BIG(NANOSECOND, '1991-04-12 10:58:34',SYSDATETIME()) as PRECISAO


SELECT
BusinessEntityID,
Title,
FirstName,
DATEDIFF(MONTH, ModifiedDate,GETDATE()) AS DIF_MESES,
DATEDIFF(YEAR, ModifiedDate,GETDATE()) as DIF_ANO,
DATEDIFF(DAY, ModifiedDate,GETDATE()) as DIF_DAY,
ModifiedDate
FROM person.person



SELECT
BusinessEntityID,
Title,
FirstName,
DATEDIFF(MONTH, ModifiedDate,GETDATE()) AS DIF_MESES,
DATEDIFF(YEAR, ModifiedDate,GETDATE()) as DIF_ANO,
DATEDIFF(DAY, ModifiedDate,GETDATE()) as DIF_DAY,
ModifiedDate,
DATEADD(MONTH,3,ModifiedDate) as MESES_ACRESCIDOS
FROM person.person



SELECT
BusinessEntityID,
Title,
FirstName,
DATEDIFF(MONTH, ModifiedDate,GETDATE()) AS DIF_MESES,
DATEDIFF(YEAR, ModifiedDate,GETDATE()) as DIF_ANO,
DATEDIFF(DAY, ModifiedDate,GETDATE()) as DIF_DAY,
ModifiedDate,
DATENAME(MONTH,ModifiedDate) as NOME_DO_MES,
DATENAME(MONTH,(DATEADD(MONTH,3,ModifiedDate))) as MESES_ACRESCIDOS
FROM person.person





