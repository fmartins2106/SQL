--views

select *
from db_venda *
limit 20;

select *
from db_cliente
limit 10;

select *
from db_produto_venda
limit 10;

CREATE OR REPLACE VIEW VW_relatorio_vendas as
SELECT v.id_cliente,
       to_char(c.data_criacao, 'DD/MM/YYYY')                    as data_criação,
       LEFT(TO_CHAR(v.data_venda, 'DD/MM/YYYY HH24:MI:SS'), 21) AS data_com_2_casas,
       v.total,
       pv.id_produto,
       pv.preco_unitario,
       pv.quantidade
FROM db_venda v
         inner join db_cliente c
                    on c.id_cliente = v.id_cliente
         inner join db_produto_venda pv
                    on pv.id_venda = v.id_venda

SELECT *
FROM VW_relatorio_vendas
ORDER BY data_com_2_casas DESC;

SELECT *
FROM VW_relatorio_vendas
ORDER BY data_com_2_casas desc;

select table_schema as "Nome schema",
       table_name   as "Nome da tabela"
FROM information_schema.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
  AND TABLE_SCHEMA not in ('pg_catalog', 'information_schema')
order by table_schema, table_name;

select datname
from pg_database;

CREATE SCHEMA if not exists escola;
DROP SCHEMA IF EXISTS escola;

select *
from db_venda
limit 3;

select *
from fn_total_venda_cliente(104);

select *
from db_cliente
limit 3;
select *
from db_pessoa
limit 3;

CREATE OR REPLACE FUNCTION fn_total_venda_cliente(id_clientes INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    total_venda NUMERIC(12, 2);
BEGIN
    SELECT COALESCE(sum(total), 0)
    INTO total_venda
    FROM db_Venda
    where id_cliente = id_clientes;
    RETURN total_venda;
end;
$$ LANGUAGE plpgsql;

select c.id_cliente,
       p.nome,
       fn_total_venda_cliente(c.id_cliente) as total_vendas
from db_cliente c
inner join db_pessoa p
on p.id_pessoa = c.id_pessoa
where c.id_cliente = 108;

CREATE OR REPLACE FUNCTION fn_total_vendas(id_cliente_total INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    total_venda NUMERIC(12, 2);
BEGIN
    SELECT COALESCE(sum(total), 0)
    INTO total_venda
    FROM db_venda
    WHERE id_cliente = id_cliente_total;
    return total_venda;
end
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_total_vendas_por_cliente(id_venda_cliente INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    total_venda NUMERIC(12, 2);
BEGIN
    SELECT COALESCE(sum(total), 0)
    INTO total_Venda
    FROM db_venda
    where id_cliente = id_venda_cliente;
    return total_venda;
end;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION fn_total_venda_cliente(venda_id_cliente INTEGER)
    RETURNS NUMERIC as
$$

declare
    total_venda NUMERIC(12, 2);
BEGIN
    SELECT COALESCE(sum(total), 0)
    INTO total_venda
    from db_venda
    where id_cliente = venda_id_cliente;
    RETURN total_venda;
end;
$$ LANGUAGE plpgsql;


--Vamos criar uma função que recebe o id_cliente e retorna o total gasto pelo cliente em todas as vendas.

-- Cria ou substitui uma função chamada fn_total_gasto_cliente que recebe um parâmetro inteiro (ID do cliente)
CREATE OR REPLACE FUNCTION fn_total_gasto_cliente(p_id_cliente INTEGER)
-- A função retorna um número (NUMERIC)
    RETURNS NUMERIC as
$$
-- Declara uma variável chamada total_gasto do tipo numérico com 12 dígitos e 2 casas decimais
declare
    total_gasto NUMERIC(12, 2);
BEGIN
    -- Realiza uma soma do campo "total" da tabela db_venda, onde o id_cliente é igual ao parâmetro recebido
    -- Se não houver resultado, retorna 0 com COALESCE
    SELECT COALESCE(sum(total), 0)
    INTO total_gasto -- Armazena o resultado na variável total_gasto
    FROM db_venda
    WHERE id_cliente = p_id_cliente;
    -- Retorna o valor da variável total_gasto como resultado da função
    return total_gasto;
END;
-- Define a linguagem da função como PL/pgSQL (linguagem procedural do PostgreSQL)
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_total_venda_nota(id_produto_nota INTEGER)
RETURNS NUMERIC AS $$
DECLARE
    total_preco_quantidade NUMERIC(12,2);
    BEGIN
    SELECT COALESCE(sum(quantidade * preco_unitario),0)
    INTO total_preco_quantidade
    from db_produto_venda
    WHERE id_venda = id_produto_nota;
    RETURN total_preco_quantidade;
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_calculo_total_uma_venda(p_id_venda INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    total NUMERIC(12, 2);
BEGIN
    SELECT COALESCE(sum(preco_unitario * quantidade), 0)
    INTO total
    FROM db_produto_venda
    WHERE id_venda = p_id_venda;
    RETURN total;
end;
$$ LANGUAGE plpgsql;

select * from db_produto_venda where id_venda =10;

select * from db_cliente limit 3;

select
    v.id_venda,
    p.nome,
    fn_calculo_total_uma_venda(v.id_venda) as "Total da venda"
    from db_venda v
    inner join db_cliente c on c.id_cliente = v.id_cliente
    inner join db_pessoa p on p.id_pessoa = c.id_pessoa
    WHERE v.id_venda = 10;

-- Cria ou substitui a função chamada fn_calcula_total_venda, que recebe um ID de venda como parâmetro
CREATE OR REPLACE FUNCTION fn_calcula_total_venda(p_id_venda INTEGER)
-- Define o tipo de retorno da função como NUMERIC
    RETURNS NUMERIC AS
$$
-- Início do bloco da função
DECLARE
    -- Declara a variável 'total' do tipo numérico com 12 dígitos no total e 2 casas decimais
    total NUMERIC(12, 2);
BEGIN
    -- Realiza a soma do valor total dos produtos (preço * quantidade) da venda informada
    -- Se o resultado for nulo (nenhum item), retorna 0
    SELECT COALESCE(SUM(preco_unitario * quantidade), 0)
    INTO total
    FROM DB_PRODUTO_VENDA
    WHERE id_venda = p_id_venda;
    -- Retorna o valor total calculado
    RETURN total;
-- Fim do bloco da função
END;
-- Define que a linguagem usada é PL/pgSQL (linguagem procedural do PostgreSQL)
$$ LANGUAGE plpgsql;


CREATE OR REPLACE VIEW vw_itens_venda AS
SELECT
    v.id_venda,
    p.nome_produto,
    pv.preco_unitario,
    pv.quantidade,
    (pv.preco_unitario * pv.quantidade) AS total_item
FROM DB_PRODUTO_VENDA pv
JOIN DB_PRODUTO p ON pv.id_produto = p.id_produto
JOIN DB_VENDA v ON pv.id_venda = v.id_venda;

CREATE OR REPLACE VIEW vw_itens_venda as
SELECT
    v.id_venda,
    p.nome_produto,
    pv.preco_unitario,
    pv.quantidade,
    (pv.preco_unitario * pv.quantidade) as total_item
FROM db_produto_venda pv
JOIN db_produto p on pv.id_produto = p.id_produto
inner join db_venda v on pv.id_venda = v.id_venda
order by v.id_venda;