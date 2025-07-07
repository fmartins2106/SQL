/* 
    POSITION(EXPRESSSÃO A PROCURAR, NOME_DA_COLUNA);
    obs: Usar somente para texto.
    ____________________________________________________
    POSITION(SUBSTRING USING SIMILAR TO or LIKE) 

 */

select POSITION('t' IN 'eu te amo')


SELECT 
    POSITION('y' IN 'O melhor canal do youtube é o DevDojo, brabo demais!') AS POSITION,
    POSITION('é o' IN 'O melhor canal do youtube é o DevDojo, brabo demais!') AS POSITION


SELECT 
    POSITION('o' IN 'olá mundo') AS pos1,   -- 1
    POSITION('u' IN 'olá mundo') AS pos2,   -- 6
    POSITION('x' IN 'olá mundo') AS pos3;   -- 0 (não encontrado)


select  position('e' in 'Fernando Martins') as "Procurando a posição da letra e"

SELECT 
    "BusinessEntityID",
    "EmailAddress",
    POSITION('@' IN "EmailAddress") AS charindex,
    SUBSTRING("EmailAddress" FROM 1 FOR POSITION('@' IN "EmailAddress") - 1) AS nome_usuario,
    "ModifiedDate",
    POSITION('8' IN "ModifiedDate"::text) AS pos -- convertendo data para texto
FROM person."EmailAddress";

SELECT
    cliente_id,
    nome,
    email,
    POSITION('@' IN "email") as "Posição do @",
    SUBSTRING("email" from 1 for POSITION('@' in "email")-1) as "Nome do usuário"
from empresa.clientes


SELECT
    f.nome || ' ' || f.sobrenome,
    f.data_nascimento,
    date_part('YEAR', AGE(NOW(), f.data_nascimento)) as "Idade",
    POSITION('@' IN 'email'),
    SUBSTRING("email" from 1 for POSITION('@' in "email") - 1) as "Nome do usuário"
from empresa.funcionarios f


SELECT * FROM EMPRESA.auditorias LIMIT 3

SELECT TABLE_NAME AS "NOME TABELAS"
    FROM information_schema.tables
    WHERE TABLE_SCHEMA = 'empresa'
    and TABLE_TYPE = 'BASE TABLE'

SELECT
    CASE EXTRACT(DOW FROM NOW())
        WHEN 0 THEN 'Domingo'
        WHEN 1 THEN 'Segunda-FEIRA'
        WHEN 2 THEN 'Terça-FEIRA'
        WHEN 3 THEN 'Quarta-FEIRA'
        WHEN 4 THEN 'Quinta-FEIRA'
        WHEN 5 THEN 'Sexta-FEIRA'
        WHEN 6 THEN 'Sábado'
    END AS "Dia da semana"


select * from CURRENT_DATE


SELECT 
* FROM EMPRESA.clientes





SELECT
    nome,
    (NOW()::DATE - data_nascimento) as "Total de dias"
    from empresa.funcionarios


select * from empresa.funcionarios limit 3
