select *
from db_funcionario;
select *
from db_diretoria;
select *
from db_departamento;

CREATE OR REPLACE PROCEDURE sp_atualizar_salario_dep_vendas(p_percentual NUMERIC)
    LANGUAGE plpgsql AS
$$
BEGIN
    UPDATE db_funcionario f
    SET salario = salario + (salario * (p_percentual / 100))
    FROM db_departamento d
    where f.id_departamento = d.id_departamento
      and d.departamento = 'Vendas';
end;
$$;


CREATE OR REPLACE PROCEDURE sp_atualizar_salario_por_departamento(digite_id_departamento INTEGER, percentual NUMERIC)
    LANGUAGE plpgsql AS
$$
BEGIN
    UPDATE db_funcionario f
    SET salario = salario + (salario * (percentual / 100))
    FROM db_departamento d
    WHERE d.id_departamento = digite_id_departamento;
end;
$$;

CREATE OR REPLACE PROCEDURE sp_atualizar_salario_cargo(digite_id_cargo INTEGER, percentual NUMERIC)
    LANGUAGE plpgsql as
$$
BEGIN
    UPDATE db_funcionario f
    SET salario = salario + (salario * (percentual / 100))
    FROM db_cargo c
    WHERE c.id_cargo = digite_id_cargo;
end;
$$;

CREATE OR REPLACE PROCEDURE sp_atualizar_salario_cargo(digite_id_cargo INTEGER, percentual NUMERIC)
    LANGUAGE plpgsql AS
$$
BEGIN
    UPDATE db_funcionario f
    SET salario = salario + (salario * (percentual / 100))
    WHERE id_cargo = digite_id_cargo;
end;
$$;

call sp_atualizar_salario_cargo(4, 10);
-- Desenvolvedor Java id_cargo = 4 - salario =8893 cod_pessoa = 4
select *
from db_funcionario
where id_cargo = 4;
select *
from db_cargo
limit 4;
select *
from db_funcionario
limit 3;

call sp_atualizar_salario_por_departamento(1, 10);
select *
from db_departamento
limit 3;
select *
from db_funcionario
where id_departamento = 1;

--id_departamento 1 = COntabilidade;
--matricula 1005 salario 1550
--matricula 1010 salario 1900


select *
from db_funcionario
limit 3;


select f.id_pessoa,
       f.matricula,
       p.nome,
       f.salario,
       d.departamento
from db_funcionario f
         inner join db_pessoa p
                    on f.id_pessoa = p.id_pessoa
         inner join db_departamento d
                    on f.id_departamento = d.id_departamento
where d.departamento = 'Vendas';


call sp_atualizar_salario_dep_vendas(10);
--02 ana souza 1800

CREATE OR REPLACE PROCEDURE sp_relatorio_vendas_diaria()
    LANGUAGE plpgsql AS
$$
BEGIN
    INSERT INTO db_relatorio_diario_vendas(id_venda, data_venda, total)
    SELECT id_venda,
           data_venda::DATE,
           sum(total)
    FROM db_venda
    WHERE data_venda >= CURRENT_DATE - INTERVAL '1 day'
      AND data_venda < CURRENT_DATE
    GROUP BY id_venda, data_venda::DATE;
end;
$$;

DROP PROCEDURE sp_relatorio_vendas_diaria();

CREATE OR REPLACE PROCEDURE sp_gerar_relatorio_diario()
    LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO db_relatorio_diario_vendas (id_loja, total, data_venda)
    SELECT id_loja,
           SUM(valor_total),
           data_pedido::date
    FROM db_pedido
    WHERE data_pedido >= CURRENT_DATE - INTERVAL '1 day'
      AND data_pedido < CURRENT_DATE
    GROUP BY id_loja, data_pedido::date
    ON CONFLICT (id_loja, data_venda) DO UPDATE
        SET total = EXCLUDED.total;
END;
$$;



CREATE TABLE db_relatorio_diario_vendas
(
    id         INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_venda   INTEGER        NOT NULL UNIQUE,
    data_venda timestamp      NOT NULL,
    total      NUMERIC(12, 2) NOT NULL
);

CALL sp_relatorio_vendas_diaria();

select *
from db_produto_venda
limit 3;
select *
from db_venda
limit 3;

CREATE OR REPLACE PROCEDURE sp_gerar_relatorio_diario()
    LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO db_relatorio_diario_vendas (id_loja, total, data_venda)
    SELECT id_loja,
           SUM(valor_total),
           data_pedido::date
    FROM db_pedido
    WHERE data_pedido >= CURRENT_DATE - INTERVAL '1 day'
      AND data_pedido < CURRENT_DATE
    GROUP BY id_loja, data_pedido::date;
