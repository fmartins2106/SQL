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


select
    nome || ' ' || sobrenome as "Nome completo",
    email,
    POSITION('@' in "email") as "Posição do @",
    LEFT("email",POSITION('@' in "email")-1) as "UserName",
    RIGHT("email",LENGTH("email") - POSITION('@' in "email")) as "Dominio"
from empresa.funcionarios


select 
    nome,
    sobrenome,
    email,
    data_nascimento,
    DATE_PART('YEAR',age(now(), data_nascimento)) as "Idade",
    length("email") "quantidade de caracteres do email",
    POSITION('@' IN "email") as "Posição do @",
    LEFT("email",POSITION('@' IN "email")-1) as UserName,
    RIGHT("email",LENGTH("email") - POSITION('@' IN "email")) as dominio
from empresa.funcionarios


SELECT * FROM CURRENT_dATE

SELECT * FROM NOW()



SELECT 
    CASE
    EXTRACT (DOW FROM NOW())     
        WHEN 2 THEN 'Quarta-feira'
    END AS "Dia da semana"

SELECT
    CASE extract(DOW FROM NOW())
        WHEN 0 THEN 'Domingo'
        WHEN 1 THEN 'Segunda-Feira'
        WHEN 2 THEN 'Terça-Feira'
        WHEN 3 THEN 'Quarta-Feira'
        WHEN 4 THEN 'Quinta-Feira'
        WHEN 5 THEN 'Sexta-Feira'
        WHEN 6 THEN 'Sábado'
    end as "Dia da semana"


select * from empresa.clientes limit 32

SELECT
    nome,
    TRIM(REPLACE(endereco,',',' - ')) as Endereço,
    TRIM(REPLACE(telefone,')',') ')) as Telefone,
    REPLACE(TO_CHAR(data_cadastro,'dd-MM-yyyy'),'-','/') as data_cadastro
from empresa.clientes


SELECT * FROM empresa.funcionarios limit 2



SELECT
    extract(YEAR FROM CURRENT_DATE)

SELECT
    CURRENT_DATE


SELECT
    CASE extract(DOW FROM NOW())
        WHEN 0 THEN 'Domingo'        
        WHEN 1 THEN 'Segunda-Feira'
        WHEN 2 THEN 'Terça-Feira'
        WHEN 3 THEN 'Quarta-Feira'
        WHEN 4 THEN 'Quinta-Feira'
        WHEN 5 THEN 'Sexta-Feira'
        WHEN 6 THEN 'Sábado'
    END AS "Dia da semama"


SELECT
    nome || ' ' || sobrenome,
    data_nascimento,
    DATE_PART('YEAR', AGE(NOW(), data_nascimento)) as "Idade",
    (NOW():: DATE - data_nascimento) as "Total de dias desde o nascimento.",
    email,
    POSITION('@' IN "email") as "Posição do @",
    LEFT("email",POSITION('@' IN "email")-1) as UserName,
    RIGHT("email",LENGTH("email") - POSITION('@' in "email")) as Dominimo


SELECT
    nome || ' ' || sobrenome,
    REPLACE(to_char(data_nascimento,'dd/MM/yyyy'),'-','/') as "Data de nascimento",
    DATE_PART('YEAR', AGE(NOW(), data_nascimento)) as "Idade",
    REPLACE(TO_CHAR(data_admissao,'dd/MM/yyyy'),'-',' / ') as "Data de adimissão",
    (NOW()::DATE - data_admissao) as "Total de dias desde a admissão",
    email,
    POSITION('@' IN email) as "Posição do @",
    LEFT("email",POSITION('@' in "email")-1) as "Nome_Usuario",
    RIGHT("email", LENGTH("email") - POSITION('@' IN "email")) as "dominio",
    CONCAT_WS(' | ', email, LEFT("email",POSITION('@' in "email")-1), RIGHT("email", LENGTH("email") - POSITION('@' IN "email"))) as "Informações do email"
from empresa.funcionarios 


SELECT * FROM empresa.funcionarios limit 3


select * from empresa.funcionarios limit 3

SELECT table_name as "Nome das talelas"
FROM information_schema.tables 
where TABLE_SCHEMA = 'empresa'
and table_type = 'BASE TABLE'


SELECT table_name as "Nome das tabelas"
FROM information_Schema.tables
where TABLE_SCHEMA = 'empresa'
and table_type = 'BASE TABLE';


SELECT TABLE_NAME AS "Nome da tabela"
from information_schema.tables
where table_schema = 'empresa'
and table_type = 'BASE TABLE'




