-----------------------------------------------------------
-- IMPLEMENTAÇÃO 10 TRIGGERS E 10 EVENT_TRIGGERS
-----------------------------------------------------------

-- LOG CLIENTE EXCLUIDO;

CREATE SCHEMA IF NOT EXISTS administration;

CREATE TABLE administration.log_cliente_inativo
(
    id_cliente_excluido INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente          INTEGER      NOT NULL,
    nome_cliente        VARCHAR(100) NOT NULL,
    data_exclusao       TIMESTAMP    NOT NULL DEFAULT NOW(),
    usuario             TEXT         NOT NULL DEFAULT CURRENT_USER,
    CONSTRAINT FK_id_cliente_log_inativo FOREIGN KEY (id_cliente) REFERENCES db_cliente (id_cliente)
);

CREATE OR REPLACE FUNCTION fn_log_cliente_inativo()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome_cliente TEXT;
BEGIN
    IF old.ativo = FALSE AND new.ativo = TRUE THEN

        SELECT p.nome
        INTO v_nome_cliente
        FROM db_cliente c
                 INNER JOIN db_pessoa p ON p.id_pessoa = c.id_pessoa
        WHERE c.id_cliente = old.id_cliente;

        INSERT INTO administration.log_cliente_inativo(id_cliente, nome_cliente)
        VALUES (old.id_cliente, v_nome_cliente);
        RETURN new;
    END IF;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_log_cliente_inativo
    AFTER UPDATE OF ativo
    ON db_cliente
    FOR EACH ROW
EXECUTE FUNCTION fn_log_cliente_inativo();

---------------------

CREATE TABLE administration.log_cliente_inativo
(
    id_cliente_inativo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente         INTEGER      NOT NULL,
    nome_cliente       VARCHAR(100) NOT NULL,
    usuario            VARCHAR(30)  NOT NULL DEFAULT CURRENT_USER,
    data_execucao      TIMESTAMP    NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_log_cliente_inativo_cliente FOREIGN KEY (id_cliente) REFERENCES db_cliente (id_cliente)
);


CREATE OR REPLACE FUNCTION fn_log_cliente_inativo()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome_cliente TEXT;
BEGIN
    SELECT p.nome
    INTO v_nome_cliente
    FROM db_pessoa p
             INNER JOIN db_cliente c
                        ON c.id_pessoa = p.id_pessoa
    WHERE c.id_cliente = old.id_cliente;

    IF old.ativo = TRUE AND new.ativo = FALSE THEN
        INSERT INTO administration.log_cliente_inativo(id_cliente, nome_cliente)
        VALUES (old.id_cliente, v_nome_cliente);
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_log_cliente_inativo
    AFTER UPDATE OF ativo
    ON db_cliente
    FOR EACH ROW
EXECUTE FUNCTION fn_log_cliente_inativo();


------
CREATE OR REPLACE FUNCTION fn_salario_maior_salario_minimo()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.salario <= 1510 THEN
        RAISE EXCEPTION 'Salário não pode ser menor que salário mínimo.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_salario_maior_salario_minimo
    BEFORE UPDATE OR INSERT
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_salario_maior_salario_minimo();


CREATE OR REPLACE FUNCTION fn_validacao_data_demissao()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_demissao < old.data_admissao OR new.data_demissao > CURRENT_DATE THEN
        RAISE EXCEPTION 'Erro. Data de demissão não pode ser menor que data de admissão ou data maior que data atual.';
    ELSE
        new.ativo = FALSE;
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_validacao_data_demissao
    BEFORE UPDATE OF data_demissao
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_validacao_data_demissao();

--1. Garantir salário >= 1510

CREATE OR REPLACE FUNCTION fn_validando_salario_minimo()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.salario < 1510 THEN
        RAISE EXCEPTION 'Salário não pode ser menor que salário mínimo';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_validando_salario_minimo
    BEFORE UPDATE OF salario OR INSERT
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_validando_salario_minimo();

---------------
CREATE OR REPLACE FUNCTION fn_validacao_salario_minimo()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.salario < 1510 THEN
        RAISE EXCEPTION 'Erro salário não pode ser menor que salário minímo vigente.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validacao_salario_minimo
    BEFORE INSERT OR UPDATE OF salario
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_validando_salario_minimo();

