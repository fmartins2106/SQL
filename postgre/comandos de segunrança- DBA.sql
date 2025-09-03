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

SELECT *
FROM db_funcionario
WHERE ativo = FALSE;

UPDATE db_funcionario
SET salario = 2000
WHERE matricula = 1000;



CREATE ROLE usuario_test WITH LOGIN PASSWORD '1212212';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '123123';
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test NOCREATEDB NOCREATEROLE NOSUPERUSER NOINHERIT;
GRANT SELECT, DELETE, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, DELETE, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, DELETE, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, DELETE, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, DELETE, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;


CREATE TABLE db_log_alteracao_salarial
(
    id_log_alt_salario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario            TEXT                    NOT NULL,
    id_funcionario     INTEGER                 NOT NULL,
    salario_antigo     NUMERIC(12, 2),
    novo_salario       NUMERIC(12, 2),
    data_alteracao     TIMESTAMP DEFAULT NOW() NOT NULL,
    CONSTRAINT fk_id_funcionario FOREIGN KEY (id_funcionario) REFERENCES db_funcionario (matricula)
);

CREATE OR REPLACE FUNCTION fn_log_alteracao_salario()
    RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO db_log_alteracao_salarial(usuario, id_funcionario, salario_antigo, novo_salario)
    VALUES (CURRENT_USER, old.id_funcionario, old.salario_antigo, new.novo_salario);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_log_tabela_alteracao_salarial
    AFTER UPDATE OF salario
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_log_alteracao_salario();

SELECT *
FROM db_venda
LIMIT 3;

CREATE OR REPLACE FUNCTION fn_inserir_total_automatico()
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

CREATE OR REPLACE TRIGGER tgr_inserir_total_automatico
    AFTER UPDATE OR DELETE OR INSERT
    ON db_produto_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_inserir_preco_unitario();



CREATE OR REPLACE FUNCTION fn_inserir_total_automatico()
    RETURNS TRIGGER AS
$$
DECLARE
    total NUMERIC(12, 2);
BEGIN
    SELECT COALESCE(SUM(NEW.preco_unitario * NEW.quantidade), 0)
    INTO total
    FROM db_produto_venda
    WHERE id_venda = new.id_venda;
    UPDATE db_venda
    SET total = total
    WHERE id_venda = new.id_venda;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_fn_inserir_valor_total_db_vendas
    AFTER UPDATE OR INSERT
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_inserir_total_automatico();

CREATE OR REPLACE FUNCTION fn_add_preco_unitario_db_produto_venda()
    RETURNS TRIGGER AS
$$
DECLARE
    v_preco NUMERIC(12, 2);
BEGIN
    SELECT preco
    INTO v_preco
    FROM db_produto
    WHERE id_produto = new.id_produto;
    new.preco_unitario = v_preco;
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_add_preco_unitario_db_produto_venda
    BEFORE UPDATE OR INSERT
    ON db_produto_venda
EXECUTE FUNCTION fn_add_preco_unitario_db_produto_venda();


SELECT *
FROM db_produto_venda
LIMIT 3;

SELECT *
FROM db_produto
LIMIT 3;

CREATE OR REPLACE FUNCTION fn_bloquear_venda_sem_produto()
    RETURNS TRIGGER AS
$$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM db_produto_venda WHERE id_venda = new.id_venda) THEN
        RAISE EXCEPTION 'Não é possivel confirmar a venda % sem produtos.',new.venda;
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloquear_venda_sem_produto
    BEFORE INSERT
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_venda_sem_produto();


SELECT table_schema,
       table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND TABLE_SCHEMA NOT IN ('pg_catalog', 'information_schema');


SELECT *
FROM db_logradouro
LIMIT 2;

ALTER TABLE db_logradouro
    ADD COLUMN ativo BOOLEAN;

CREATE OR REPLACE FUNCTION fn_inativar_logradouro()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido excluir do linha do banco de dados.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_inativar_logradouro
    BEFORE DELETE
    ON db_logradouro
    FOR EACH ROW
EXECUTE FUNCTION fn_inativar_logradouro();

DELETE
FROM db_logradouro
WHERE id_logradouro = 1;

SET ROLE usuario_test;

SELECT "current_user"();

CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '123123';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
ALTER ROLE usuario_test NOCREATEDB NOINHERIT NOCREATEROLE NOSUPERUSER;
GRANT SELECT, DELETE, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;

GRANT SELECT, DELETE, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, DELETE, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, DELETE, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, DELETE, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, DELETE, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;

