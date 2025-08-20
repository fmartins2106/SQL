SELECT "current_user"(); --Verificar qual usuario esta logado no banco de dados;

SET ROLE fmartins; -- definir usuario;

CREATE ROLE fmartins_adm WITH LOGIN SUPERUSER PASSWORD 'masterkey'; --criar usuario como adm do banco;

CREATE ROLE usuario_test WITH LOGIN PASSWORD '123';

CREATE ROLE usuario_test WITH LOGIN PASSWORD '123456';
CREATE ROLE usuario_test WITH LOGIN PASSWORD '123456';

SET ROLE usuario_test;
SET ROLE fmartins;
SELECT "current_user"();
SELECT *
FROM db_pessoa;
SELECT *
FROM db_pessoa;
SELECT *
FROM db_cliente;

UPDATE db_cliente
SET ativo = FALSE
WHERE id_cliente = 103;

SELECT *
FROM db_cliente
WHERE id_cliente = 103;

DROP TABLE db_test;

SELECT *
FROM db_test;

CREATE TABLE db_test
(
    id        SERIAL PRIMARY KEY,
    nome      VARCHAR(100),
    sobrenome VARCHAR(100)
);
SELECT CURRENT_DATABASE();

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_name ILIKE '%log_cliente_cancelado%';
SELECT *
FROM db_log_cliente_cancelado;


TRUNCATE TABLE db_test;
TRUNCATE TABLE db_cliente;
DROP TABLE db_test;
DROP TABLE db_cliente;


SET ROLE usuario_test;

ALTER TABLE db_test
    OWNER TO fmartins;
-- alterar tabela passado poderes para o adm do banco;


-- transferir propriedade das tabelas em lote.

DO
$$
    DECLARE
        r RECORD;
    BEGIN
        FOR r IN
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public'
            LOOP
                EXECUTE FORMAT('alter table public.%I OWNER TO fmartins_adm;', r.tablename);
            END LOOP;
    END;
$$;

-- verificar donos das tabelas;
SELECT tablename,
       tableowner
FROM pg_tables
ORDER BY tableowner;

DO
$$
    DECLARE
        r RECORD;
    BEGIN
        FOR r IN
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public'
            LOOP
                EXECUTE FORMAT('REVOKE ALL ON public.%I from public;', r.tablename);
            END LOOP;
    END;
$$;

DO
$$
    DECLARE
        r RECORD;
    BEGIN
        FOR r IN
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public' -- ou outro schema
            LOOP
                EXECUTE FORMAT(
                        'GRANT SELECT, INSERT, UPDATE ON public.%I TO usuario_test;',
                        r.tablename
                        );
            END LOOP;
    END;
$$;


SELECT *
FROM db_pessoa;

SELECT "current_user"();

SELECT *
FROM pg_roles;

SELECT *
FROM db_test;

SET ROLE usuario_test;
SELECT "current_user"();

SELECT tablename, tableowner
FROM pg_tables
ORDER BY tableowner;

CREATE OR REPLACE FUNCTION fn_cliente_inativo()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome_cliente TEXT;
BEGIN
    SELECT p.nome
    INTO v_nome_cliente
    FROM db_pessoa p
    WHERE p.id_pessoa = old.id_pessoa;
    IF new.ativo = FALSE AND old.ativo = TRUE THEN
        INSERT INTO db_log_cliente_cancelado(id_cliente, nome_cliente)
        VALUES (old.id_cliente, v_nome_cliente);
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_cliente_inativo
    AFTER UPDATE
    ON db_cliente
    FOR EACH ROW
EXECUTE FUNCTION fn_cliente_inativo();


SELECT *
FROM db_log_cliente_cancelado;

CREATE OR REPLACE FUNCTION fn_proibir_excluir_linha()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Exclusão proibida. Use a coluna ativo, e selecione opção false.';
    RETURN old;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_proibir_excluir_linha
    BEFORE DELETE
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_proibir_excluir_linha();

SELECT "current_user"();
SET ROLE fmartins;

SELECT *
FROM pg_roles;

SELECT *
FROM db_venda
LIMIT 2;

