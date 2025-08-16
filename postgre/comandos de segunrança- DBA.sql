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



















