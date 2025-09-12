SELECT table_schema,
       table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema');

-- Bloquear drop table.
CREATE OR REPLACE FUNCTION fn_bloquear_drop_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar drop table.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_drop_table
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();

---------------------------------------------

CREATE OR REPLACE FUNCTION fn_bloquear_alter_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar alteração nas colunas das tabelas.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_alter_table
    ON DDL_COMMAND_START
    WHEN TAG IN ('ALTER TABLE')
EXECUTE FUNCTION fn_bloquear_alter_table();

--------------------------------------------

-- Efetuar script de proibido efetuar exclusão de dados das tabelas;

CREATE OR REPLACE FUNCTION fn_bloquear_delete_tabelas()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar exclusão de dados da tabela.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloquear_delete_tabelas
    BEFORE DELETE
    ON funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_delete_tabelas();


DO
$$
    DECLARE
        tabela RECORD;
    BEGIN
        FOR tabela IN
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public'
            LOOP
                EXECUTE FORMAT('
                CREATE OR REPLACE TRIGGER tgr_bloquear_delete_tabela_%I
                BEFORE DELETE
                ON %I
                FOR EACH ROW
                EXECUTE FUNCTION fn_bloquear_delete_tabelas();'
                    , tabela.tablename, tabela.tablename);
            END LOOP;
    END;
$$ LANGUAGE plpgsql;


--------------------------------------------------------------


--proibido alteracao em cadastros inativos.

CREATE OR REPLACE FUNCTION fn_bloquear_alteracao_cadastro_inativo()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.ativo = FALSE THEN
        RAISE EXCEPTION 'Erro. Proibido efetuar atualização em cadastros que está inativo.';
    END IF;
    RETURN new;
END;

$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_bloquear_alteracao_cadastro_inativo
    BEFORE UPDATE
    ON funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_alteracao_cadastro_inativo();

DO
$$
    DECLARE
        tabela RECORD;
    BEGIN
        FOR tabela IN
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public'
            LOOP
                EXECUTE FORMAT('
            CREATE OR REPLACE TRIGGER tgr_bloquear_alteracao_cadastro_inativo_%I
            BEFORE UPDATE
            ON %I
            FOR EACH ROW
            EXECUTE FUNCTION fn_bloquear_alteracao_cadastro_inativo();'
                    , tabela.tablename, tabela.tablename);
            END LOOP;
    END;
$$ LANGUAGE plpgsql;

--------------------------------

--BLOQUEAR TRUNCADE

CREATE OR REPLACE FUNCTION fn_bloquear_truncade()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar delete TRUNCADE.';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloquear_truncade
    BEFORE TRUNCATE
    ON funcionario
    FOR EACH STATEMENT
EXECUTE FUNCTION fn_bloquear_truncade();

DO
$$
    DECLARE
        tabela RECORD;
    BEGIN
        FOR tabela IN
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public'
            LOOP
                EXECUTE FORMAT('
                CREATE OR REPLACE TRIGGER tgr_bloquear_truncade_tabela_%I
                BEFORE TRUNCATE
                ON %I
                FOR EACH STATEMENT
                EXECUTE FUNCTION fn_bloquear_truncade();'
                    , tabela.tablename, tabela.tablename);

            END LOOP;

    END;

$$ LANGUAGE plpgsql;

--validando preco tabela produtos

CREATE OR REPLACE FUNCTION fn_validando_preco_produto()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.preco < 0 THEN
        RAISE EXCEPTION 'Erro, valor do produto não pode ser menor que zero.';
    END IF;
    RETURN new;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validando_preco_produto
    BEFORE UPDATE OF preco OR INSERT
    ON produtos
    FOR EACH ROW
EXECUTE FUNCTION fn_validando_preco_produto();


-------------------------------------------

--validando preco tabela venda