CREATE OR REPLACE FUNCTION fn_set_atualizacao()
    RETURNS TRIGGER AS
$$
BEGIN
    new.ultima_atualizacao := NOW();
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_ultima_atualizacao
    BEFORE INSERT OR UPDATE
    ON db_pessoa
    FOR EACH ROW
EXECUTE FUNCTION fn_set_atualizacao();


CREATE OR REPLACE FUNCTION fn_calcular_total_vendas()
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

CREATE OR REPLACE TRIGGER tgr_calcular_total
    AFTER UPDATE OR INSERT
    ON db_produto_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_calcular_total_vendas();

CREATE OR REPLACE FUNCTION fn_calcular_total_vendas()
    RETURNS TRIGGER AS
$$
BEGIN
    UPDATE db_venda
    SET total = (SELECT COALESCE(SUM(preco_unitario * quantidade), 0)
                 FROM db_produto_venda
                 WHERE db_venda.id_venda = new.id_venda)
    WHERE id_venda = new.id_venda;
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_calcular_total_vendas
    AFTER UPDATE OR INSERT OR DELETE
    ON db_produto_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_calcular_total_vendas();

CREATE OR REPLACE FUNCTION fn_bloquear_demissao_salario_maior_10000()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_demissao IS NOT NULL AND new.salario >= 10000 THEN
        RAISE EXCEPTION 'Demissão não autorizada. Tratar com Diretoria da área.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloquear_demissao_salario_maior_10000
    BEFORE UPDATE OF data_demissao
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_demissao_salario_maior_10000();


SELECT *
FROM db_funcionario
WHERE salario >= 10000;

UPDATE db_funcionario
SET data_demissao = '2025-08-22'
WHERE matricula = 1018;

