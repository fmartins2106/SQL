/* PARSE(NOME_DA_COLUNA AS [DATA_TYPE] [USING CULTURE]) */

SELECT (SELECT PARSE('3654' AS INT)) + (SELECT PARSE('6' AS INT))

SELECT TRY_PARSE('3654' AS INT)

SELECT PARSE('R$360,00' as money USING 'pt-BR')

/* parse não é utilizado muito. Melhor usar cast, convert */
