/* 
CHAR([NUMERO[ATE 255]])
NCHAR([NUMERO[ATE 255]]) Retorna 1 caracter.
ASCII() Retorno valor da tabela ASCII
UNICODE('UniCaracter) retorna inteiro.
SOUNDEX(Character_expression) returns varchar
DIFFERENCE() - Retorna de 0 a 4, onde zero significa nenhuma ou pouca semelhança e 4 muita semelhança.
REVERSE(EXPRESSAO) Inverte expressão.

 */

SELECT CHAR(201) AS [CHAR],
        NCHAR(22) AS [NCHAR],
        ASCII('d') as [ASCII],
        UNICODE('d') as [UNICODE],
        SOUNDEX('Fernando') as [SOUNDEX],
        SOUNDEX('DevDojo')as [SOUNDEX_2],
        DIFFERENCE(SOUNDEX('Fernando'),SOUNDEX('DevDojo')) AS [DIFFERENCE],
        DIFFERENCE('Fernando','DevDojo') AS [DIFFERENCE],
        REVERSE('DevDojo melhor canal do Brasil') as [Frase invertida]

SELECT
    reverse(firstName) as REV,
    soundex(FirstName) as S1,
    SOUNDEX(LastName) as S3
from person.person



sdsdsd