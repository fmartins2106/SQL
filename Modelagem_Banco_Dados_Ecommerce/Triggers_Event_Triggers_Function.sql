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

--validar datas.