---
CREATE OR REPLACE FUNCTION fn_salario_maior_salario_minimo()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.salario < 1510 THEN
        RAISE EXCEPTION 'Erro. Salário não pode ser menor que salário mínomo vigente.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_salario_maior_salario_minimo
    BEFORE INSERT OR UPDATE OF salario
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_salario_maior_salario_minimo();



-- 2. Data de demissão >= admissão
CREATE OR REPLACE FUNCTION fn_validando_data_demissao()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_demissao < old.data_admissao OR new.data_demissao > CURRENT_DATE THEN
        RAISE EXCEPTION 'Erro. data de demissão não pode ser menor que data de admissão ou maior que data atual.';
    ELSE
        new.ativo = FALSE;
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validando_data_demissao
    BEFORE UPDATE OF data_demissao
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_validando_data_demissao();

------------------------------------------------
CREATE OR REPLACE FUNCTION fn_validando_data_demissao()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_demissao < old.data_admissao OR new.data_demissao > CURRENT_DATE THEN
        RAISE EXCEPTION 'Erro. Data de demissão deve ser maior que data de admissão.';
    ELSE
        new.ativo = FALSE;
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validando_data_demissao
    BEFORE UPDATE OR INSERT
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_validando_data_demissao();

-----------------------------------

CREATE OR REPLACE FUNCTION fn_validado_data_demissao()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_demissao < old.data_admissao THEN
        RAISE EXCEPTION 'Erro, data de demissão não pode ser menor que data de admissão.';
    END IF;
    IF new.data_demissao > CURRENT_DATE THEN
        RAISE EXCEPTION 'Erro, data de demissão não pode ser maior que data atual.';
    END IF;

    new.ativo = FALSE;

    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_validando_data_demissao
    BEFORE UPDATE OF data_demissao OR INSERT
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_validando_data_demissao();


-- 3. Log exclusão de cliente

CREATE TABLE administration.log_exclusao_cliente
(
    id_log_cliente INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente     INTEGER      NOT NULL,
    nome_cliente   VARCHAR(100) NOT NULL,
    usuario        VARCHAR(50)  NOT NULL DEFAULT CURRENT_USER,
    data_exclusao  TIMESTAMP    NOT NULL DEFAULT NOW(),
    CONSTRAINT FK_id_cliente_log_exclusao FOREIGN KEY (id_cliente) REFERENCES db_cliente (id_cliente)
);


CREATE OR REPLACE FUNCTION fn_log_exclusao_cliente()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome_cliente TEXT;
BEGIN

    IF old.ativo = TRUE AND new.ativo = FALSE THEN

        SELECT p.nome
        INTO v_nome_cliente
        FROM db_pessoa p
                 INNER JOIN db_cliente f
                            ON f.id_pessoa = p.id_pessoa
        WHERE old.id_cliente = f.id_cliente;

        INSERT INTO administration.log_exclusao_cliente(id_cliente, nome_cliente)
        VALUES (old.id_cliente, v_nome_cliente);
    END IF;
    RETURN new;

END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_log_exclusao_cliente
    AFTER UPDATE OF ativo
    ON db_cliente
    FOR EACH ROW
EXECUTE FUNCTION fn_log_exclusao_cliente();

UPDATE db_cliente
SET ativo = FALSE
WHERE id_cliente = 105;

SELECT *
FROM administration.log_exclusao_cliente;


DROP FUNCTION fn_log_cliente_inativo() CASCADE;
SELECT *
FROM db_cliente
LIMIT 3;

-----------------------------------------------------
CREATE TABLE log_exclusao_cliente
(
    id_exclusao_cliente INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente          INTEGER      NOT NULL,
    nome_cliente        VARCHAR(100) NOT NULL,
    usuario             VARCHAR(30)  NOT NULL DEFAULT CURRENT_USER,
    data_execucao       TIMESTAMP    NOT NULL DEFAULT NOW(),
    CONSTRAINT FK_id_cliente FOREIGN KEY (id_cliente) REFERENCES db_cliente (id_cliente)
);

