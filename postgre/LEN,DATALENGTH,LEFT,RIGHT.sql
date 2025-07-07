/* 
    LENGTH: RETORNA A QUANTIDADE DE CARACTERES | RETORNO SEMPRE DO TIPO INTEGER;
    OCTET_LENGTH: RETORNA A QUANTIDADE DE BYTES (útil para analisar armazenamento físico);
    LEFT(nome_coluna, tamanho): RETORNA A PARTE ESQUERDA DA STRING | TIPO: TEXT ou VARCHAR;
    RIGHT(nome_coluna, tamanho): RETORNA A PARTE DIREITA DA STRING | TIPO: TEXT ou VARCHAR;
    POSITION(substring IN coluna): RETORNA A POSIÇÃO DA SUBSTRING NA STRING (equivalente ao CHARINDEX);
*/
SELECT LENGTH('DEVDOJO');

SELECT
    LENGTH('DEVJOVO') AS len, -- Conta caracteres
    OCTET_LENGTH('DEVJOGO  ') AS datalength, -- Conta bytes (inclui espaços finais)
    LEFT('O melhor canal do YouTube é o DevDojo, brabo demais', 8) AS esquerda,
    LEFT('O melhor canal do YouTube é o DevDojo, brabo demais', LENGTH('O melhor canal do YouTube é o DevDojo, brabo demais') / 2) AS metade_esquerda,
    RIGHT('O melhor canal do YouTube é o DevDojo, brabo demais', 8) AS direita,
    LEFT(CAST(561 AS TEXT), 1) AS left_num,
    RIGHT(CAST(NOW() AS TEXT), 4) AS right_data
;


SELECT LENGTH('Fernando martins')

select
    LENGTH('Fernando martins') as "Quantidade de letras",
    OCTET_LENGTH('Fernando martins') as "Quantidade de bytes", 
    LEFT('Eu sou o melhor',8) as esquerda,
    LEFT('O melhor canal do youtube é o DevDojo',LENGTH('O melhor canal do youtube é o DevDojo')/2) as metade_esquerda,
    RIGHT('O melhor canal do youtube é o DevDojo',8) AS DIREITA,
    LEFT(CAST(561 AS TEXT),1) AS LEFT_NUM,
    RIGHT(CAST(NOW() AS TEXT),50) AS RIGHT_DATA


SELECT
    "BusinessEntityID",
    LENGTH("EmailAddress") AS len,
    POSITION('@' IN "EmailAddress") AS pos_arroba,
    LEFT("EmailAddress", POSITION('@' IN "EmailAddress") - 1) AS username,
    "EmailAddress",
    RIGHT("EmailAddress", LENGTH("EmailAddress") - POSITION('@' IN "EmailAddress")) AS dominio
FROM person."EmailAddress"
ORDER BY "BusinessEntityID";


SELECT 
    nome,
    sobrenome,
    email,
    length("email") "Quantidade de caracteres do email",
    POSITION('@' IN "email") as "Posição do arroba",
    LEFT("email",POSITION('@' IN "email")-1) as Username,
    RIGHT("email",LENGTH("email") - POSITION('@' IN "email")) as dominio
from empresa.funcionarios


SELECT * FROM empresa.funcionarios limit 2
