DROP FUNCTION IF EXISTS dbo.FunDataExtenso


CREATE OR ALTER FUNCTION dbo.FunDataExtenso(
    @Data VARCHAR(10)
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @Resultado VARCHAR(100)

    IF ISDATE(@Data) = 1
    BEGIN
        DECLARE @DataConvertida DATE = CONVERT(DATE, @Data, 103);
        DECLARE @Mes VARCHAR(12)

        SET @Mes = (SELECT CASE MONTH(@DataConvertida)
                            WHEN 1 THEN 'Janeiro'
                            WHEN 2 THEN 'Fevereiro'
                            WHEN 3 THEN 'Março'
                            WHEN 4 THEN 'Abril'
                            WHEN 5 THEN 'Maio'
                            WHEN 6 THEN 'Junho'
                            WHEN 7 THEN 'Julho'
                            WHEN 8 THEN 'Agosto'
                            WHEN 9 THEN 'Setembro'
                            WHEN 10 THEN 'Outubro'
                            WHEN 11 THEN 'Novembro'
                            WHEN 12 THEN 'Dezembro'
                        END)

        SET @Resultado = CONCAT('Rio de Janeiro, ', DAY(@DataConvertida), ' de ', @Mes, ' de ', YEAR(@DataConvertida), '.')
    END
    ELSE
    BEGIN
        SET @Resultado = 'Insira um valor no formato de data.'
    END

    RETURN @Resultado
END

-- Teste
SELECT dbo.FunDataExtenso('') AS Coluna