SELECT "current_user"();
SET ROLE fmartins_adm;
SELECT "current_user"();

CREATE ROLE usuario_test2 WITH LOGIN PASSWORD '123';
CREATE ROLE dev_dojo_01 WITH LOGIN PASSWORD '123';
CREATE ROLE dev_dojo_01 WITH LOGIN PASSWORD '123';
CREATE ROLE dev_dojo_01 WITH LOGIN PASSWORD '123';
CREATE ROLE dev_dojo_02 WITH LOGIN PASSWORD '123';

CREATE ROLE dev_dojo_master WITH LOGIN SUPERUSER PASSWORD '123123';
CREATE ROLE dev_dojo_1 WITH LOGIN SUPERUSER PASSWORD '123123';
CREATE ROLE dev_dojo_02 WITH LOGIN SUPERUSER PASSWORD '123123';
CREATE ROLE dev_dojo_03 WITH LOGIN SUPERUSER PASSWORD '123123';
CREATE ROLE dev_dojo_03 WITH LOGIN SUPERUSER PASSWORD '122122';
CREATE ROLE dev_dojo WITH LOGIN PASSWORD '1122';



CREATE ROLE fmartins_adm WITH LOGIN SUPERUSER PASSWORD 'masterkey'; --criar usuario como adm do banco;

CREATE ROLE usuario_test WITH LOGIN PASSWORD '123';

CREATE ROLE usuario_test WITH LOGIN PASSWORD '123456';
CREATE ROLE usuario_test WITH LOGIN PASSWORD '123456';


-- Impedir criação de DB e roles
ALTER ROLE usuario_test NOCREATEDB NOCREATEROLE NOSUPERUSER;

ALTER ROLE usuaro_test NOCREATEROLE NOCREATEDB NOSUPERUSER;
ALTER ROLE usuario_test NOCREATEDB NOCREATEROLE NOSUPERUSER;
ALTER ROLE usuario_test NOCREATEDB NOCREATEROLE NOSUPERUSER;
ALTER ROLE usuario_test NOCREATEDB NOCREATEROLE NOSUPERUSER;
ALTER ROLE usuario_test NOCREATEDB NOCREATEROLE NOSUPERUSER;
ALTER ROLE usuario_test NOCREATEDB NOCREATEROLE NOSUPERUSER;

-- Dar acesso somente a um banco específico
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;

GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;

GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;

GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;


SET ROLE fmartins;
SELECT "current_user"();
SELECT "current_user"();

CREATE ROLE fernando_martins WITH LOGIN SUPERUSER PASSWORD '123123';
CREATE ROLE fernando_02 WITH LOGIN PASSWORD '123123';
CREATE ROLE fernando_martins WITH LOGIN PASSWORD '123123';
CREATE ROLE fernando_martins WITH LOGIN PASSWORD '123123';
CREATE ROLE fernando_martins WITH LOGIN PASSWORD '123123';
CREATE ROLE fmartins_master WITH LOGIN SUPERUSER PASSWORD '123123';
CREATE ROLE fmartins_master WITH LOGIN SUPERUSER PASSWORD '123123';


GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;

GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;


-- 3. Dar permissão de usar o schema (normalmente 'public')
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuaio_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;

-- 4. Dar permissão em todas as tabelas já existentes
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;

--Evita que qualquer tabela seja excluída no banco de produção.

CREATE OR REPLACE FUNCTION fn_bloquear_drop_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'DROP TABLE não permitido em ambiente de produção';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_drop_table
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();

CREATE EVENT TRIGGER tgr_bloquear_drop_table
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();

CREATE EVENT TRIGGER tgr_bloquear_drop_table
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();

CREATE EVENT TRIGGER tgr_bloquear_drop_table
    ON SQL_DROP
    WHEN TAG IN ('drop table')
EXECUTE FUNCTION fn_bloquear_drop_table();

CREATE EVENT TRIGGER tgr_bloquear_drop
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();

DROP EVENT TRIGGER tgr_bloquear_drop;
DROP TABLE db_test;