CREATE OR REPLACE FUNCTION fn_validando_valor_total()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.valor_total < 0 THEN
        RAISE EXCEPTION 'Erro, valor total da venda não pode ser menor que zero.';
    END IF;
    RETURN new;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validando_valor_total
    BEFORE UPDATE OF valor_total OR INSERT
    ON venda
    FOR EACH ROW
EXECUTE FUNCTION fn_validando_valor_total();



-------------------------------------------

--validando preco tabela valor_imposto

CREATE OR REPLACE FUNCTION fn_validando_valor_imposto()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.valor_imposto < 0 THEN
        RAISE EXCEPTION 'Erro, valor imposto da venda não pode ser menor que zero.';
    END IF;
    RETURN new;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validando_valor_imposto
    BEFORE UPDATE OF valor_imposto OR INSERT
    ON venda
    FOR EACH ROW
EXECUTE FUNCTION fn_validando_valor_imposto();



-------------------------------------------

--validando preco tabela valor_frete

CREATE OR REPLACE FUNCTION fn_validando_valor_frete()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.valor_frete < 0 THEN
        RAISE EXCEPTION 'Erro, valor frete da venda não pode ser menor que zero.';
    END IF;
    RETURN new;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validando_valor_frete
    BEFORE UPDATE OF valor_frete OR INSERT
    ON venda
    FOR EACH ROW
EXECUTE FUNCTION fn_validando_valor_frete();


---------------------------------------

-- validar salario.

CREATE OR REPLACE FUNCTION fn_validar_Salario_indevido()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.salario < 0 OR new.salario > 1000000 THEN
        RAISE EXCEPTION 'Erro. Salário não pode ser menor que zero.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validar_salario_indevido
    BEFORE UPDATE OF salario_cargo OR INSERT
    ON cargos
    FOR EACH ROW
EXECUTE FUNCTION fn_validar_Salario_indevido();

SELECT *
FROM funcionario
LIMIT 10;


--validar datas.

CREATE OR REPLACE FUNCTION fn_validar_data_demissao()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_demissao < old.data_demissao OR new.data_demissao > CURRENT_DATE THEN
        RAISE EXCEPTION 'Erro. Data de demissão não pode ser menor que data de admissão ou maior que data atual';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validar_data_demissao
    BEFORE UPDATE OF data_demissao OR INSERT
    ON funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_validar_data_demissao();

-----------------------------------------------

--validando data da venda.

CREATE OR REPLACE FUNCTION fn_validar_data_venda()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_venda::DATE <> CURRENT_DATE THEN
        RAISE EXCEPTION 'Erro. Data da venda deve ser igual a hoje (%).',CURRENT_DATE;
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validar_data_venda
    BEFORE INSERT
    ON venda
    FOR EACH ROW
EXECUTE FUNCTION fn_validar_data_venda();

----
-- validando atualiozacao tabela venda;

CREATE OR REPLACE FUNCTION fn_validando_atualizacao_tabela_venda()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar alteração após emissão da nota.';
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_validando_atualizacao_tabela_venda
    BEFORE UPDATE
    ON venda
EXECUTE FUNCTION fn_validando_atualizacao_tabela_venda();


------------------------------------
--validando quantidade em estoque.

CREATE OR REPLACE FUNCTION fn_validar_quantidade_estoque()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.quantidade_estoque < 0 THEN
        RAISE EXCEPTION 'Erro. Quantidade em estoque não pode ser menor que zero.';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validar_quantidade_estoque
    BEFORE UPDATE OF quantidade_estoque OR INSERT
    ON produtos
    FOR EACH ROW
EXECUTE FUNCTION fn_validar_quantidade_estoque();


SELECT table_schema,
       table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema');

--logs

CREATE SCHEMA IF NOT EXISTS administration;

