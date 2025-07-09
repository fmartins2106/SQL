/* 
TRANSLATE(Expressão/Nome_da_coluna, - caracteres que quer traduzir, - como quer que retorne )

 */

SELECT
    REPLACE('A melhor seleção do mundo é o Brasil ?','ç','c'),
    TRANSLATE('A melhor seleção do mundo é o Brasil ?','ça é ?', 'ca e !')


SELECT
    BusinessEntityID,
    TRY_CAST(RateChangeDate as Date) as RateChangeDate,
    TRY_CAST(Rate as varchar(10)) AS RATE2,
    Rate,
    STR(Rate, 8, 2) as [STR],
    PayFrequency
FROM HumanResources.EmployeePayHistory