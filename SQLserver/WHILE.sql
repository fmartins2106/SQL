--WHILE

DROP TABLE IF EXISTS #tempTbl
go
DECLARE @Contador INT = 1

CREATE TABLE #TempTbl(
    id INT
)


--CONDIÇÃO PARA EXECUÇÃO

--WHILE @Contador <= 20
WHILE (@Contador <= 1000 OR YEAR(GETDATE()) <> 2025) --ENQUANTO FOR VERDADE
    BEGIN
        INSERT INTO #TempTbl
        VALUES (@Contador)
        SET @Contador += 1
    end

SELECT * FROM #TempTbl

GO
----------------------------------------------
SET NOCOUNT ON
GO

DROP TABLE IF EXISTS #TblCalendario
go

CREATE TABLE #TblCalendario(
    [Data] DATE PRIMARY KEY
)

declare @Data DATE = '2000-01-01'

while @Data <= try_cast(getdate() as DATE)
    BEGIN
        INSERT INTO #TblCalendario
        VALUES (@Data)
        set @Data = DATEADD(DAY,1,@Data)
    end

SELECT  * FROM #TblCalendario


------------------------------------------------

declare @Campo VARCHAR(200) = '     SQL     Server'
    SET @Campo = TRIM(@Campo)

while CHARINDEX(' ',@Campo) > 0
    begin
        SET @Campo = REPLACE(@Campo,' ','')
    end

SELECT @Campo
go





