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


CREATE OR REPLACE FUNCTION fn_produto_cliente(id_cliente_total INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    total_venda NUMERIC(12, 2);
BEGIN
    SELECT COALESCE(sum(total), 0)
    INTO total_venda
    FROM db_venda
    WHERE id_cliente = id_cliente_total;
    RETURN total_venda;
end
$$ LANGUAGE plpgsql;

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
    RETURNS NUMERIC AS
$$
DECLARE
    total_preco_quantidade NUMERIC(12, 2);
BEGIN
    SELECT COALESCE(sum(quantidade * preco_unitario), 0)
    INTO total_preco_quantidade
    from db_produto_venda
    WHERE id_venda = id_produto_nota;
    RETURN total_preco_quantidade;
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_calculo_Total_por_pedido(id_pedido INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    total_venda NUMERIC(12, 2);
BEGIN
    SELECT COALESCE(sum(db_produto_venda.preco_unitario * db_produto_venda.quantidade), 0)
    INTO total_venda
    from db_produto_venda
    where id_venda = id_pedido;
    RETURN total_venda;
end;
$$
    LANGUAGE plpgsql;

select *
from db_produto_venda
limit 2;


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



SELECT table_schema as "schema",
       table_name   as "Nome da tabela"
from information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema')
order by table_schema, table_name;

select *
from db_pessoa
limit 3;
select *
from db_funcionario
limit 3;

CREATE OR REPLACE VIEW vw_tempo_casa_funcionario as
SELECT f.id_pessoa,
       p.nome,
       tf.tipo_funcionario,
       c.cargo,
       to_char(data_admissao, 'DD/MM/YYYY')                 as "Data de admissão",
       date_part('YEAR', age(current_date, data_admissao))  as "Tempo de casa (ano)",
       date_part('MONTH', age(current_date, data_admissao)) as "Tempo de casa (meses)"
FROM db_funcionario f
         inner join db_pessoa p
                    on p.id_pessoa = f.id_pessoa
         inner join db_tipo_funcionario tf
                    on tf.id_nivel_funcionario = f.id_nivel_funcionario
         inner join db_cargo c
                    on c.id_cargo = f.id_cargo
WHERE f.data_demissao is null
order by "Tempo de casa (ano)";

select *
from vw_tempo_casa_funcionario;

select *
from db_tipo_funcionario;
select *
from db_funcionario;
select *
from db_cargo;
select datname
from pg_database;

select *
from db_produto_venda
where id_venda = 10;

select *
from db_cliente
limit 3;

select v.id_venda,
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
SELECT v.id_venda,
       p.nome_produto,
       pv.preco_unitario,
       pv.quantidade,
       (pv.preco_unitario * pv.quantidade) AS total_item
FROM DB_PRODUTO_VENDA pv
         JOIN DB_PRODUTO p ON pv.id_produto = p.id_produto
         JOIN DB_VENDA v ON pv.id_venda = v.id_venda;

CREATE OR REPLACE VIEW vw_itens_venda as
SELECT v.id_venda,
       p.nome_produto,
       pv.preco_unitario,
       pv.quantidade,
       (pv.preco_unitario * pv.quantidade) as total_item
FROM db_produto_venda pv
         JOIN db_produto p on pv.id_produto = p.id_produto
         inner join db_venda v on pv.id_venda = v.id_venda
order by v.id_venda;

select *
from db_funcionario
limit 3;

CREATE OR REPLACE FUNCTION fn_obter_salario(digite_matricula INTEGER)
    RETURNS NUMERIC as
$$
DECLARE
    v_salario NUMERIC(12, 2);
BEGIN
    SELECT salario
    INTO v_salario
    from db_funcionario
    where matricula = digite_matricula;
    RETURN v_salario;
end;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_obter_salario(digite_matricula INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    valor_salario NUMERIC(12, 2);
BEGIN
    SELECT salario
    INTO valor_salario
    FROM db_funcionario
    WHERE matricula = digite_matricula;
    RETURN valor_salario;
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_obter_salario(digite_matricula INTEGER)
    RETURNS NUMERIC as
$$
DECLARE
    valor_salario NUMERIC(12, 2);
BEGIN
    SELECT salario
    INTO valor_salario
    FROM db_funcionario
    where matricula = digite_matricula;
    RETURN valor_salario;
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_cadastro_cliente_existe(digite_cpf VARCHAR)
    RETURNS BOOLEAN as
$$
DECLARE
    existe_cliente BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1
                  FROM db_cliente c
                           join db_pessoa p ON c.id_pessoa = p.id_pessoa
                  WHERE p.cpf = digite_cpf)
    INTO existe_cliente;
    return existe_cliente;
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_total_vendas_cliente(digite_id_cliente INTEGER)
    RETURNS NUMERIC as
$$
DECLARE
    total_venda NUMERIC(12, 2);
BEGIN
    SELECT COALESCE(sum(total), 0)
    INTO total_venda
    from db_venda
    where id_cliente = digite_id_cliente;
    return total_venda;
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_valor_total_por_venda(digite_id_venda INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    valor_total_por_venda NUMERIC(12, 2);
BEGIN
    SELECT COALESCE(sum(quantidade * preco_unitario), 0)
    INTO valor_total_por_venda
    FROM db_produto_venda
    WHERE id_venda = digite_id_venda;
    RETURN valor_total_por_venda;
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_salario_funcionario(digite_matricula INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    salario_funcionario NUMERIC(12, 2)
BEGIN
    SELECT COALESCE((salario), 0)
    INTO salario_funcionario
    from db_funcionario
    WHERE matricula = digite_matricula;
    return salario_funcionario;
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_verificar_cadastro_pessoa(digite_cpf VARCHAR)
    RETURNS VARCHAR AS
$$
DECLARE
    nome_pessoa VARCHAR;
BEGIN
    SELECT nome
    INTO nome_pessoa
    FROM db_pessoa
    where cpf = digite_cpf;
    return nome_pessoa;
end;
$$ LANGUAGE plpgsql;

select *
from fn_verificar_cadastro_pessoa('22345678122');

CREATE OR REPLACE FUNCTION fn_verificar_cadastro_cliente(digite_cpf TEXT)
    RETURNS TEXT AS
$$
DECLARE
    nome_cliente TEXT;
BEGIN
    SELECT p.nome
    INTO nome_cliente
    from db_cliente c
             inner join db_pessoa p
                        on p.id_pessoa = c.id_pessoa
    where digite_cpf = p.cpf;
    return nome_cliente;
end;
$$ LANGUAGE plpgsql;

select *
from fn_verificar_cadastro_cliente('20345678140');



select *
from db_cliente
limit 2;



select *
from db_pessoa
where id_pessoa = 20;

select *
from db_funcionario
limit 3;

CREATE OR REPLACE FUNCTION fn_verificar_salario(digite_matricula INTEGER)
    RETURNS TEXT AS
$$
DECLARE
    valor_salario NUMERIC(12, 2);
BEGIN
    SELECT salario
    INTO valor_salario
    from db_funcionario
    WHERE matricula = digite_matricula;
    IF valor_salario >= 100000 THEN
        RETURN 'Salário alto';
    ELSEIF valor_salario >= 5000 THEN
        RETURN 'Salário média';
    ELSE
        RETURN 'Sálario baixo';
    END IF;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_verificar_salario(digite_matricula INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    valor_salario NUMERIC(12, 2)
BEGIN
    SELECT salario
    INTO valor_salario
    from db_funcionario
    where matricula = digite_matricula;
    IF valor_salario >= 10000 THEN
        RETURN 'Salário alto';
    ELSEIF valor_salario >= 5000 THEN
        RETURN 'Salário médio';
    ELSE
        RETURN 'Salário baixo!';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_verificar_salario(digite_matricula INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    valor_salario NUMERIC(12, 2);
BEGIN
    SELECT salario
    INTO valor_salario
    from db_funcionario
    where matricula = digite_matricula;
    IF valor_salario >= 10000 THEN
        RETURN 'Salário muito alto';
    ELSEIF valor_salario >= 5000 THEN
        RETURN 'Salário médio';
    ELSE
        RETURN 'Salário baixo';
    end if;
end;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_verificar_funcionario_diretoria(
    p_funcionario_id INTEGER,
    p_diretoria_nome VARCHAR
) RETURNS VARCHAR AS
$$
DECLARE
    v_nome_diretoria VARCHAR;
BEGIN
    SELECT d.diretoria
    INTO v_nome_diretoria
    FROM db_funcionario f
             INNER JOIN db_departamento dep ON f.id_departamento = dep.id_departamento
             INNER JOIN db_diretoria d ON dep.cod_diretoria = d.cod_diretoria
    WHERE f.matricula = p_funcionario_id;

    IF v_nome_diretoria IS NULL THEN
        RETURN 'Funcionário não encontrado ou dados incompletos';
    ELSIF v_nome_diretoria = p_diretoria_nome THEN
        RETURN 'FUNCIONÁRIO PERTENCE À DIRETORIA';
    ELSE
        RETURN 'FUNCIONÁRIO NÃO PERTENCE À DIRETORIA';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM fn_verificar_funcionario_diretoria(1002, 'Diretoria de Tecnologia');



select *
from db_funcionario
limit 4;
select *
from db_diretoria
limit 4;
select *
from db_cargo;
select table_schema,
       table_name
from information_schema.tables
where table_type = 'BASE TABLE'
  and table_schema not in ('pg_catalog', 'information_schema');

select *
from db_diretoria
limit 3;


CREATE OR REPLACE FUNCTION verificar_funcionario_diretoria(
    funcionario_id INTEGER,
    diretoria_nome VARCHAR
) RETURNS VARCHAR AS
$$
DECLARE
    dep_id   INTEGER;
    dir_id   INTEGER;
    dir_nome VARCHAR;
BEGIN
    SELECT departamento_id INTO dep_id FROM funcionario WHERE id = funcionario_id;
    SELECT diretoria_id INTO dir_id FROM departamento WHERE id = dep_id;
    SELECT nome INTO dir_nome FROM diretoria WHERE id = dir_id;

    IF dir_nome = diretoria_nome THEN
        RETURN 'FUNCIONÁRIO PERTENCE À DIRETORIA';
    ELSE
        RETURN 'FUNCIONÁRIO NÃO PERTENCE À DIRETORIA';
    END IF;
END;
$$ LANGUAGE plpgsql;



select *
from db_cliente
limit 3;



SELECT *
from fn_verificar_salario(1001);

select *
from db_pessoa
WHERE sexo = 'M';

CREATE OR REPLACE FUNCTION fn_contar_por_sexo(digite_sexo CHAR)
    RETURNS INTEGER AS
$$
DECLARE
    total INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO total
    FROM db_funcionario f
             JOIN db_pessoa p ON p.id_pessoa = f.id_pessoa
    WHERE UPPER(p.sexo) = UPPER(digite_sexo);
    RETURN total;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_contar_por_sexo(digite_sexo CHAR)
    RETURNS INTEGER AS
$$
DECLARE
    total INTEGER;
BEGIN
    SELECT count(*)
    INTO total
    from db_funcionario f
             inner join db_pessoa p ON p.id_pessoa = f.id_pessoa
    WHERE p.sexo = upper(digite_sexo);
    RETURN total;
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_contar_por_sexo(digite_sexo CHAR)
    RETURNS INTEGER AS
$$
DECLARE
    total INTEGER;
BEGIN
    SELECT count(*)
    INTO total
    FROM db_funcionario f
             inner join db_pessoa p
                        on p.id_pessoa = f.id_pessoa
    WHERE p.sexo = upper(digite_sexo);
    RETURN total;
end;
$$
    LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_contar_por_sexo(digite_sexo CHAR)
    RETURNS INTEGER AS
$$
DECLARE
    total INTEGER;
BEGIN
    SELECT count(*)
    INTO total
    FROM db_funcionario f
             inner join db_pessoa p
                        on p.id_pessoa = f.id_pessoa
    where p.sexo = upper(digite_sexo);
    RETURN total;
end;
$$
    LANGUAGE plpgsql;


select *
from fn_contar_por_sexo('F');


CREATE OR REPLACE FUNCTION fn_verificar_salario(digite_matricula INTEGER)
    RETURNS VARCHAR AS
$$
DECLARE
    valor_salario NUMERIC(12, 2);
BEGIN
    SELECT COALESCE((salario), 0)
               salario
    INTO valor_salario
    from db_funcionario
    where matricula = digite_matricula;
    IF valor_salario >= 10000 then
        RETURN 'Salário diretoria';
    ELSIF valor_salario >= 5000 then
        RETURN 'Salário gerente';
    ELSE
        RETURN 'Salário funcionário';
    end if;
end;
$$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_verificar_salario(digite_matricula INTEGER)
    RETURNS NUMERIC AS
$$
DECLARE
    salario_funcionario NUMERIC(12, 2);
BEGIN
    SELECT COALESCE((salario), 0)
    INTO salario_funcionario
    from db_funcionario
    where matricula = digite_matricula;
    RETURN salario_funcionario;
end;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_nivel_salario(digite_matricula INTEGER)
    RETURNS VARCHAR AS
$$
DECLARE
    salario_funcionario NUMERIC(12, 2)
BEGIN
    SELECT COALESCE((salario), 0)
    INTO salario_funcionario
    FROM db_funcionario
    where matricula = digite_matricula;
    IF salario_funcionario > 10000 THEN
        return 'Salário de diretoria';
    ELSIF salario_funcionario > 5000 THEN
        return 'Salário de gerente';
    ELSE
        RETURN 'Salário normal';
    end if;
end;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_quantidade_func_por_cargo()
    RETURNS TEXT AS
$$
DECLARE
    r         record;
    resultado TEXT := '';
BEGIN
    FOR r IN
        SELECT c.cargo,
               count(*) AS TOTAL
        from db_funcionario f
                 inner join db_cargo c
                            on f.id_cargo = c.id_cargo
        GROUP BY c.cargo
        LOOP
            resultado := resultado || r.cargo || ': ' || r.total || ' funcionário(s)' || E'\n';
        end loop;
    return resultado;
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_quantidade_func_por_cargo()
    RETURNS TEXT AS
$$
DECLARE
    r         RECORD;
    resultado TEXT := '';
BEGIN
    FOR r IN
        SELECT c.cargo,
               count(*) AS TOTAL
        from db_funcionario f
                 inner join db_cargo c
                            on c.id_cargo = f.id_cargo
        group by c.cargo
        LOOP
            resultado := resultado || r.cargo || ': ' || r.total || 'funcionário(s)' || 'E\n';
        end loop;
    return resultado;
end;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_quantidade_func_por_cargo() -- Cria uma função chamada fn_quantidade_func_por_cargo que não recebe parâmetros
    RETURNS TEXT AS -- A função retorna um valor do tipo TEXT
$$
DECLARE
    r         RECORD; -- Declara uma variável do tipo RECORD para armazenar os resultados da consulta dentro do loop
    resultado TEXT := ''; -- Declara e inicializa uma variável texto para acumular os dados que serão retornados
BEGIN
    FOR r IN -- Inicia um loop que percorre cada linha do resultado da consulta abaixo
        SELECT c.cargo,          -- Seleciona o nome do cargo
               count(*) AS TOTAL -- Conta quantos funcionários existem para aquele cargo
        FROM db_funcionario f -- Tabela de funcionários, com alias 'f'
                 INNER JOIN db_cargo c -- Faz um INNER JOIN com a tabela de cargos, alias 'c'
                            ON c.id_cargo = f.id_cargo -- Condição do JOIN: relaciona os IDs de cargo nas duas tabelas
        GROUP BY c.cargo -- Agrupa os resultados por cargo (necessário para usar COUNT)
        LOOP
            resultado := resultado || r.cargo || ': ' || r.total || ' funcionário(s)' || E'\n';
            -- Concatena cada resultado na variável 'resultado', com quebra de linha (E'\n' permite caracteres especiais como \n)
        END LOOP; -- Fim do loop
    RETURN resultado; -- Retorna o texto acumulado com os cargos e quantidades
END; -- Fim da função
$$ LANGUAGE plpgsql; -- Indica que a linguagem usada na função é PL/pgSQL


CREATE OR REPLACE FUNCTION fn_aplica_desconto_produtos_caros()
    RETURNS TEXT AS
$$
DECLARE
    r          RECORD;
    novo_preco NUMERIC;
BEGIN
    FOR r IN SELECT id_produto, preco FROM db_produto WHERE preco > 500
        LOOP
            novo_preco := r.preco * 0.9;

            UPDATE db_produto
            SET preco = novo_preco
            WHERE id_produto = r.id_produto;
        END LOOP;

    RETURN 'Desconto aplicado com sucesso.';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_aplica_desconto_produtos_caros()
    RETURNS TEXT AS
$$

DECLARE
    r          RECORD;
    novo_preco NUMERIC(12, 2);
BEGIN
    FOR r IN SELECT id_produto, preco FROM db_produto WHERE preco > 500
        LOOP
            novo_preco := r.preco * 0.9;
            UPDATE db_produto
            SET preco = novo_preco
            WHERE id_produto = r.id_produto;
        end loop;
    return 'Desconto aplicado com sucesso.';
end;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION fn_aplicar_desconto_produtos_caros()
    RETURNS TEXT AS
$$
DECLARE
    r          RECORD;
    novo_preco NUMERIC(12, 2);
BEGIN
    FOR r IN
        SELECT id_produto,
               preco
        from db_produto
        where preco > 500
        LOOP
            novo_preco := r.preco * 0.9;
            UPDATE db_produto
            SET preco = novo_preco
            WHERE id_produto = r.id_produto;
        end loop;
    return 'Desconto aplicado com sucesso.';
end;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_reajuste_valor_produtos()
    RETURNS TEXT AS
$$
DECLARE
    r          RECORD;
    novo_preco NUMERIC(12, 2);
BEGIN
    FOR r IN
        SELECT id_produto,
               preco
        from db_produto
        where preco > 500
        LOOP
            novo_preco := r.preco + (r.preco * 0.09);
            UPDATE db_produto
            SET preco = novo_preco
            WHERE id_produto = r.id_produto;
        end loop;
    return 'Reajuste aplicado com sucesso.';
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_reajuste_valor_produtos()
    RETURNS TEXT AS
$$
DECLARE
    r          RECORD;
    novo_preco NUMERIC(12, 2);
BEGIN
    FOR r IN
        SELECT id_produto,
               preco
        FROM db_produto
        where preco > 500
        LOOP
            novo_preco := r.preco * 0.10;
            UPDATE db_produto
            SET preco = novo_preco
            where id_produto = r.id_produto;
        end loop;
    return 'Desconto concedido com suceso';
end;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_desconto_preco_produtos()
    RETURNS TEXT AS
$$
DECLARE
    r          RECORD;
    novo_preco NUMERIC(12, 2);
BEGIN
    FOR r IN
        SELECT id_produto,
               preco
        from db_produto
        where preco > 500
        LOOP
            novo_preco := r.preco * 0.09;
            UPDATE db_produto
            SET preco = novo_preco
            WHERE id_produto = r.id_produto;
        end loop;
    return 'Desconto consedido com sucesso';
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_desconto_preco_produtos()
    RETURNS TEXT AS
$$
DECLARE
r RECORD;
novo_valor NUMERIC(12, 2);
BEGIN
    FOR r IN
        SELECT
            id_produto,
            preco
            FROM db_produto
        where preco > 500
        LOOP
        novo_valor = r.id_produto * 0.09;
        UPDATE db_produto
        SET preco = novo_valor
        where id_produto = r.id_produto;
        end loop;
    return 'Desconto concedido com sucesso.';
    end;
$$ LANGUAGE plpgsql;



select *
from db_produto
where id_produto = 1000;


select *
from fn_reajuste_valor_produtos();
--1000 3521.89

select *
from fn_aplica_desconto_produtos_caros();


SELECT *
from fn_quantidade_func_por_cargo();


select *
from db_cargo
limit 3;