CREATE TABLE db_log_demissao
(
    id_demissao      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    matricula        INTEGER NOT NULL,
    nome_funcionario TEXT    NOT NULL,
    data_admissao    DATE    NOT NULL,
    data_demissao    DATE    NOT NULL,
    usuario          TEXT    NOT NULL,
    data_execucao    TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION fn_log_demissao()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome TEXT;
BEGIN
    SELECT nome
    INTO v_nome
    FROM db_pessoa
    WHERE id_pessoa = new.id_pessoa;
    INSERT INTO db_log_demissao(matricula, nome_funcionario, data_admissao, data_demissao, usuario)
    VALUES (old.matricula, v_nome, old.data_admissao, new.data_demissao, "current_user"());
    RETURN old;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_log_demissao()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome TEXT;
BEGIN
    SELECT nome
    INTO v_nome
    FROM db_pessoa
    WHERE id_pessoa = new.id_pessoa;
    INSERT INTO db_log_demissao(matricula, nome_funcionario, data_admissao, data_demissao, usuario)
    VALUES (old.matricula, v_nome, old.data_admissao, new.data_demissao, CURRENT_USER);
    RETURN new;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE TRIGGER tgr_log_demissao
    AFTER UPDATE
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_log_demissao();


SELECT *
FROM db_funcionario
ORDER BY db_funcionario.matricula DESC;

UPDATE db_funcionario
SET data_demissao = '2025-08-22'
WHERE matricula = 1020;

SELECT *
FROM db_log_demissao;

SELECT *
FROM db_funcionario
WHERE matricula = 1020;



SELECT "current_user"();



SELECT *
FROM db_funcionario
LIMIT 3;

SELECT *
FROM db_produto_venda
LIMIT 3;



SELECT *
FROM db_pessoa
LIMIT 3;



CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '123123';
GRANT CONNECT ON DATABASE postgres TO usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test NOCREATEDB NOCREATEROLE NOINHERIT NOSUPERUSER;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;

SELECT "current_user"();

SET ROLE fmartins_adm;

CREATE FUNCTION fn_atualizar_dados()
    RETURNS TRIGGER AS
$$
BEGIN
    IF (tg_op = 'UPDATE' OR tg_op = 'DELETE') AND OLD.ativo = FALSE THEN
        RAISE EXCEPTION 'ERro: operação não permitida em cadastro inativo.';
    END IF;
    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION fn_atualizar_dados()
    RETURNS TRIGGER AS
$$
BEGIN
    IF (tg_op = 'UPDATE' OR 'tg_op' = 'DELETE') AND OLD.ativo = FALSE THEN
        RAISE EXCEPTION 'Erro: operação não permitida em cadastro inativo';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_atualizar_dados_cad_cancelado()
    RETURNS TRIGGER AS
$$
BEGIN
    IF (tg_op = 'DELETE' OR tg_op = 'UPDATE') AND OLD.ATIVO = FALSE THEN
        RAISE EXCEPTION 'Erro, não permitido cadastro inativo.';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_atualizar_dados_db_pessoa
    BEFORE DELETE OR INSERT OR UPDATE
    ON db_pessoa
    FOR EACH ROW
EXECUTE FUNCTION fn_atualizar_dados();


CREATE OR REPLACE FUNCTION fn_calcular_total_vendas()
    RETURNS TRIGGER AS
$$
DECLARE
    v_total_vendas NUMERIC(12, 2);
    v_id_venda     INT;
BEGIN
    IF (tg_op = 'DELETE') THEN
        v_id_venda := old.id_venda;
    ELSE
        v_id_venda := new.id_venda;
    END IF;
    SELECT COALESCE(SUM(preco_unitario * quantidade), 0)
    INTO v_total_vendas
    FROM db_produto_venda
    WHERE id_venda = v_id_venda;

    UPDATE db_venda
    SET total = v_total_vendas
    WHERE id_venda = v_id_venda;
    RETURN COALESCE(new, old);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_calcular_total_vendas
    AFTER UPDATE OR INSERT OR DELETE
    ON db_produto_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_calcular_total_vendas();


CREATE OR REPLACE FUNCTION fn_proibido_demissao_salario_maior_10000()
    RETURNS TRIGGER AS
$$
BEGIN
    IF old.data_demissao IS NULL AND new.data_demissao IS NOT NULL THEN
        IF new.salario >= 10000 THEN
            RAISE EXCEPTION 'Proibido demissão. Salário acima de R$10.000 - Converser com a diretoria.';
        END IF;
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_proibido_demissao_salario_maior_10000
    BEFORE UPDATE OF data_demissao
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_proibido_demissao_salario_maior_10000();


CREATE OR REPLACE FUNCTION fn_salario_minimo()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.salario < 1510 THEN
        RAISE EXCEPTION 'Erro, Salário não pode ser menor que salário mínimo vigente de R$1510.00';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_salario_minimo
    BEFORE UPDATE OF salario OR INSERT
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_salario_minimo();



CREATE OR REPLACE FUNCTION fn_calcular_total_db_venda()
    RETURNS TRIGGER AS
$$
DECLARE
    v_total_vendas NUMERIC(12, 2);
    v_id_venda     INTEGER;
BEGIN
    IF (tg_op = 'DELETE') THEN
        old.id_venda = v_id_venda;
    ELSE
        v_id_venda = new.id_venda;
    END IF;

    SELECT COALESCE(SUM(preco_unitario * quantidade), 0)
    INTO v_total_vendas
    FROM db_produto_venda
    WHERE id_venda = v_id_venda;

    UPDATE db_venda
    SET total = v_total_vendas
    WHERE id_venda = v_id_venda;
    RETURN COALESCE(new, old);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_calcular_total_db_venda
    AFTER INSERT OR DELETE OR UPDATE
    ON db_produto_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_calcular_total_vendas();


CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '123123';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test NOCREATEDB NOCREATEROLE NOSUPERUSER NOINHERIT;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;

CREATE OR REPLACE FUNCTION fn_set_atualizacao()
    RETURNS TRIGGER AS
$$
BEGIN
    new.data_atualizacao = NOW();
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_set_atualizacao_tabela_db_cliente
    BEFORE UPDATE
    ON db_cliente
    FOR EACH ROW
EXECUTE FUNCTION fn_set_atualizacao();

CREATE OR REPLACE FUNCTION fn_set_atualizacao()
    RETURNS TRIGGER AS
$$
BEGIN
    new.data_atualizacao = NOW();
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_atualizacao_tabela_db_cliente
    BEFORE UPDATE
    ON db_cliente
    FOR EACH ROW
EXECUTE FUNCTION fn_set_atualizacao();

CREATE OR REPLACE FUNCTION fn_atualizar_valor_total_db_venda()
    RETURNS TRIGGER AS
$$
DECLARE
    v_total_venda NUMERIC(12, 2);
    v_id_venda    INTEGER;
BEGIN
    IF (tg_op = 'DELETE') THEN
        v_id_venda = old.id_venda;
    ELSE
        v_id_venda = new.id_venda;
    END IF;

    SELECT COALESCE(SUM(preco_unitario * quantidade), 0)
    INTO v_total_venda
    FROM db_produto_venda
    WHERE id_venda = v_id_venda;

    UPDATE db_venda
    SET total = v_total_venda
    WHERE id_venda = v_id_venda;

    RETURN COALESCE(new, old);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_proibido_demissao_salario_acima_10000()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.salario >= 10000 AND new.data_demissao IS NOT NULL THEN
        RAISE EXCEPTION 'Erro. proibido demissão de funcionário com salário maior que R$10.000 - Converse com a diretoria';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_proibido_demissao_salario_acima_10000
    BEFORE UPDATE
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_proibido_demissao_salario_acima_10000();

CREATE TABLE db_log_alteracao_salario
(
    id_altecao_salario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    matricula          INTEGER        NOT NULL,
    nome_funcionario   TEXT           NOT NULL,
    salario_antigo     NUMERIC(12, 2) NOT NULL,
    salario_novo       NUMERIC(12, 2) NOT NULL,
    usuario            TEXT           NOT NULL,
    data_alteracao     TIMESTAMP DEFAULT NOW()
);


CREATE OR REPLACE FUNCTION fn_alteracao_salario()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome_funcionario TEXT;
BEGIN
    SELECT nome
    INTO v_nome_funcionario
    FROM db_pessoa
    WHERE id_pessoa = new.id_pessoa;

    -- Só loga se o salário realmente mudou
    IF TG_OP = 'UPDATE' AND OLD.salario <> NEW.salario THEN
        INSERT INTO db_log_alteracao_salario(matricula, nome_funcionario, salario_antigo, salario_novo, usuario)
        VALUES (OLD.matricula, v_nome_funcionario, OLD.salario, NEW.salario, CURRENT_USER);
    END IF;

    -- Se for INSERT, guarda salário inicial
    IF TG_OP = 'INSERT' THEN
        INSERT INTO db_log_alteracao_salario(matricula, nome_funcionario, salario_antigo, salario_novo, usuario)
        VALUES (NEW.matricula, v_nome_funcionario, 0, NEW.salario, CURRENT_USER);
    END IF;
    RETURN new;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_alteracao_salario
    AFTER UPDATE OR INSERT
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_alteracao_salario();



CREATE OR REPLACE FUNCTION fn_alteracao_salario()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome TEXT;
BEGIN
    SELECT nome
    INTO v_nome
    FROM db_pessoa
    WHERE id_pessoa = new.id_pessoa;

    IF (tg_op = 'UPDATE') AND old.salario <> new.salario THEN
        INSERT INTO db_log_alteracao_salario(matricula, nome_funcionario, salario_antigo, salario_novo, usuario)
        VALUES (old.matricula, v_nome, old.salario, new.salario, CURRENT_USER);
    END IF;

    IF (tg_op = 'INSERT') THEN
        INSERT INTO db_log_alteracao_salario(matricula, nome_funcionario, salario_antigo, salario_novo, usuario)
        VALUES (old.matricula, v_nome, 0, new.salario, CURRENT_USER);
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_atualizar_salario
    BEFORE INSERT OR UPDATE
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_atualizar_salario;


CREATE OR REPLACE FUNCTION fn_alteracao_salario()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome_funcionario TEXT;
BEGIN
    SELECT nome
    INTO v_nome_funcionario
    FROM db_pessoa
    WHERE id_pessoa = NEW.id_pessoa;

    IF (tg_op = 'UPDATE') THEN
        INSERT INTO db_log_alteracao_salario(matricula, nome_funcionario, salario_antigo, salario_novo, usuario)
        VALUES (OLD.matricula, v_nome_funcionario, OLD.salario, NEW.salario, CURRENT_USER);
    END IF;

    IF (tg_op = 'INSERT') THEN
        INSERT INTO db_log_alteracao_salario(matricula, nome_funcionario, salario_antigo, salario_novo, usuario);
        VALUES (old.matricula, v_nome_funcionario, 0, new.salario, CURRENT_USER);
    END IF;

    RETURN new;
END;
$$
    LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_alteracao_salario
    BEFORE INSERT OR UPDATE
    ON db_log_alteracao_salario
    FOR EACH ROW
EXECUTE FUNCTION fn_alteracao_salario();


CREATE OR REPLACE FUNCTION fn_validar_preco_produto()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.preco < 50 OR new.preco > 10000 THEN
        RAISE EXCEPTION 'Erro. Preço não pode ser menor que R$50.00 ou maior que R$10000';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validar_preco_produto
    BEFORE INSERT OR UPDATE
    ON db_produto
    FOR EACH ROW
EXECUTE FUNCTION fn_validar_preco_produto();


CREATE OR REPLACE FUNCTION fn_validar_preco_produto()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.preco < 50 OR new.preco > 10000 THEN
        RAISE EXCEPTION 'Erro. Preço não pode ser menor que R$50,00 ou maior que R$10.000';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validar_preco_produto
    BEFORE INSERT OR UPDATE
    ON db_produto
    FOR EACH ROW
EXECUTE FUNCTION fn_validar_preco_produto();


CREATE OR REPLACE FUNCTION fn_data_criacao()
    RETURNS TRIGGER AS
$$
BEGIN
    new.data_criacao = NOW();
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_data_criacao
    BEFORE INSERT
    ON db_cliente
    FOR EACH ROW
EXECUTE FUNCTION fn_data_criacao();



SELECT *
FROM db_produto
LIMIT 2;


CREATE OR REPLACE FUNCTION fn_atualizar_dados()
    RETURNS TRIGGER AS
$$
BEGIN
    IF (tg_op = 'DELETE' OR tg_op = 'UPDATE') AND old.ativo = FALSE THEN
        RAISE EXCEPTION 'Erro. Operação não permitida, cadastro inativo.';
    END IF;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_atualizar_dados
    BEFORE DELETE OR UPDATE
    ON db_pessoa
    FOR EACH ROW
EXECUTE FUNCTION fn_atualizar_dados();


CREATE OR REPLACE FUNCTION fn_atualizar_total_db_vendas()
    RETURNS TRIGGER AS
$$
DECLARE
    v_total_venda NUMERIC(12, 2);
    v_id_venda    INTEGER;
BEGIN

    IF (tg_op = 'DELETE') THEN
        v_id_venda = old.id_venda;
        RAISE EXCEPTION 'Erro. Exclusão proibida';
    ELSE
        v_id_venda = new.id_venda;
    END IF;

    SELECT COALESCE(SUM(preco_unitario * quantidade), 0)
    INTO v_total_venda
    FROM db_produto_venda
    WHERE id_venda = v_id_venda;

    UPDATE db_venda
    SET total = v_total_venda
    WHERE id_venda = v_id_venda;

    RETURN COALESCE(new, old);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_atualizar_total_db_vendas
    BEFORE INSERT OR UPDATE OR DELETE
    ON db_produto_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_atualizar_total_vendas();



CREATE FUNCTION fn_atualizar_dados()
    RETURNS TRIGGER AS
$$
BEGIN
    IF (tg_op = 'UPDATE' OR tg_op = 'DELETE') AND OLD.ativo = FALSE THEN
        RAISE EXCEPTION 'ERro: operação não permitida em cadastro inativo.';
    END IF;
    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_proibido_excluir_tabela()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido excluir tabelas.';
END;
$$ LANGUAGE plpgsql;


CREATE EVENT TRIGGER tgr_proibido_excluir_tabela
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_proibido_excluir_tabela();


CREATE TABLE db_log_create_table_test_2
(
    nome         TEXT NOT NULL,
    usuario      TEXT NOT NULL,
    data_criacao TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION fn_log_create_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO db_log_create_table_test_2(nome, usuario)
    SELECT objid::REGCLASS::TEXT, CURRENT_USER
    FROM pg_event_trigger_ddl_commands();
END;
$$ LANGUAGE plpgsql;



CREATE EVENT TRIGGER tgr_create_table
    ON DDL_COMMAND_END
    WHEN TAG IN ('CREATE TABLE')
EXECUTE FUNCTION fn_log_create_table();


SET ROLE fmartins;

SELECT "current_user"();
SELECT *
FROM db_log_create_table_test_2;

CREATE TABLE db_test03
(

);

CREATE ROLE usuario_test WITH LOGIN PASSWORD '231213';
CREATE ROLE usuario_Test WITH LOGIN SUPERUSER PASSWORD '123123';
GRANT CONNECT ON DATABASE postgres TO usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
ALTER ROLE usuario_test NOCREATEDB NOCREATEROLE NOSUPERUSER NOINHERIT;
GRANT SELECT, DELETE, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO usuario_test;

CREATE ROLE usuario_test WITH LOGIN PASSWORD '122123';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '123123';
GRANT CONNECT ON DATABASE postgres TO usuario_test;
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
ALTER ROLE usuario_test NOCREATEDB NOINHERIT NOCREATEROLE NOSUPERUSER;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;


CREATE OR REPLACE FUNCTION fn_bloquear_drop_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido excluir tabela';
END;
$$ LANGUAGE plpgsql;


CREATE EVENT TRIGGER tgr_bloquear_drop_table
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();

CREATE OR REPLACE FUNCTION fn_bloquear_database()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido excluir banco de dados.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_database
    ON DDL_COMMAND_START
    WHEN TAG IN ('DROP DATABASE')
EXECUTE FUNCTION fn_bloquear_database();

CREATE OR REPLACE FUNCTION fn_bloquear_excluir_schema()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido excluir schema.';
END;

$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_proibido_excluir_schema
    ON DDL_COMMAND_START
    WHEN TAG IN ('DROP SCHEMA')
EXECUTE FUNCTION fn_bloquear_excluir_schema();


CREATE TABLE db_log_create_tables
(
    id_comando   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_tabela  VARCHAR(100) NOT NULL,
    comando      VARCHAR(50)  NOT NULL,
    usuario      VARCHAR(50)  NOT NULL,
    data_criacao TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION fn_db_log_create_tables()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO db_log_create_tables(nome_tabela, comando, usuario)
    SELECT objid::REGCLASS::TEXT AS nome_tabela,
           command_tag,
           "current_user"()
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('ALTER TABLE', 'DROP TABLE', 'CREATE TABLE');
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_log_create_tables
    ON DDL_COMMAND_END
    WHEN TAG IN ('ALTER TABLE', 'DROP TABLE','CREATE TABLE')
EXECUTE FUNCTION fn_db_log_create_tables();



CREATE OR REPLACE FUNCTION fn_db_log_create_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO db_log_create_tables
    SELECT objid::REGCLASS::TEXT,
           command_tag,
           CURRENT_USER
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('CREATE TABLE', 'DROP TABLE', 'ALTER TABLE')
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_db_log_create_table
    ON DDL_COMMAND_END
    WHEN TAG IN ('CREATE TABLE','DROP TABLE', 'ALTER TABLE')
EXECUTE FUNCTION fn_db_log_create_tables();

CREATE OR REPLACE FUNCTION fn_db_bloquear_exclusao_tabela()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido efetuar exclusão de tabelas.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_proibido_exclusao_tabelas
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_db_bloquear_exclusao_tabela();

CREATE OR REPLACE FUNCTION fn_bloquear_exclusao_banco_dados()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido exclusao de banco de dados.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_exclusao_banco_dados
    ON DDL_COMMAND_START
    WHEN TAG IN ('DROP DATABASE')
EXECUTE FUNCTION fn_bloquear_exclusao_banco_dados();


CREATE OR REPLACE FUNCTION fn_proibido_excluir_dados_tabelas()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Probido excluir dados da tabela. Utilize o campo Ativo e modifique para false.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_proibido_exclusao_tabela_db_funcionario
    BEFORE DELETE
    ON db_funcionario
EXECUTE FUNCTION fn_proibido_excluir_dados_tabelas();

--
CREATE OR REPLACE FUNCTION fn_proibido_exclusao_dados_tabela()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido excluir dados tabela.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;

DO
$$
    DECLARE
        tbl RECORD;
    BEGIN
        FOR tbl IN
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public'
            LOOP
                EXECUTE FORMAT(
                        'CREATE OR REPLACE TRIGGER tgr_proibido_excluir_dados_%I
                         BEFORE DELETE
                         ON %I
                         FOR EACH ROW
                         EXECUTE FUNCTION fn_proibido_excluir_dados_tabelas();'
                    , tbl.tablename, tbl.tablename);
            END LOOP;
    END;

$$;

CREATE OR REPLACE FUNCTION fn_proibido_excluir_dados_tabela()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro, proibido excluir dados coluna.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;

DO
$$
    DECLARE
        tabela RECORD;
    BEGIN
        FOR tabela IN
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public';
        LOOP
            EXECUTE FORMAT('CREATE OR REPLACE TRIGGER tgr_proibido_excluir_dados_%I
                         BEFORE DELETE
                         ON %I
                         FOR EACH ROW
                         EXECUTE FUNCTION fn_proibido_excluir_dados_tabelas();',
                           tabela.tablename, tabela.tablename);
        END LOOP;
    END;
$$;

CREATE OR REPLACE FUNCTION fn_proibido_excluir_dados_tabela()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido excluir dados da tabela.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tgr_proibido_excluir_dados_tabela
    BEFORE DELETE
    ON db_test
    FOR EACH ROW
EXECUTE FUNCTION fn_proibido_excluir_dados_tabelas();

DO
$$
    DECLARE
        tabela RECORD;
    BEGIN
        FOR tabela IN
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public';
        LOOP
            EXECUTE FORMAT('CREATE TRIGGER tgr_proibido_excluir_dados_tabela_%I
            BEFORE DELETE
            ON %I
            FOR EACH ROW
            EXECUTE FUNCTION fn_proibido_excluir_dados_tabelas()',
                           tabela.tablename, tabela.tablename);
        END LOOP;
    END;

$$;



DO
$$
    DECLARE
        tbl RECORD;
    BEGIN
        FOR tbl IN
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public'
            LOOP
                EXECUTE FORMAT(
                        'CREATE OR REPLACE TRIGGER tgr_proibido_exclusao_tabela_%I
                        BEFORE DELETE
                        ON %I
                        FOR EACH ROW
                        EXECUTE FUNCTION fn_proibido_excluir_dados_tabelas();'
                    , tbl.tablename, tbl.tablename);
            END LOOP;
    END;
$$;

CREATE OR REPLACE FUNCTION fn_proibido_excluir_tabelas()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido excluir tabelas.';
END;
$$ LANGUAGE plpgsql;


CREATE EVENT TRIGGER tgr_proibido_excluir_tabelas
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_proibido_excluir_tabela();

SET ROLE fmartins_adm;
SELECT "current_user"();

CREATE TABLE db_log_tabelas
(
    id_mod_tabela    INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tabela           VARCHAR(50) NOT NULL,
    comando          VARCHAR(50) NOT NULL,
    usuario          VARCHAR(50) NOT NULL,
    data_modificacao TIMESTAMP DEFAULT NOW()
);

DROP TABLE db_log_tabelas;
DROP FUNCTION fn_bloquear_drop_table() CASCADE;


CREATE FUNCTION fn_bloquear_drop_table() RETURNS EVENT_TRIGGER
    LANGUAGE plpgsql
AS
$$
BEGIN
    RAISE EXCEPTION 'DROP TABLE não permitido em ambiente de produção';
END;
$$;

CREATE EVENT TRIGGER tgr_proibido_excluir_tabela
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();


ALTER FUNCTION fn_bloquear_drop_table() OWNER TO fmartins;



CREATE OR REPLACE FUNCTION fn_log_tabelas()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO db_log_tabelas(tabela, comando, usuario)
    SELECT objid::REGCLASS::TEXT,
           command_tag,
           CURRENT_USER
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('DROP TABLE', 'ALTER TABLE', 'CREATE TABLE');
END;
$$ LANGUAGE plpgsql;


CREATE EVENT TRIGGER tgr_log_tabelas
    ON DDL_COMMAND_END
    WHEN TAG IN ('DROP TABLE','ALTER TABLE','CREATE TABLE')
EXECUTE FUNCTION fn_log_tabelas();



CREATE OR REPLACE FUNCTION fn_db_log_create_tables()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO db_log_create_tables(nome_tabela, comando, usuario)
    SELECT objid::REGCLASS::TEXT AS nome_tabela,
           command_tag,
           CURRENT_USER
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('CREATE TABLE', 'ALTER TABLE', 'DROP TABLE');
END;
$$
    LANGUAGE plpgsql;


CREATE EVENT TRIGGER tgr_db_log_create_tables
    ON DDL_COMMAND_END
    WHEN TAG IN ('CREATE TABLE', 'ALTER TABLE','DROP TABLE')
EXECUTE FUNCTION fn_db_log_create_tables();

CREATE TABLE db_test10
(

);



ALTER TABLE db_test10
    ADD COLUMN id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY;

SELECT *
FROM db_log_create_tables;

CREATE DATABASE superdev_db;


CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '1223123';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
ALTER ROLE usuario_test NOCREATEDB NOINHERIT NOCREATEROLE NOSUPERUSER;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;


CREATE OR REPLACE FUNCTION fn_bloquer_exclusao_sistema()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO db_log_tabelas(tabela, comando, usuario)
    SELECT objid::REGCLASS::TEXT,
           command_tag,
           CURRENT_USER
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('DROP TABLE', 'ALTER TABLE', 'CREATE TABLE');
END;
$$ LANGUAGE plpgsql;


CREATE EVENT TRIGGER tgr_proibido_excluir_dados_sistema
    ON DDL_COMMAND_END
    WHEN TAG IN ('DROP TABLE','ALTER TABLE','CREATE TABLE')
EXECUTE FUNCTION fn_bloquer_exclusao_sistema();


CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '123123';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test NOCREATEDB NOINHERIT NOCREATEROLE NOSUPERUSER;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, SELECT, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;

---------

CREATE OR REPLACE FUNCTION fn_db_log_alteracao_tablela()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO db_log_tabelas(tabela, comando, usuario)
    SELECT objid::REGCLASS::TEXT,
           command_tag,
           CURRENT_USER
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('ALTER TABLE', 'DROP TABLE', 'CREATE TABLE');
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_db_log_alteracao_tabela
    ON DDL_COMMAND_END
    WHEN TAG IN ('ALTER TABLE','DROP TABLE','CREATE TABLE')
EXECUTE FUNCTION fn_db_log_create_tables();

------

CREATE OR REPLACE FUNCTION fn_proibido_alteracao_tabela()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido excluir tabela.';
END;
$$ LANGUAGE plpgsql;


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
                EXECUTE FORMAT(
                        'CREATE OR REPLACE TRIGGER tgr_proibido_excluir_alterar_dados_tabela%I
                         BEFORE DELETE
                         ON %I
                         EXECUTE FUNCTION fn_proibido_excluir_dados_tabela();'
                    , tabela.tablename, tabela.tablename);
            END LOOP;
    END;
$$;


CREATE OR REPLACE FUNCTION fn_proibido_alteracao_tabelas()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido alteração na estrutura da tabela.';
END;
$$ LANGUAGE plpgsql;


CREATE EVENT TRIGGER tgr_proibido_alteracao_tabelas
    ON DDL_COMMAND_START
    WHEN TAG IN ('ALTER TABLE')
EXECUTE FUNCTION fn_proibido_alteracao_tabelas();

-------

CREATE OR REPLACE TRIGGER tgr_proibido_excluir_alterar_dados_tabela
    BEFORE DELETE
    ON db_test
EXECUTE FUNCTION fn_proibido_excluir_dados_tabela();

DO
$$
    DECLARE
        tbl RECORD;
    BEGIN
        FOR tbl IN
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public'
            LOOP
                EXECUTE FORMAT(
                        'CREATE OR REPLACE TRIGGER tgr_proibido_exclusao_tabela_%I
                        BEFORE DELETE
                        ON %I
                        FOR EACH ROW
                        EXECUTE FUNCTION fn_proibido_excluir_dados_tabelas();'
                    , tbl.tablename, tbl.tablename);
            END LOOP;
    END;
$$;


CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '123123';
REVOKE ALL PRIVILEGES ON DATABASE prostgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test NOCREATEDB NOINHERIT NOCREATEROLE NOSUPERUSER NOCREATEUSER;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA public TO usuario_test;


CREATE OR REPLACE FUNCTION fn_bloquear_drop_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro, proibido efetuar exclusão de tabelas.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_drop_table
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();

CREATE OR REPLACE FUNCTION fn_bloquear_alter_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar alteração na estrutura da tabela sem permissão prévia';
END;
$$ LANGUAGE plpgsql;


CREATE EVENT TRIGGER tgr_bloquear_alter_tabela
    ON DDL_COMMAND_START
    WHEN TAG IN ('ALTER TABLE')
EXECUTE FUNCTION fn_bloquear_alter_table();


CREATE SCHEMA IF NOT EXISTS administration;

CREATE TABLE administration.log_comandos
(
    id_alteracao  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    comando       VARCHAR(20) NOT NULL,
    tabela        VARCHAR(20) NOT NULL,
    usuario       VARCHAR(20) NOT NULL DEFAULT CURRENT_USER,
    data_execucao TIMESTAMP   NOT NULL DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION fn_log_comandos()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO administration.log_comandos(comando, tabela)
    SELECT command_tag,
           object_identity
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('DROP TABLE', 'ALTER TABLE', 'CREATE TABLE');

END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_log_comandos
    ON DDL_COMMAND_END
    WHEN TAG IN ('DROP TABLE','ALTER TABLE','CREATE TABLE')
EXECUTE FUNCTION fn_log_comandos();


DO
$$
    DECLARE
        nome_tabela RECORD;
    BEGIN
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'public';
        LOOP
            EXECUTE FORMAT(
           'CREATE OR REPLACE TRIGGER tgr_bloquear_deleta_from_tabela_%I
            BEFORE DELETE OR TRUNCATE
            ON %I
            FOR EACH ROW
            EXECUTE FUNCTION fn_bloquear_delete_from_tabelas();'
            ,nome_tabela.tablename,nome_tabela.tablename);
        END LOOP;
    END;
$$;

CREATE OR REPLACE FUNCTION fn_bloquear_delete_from_tabelas()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar exclusão de dados do sistema.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloquear_deleta_from_tabelas
    BEFORE DELETE OR TRUNCATE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_delete_from_tabelas();




