CREATE TABLE db_test
(
    id   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE db_test;
SET ROLE fmartins_adm;


--Mantém um registro de quem cria tabelas e quando.

CREATE TABLE db_log_create_table
(
    usuario            TEXT NOT NULL,
    comando            TEXT NOT NULL,
    data_hora_execucao TIMESTAMP DEFAULT NOW()
);

SELECT *
FROM db_log_create_table;
CREATE OR REPLACE FUNCTION fn_log_create_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO db_log_create_table(usuario, comando)
    VALUES ("current_user"(), tg_tag);
END;

$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_log_create_table
    ON DDL_COMMAND_START
    WHEN TAG IN ('CREATE TABLE')
EXECUTE FUNCTION fn_log_create_table();


CREATE EVENT TRIGGER tgr_bloquear_drop_Table
    ON SQL_DROP
    WHEN TAG IN ('drop table')
EXECUTE FUNCTION fn_bloquear_drop_table();

CREATE EVENT TRIGGER tgr_log_create_table
    ON DDL_COMMAND_START
    WHEN TAG IN ('CREATE TABLE')
EXECUTE FUNCTION fn_log_create_table();


SELECT "current_user"();
SET ROLE fmartins_adm;

CREATE ROLE fmartins02 WITH LOGIN PASSWORD '123123';
CREATE ROLE fmartins02 WITH LOGIN SUPERUSER PASSWORD '123123';
CREATE ROLE fmartins WITH LOGIN SUPERUSER PASSWORD '123123';
CREATE ROLE fmartins WITH LOGIN PASSWORD '123123';

CREATE ROLE fmartins WITH LOGIN PASSWORD '123123';

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco TO usuario_test;


GRANT CONNECT ON DATABASE meu_banco TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco02 TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco3 TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco03 TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco03 TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco03 TO usuario_test;
GRANT CONNECT ON DATABASE meu_banco03 TO usuario_test;

GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;

GRANT CONNECT ON DATABASE banco02 TO usuario_test;
GRANT CONNECT ON DATABASE banco03 TO usuario_test;
GRANT CONNECT ON DATABASE banco03 TO usuario_test;
GRANT CONNECT ON DATABASE banco03 TO usuario_test;
GRANT CONNECT ON DATABASE banco03 TO usuario_test;
GRANT CONNECT ON DATABASE banco04 TO usuario_test;

GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;

GRANT CONNECT ON DATABASE dbTest TO usuario_test;
GRANT CONNECT ON DATABASE banco01 TO usuario_test;


GRANT CONNECT ON SCHEMA TO usuario_test;
GRANT CONNECT ON SCHEMA TO usuario_test;
GRANT CONNECT ON SCHEMA TO usuario_test;
GRANT CONNECT ON SCHEMA TO usuario_test;
GRANT CONNECT ON SCHEMA TO usuario_test;
GRANT CONNECT ON DATABASE bancoo1 TO usuario_test;

GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA to usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA to usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA to usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA to usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA to usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA to usuario_test;


GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;

GRANT CONNECT ON DATABASE dbMedico TO usuario_test;
GRANT CONNECT ON SCHEMA PUBLIC TO usuario_test;
GRANT INSERT, DELETE, UPDATE, SELECT ON ALL TABLES IN SCHEMA public TO usuaro_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;

CREATE OR REPLACE FUNCTION fn_proibir_excluir_tabela()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido excluir tabela do banco de dados. Consulte o DBA.';
END;

$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloqueio_exclusao_tabela
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();



CREATE TABLE db_log_create_table
(
    usuario            TEXT NOT NULL,
    comando            TEXT NOT NULL,
    data_hora_execucao TIMESTAMP DEFAULT NOW()
);


CREATE TABLE db_log_create_table
(
    usuario       TEXT NOT NULL,
    comando       TEXT NOT NULL,
    data_execucao TIMESTAMP DEFAULT NOW()
);

CREATE TABLE db_log_create_table
(
    usuario       TEXT NOT NULL,
    comando       TEXT NOT NULL,
    data_execucao TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION fn_log_create_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO db_log_create_table(usuario, comando)
    VALUES ("current_user"(), tg_tag);
END;

$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_db_log_create_table
    ON DDL_COMMAND_START
    WHEN TAG IN ('CREATE TABLE')
EXECUTE FUNCTION fn_log_create_table();



SELECT *
FROM db_log_create_table;
CREATE OR REPLACE FUNCTION fn_log_create_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO db_log_create_table(usuario, comando)
    VALUES ("current_user"(), tg_tag);
END;

$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_log_create_table
    ON DDL_COMMAND_START
    WHEN TAG IN ('CREATE TABLE')
EXECUTE FUNCTION fn_log_create_table();


CREATE OR REPLACE FUNCTION fn_proibir_excluir_coluna()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido excluir coluna. Consulte o DBA.';
END;
$$ LANGUAGE plpgsql;


CREATE EVENT TRIGGER tgr_proibido_excluir_coluna
    ON DDL_COMMAND_START
    WHEN TAG IN ('ALTER TABLE')
EXECUTE FUNCTION fn_proibir_excluir_coluna();

CREATE EVENT TRIGGER tgr_proibido_excluir_coluna
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_log_create_table();

CREATE EVENT TRIGGER tgr_proibido_alter_table
    ON DDL_COMMAND_START
    WHEN TAG IN ('ALTER TABLE')
EXECUTE FUNCTION fn_proibir_excluir_coluna();


SELECT "current_user"();
SET ROLE fmartins_adm;

CREATE ROLE fmartins_adm_adm WITH LOGIN PASSWORD '123123';
CREATE ROLE fmartins_adm WITH LOGIN SUPERUSER PASSWORD '123123';

GRANT CONNECT ON DATABASE dbescola TO fmartins02;
GRANT CONNECT ON DATABASE dbescola TO fmartins02;
GRANT CONNECT ON SCHEMA PUBLIC TO fmartins;
GRANT CONNECT ON SCHEMA PUBLIC TO fmartins;
GRANT CONNECT ON SCHEMA PUBLIC TO fmartins;
GRANT CONNECT ON SCHEMA PUBLIC TO fmartins;
GRANT CONNECT ON SCHEMA PUBLIC TO fmartins;
GRANT CONNECT ON SCHEMA PUBLIC TO fmartins;
GRANT CONNECT ON SCHEMA PUBLIC TO fmartins;
GRANT CONNECT ON SCHEMA PUBLIC TO fmartins;

GRANT CONNECT ON DATABASE dbMedico TO usuario_test;
GRANT CONNECT ON SCHEMA PUBLIC TO usuario_test;
GRANT INSERT, DELETE, UPDATE, SELECT ON ALL TABLES IN SCHEMA public TO usuaro_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;

GRANT CONNECT ON DATABASE dbescola TO fmartins;

GRANT INSERT, DELETE, UPDATE, SELECT ON ALL TABLES IN SCHEMA public TO fmartins;
GRANT INSERT, DELETE, UPDATE, SELECT ON ALL TABLES IN SCHEMA public TO fmartins;
GRANT INSERT, DELETE, UPDATE, SELECT ON ALL TABLES IN SCHEMA public TO fmartins;
GRANT INSERT, DELETE, UPDATE, SELECT ON ALL TABLES IN SCHEMA public TO fmartins;
GRANT INSERT, DELETE, UPDATE, SELECT ON ALL TABLES IN SCHEMA public TO fmartins;
GRANT INSERT, DELETE, UPDATE, SELECT ON ALL TABLES IN SCHEMA public TO fmartins;


SELECT *
FROM db_venda;

CREATE OR REPLACE FUNCTION fn_bloquear_drop_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido operação drop em tabelas.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_drop_table
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();


CREATE TABLE db_log_create_table
(
    usuario       TEXT NOT NULL,
    comando       TEXT NOT NULL,
    data_execucao TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION fn_log_create_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO db_log_create_table(usuario, comando)
    VALUES ("current_user"(), tg_tag);
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_log_create_table
    ON DDL_COMMAND_START
    WHEN TAG IN ('CREATE TABLE')
EXECUTE FUNCTION fn_log_create_table();

CREATE OR REPLACE FUNCTION fn_proibido_remover_coluna()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido ALTER TABLE com seu usuario.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_proibido_alter_tabela
    ON DDL_COMMAND_START
    WHEN TAG IN ('ALTER TABLE')
EXECUTE FUNCTION fn_proibido_remover_coluna();

REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOCREATEDB NOINHERIT;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;

REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOCREATEDB NOINHERIT;
ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOCREATEDB NOINHERIT;
REVOKE ALL PRIVILEGES ON DATABASE postgres to usuario;
REVOKE ALL PRIVILEGES ON DATABASE postgres to usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public to usuario_test;

ALTER ROLE usuario_test WITH NOCREATEDB NOCREATEROLE NOSUPERUSER NOINHERIT;


SET ROLE fmartins_adm;
SELECT "current_user"();
DROP TABLE db_test;
CREATE TABLE db_test03
(
    nome TEXT NOT NULL

);

ALTER TABLE db_test
    ADD COLUMN nome TEXT NOT NULL;

SELECT *
FROM db_test;

CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOCREATEDB NOINHERIT;
ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOCREATEDB NOINHERIT;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;

REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOCREATEDB NOINHERIT;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;

CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOINHERIT NOCREATEDB;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;


CREATE OR REPLACE FUNCTION fn_baixar_estoque()
    RETURNS TRIGGER AS
$$
BEGIN
    UPDATE db_estoque
    SET quantidade = old.quantidade - new.quantidade
    WHERE id_produto = new.id_produto;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_baixar_estoque
    BEFORE UPDATE
    ON db_produto_venda
EXECUTE FUNCTION fn_baixar_estoque();



GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;

SELECT *
FROM db_estoque
LIMIT 3;

SELECT *
FROM db_produto_venda
LIMIT 3;

SELECT *
FROM db_venda
LIMIT 3;


CREATE OR REPLACE FUNCTION fn_atualizar_total_vendas()
    RETURNS TRIGGER AS
$$
BEGIN
    UPDATE db_venda
    SET total = (SELECT COALESCE(SUM(preco_unitario * quantidade), 0)
                 FROM db_produto_venda
                 WHERE id_venda = new.id_venda)
    WHERE id_venda = new.id_venda;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_atualizar_total
    AFTER INSERT OR UPDATE OR DELETE
    ON db_produto_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_atualizar_total_vendas();


CREATE OR REPLACE FUNCTION fn_inserir_preco_unitario()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.preco_unitario IS NULL THEN
        SELECT preco
        INTO new.preco_unitario
        FROM db_produto
        WHERE id_produto = new.id_produto;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_inserir_preco_unitario
    BEFORE INSERT
    ON db_produto_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_inserir_preco_unitario();


SELECT *
FROM db_produto
LIMIT 3;

SET ROLE fmartins_adm;


CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;

GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;


GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;

ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOCREATEDB NOINHERIT;
ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOCREATEDB NOINHERIT;
ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOINHERIT NOCREATEDB;
ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOCREATEDB NOINHERIT;
ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOCREATEDB NOINHERIT;
ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOCREATEDB NOINHERIT;

ALTER ROLE usuario_test WITH NOSUPERUSER NOCREATEROLE NOCREATEDB NOINHERIT;


GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;

CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test NOCREATEDB NOCREATEROLE NOSUPERUSER NOINHERIT;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;

GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;

SELECT *
FROM db_produto_venda
LIMIT 23;

CREATE OR REPLACE FUNCTION fn_atualizar_total_vendas()
    RETURNS TRIGGER AS
$$
BEGIN
    UPDATE db_venda
    SET total = (SELECT COALESCE(SUM(preco_unitario * quantidade), 0)
                 FROM db_produto_venda
                 WHERE id_venda = new.id_venda)
    WHERE id_venda = NEW.id_venda;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_atualizar_total_vendas
    AFTER INSERT OR UPDATE OR DELETE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_atualizar_total_vendas();

CREATE OR REPLACE TRIGGER tgr_atualizar_total_vendas
    AFTER UPDATE OR INSERT OR DELETE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_atualizar_total_vendas();


CREATE OR REPLACE FUNCTION fn_atualizar_preco_unitario()
    RETURNS TRIGGER AS
$$
BEGIN
    SELECT preco
    INTO new.preco_unitario
    FROM db_produto
    WHERE id_produto = new.id_produto;
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_triger_atualizar_preco_unitario
    AFTER INSERT
    ON db_produto_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_atualizar_preco_unitario();

SELECT *
FROM db_produto_venda
LIMIT 3;
SELECT *
FROM db_produto
LIMIT 2;

CREATE OR REPLACE FUNCTION fn_validar_preco()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.preco < 50 OR new.preco > 10000 THEN
        RAISE EXCEPTION 'Erro, preço do produto não pode ser menor que 50 ou maior que R$10.000,00';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validar_preco_min_max
    BEFORE INSERT
    ON db_produto
    FOR EACH ROW
EXECUTE FUNCTION fn_validar_preco();

CREATE OR REPLACE FUNCTION fn_bloquear_exclusao_cliente()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido deletar cadastro do banco de dados.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloqueando_exclusao_cliente
    BEFORE DELETE
    ON db_cliente
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_exclusao_cliente();


SET ROLE fmartins;
SELECT "current_user"();

DELETE
FROM db_cliente
WHERE id_cliente = 104;

SELECT *
FROM db_cliente
WHERE id_cliente = 104;

SELECT *
FROM db_cliente
LIMIT 32;


CREATE OR REPLACE FUNCTION fn_bloquear_drop_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido dar drop table. Converse com o DBA.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_event_trigger_bloquear_drop_table
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();


CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '123123';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test NOCREATEDB NOINHERIT NOCREATEROLE NOSUPERUSER;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT DELETE, SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO usuario_test;

CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '123123';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test NOCREATEDB NOCREATEROLE NOINHERIT NOSUPERUSER;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;


SELECT table_schema,
       table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_component', 'schema information')
ORDER BY table_name, table_schema;

SELECT *
FROM db_venda
LIMIT 32;

SELECT *
FROM db_diretoria
LIMIT 3;


CREATE OR REPLACE FUNCTION fn_proibido_excluir_dados_direitoria()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido exclusão de dados da tabela diretoria.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_proibido_excluir_dados_diretoria
    BEFORE DELETE
    ON db_diretoria
    FOR EACH ROW
EXECUTE FUNCTION fn_proibido_excluir_dados_direitoria();


SELECT "current_user"();
ALTER TABLE db_diretoria
    DROP COLUMN ativo;
SET ROLE fmartins;

ALTER TABLE db_diretoria
    ADD COLUMN test BOOLEAN;

ALTER TABLE db_diretoria
    DROP COLUMN test;

SELECT *
FROM db_diretoria
LIMIT 3;

UPDATE db_diretoria
SET ativo = TRUE
WHERE ativo IS NULL;


SELECT *
FROM db_funcionario
LIMIT 3;

CREATE OR REPLACE FUNCTION fn_data_admissa_futura()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_admissao > CURRENT_DATE THEN
        RAISE EXCEPTION 'Erro, data de admissão não pode ser maior que a data de hoje.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_data_admissao_futura
    BEFORE INSERT
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_data_admissa_futura();

INSERT INTO DB_FUNCIONARIO
(id_pessoa, data_admissao, data_demissao, salario, id_cargo, id_departamento, id_nivel_funcionario)
VALUES (1, '2025-08-20', NULL, 2500.00, 1, 1, 3);

SELECT *
FROM db_funcionario
ORDER BY matricula DESC
LIMIT 10
;


CREATE OR REPLACE FUNCTION fn_proibido_alteracao_cadastro_inativo()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.ativo = FALSE THEN
        RAISE EXCEPTION 'Proibido alterar dado de cadastro inativo';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_proibido_alteracao_cadastro_inativo
    BEFORE UPDATE OR DELETE OR INSERT
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_proibido_alteracao_cadastro_inativo();

SELECT * from db_funcionario where ativo = false;

UPDATE db_funcionario SET salario = 2000 where matricula = 1000;

DROP EVENT TRIGGER tgr_proibido_excluir_coluna;




