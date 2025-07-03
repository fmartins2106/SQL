
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


select * from empresa.vendas limit 20




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