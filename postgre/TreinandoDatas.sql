
select NOW() as "Data e hora"/* Data e hora com segundos, microsegundos e fuso horario */

SELECT
    EXTRACT(HOUR FROM NOW()) AS HORA, /* Trás somente a hora. */
    EXTRACT(MINUTE FROM NOW()) AS MINUTO, /* Somente o minuto */
    EXTRACT(DAY FROM NOW()) AS DIA,
    EXTRACT(MONTH FROM NOW()) AS MES,
    EXTRACT(YEAR FROM NOW()) AS ANO /* Ano */

    /* ESCREVER O MES */
SELECT
TO_CHAR(NOW(), 'month') AS NOME_DO_MES;


SELECT
    CASE EXTRACT(DOW FROM NOW()) 
        WHEN 0 THEN 'Domingo'
        WHEN 1 THEN 'Segunda-feira'
        WHEN 2 THEN 'Terça-feira'
        WHEN 3 THEN 'Quarta-feira'
        WHEN 4 THEN 'Quinta-feira'
        WHEN 5 THEN 'Sexta-feira'
        WHEN 6 THEN 'Sábado'
    END AS "Dia da semana"


SELECT * FROM NOW()


SELECT(NOW():: DATE - DATE '2024-01-02') AS "Total de dias"

select(now():: DATE - DATE '2020-01-01') AS "Total de dias"
/* total de dias */


SELECT EXTRACT(YEAR FROM NOW()) /* Data hoje. */


SELECT /* mês descritivo */
    TO_CHAR(NOW(), 'MONTH') AS "Mês"


SELECT /* mês descritivo */
    TO_CHAR(NOW(), 'MONTH') AS "MÊS"


SELECT /* Calculando idade */
    DATE_PART('YEAR',AGE(NOW(), '2020-01-02')) AS "IDADE"


SELECT
    DATE_TRUNC('MONTH', NOW()) + INTERVAL '1 MONTH' - INTERVAL
    '1 DAY' AS "ÚLTIMO DIA DO MÊS"



      DATE_TRUNC('MONTH', ModifiedDate) + INTERVAL '1 MONTH' - INTERVAL '1 day' AS ultimo_dia_do_mes,

SELECT 
    (NOW()::date - DATE '1991-04-12') AS total_dias; /* Calculando total de dias */

SELECT
    nome,
    sobrenome,
    data_nascimento,
    DATE_PART('month', AGE(NOW(), data_nascimento)) AS dif_meses,
    DATE_PART('year', AGE(NOW(), data_nascimento)) AS dif_ano,
    (NOW()::date - data_nascimento::date) AS dif_day,
    data_nascimento
FROM empresa.funcionarios;

SELECT
    nome,
    sobrenome,
    data_nascimento,
    DATE_PART('month', AGE(NOW(), data_nascimento)) AS dif_meses,
    DATE_PART('year', AGE(NOW(), data_nascimento)) AS dif_ano,
    (NOW()::date - data_nascimento::date) AS dif_day,
    data_nascimento,
data_nascimento + INTERVAL '3 months' as meses_acrescidos /* Acrescentando meses na data */
FROM empresa.funcionarios;


-- Último dia do mês atual
SELECT DATE_TRUNC('MONTH', NOW()) + INTERVAL '1 MONTH' - INTERVAL '1 day' AS eomonth;

-- Último dia do mês 4 meses atrás
SELECT DATE_TRUNC('MONTH', NOW() - INTERVAL '4 MONTH') + INTERVAL '1 MONTH' - INTERVAL '1 day' AS eomonth_neg;

-- Último dia de fevereiro de 2020
SELECT DATE_TRUNC('MONTH', DATE '2020-02-10') + INTERVAL '1 MONTH' - INTERVAL '1 day' AS fev;

-- Último dia do mês 3 meses depois de 2010-02-10
SELECT DATE_TRUNC('MONTH', DATE '2010-02-10' + INTERVAL '3 MONTH') + INTERVAL '1 MONTH' - INTERVAL '1 day' AS mes;


SELECT 
  BusinessEntityID,                          -- ID da pessoa
  FirstName,                                 -- Nome
  ModifiedDate,                              -- Data de modificação original

  -- Último dia do mês 3 meses antes da data
  DATE_TRUNC('MONTH', ModifiedDate - INTERVAL '3 MONTH') + INTERVAL '1 MONTH' - INTERVAL '1 day' AS menos_3_meses,

  -- Último dia do mês da data atual


  -- Último dia do mês 6 meses depois da data
  DATE_TRUNC('MONTH', ModifiedDate + INTERVAL '6 MONTH') + INTERVAL '1 MONTH' - INTERVAL '1 day' AS mais_6_meses

FROM person.person;


-- Cria uma data a partir do ano, mês e dia (equivalente ao DATEFROMPARTS)
SELECT MAKE_DATE(2014, 10, 7) AS data_manual;

-- Cria um horário a partir de hora, minuto, segundo (equivalente ao TIMEFROMPARTS)
SELECT MAKE_TIME(12, 30, 40) AS hora_manual;

-- Cria uma data e hora completas (equivalente ao DATETIMEFROMPARTS)
SELECT MAKE_TIMESTAMP(1991, 4, 12, 1, 58, 30) AS datahora_manual;






select * from empresa.funcionarios
limit 3


SELECT

    NOW() AS "NOW()",                                 -- data e hora atual
    EXTRACT(HOUR FROM NOW()) AS hora,                 -- hora
    EXTRACT(MINUTE FROM NOW()) AS minuto,             -- minuto
    EXTRACT(YEAR FROM NOW()) AS ano,                  -- ano

    DATE_PART('year', NOW()) AS anosozinho,           -- outra forma de obter o ano
    DATE_PART('month', NOW()) AS messozinho,          -- mês
    DATE_PART('day', NOW()) AS diasozinho,            -- dia

    EXTRACT(MICROSECONDS FROM clock_timestamp()) AS microsecond, -- microssegundos
    EXTRACT(NANOSECONDS FROM clock_timestamp()) AS nano;          -- nanossegundos



SELECT
    TO_CHAR(NOW(), 'Month') AS nome_do_mes,           -- nome do mês por extenso
    TO_CHAR(NOW(), 'DD') AS dia_do_mes;                -- dia do mês como string




SELECT 
DATE_PART('YEAR', NOW()) AS ANO,
DATE_PART('month', NOW()) AS MES,
DATE_PART('DAY', NOW()) AS DIA

