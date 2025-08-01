-views

select * from db_venda * limit 20;

select * from db_cliente limit 10;

select * from db_produto_venda limit 10;

CREATE OR REPLACE VIEW VW_relatorio_vendas as
    SELECT
    v.id_cliente,
    to_char(c.data_criacao,'DD/MM/YYYY') as data_criação,
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


SELECT * FROM VW_relatorio_vendas ORDER BY data_com_2_casas DESC;


