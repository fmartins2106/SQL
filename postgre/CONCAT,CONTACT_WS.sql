
SELECT
v.venda_id,
v.cliente_id,
c.nome,
v.funcionario_id,
v.data_venda,
v.total,
v.status,
v.forma_pagamento,
-- CONCAT ignora nulos, mas adiciona espaço onde houver string vazia
CONCAT(v.data_venda,' ',v.funcionario_id,' ',v.total,' ',v.status,' ',v.forma_pagamento) as "Informações principais",
    -- CONCAT_WS ignora nulos e não insere espaços extras
CONCAT_WS(' ',v.funcionario_id,v.data_venda,v.total,v.status, CURRENT_DATE) as "CONCAT_WS"
from empresa.vendas v
inner join empresa.clientes c ON c.cliente_id = v.cliente_id
ORDER BY v.venda_id


 
select TABLE_NAME AS "NOME DAS TABLEAS" -- Renomeia a coluna TABLE_NAME para "NOME DAS TABELAS" no resultado
    FROM INFORMATION_SCHEMA.TABLES - Usa a visão de metadados que contém informações sobre todas as tabelas do banco
    WHERE table_schema = 'empresa' -- Filtra apenas as tabelas que estão no esquema chamado 'empresa'
    and table_type = 'BASE TABLE' -- Garante que só as tabelas reais (físicas) serão listadas, excluindo as views


SELECT
    f.funcionario_id,
    f.nome || ' ' || f.sobrenome as "Nome Completo",
    f.data_nascimento,
    DATE_PART('YEAR',AGE(NOW(), f.data_nascimento)) as "Idade",
    f.salario,
    CONCAT_WS(' | ',c.salario_minimo, c.salario_maximo) as "Salário mínimo e máximo do departamento",
    CONCAT_WS(' | ',d.nome, d.descricao) as "Dados Departamento"
FROM empresa.funcionarios f
inner join empresa.cargos c
on c.cargo_id = f.cargo_id
inner join empresa.departamentos d
on d.departamento_id = f.departamento_id
order by "Nome Completo" desc

SELECT EXTRACT(YEAR FROM NOW())

SELECT EXTRACT(MONTH FROM NOW())

SELECT EXTRACT(DAY FROM NOW())

SELECT * FROM NOW()

SELECT * FROM CURRENT_DATE

select * from empresa.departamentos limit 2

SELECT * FROM EMPRESA.FUNCIONARIOS LIMIT 2

SELECT * FROM EMPRESA.CARGOS LIMIT 2


select * from empresa.vendas limit 20


SELECT
    (NOW():: DATE - DATE '2020-10-12') AS "Total de dias"

SELECT
    DATE_PART('YEAR',AGE(NOW(), '2020-02-22'))


SELECT
f.nome || ' ' || f.sobrenome as "nome completo",
c.cargo_id,
c.nome
    from empresa.funcionarios f
    inner join empresa.cargos c
    on c.cargo_id = f.cargo_id
order by c.cargo_id

SELECT
nome,
descricao,
salario_minimo,
salario_maximo
from empresa.cargos
GROUP BY nome,descricao,salario_minimo, salario_maximo
ORDER BY nome desc

select
    SUM(c.salario_maximo) as "Soma Salário",
    AVG(c.salario_maximo) as "Média salário"
from empresa.cargos c







select * from empresa.cargos
limit 30

select * from empresa.funcionarios
limit 30