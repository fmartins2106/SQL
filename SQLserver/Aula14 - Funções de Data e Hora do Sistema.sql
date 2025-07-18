SELECT TRY_CAST(GETDATE() AS TIME) AS [TIME], /* Traz a hora com a presição */
       TRY_CAST(GETDATE() AS DATE) AS [DATE], /* Traz somente a data */

    GETDATE()  AS [GETDATE()],
    CURRENT_TIMESTAMP AS [CURRENT_TIMESTAMP], /* semelhante ao GETDATE(). O GETDATE() é mais utilizado. */
    SYSDATETIME() AS [SYSDATETIME()], /* Igual GETDATE, porém traz uma presição maior no segundos. Utilizado em casos especificos*/
    GETUTCDATE() AS [GETUTCDATE()],/* RETONAR HORARIO UNIVERSAL MUNDIAL */
    SYSDATETIMEOFFSET() AS [SYSDATETIMEOFFSET()],/* traz valor do fusohorário - 3horas */
    CURRENT_TIMEZONE() AS [CURRENT_TIMEZONE] /* Traz o fuso horário, mas não está implementado de forma oficial */




SELECT @@VERSION /* verificar a verão do banco de dados */


