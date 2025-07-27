select top 10 * from person.person;

WITH CTE_SALES AS (
    select
    SUM(LineTotal) AS LineTotal,
    DATEPART(YEAR,ModifiedDate) as Ano,
    MONTH(ModifiedDate) as Mes
from Sales.SalesOrderDetail
group by
    DATEPART(YEAR,ModifiedDate),
    MONTH(ModifiedDate)
)


select
       LineTotal,
       Ano,
       Mes,
       SUM(LineTotal) OVER ( ORDER BY Ano,Mes) AS LineTotal2
FROM CTE_SALES;