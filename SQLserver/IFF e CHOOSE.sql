--Funções lígicas
-- IIF(test_logico, 'SeForVerdadeiro','SeForFalso')
-- CHOOSE(indice,expressões(argumentos))



SELECT IIF(5 > 2, 'Verdadeiro','Falso') as TestIFF
-- Não recomendado usar em join.

select IIF(OrderQty >= 3, 'Muito bom','Vamos melhorar') as Test,
      * from sales.SalesOrderDetail

SELECT CHOOSE(3, 'indice 1','indice 2','indice 3','indice 4')





select IIF(OrderQty >= 3, 'Muito bom','Vamos melhorar') as Test,
        CHOOSE(OrderQty, 'indice 1','indice 2','indice 3','indice 4') as posição,
        CHOOSE(MONTH(ModifiedDate),'Verão','Verão','Outono','Outono','Inverno','Inverno','Inverno','Primaveira','Primavera','Primavera','Verão') as [Estação do ano],
      * from sales.SalesOrderDetail

