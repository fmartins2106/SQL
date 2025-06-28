SELECT GETDATE() AS [GETDATE()],

EOMONTH( GETDATE()) AS [EOMONTH], /* Trás o último dia do mês */
EOMONTH( GETDATE(), -4) AS [NEG], /* Tirou 4 dias do mes no retorno */

EOMONTH('2020-02-10') AS FEV,/* Mesma coisa, porém forma  visual */
EOMONTH('2010-02-10',3) AS MES /* Adiciona 3 meses na contagem */

select 
BusinessEntityID,
FirstName,
ModifiedDate,
EOMONTH(ModifiedDate, -3) as [-3 Meses],
EOMONTH(ModifiedDate) AS UTIMO_DIA_DO_MES,
EOMONTH(ModifiedDate,6) AS [+6 MESES]
from person.person

SELECT DATEFROMPARTS(2014,10,7) /* DEFINIR DIA SEPARADOS */
SELECT TIMEFROMPARTS(12,30,40,0,0) /* PARA DEFINIR HORA SEPARADA*/

SELECT DATETIMEFROMPARTS(1991,4,12,1,58,30,0) /* DATA E HORA FRACIONADA(SEPARADAS) */