CREATE OR REPLACE FUNCTION fn_exclusao_cliente()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome_cliente TEXT;
BEGIN

    IF new.ativo = FALSE AND old.ativo = TRUE THEN

        SELECT p.nome
        INTO v_nome_cliente
        FROM db_cliente f
                 INNER JOIN db_pessoa p
                            ON f.id_pessoa = p.id_pessoa
        WHERE f.id_cliente = new.id_cliente;

        INSERT INTO log_exclusao_cliente(id_cliente, nome_cliente)
        VALUES (old.id_cliente, v_nome_cliente);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_exclusao_cliente
    AFTER UPDATE OF ativo
    ON db_cliente
    FOR EACH ROW
EXECUTE FUNCTION fn_exclusao_cliente();


-- 4. Bloquear exclusão de vendas

SELECT *
FROM db_venda
LIMIT 3;

CREATE OR REPLACE FUNCTION fn_bloquear_exclusao_venda()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido excluir dados da venda.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloquear_exclusao_venda
    BEFORE DELETE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_exclusao_venda();

----------------------------------------
CREATE OR REPLACE FUNCTION fn_bloquear_exclusao_venda()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar exclusão da venda. Usar opção inativar.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloquear_exclusao_venda
    BEFORE DELETE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_exclusao_venda();

---
CREATE OR REPLACE FUNCTION fn_bloquear_exclusao_venda()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar exclusão da venda. Utilize a opção inativar.';
    RETURN old;
END ;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloquear_exclusao_venda
    BEFORE DELETE
    ON db_venda
EXECUTE FUNCTION fn_bloquear_exclusao_venda();


-- 5. valor_produto_menor_que_zero

CREATE OR REPLACE FUNCTION fn_valor_produto_menor_zero()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.preco < 0 THEN
        RAISE EXCEPTION 'Erro, valor do produto não pode ser menor que zero.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_valor_produto_menor_zero
    BEFORE INSERT OR UPDATE OF preco
    ON db_produto
    FOR EACH ROW
EXECUTE FUNCTION fn_valor_produto_menor_zero();


SELECT *
FROM db_produto
LIMIT 3;

---
CREATE OR REPLACE FUNCTION fn_bloquear_valor_invalido_produto()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.total < 0 OR new.total > 10000 THEN
        RAISE EXCEPTION 'Erro, valor inválido. Valor total da venda não pode ser menor que zero ou maior que R$10000';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloquear_valor_invalido_produto
    BEFORE INSERT OR UPDATE OF total
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_valor_invalido_produto();


---------------------------------
CREATE OR REPLACE FUNCTION fn_valor_produto_menor_zero()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.preco < 0 OR new.preco > 10000 THEN
        RAISE EXCEPTION 'Erro. Valor do produto não pode ser menor que zero ou maior que R$10000';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_valor_produto_menor_zero
    BEFORE INSERT OR UPDATE OF preco
    ON db_produto
    FOR EACH ROW
EXECUTE FUNCTION fn_valor_produto_menor_zero();

-- 6. valor_venda_menor_que_zero

CREATE OR REPLACE FUNCTION fn_valor_total_venda_menor_zero()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.total < 0 THEN
        RAISE EXCEPTION 'Erro, valor do produto não pode ser menor que zero.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_valor_produto_menor_zero
    BEFORE INSERT OR UPDATE OF total
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_valor_total_venda_menor_zero();

----------------------------------------
CREATE OR REPLACE FUNCTION fn_valor_total_venda_menor_zero()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.total < 0 THEN
        RAISE EXCEPTION 'Erro. valor total da venda não pode ser menor que zero.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_valor_total_venda_menor_zero
    BEFORE INSERT OR UPDATE OF total
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_valor_total_venda_menor_zero();

-- 7. Log de alterações salariais

CREATE TABLE administration.log_alteracao_salarial
(
    id_log_alteracao_salario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    matricula                INTEGER       NOT NULL,
    salario_antigo           NUMERIC(7, 2) NOT NULL,
    novo_salario             NUMERIC(7, 2) NOT NULL,
    usuario                  VARCHAR(30)   NOT NULL DEFAULT CURRENT_USER,
    data_alteracao           TIMESTAMP     NOT NULL DEFAULT NOW(),
    CONSTRAINT FK_log_alteracao_salarioal FOREIGN KEY (matricula) REFERENCES db_funcionario (matricula)
);

