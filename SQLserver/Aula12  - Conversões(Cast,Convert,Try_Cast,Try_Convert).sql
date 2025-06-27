/*  GETDATA()
    CAST(VALOR[Nome_Da_Coluna],Nome_Da_Coluna,[style]) 
    CONVERT ([Tipo_Do_Dado], Nome_Da_Coluna,[style])

*/

select (select cast ( '33' as int)) + (select cast( '37' as int)) as result
 
 select cast ('20010101' AS DATE)
 select  GETDATE() /*  DATA COM HORA */
 SELECT CONVERT(VARCHAR(10),GETDATE(),103) /* Data no padrão brasileiro */
 select(select CONVERT(int, '6526164')) + 6
SELECT CONVERT(VARCHAR(10),GETDATE(),3) /* Data no padrão brasileiro com ano em 2 digitos */

SELECT CONVERT(VARCHAR(25),GETDATE(),113) /* Data no padrão britanico ex: 04 ago 2021 hh:MM:ss:ml*/

SELECT TRY_CONVERT(DATE,'14/02/2017', 101) AS COLUNA1,
     TRY_CONVERT(DATE, '02/14/2017', 101) AS COLUNA2


SELECT CAST('45F' AS smallmoney) AS CONV
SELECT TRY_CAST('45F' AS smallmoney) AS CONV

SELECT (SELECT CAST(GETDATE() AS varchar(25))) + '6565' /* CONVERTE DATA PARA TESTO, O SINAL DE + É USADO PARA CONCATENAÇÃO */


SELECT TRY_CAST('6528.56' AS float)

SELECT TRY_CAST('255' AS tinyint) /* Intervalo de dado pequeno 1byte */