END;
$$;

select *
from db_venda
order by id_venda desc;

select *
from db_produto_venda
order by id_venda desc;
-- Inserções de id_venda 45 até 126 (82 registros)
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (45, 1001, 399.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (46, 1002, 1199.00, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (47, 1003, 849.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (48, 1004, 279.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (49, 1005, 699.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (50, 1006, 1599.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (51, 1007, 4399.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (52, 1008, 229.90, 3);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (53, 1009, 1999.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (54, 1010, 599.00, 2);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (55, 1011, 549.80, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (56, 1012, 999.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (57, 1013, 1050.00, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (58, 1014, 199.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (59, 1015, 850.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (60, 1016, 299.00, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (61, 1017, 179.90, 4);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (62, 1018, 399.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (63, 1019, 2499.99, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (64, 1020, 899.00, 1);

-- Continuando do 65 ao 126
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (65, 1019, 799.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (66, 1019, 329.90, 3);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (67, 1019, 459.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (68, 1019, 1129.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (69, 1019, 1349.50, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (70, 1019, 199.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (71, 1019, 209.90, 3);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (72, 1019, 1799.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (73, 1019, 2799.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (74, 1019, 4099.00, 1);

-- 75–126: distribuindo algumas com múltiplos produtos por venda
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (75, 1001, 199.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (75, 1002, 549.90, 1);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (76, 1003, 3989.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (77, 1004, 279.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (78, 1005, 1399.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (79, 1006, 899.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (80, 1007, 799.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (81, 1008, 299.00, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (82, 1009, 149.90, 4);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (83, 1010, 499.90, 1);

-- Restante: 84 a 126
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (84, 1011, 579.80, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (85, 1012, 749.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (86, 1013, 649.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (87, 1014, 229.90, 3);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (88, 1015, 329.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (89, 1016, 189.90, 4);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (90, 1017, 999.90, 1);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (91, 1018, 429.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (92, 1019, 1349.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (93, 1020, 999.99, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (94, 1010, 859.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (95, 1010, 519.90, 3);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (96, 1010, 689.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (97, 1010, 449.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (98, 1010, 729.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (99, 1010, 299.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (100, 1010, 229.00, 3);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (101, 1012, 979.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (102, 1012, 2799.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (103, 1012, 3199.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (104, 1012, 459.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (105, 1012, 759.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (106, 1012, 1129.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (107, 1012, 349.90, 3);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (108, 1012, 999.00, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (109, 1012, 279.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (110, 1012, 1349.00, 1);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (111, 1011, 2299.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (112, 1011, 1599.99, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (113, 1011, 1249.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (114, 1001, 399.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (115, 1002, 2199.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (116, 1003, 849.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (117, 1004, 279.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (118, 1005, 699.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (119, 1006, 1599.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (120, 1007, 4399.90, 1);

INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (121, 1008, 229.90, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (122, 1009, 1999.00, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (123, 1010, 599.00, 2);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (124, 1011, 549.80, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (125, 1012, 999.90, 1);
INSERT INTO DB_PRODUTO_VENDA (id_venda, id_produto, preco_unitario, quantidade)
VALUES (126, 1013, 1050.00, 1);


SELECT cron.schedule(
               'teste_relatorio_5min', -- Nome amigável pro job
               '*/5 * * * *', -- Cron: a cada 5 minutos
               $$CALL sp_gerar_relatorio_diario();$$ -- Chamada da procedure
       );

SELECT jobid, jobname, command
FROM cron.job;

SELECT cron.unschedule(1);

SELECT jobid, jobname, schedule, command, active
FROM cron.job;


CALL sp_relatorio_vendas_diaria();
CREATE OR REPLACE PROCEDURE sp_relatorio_vendas_diaria()
    LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO db_relatorio_diario_vendas(id_venda, data_venda, total)
    SELECT id_venda,
           data_venda::DATE,
           SUM(total) AS total
    FROM db_venda
    WHERE data_venda >= CURRENT_DATE - INTERVAL '1 day'
      AND data_venda < CURRENT_DATE
    GROUP BY id_venda, data_venda::DATE;
END;
$$;

ALTER PROCEDURE sp_relatorio_vendas_diaria() OWNER TO fmartins;


DELETE
FROM db_relatorio_diario_vendas
WHERE id_venda = 118;

select *
from db_funcionario;
CALL sp_relatorio_vendas_diaria();

SELECT *
FROM db_relatorio_diario_vendas
ORDER BY data_venda DESC
LIMIT 10;



DELETE
from db_venda
where id_venda in
      (44, 44, 45, 46, 47, 48, 49, 54, 56, 58, 60, 61, 62, 63, 64, 65, 67, 69, 70, 71, 72, 73, 82, 87, 88, 89, 121, 122,
       123, 124, 125, 126, 111, 113, 114, 115, 117, 119, 120, 101, 102, 103, 109, 110, 94, 95, 97, 99, 100, 91
          );
DELETE
FROM db_produto_venda
WHERE id_venda IN
      (44, 44, 45, 46, 47, 48, 49, 54, 56, 58, 60, 61, 62, 63, 64, 65, 67, 69, 70, 71, 72, 73, 82, 87, 88, 89, 121, 122,
       123, 124, 125, 126, 111, 113, 114, 115, 117, 119, 120, 101, 102, 103, 109, 110, 94, 95, 97, 99, 100, 91
          );

select *
from db_produto_venda
limit 2000;


CREATE OR REPLACE PROCEDURE sp_atualizar_salario_por_funcao(digite_id_cargo INTEGER, percentual NUMERIC)
    LANGUAGE plpgsql AS
$$
BEGIN
    UPDATE db_funcionario f
    SET salario = (f.salario + (f.salario * (percentual / 100)))
    where id_cargo = digite_id_cargo;
end;
$$;

CREATE OR REPLACE PROCEDURE sp_atualizar_salario_por_funcao(digite_id_cargo INTEGER, percentual NUMERIC)
    LANGUAGE plpgsql as
$$
BEGIN
    UPDATE db_funcionario
    SET salario = salario + (salario * (percentual / 100))
    where id_cargo = digite_id_cargo;
end;
$$;

CREATE OR REPLACE PROCEDURE sp_gerar_relatorio_vendas()
    LANGUAGE plpgsql as
$$
begin
    INSERT INTO db_relatorio_diario_vendas(id_venda, data_venda, total)
    SELECT id_venda,
           data_venda,
           total
    from db_venda
    where data_venda >= CURRENT_DATE - INTERVAL '1 day'
      and data_venda < CURRENT_DATE
    GROUP BY id_venda, total::DATE;
end;
$$;


CREATE OR REPLACE PROCEDURE pg_relatorio_diario_vendas()
LANGUAGE plpgsql as $$
    begin
        INSERT INTO db_relatorio_diario_vendas(id_venda,data_venda,total)
        SELECT
           id_venda,
           data_venda,
           total
            FROM db_venda
        where data_venda >= CURRENT_DATE - INTERVAL '1 day'
        and data_venda < CURRENT_DATE
        group by id_venda, total::DATE;
    end;
    $$;

CREATE OR REPLACE PROCEDURE sp_reajustar_salario_departamento(digite_id_departamento INTEGER, percentual NUMERIC)
LANGUAGE plpgsql AS $$
    BEGIN
        UPDATE db_funcionario f
        SET salario = salario + (salario * (percentual / 100))
        WHERE id_departamento = digite_id_departamento;
    END;
    $$;

CREATE OR REPLACE PROCEDURE sp_relatorio_diario_vendas()
LANGUAGE plpgsql AS $$
    BEGIN
        INSERT INTO db_relatorio_diario_vendas(id_venda,data_venda,total)
        SELECT
            id_venda,
            data_venda,
            total
            FROM db_venda
        WHERE data_venda >= CURRENT_DATE - INTERVAL '1 day'
        AND data_venda < CURRENT_DATE
        GROUP BY id_venda, total::DATE;
    END;
    $$;



CREATE OR REPLACE PROCEDURE sp_transferir_funcionario(
    p_id_func INTEGER,
    p_novo_departamento INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE db_funcionario
    SET id_departamento = p_novo_departamento
    WHERE id_funcionario = p_id_func;
END;
$$;

CREATE OR REPLACE PROCEDURE sp_transferir_funcionario(digite_matricula_funcionario INTEGER, digite_novo_departamento INTEGER)
LANGUAGE plpgsql AS $$
    BEGIN
        UPDATE db_funcionario
        SET id_departamento = digite_novo_departamento
        WHERE matricula = digite_matricula_funcionario;
    END;
    $$;

select * from db_funcionario where matricula = 1003;
SELECT * from db_departamento;
CALL sp_transferir_funcionario(1003,5);
--matricula 1003 id_departamento 4 desenvolvimento vai para logistica = 5;


select * from db_funcionario limit 10;