CREATE OR REPLACE FUNCTION fn_log_alteracao_salarial()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.salario <> old.salario OR old.salario IS NULL THEN
        IF (tg_op = 'INSERT') THEN
            INSERT INTO administration.log_alteracao_salarial(matricula, salario_antigo, novo_salario)
            VALUES (new.matricula, 0, new.salario);
        END IF;

        IF (tg_op = 'UPDATE') THEN
            INSERT INTO administration.log_alteracao_salarial(matricula, salario_antigo, novo_salario)
            VALUES (old.matricula, old.salario, new.salario);
        END IF;
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_log_alteracao_salarial
    AFTER UPDATE OF salario OR INSERT
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_log_alteracao_salarial();

----------------------------------------
CREATE TABLE administration.log_alteracao_salario
(
    id_log_alteracao_salario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    matricula                INTEGER       NOT NULL,
    antigo_salario           NUMERIC(7, 2) NOT NULL,
    novo_salario             NUMERIC(7, 2) NOT NULL,
    usuario                  VARCHAR(100)  NOT NULL DEFAULT CURRENT_USER,
    data_execucao            TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_log_db_funcionario_log_alt_salario FOREIGN KEY (matricula) REFERENCES db_funcionario (matricula)
);

CREATE OR REPLACE FUNCTION fn_log_alteracao_salarial()
    RETURNS TRIGGER AS
$$
BEGIN

    IF tg_op = 'INSERT' THEN
        INSERT INTO administration.log_alteracao_salario(matricula, antigo_salario, novo_salario)
        VALUES (new.matricula, 0, new.salario);
    END IF;

    IF tg_op = 'UPDATE' THEN
        INSERT INTO administration.log_alteracao_salario(matricula, antigo_salario, novo_salario)
        VALUES (old.matricula, old.salario, new.salario);
    END IF;
    RETURN new;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_log_alteracao_salarial
    AFTER UPDATE OR INSERT
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_log_alteracao_salarial();


----------------------------------------
CREATE TABLE administration.log_alteracao_salario
(
    id_alteracao_salario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    matricula            INTEGER       NOT NULL,
    nome_funcionario     VARCHAR(100)  NOT NULL,
    salario_antigo       NUMERIC(7, 2) NOT NULL,
    novo_salario         NUMERIC(7, 2) NOT NULL,
    usuario              VARCHAR(30)   NOT NULL DEFAULT CURRENT_USER,
    data_alteracao       TIMESTAMP     NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_funcionario_log_alteracao_salario FOREIGN KEY (matricula) REFERENCES db_funcionario (matricula)
);

CREATE OR REPLACE FUNCTION fn_log_alteracao_salario()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome TEXT;
BEGIN
    SELECT nome
    INTO v_nome
    FROM db_funcionario f
             INNER JOIN db_pessoa p
                        ON p.id_pessoa = f.id_pessoa
    WHERE f.matricula = COALESCE(old.matricula, new.matricula);

    IF (tg_op = 'UPDATE') THEN
        INSERT INTO administration.log_alteracao_salario(matricula, nome_funcionario, salario_antigo, novo_salario)
        VALUES (old.matricula, v_nome, old.salario, new.salario);
    END IF;

    IF (tg_op = 'INSERT') THEN
        INSERT INTO administration.log_alteracao_salario(matricula, nome_funcionario, salario_antigo, novo_salario)
        VALUES (old.matricula, v_nome, 0, new.salario);
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_log_alteracao_salario
    AFTER UPDATE OF salario OR INSERT
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_log_alteracao_salarial();


SELECT *
FROM db_funcionario
ORDER BY matricula DESC;

SELECT *
FROM administration.log_alteracao_salarial;

UPDATE db_funcionario
SET salario = 1999.99
WHERE matricula = 1035;

DROP TRIGGER tgr_log_demissao ON db_funcionario;

INSERT INTO DB_FUNCIONARIO
(id_pessoa, data_admissao, data_demissao, salario, id_cargo, id_departamento, id_nivel_funcionario)
VALUES (44, '2020-01-15', NULL, 2500.00, 1, 1, 3);

--------------
CREATE ROLE usuario_test WITH LOGIN PASSWORD '123123';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '123123';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA administration FROM usuario_test;
ALTER ROLE usuario_test NOINHERIT NOCREATEDB NOSUPERUSER;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;