CREATE TABLE administration.log_comandos_ddl
(
    id_comando_ddl INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_comando   VARCHAR(30) NOT NULL,
    nome_tabela    VARCHAR(50) NOT NULL,
    usuario        VARCHAR(30) NOT NULL DEFAULT CURRENT_USER,
    data_execucao  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION fn_log_comandos_ddl()
    RETURNS EVENT_TRIGGER AS
$$
DECLARE
    nome_tabela TEXT;
    comando     TEXT;
BEGIN
    FOR comando, nome_tabela IN
        SELECT command_tag,
               objid::REGCLASS::TEXT
        FROM pg_event_trigger_ddl_commands()
        LOOP
            IF comando IN ('DROP TABLE', 'ALTER TABLE', 'CREATE TABLE') THEN
                INSERT INTO administration.log_comandos_ddl(nome_comando, nome_tabela)
                VALUES (comando, nome_tabela);
            END IF;
        END LOOP;
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_fn_log_comandos_ddl_drop_table
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE', 'ALTER TABLE')
EXECUTE FUNCTION fn_log_comandos_ddl();

CREATE EVENT TRIGGER tgr_log_comandos_ddl_alter_create
    ON DDL_COMMAND_END
    WHEN TAG IN ('CREATE TABLE', 'ALTER TABLE')
EXECUTE FUNCTION fn_log_comandos_ddl();

CREATE TABLE administration.log_delete
(
    id_log_delete INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_tabela   VARCHAR(50) NOT NULL CHECK ( nome_tabela <> ''),
    comando       VARCHAR(30) NOT NULL CHECK ( comando <> '' ),
    usuario       VARCHAR(50) NOT NULL DEFAULT CURRENT_USER CHECK ( usuario <> '' ),
    data_execucao TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION fn_log_delete()
    RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO administration.log_delete(nome_tabela, comando)
    VALUES (tg_table_name, tg_op);
    RETURN old;
END;
$$ LANGUAGE plpgsql;

--modelo de trigger
CREATE OR REPLACE TRIGGER tgr_log_delete
    AFTER DELETE
    ON pg_tables
    FOR EACH ROW
EXECUTE FUNCTION fn_log_delete();

DO
$$
    DECLARE
        tabela RECORD;
    BEGIN
        FOR tabela IN
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public'
            LOOP
                EXECUTE FORMAT('
                CREATE OR REPLACE TRIGGER tgr_log_delete_%I
                AFTER DELETE
                ON %I
                FOR EACH ROW
                EXECUTE FUNCTION fn_log_delete();', tabela.tablename, tabela.tablename);
            END LOOP;
    END;
$$ LANGUAGE plpgsql;


CREATE TABLE administration.log_vendas_canceladas
(
    id_venda_cancelada INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente         INTEGER       NOT NULL,
    nome_cliente       VARCHAR(100)  NOT NULL CHECK ( nome_cliente <> '' ),
    valor_total        NUMERIC(7, 2) NOT NULL,
    usuario            VARCHAR(100)  NOT NULL DEFAULT CURRENT_USER,
    data_execucao      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION fn_log_vendas_canceladas()
    RETURNS TRIGGER AS
$$
DECLARE
    usuario_log   TEXT;
    v_nome_pessoa TEXT;
BEGIN
    IF new.status_venda = FALSE THEN
        -- Pega o usuário da sessão se existir, senão usa current_user do banco
        usuario_log = COALESCE(CURRENT_SETTING('app.current_user', TRUE), CURRENT_USER);
        SELECT p.nome
        INTO v_nome_pessoa
        FROM pessoa p
                 INNER JOIN cliente c
                            ON c.id_pessoa = p.id_pessoa
        where c.id_cliente = new.id_cliente;
        INSERT INTO administration.log_vendas_canceladas(id_cliente, nome_cliente, valor_total, usuario)
        VALUES (new.id_cliente, v_nome_pessoa, new.valor_total, usuario_log);
    END IF;
    RETURN new;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_log_vendas_canceladas
    AFTER UPDATE OF status_Venda or INSERT
    ON venda
    FOR EACH ROW
EXECUTE FUNCTION fn_log_vendas_canceladas();





