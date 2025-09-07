---triggers e event_triggers.

CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '123123';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test NOCREATEUSER NOINHERIT NOCREATEDB NOSUPERUSER;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;


-- event trigger bloquear drop table;

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

-- proibido alter table.

CREATE OR REPLACE FUNCTION fn_bloquear_alter_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar alter table.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_alter_table
    ON SQL_DROP
    WHEN TAG IN ('ALTER TABLE')
EXECUTE FUNCTION fn_bloquear_alter_table();


-- log alteracao tabelas

CREATE TABLE administration.log_alteracao_tabelas
(
    id_alteracao  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_tabela   VARCHAR(30) NOT NULL,
    comando       VARCHAR(30) NOT NULL,
    usuario       VARCHAR(30) NOT NULL DEFAULT CURRENT_USER,
    data_execucao TIMESTAMP   NOT NULL DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION fn_log_alteracao_tabelas()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO administration.log_alteracao_tabelas(nome_tabela, comando)
    SELECT objid::REGCLASS::TEXT,
           command_tag
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('DROP TABLE', 'ALTER TABLE', 'CREATE TABLE');
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_log_alteracao_tabelas
    ON DDL_COMMAND_END
    WHEN TAG IN ('DROP TABLE', 'ALTER TABLE','CREATE TABLE')
EXECUTE FUNCTION fn_log_alteracao_tabelas();


-- trigger normal.

--criando trigger para bloquear delete from.....

CREATE OR REPLACE FUNCTION fn_bloquear_delete_tabela()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido efetuar delete de dados da tabela.';
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_bloquear_delete_tabela
    BEFORE DELETE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_delete_tabela();

DO
$$
    DECLARE
        tabela RECORD;
    BEGIN
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'public';
        EXECUTE FORMAT('
            CREATE OR REPLACE TRIGGER tgr_bloquear_delete_tabela_%I
            BEFORE DELETE
            ON %I
            FOR EACH ROW
            EXECUTE FUNCTION fn_bloquear_delete_tabela();',
                       tabela.tablename, tabela.tablename);
    END;

$$;


-- log alteracao salarial;

CREATE TABLE administration.log_alteracao_salarial
(
    id_alteracao_salarial INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    matricula             INTEGER       NOT NULL,
    nome_funcionario      VARCHAR(100)  NOT NULL,
    salario_antigo        NUMERIC(7, 2) NOT NULL,
    novo_salario          NUMERIC(7, 2) NOT NULL,
    usuario               VARCHAR(20)   NOT NULL DEFAULT CURRENT_USER,
    data_alteracao        TIMESTAMP     NOT NULL DEFAULT NOW(),
    CONSTRAINT FK_log_alteracao_salarial_dbfuncionario FOREIGN KEY (matricula) REFERENCES db_funcionario (matricula)
);

CREATE OR REPLACE FUNCTION fn_log_alteracao_salarial()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome_funcionario TEXT;
BEGIN

    SELECT p.nome
    INTO v_nome_funcionario
    FROM db_funcionario f
             INNER JOIN db_pessoa p
                        ON p.id_pessoa = f.id_pessoa
    WHERE f.matricula = old.matricula;

    IF tg_op = 'UPDATE' THEN
        INSERT INTO administration.log_alteracao_salarial(matricula, salario_antigo, novo_salario)
        VALUES (old.matricula, old.salario, new.salario);
    END IF;

    IF tg_op = 'INSERT INTO' THEN
        INSERT INTO administration.log_alteracao_salarial(matricula, salario_antigo, novo_salario)
        VALUES (old.matricula, 0, new.salario);
    END IF;

END;
$$ LANGUAGE plpgsql;


CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '1231213';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test NOCREATEUSER NOINHERIT NOCREATEDB NOCREATEROLE;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT SELECT, DELETE, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;


CREATE OR REPLACE FUNCTION fn_bloquear_drop_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido efetuar drop table.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_drop_table
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();

CREATE OR REPLACE FUNCTION fn_bloquer_alteracao_tabela()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar alterações na tabela.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_alteracao_tabela
    ON SQL_DROP
    WHEN TAG IN ('ALTER TABLE')
EXECUTE FUNCTION fn_bloquear_alteracao_tabelas();


--------------------------------------------------------------

CREATE OR REPLACE FUNCTION fn_bloquear_delete_from()
    RETURNS TRIGGER AS
$$
DECLARE
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar exclusão de dados da tabela.';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloquear_delete_from
    BEFORE DELETE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_delete_from();

DO
$$
    DECLARE
        tabela RECORD;
    BEGIN
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'public';
        LOOP
            EXECUTE FORMAT('
            CREATE OR REPLACE TRIGGER tgr_bloquear_delete_from_table_%I
            BEFORE DELETE
            ON %I
            FOR EACH ROW
            EXECUTE FUNCTION fn_bloquear_delete_from();'
                , tabela.tablename, tabela.tablename);
        END LOOP;
    END;
$$ LANGUAGE plpgsql;

---------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fn_bloquear_truncade()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. proibido efetuar alteração nas colunas das tabelas.';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloquear_alteracao_colunas_tabela
    BEFORE TRUNCATE
    ON db_venda
    FOR EACH STATEMENT
EXECUTE FUNCTION fn_bloquear_truncade();

DO
$$
    DECLARE
        tabela RECORD;
    BEGIN
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'public';
        LOOP
            EXECUTE FORMAT('
            CREATE OR REPLACE TRIGGER tgr_bloquear_alteracao_colunas_tabela_%I
            BEFORE TRUNCATE
            ON %I
            FOR EACH ROW
            EXECUTE FUNCTION fn_bloquear_truncade();'
                , tabela.tablename, tabela.tablename);
        END LOOP;
    END;
$$;


CREATE OR REPLACE FUNCTION fn_bloquear_valores_menores_zero()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.preco < 0 THEN
        RAISE EXCEPTION 'Erro. Valor não pode ser menor que zero.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_bloquear_valores_menores_zero
    BEFORE UPDATE OF preco OR INSERT
    ON db_produto
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_valores_menores_zero();

CREATE OR REPLACE FUNCTION fn_bloquear_data_demissao_errada()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_demissao < old.data_admissao OR new.data_demissao < CURRENT_DATE THEN
        RAISE EXCEPTION 'Erro. data de demissão não pode ser menor que data de admissão ou maior que data atual.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_bloquear_data_demissao_errada
    BEFORE UPDATE OF data_admissao OR INSERT
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_data_demissao_errada();





































