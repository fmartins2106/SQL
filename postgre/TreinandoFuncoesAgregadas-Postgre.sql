select * from empresa.vendas
limit 40;


SELECT COUNT(*) AS TOTAL_VENDAS
from empresa.vendas

select * from empresa.vendas


select * from empresa.funcionarios
limit 10;



select
    c.nome as Cargo,
    SUM(f.salario) AS total_salario
from empresa.funcionarios f
inner join empresa.cargos c
ON c.cargo_id = f.cargo_id
GROUP BY c.nome, f.nome
ORDER by total_salario desc


SELECT
    c.nome as Cargo,
    d.nome as Departamento,
    SUM(f.salario) as Total_Salário
from empresa.funcionarios f
inner join empresa.cargos c
on c.cargo_id = f.cargo_id
inner join empresa.departamentos d
on d.departamento_id = f.departamento_id  
group by c.nome,f.salario, d.nome
order by  f.salario desc

select * from empresa.funcionarios
limit 30;

select * from empresa.cargos
limit 40

select * from empresa.departamentos
limit 40

select * from empresa.cargos
limit 30


select count(*)
from empresa.funcionarios

select COUNT(*) as contador,
    nome,
    sobrenome
from empresa.funcionarios
GROUP BY nome,sobrenome


select MIN(funcionario_id) as minimo,
        MAX(funcionario_id) as máximo,
        AVG(funcionario_id) as média,
        SUM(funcionario_id) as soma
from empresa.funcionarios


select *
from empresa.funcionarios
where data_nascimento BETWEEN '1985-01-01' and '1990-01-01'

select departamento_id,
    MIN(salario) AS MENOR_SALARIO,
    MAX(salario) AS MAIOR_SALARIO
from empresa.funcionarios
group by departamento_id


select * from empresa.vendas
limit 40

select v.cliente_id,
    c.nome as NOME_CLIENTE,
    COUNT(v.venda_id) as QUANT_VENDAS,
    MIN(v.total) as MENOR_COMPRA,
    MAX(v.total) as MAIOR_COMPRA,
    SUM(v.total) as TOTAL_COMPRAS
from empresa.vendas v
inner join empresa.clientes c
ON c.cliente_id = v.cliente_id
where v.data_venda BETWEEN '2024-01-01' and '2025-06-01'
GROUP BY v.cliente_id,c.nome
ORDER by v.cliente_id

select v.cliente_id,
    c.nome as NOME_CLIENTE,
    COUNT(v.venda_id) as QUANT_VENDAS_REALIZADAS,
    MIN(v.total) as MENOR_COMPRA,
    MAX(v.total) as MAIOR_VENDA,
    AVG(v.total) as MÉDIA_DE_COMPRAS,
    SUM(v.total)  as TOTAL_VENDAS
FROM empresa.vendas v 
inner join empresa.clientes c
ON c.cliente_id = v.cliente_id
GROUP BY v.cliente_id, c.nome
having count(v.venda_id ) = 4
order by total_vendas desc


select * from empresa.vendas limit 30
select * from empresa.clientes limit 30