-- 10. Bloquear alteração de documento fiscal em vendas

CREATE OR REPLACE FUNCTION fn_bloquear_alteracao_db_venda()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido efetuar alteração na tabela venda.';
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION fn_bloquear_alteracao_db_venda();

CREATE OR REPLACE TRIGGER tgr_bloquear_alteracao_db_venda
    BEFORE UPDATE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_alteracao_db_venda();


CREATE OR REPLACE FUNCTION fn_bloquear_alteracao_db_venda()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar alteração em notas fiscais. Efetuar cancelamento.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloquear_alteraca_db_venda
    BEFORE UPDATE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_alteracao_db_venda();

-- 10. Bloquear exclusão dados de qualquer tabela.

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
                        'CREATE OR REPLACE TRIGGER tgr_proibido_alteracao_exclusao_tabela_%I
                         BEFORE DELETE OR UPDATE
                         ON %I
                         FOR EACH ROW
                         EXECUTE FUNCTION fn_proibido_alteracao_exclusao_tabelas();'
                    , tabela.tablename, tabela.tablename);
            END LOOP;
    END;
$$;

CREATE OR REPLACE FUNCTION fn_proibido_alteracao_exclusao_tabelas()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido excluir dados da tabela.';
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_proibido_alteracao_exclusao_tabelas
    BEFORE DELETE OR UPDATE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_proibido_alteracao_exclusao_tabelas();

---------------------------------------------------------------
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
                EXECUTE FORMAT('CREATE OR REPLACE TRIGGER tgr_proibido_exclusao_tabelas
                            BEFORE DELETE
                            ON db_venda
                            FOR EACH ROW
                            EXECUTE FUNCTION fn_proibido_exclusao_tabelas();'
                    , tabela.tablename, tabela.tablename);
            END LOOP;
    END;

$$;

CREATE OR REPLACE FUNCTION fn_proibido_exclusao_tabelas()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar exclusão de dados na tabela.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_proibido_exclusao_tabelas
    BEFORE DELETE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_proibido_exclusao_tabelas();


-- teste refazendo bloquear alteração e exclusão de dados das tabelas.
DO
$$
    DECLARE
        tabela RECORD;
    BEGIN
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'public';
        LOOP
            EXECUTE FORMAT(
                    '
                    CREATE OR REPLACE TRIGGER tgr_proibido_alteracao_exclusao_dados_tabela_%I
                    BEFORE UPDATE OR DELETE
                    ON %I
                    FOR EACH ROW
                    EXECUTE FUNCTION fn_proibido_alteracao_exclusao_tabelas();'
                , tabela.tablename, tabela.tablename);
        END LOOP;
    END;
$$;


CREATE OR REPLACE TRIGGER tgr_proibido_alteracao_exclusao_dados_tabela
    BEFORE UPDATE OR DELETE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_proibido_alteracao_exclusao_tabelas();


--EVENT TRIGGERS

-- 1. Bloquear ALTER TABLE
CREATE OR REPLACE FUNCTION fn_bloquear_alteracao_tabelas()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido efetuar alteração nas tabelas. Converse com o administrador do sistema.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_alteracao_tabelas
    ON DDL_COMMAND_START
    WHEN TAG IN ('ALTER TABLE')
EXECUTE FUNCTION fn_bloquear_alteracao_tabelas();

ALTER TABLE db_venda
    ADD COLUMN atividade BOOLEAN;

-----------
CREATE OR REPLACE FUNCTION fn_bloquear_alteracao_tabelas()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido efetuar alteração nas tabelas.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_alteracao_tabelas
    ON DDL_COMMAND_START
    WHEN TAG IN ('ALTER TABLE')
EXECUTE FUNCTION fn_bloquear_alteracao_tabelas();


-- 2. Bloquear DROP TABLE

CREATE OR REPLACE FUNCTION fn_bloquear_drop_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido efetuar exclusão de tabelas do banco de dados.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_drop_table
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();


-----------------------
CREATE OR REPLACE FUNCTION fn_bloquear_drop_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Erro. Proibido excluir tabela.';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_drop_table
    ON SQL_DROP
    WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fn_bloquear_drop_table();


