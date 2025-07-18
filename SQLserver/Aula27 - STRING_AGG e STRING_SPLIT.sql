/* 
STRING_AGG(Nome_da_coluna/expressão, separador): retorno será um varchar.
STRING_SPLIT(Expressão, separador): retorno será uma tabela de uma única coluna.
 
 */

SELECT
    STRING_AGG( TRY_CAST(FirstName as VARCHAR(MAX)), ' ') AS DevDojo,
    LastName
from person.person
GROUP BY LastName


SELECT value
    FROM STRING_SPLIT('Willian Suane grande mestre Jedi do DevDojo',' ')