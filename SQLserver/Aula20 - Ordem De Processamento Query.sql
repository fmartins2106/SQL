/* Ordem de processamento da query
    1 -FROM
    2 -WHERE
    3 -GROUPBY
    4 -HAVING
    5 -SELECT
    6 -ORDER BY
    7 -OFFSET NEXT */

select 
    SalesOrderID,
    CarrierTrackingNumber,
    --OrderQty,
    --ProductID,
     MAX(UnitPrice) AS TOTAL,
    --LineTotal,
    TRY_CAST(ModifiedDate AS DATE) as [DataModificada]
from sales.SalesOrderDetail
WHERE CarrierTrackingNumber is not NULL
GROUP BY SalesOrderID,
        CarrierTrackingNumber,
        --ProductID,
        ModifiedDate
HAVING MAX(UnitPrice) > 750.0000
ORDER BY SalesOrderID