-- 3. Bloquear CREATE table fora do horario

CREATE OR REPLACE FUNCTION fn_bloquear_create_table_fora_horario()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    IF EXTRACT(HOUR FROM NOW()) NOT BETWEEN 0 AND 19 THEN
        RAISE EXCEPTION 'Proibido create table fora do horário de funcionamento da empresa(8-18). Consulte o DBA.';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER trg_bloquear_create_table_fora_horario
    ON DDL_COMMAND_START
    WHEN TAG IN ('CREATE TABLE')
EXECUTE FUNCTION fn_bloquear_create_table_fora_horario();

CREATE TABLE teste100
(
    id INTEGER NOT NULL
);

---------------------

CREATE OR REPLACE FUNCTION fn_bloquear_create_table_fora_horario_comercial()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    IF EXTRACT(HOUR FROM NOW()) NOT BETWEEN 8 AND 19 THEN
        RAISE EXCEPTION ('Erro. Criação de tabela proibido fora do horário comercial(8-19)');
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_bloquear_create_table_fora_horario_comercial
    ON DDL_COMMAND_START
    WHEN TAG IN ('CREATE TABLE')
EXECUTE FUNCTION fn_bloquear_create_table_fora_horario();


-- 3. log alter, drop and CREATE table.

CREATE TABLE administration.log_alter_create_drop_table
(
    id_altecao    INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tabela        VARCHAR(100) NOT NULL,
    comando       VARCHAR(50)  NOT NULL,
    usuario       VARCHAR(50)  NOT NULL DEFAULT CURRENT_USER,
    data_execucao TIMESTAMP    NOT NULL DEFAULT NOW()
);


CREATE OR REPLACE FUNCTION fn_log_alter_create_drop_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO administration.log_alter_create_drop_table(tabela, comando)
    SELECT objid::REGCLASS::TEXT,
           command_tag
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('CREATE TABLE', 'DROP TABLE', 'ALTER TABLE');
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_log_alter_create_drop_table
    ON DDL_COMMAND_END
    WHEN TAG IN ('CREATE TABLE','DROP TABLE','ALTER TABLE')
EXECUTE FUNCTION fn_log_alter_create_drop_table();


------

CREATE TABLE administration.log_alter_create_drop_table
(
    id_log_alteracao_tabela INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_tabela             VARCHAR(50) NOT NULL,
    comando                 VARCHAR(50) NOT NULL,
    usuario                 VARCHAR(30) NOT NULL DEFAULT CURRENT_USER,
    data_execucacao         TIMESTAMP   NOT NULL DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION fn_log_alter_create_drop_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO administration.log_alter_create_drop_table(tabela, comando)
    SELECT objid::REGCLASS::TEXT,
           command_tag
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('CREATE TABLE', 'DROP TABLE', 'ALTER TABLE');
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_log_alter_create_drop_table
    ON DDL_COMMAND_END
    WHEN TAG IN ('CREATE TABLE', 'DROP TABLE','ALTER TABLE')
EXECUTE FUNCTION fn_log_alter_create_drop_table();


----

CREATE OR REPLACE FUNCTION fn_log_alteracao_drop_table()
    RETURNS EVENT_TRIGGER AS
$$
BEGIN
    INSERT INTO administration.log_alter_create_drop_table
    SELECT objid::REGCLASS::TEXT,
           command_tag
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('DROP TABLE', 'ALTER TABLE', 'CREATE TABLE');
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER tgr_log_alteracao_drop_tabela
    ON DDL_COMMAND_END
    WHEN TAG IN ('DROP TABLE','ALTER TABLE','CREATE TABLE')
EXECUTE FUNCTION fn_log_alter_create_drop_table();

-- criação usuario e comandos de segurança.

CREATE ROLE usuario_test WITH LOGIN PASSWORD '1223123';
CREATE ROLE usuario_test WITH LOGIN SUPERUSER PASSWORD '123123';
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM usuario_test;
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usuario_test;
ALTER ROLE usuario_test NOINHERIT NOCREATEDB NOSUPERUSER NOCREATEROLE;
GRANT CONNECT ON DATABASE postgres TO usuario_test;
GRANT USAGE ON SCHEMA public TO usuario_test;
GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO usuario_test;





