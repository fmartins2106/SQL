SELECT *
FROM db_pessoa
LIMIT 3;

-- Função
CREATE OR REPLACE FUNCTION set_updated_at()
    RETURNS TRIGGER AS
$$
BEGIN
    NEW.updated_at := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER trg_utima_atualizacao
    BEFORE UPDATE
    ON db_pessoa
    FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

ALTER TABLE db_pessoa
    ADD COLUMN ultima_atualizacao TIMESTAMP;


-----------------------------------------------------
CREATE OR REPLACE FUNCTION set_atualizacao()
    RETURNS TRIGGER AS
$$
BEGIN
    new.ultima_atualizacao := NOW();
    RETURN new;
END;
$$ LANGUAGE plpgsql;
--
CREATE TRIGGER trg_gerar_ultima_atualizacao
    BEFORE UPDATE
    ON db_pessoa
    FOR EACH ROW
EXECUTE FUNCTION set_atualizacao();

SELECT *
FROM db_pessoa
WHERE id_pessoa = 1;

UPDATE db_pessoa
SET nome = 'Fernando Martins da Silva'
WHERE id_pessoa = 1;

----------------------------------------------------------

CREATE OR REPLACE FUNCTION set_atualizacao()
    RETURNS TRIGGER AS
$$
BEGIN
    new.ultima_atualizacao := NOW();
    RETURN new;

END;
$$ LANGUAGE plpgsql;
--
ALTER TABLE db_funcionario
    ADD COLUMN ultima_atualizacao TIMESTAMP;

CREATE TRIGGER trg_gerar_ultima_atualizacao_funcionario
    BEFORE UPDATE
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION set_atualizacao();
--------------------------------------------------------------
CREATE OR REPLACE FUNCTION set_atualizacao()
    RETURNS TRIGGER AS
$$
BEGIN
    new.ultima_atualizacao := NOW();
    RETURN new;
END;
$$ LANGUAGE plpgsql;
--
ALTER TABLE db_cargo
    ADD COLUMN ultima_atualizacao TIMESTAMP;

CREATE OR REPLACE TRIGGER trg_gerar_ultima_atualizacao_cargo
    BEFORE UPDATE
    ON db_cargo
    FOR EACH ROW
EXECUTE FUNCTION set_atualizacao();


---------------------------------------------------

CREATE OR REPLACE FUNCTION set_atualizacao()
    RETURNS TRIGGER AS
$$
BEGIN
    NEW.ultima_atualizacao := NOW();
    RETURN new;
END;
$$ LANGUAGE plpgsql;

--
ALTER TABLE db_cliente
    ADD COLUMN ultima_atualizacao TIMESTAMP;

CREATE OR REPLACE TRIGGER tgr_ultima_atualizacao_cliente
    BEFORE UPDATE
    ON db_pessoa
    FOR EACH ROW
EXECUTE FUNCTION set_atualizacao();
----------------------------------------------------
CREATE OR REPLACE FUNCTION tgr_atualizar()
    RETURNS TRIGGER AS
$$
BEGIN
    new.ultima_atualizacao := NOW();
    RETURN new;
END;
$$;

CREATE OR REPLACE TRIGGER trg_ultima_atualizacao_telefone
    BEFORE UPDATE
    ON db_telefone
    FOR EACH ROW
EXECUTE FUNCTION set_atualizacao();

SELECT table_schema,
       table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema')
ORDER BY table_schema, table_name;
---------------------------------------------------------------

SELECT *
FROM db_departamento
LIMIT 3;

CREATE OR REPLACE FUNCTION fn_ultima_atualizacao()
    RETURNS TRIGGER AS
$$
BEGIN
    new.ultima_atualizacao := NOW();
    RETURN NOW();
END;

$$;
--
CREATE OR REPLACE TRIGGER tgr_ultima_atualizacao_departamento
    BEFORE UPDATE
    ON db_departamento
    FOR EACH ROW
EXECUTE FUNCTION set_atualizacao();

SELECT *
FROM db_departamento
WHERE id_departamento = 3;
UPDATE db_departamento
SET departamento = 'Recrutamento e Seleção'
WHERE id_departamento = 3;
ALTER TABLE db_departamento
    ADD COLUMN ultima_atualizacao TIMESTAMP;

------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_data_atualizada()
    RETURNS TRIGGER AS
$$
BEGIN
    new.ultima_atualizacao := NOW();
    RETURN NOW();
END;
$$ LANGUAGE plpgsql;

--
CREATE OR REPLACE TRIGGER trg_ultima_atualizacao_endereco
    BEFORE UPDATE
    ON db_endereco
    FOR EACH ROW
EXECUTE FUNCTION set_atualizacao();

SELECT *
FROM db_endereco
ORDER BY id_endereco;

UPDATE db_endereco
SET endereco = 'Paulistana'
WHERE id_endereco = 51;

ALTER TABLE db_endereco
    ADD COLUMN ultima_atualizacao TIMESTAMP;


UPDATE db_telefone
SET telefone = '10101010'
WHERE id_telefone = 1;

SELECT *
FROM db_telefone
WHERE id_telefone = 1;

ALTER TABLE db_telefone
    ADD COLUMN ultima_atualizacao TIMESTAMP;

----------------------------------------------
CREATE OR REPLACE FUNCTION fn_atualizar_data()
    RETURNS TRIGGER AS
$$
BEGIN
    new.ultima_atualizacao := NOW();
    RETURN NOW();
END;

$$ LANGUAGE plpgsql;
--
CREATE OR REPLACE TRIGGER tgr_ultima_atualizacao_departamento
    BEFORE UPDATE
    ON db_departamento
    FOR EACH ROW
EXECUTE FUNCTION tgr_atualizar();

---------------------------------------

SELECT *
FROM db_cliente
LIMIT 3;


CREATE OR REPLACE FUNCTION fn_impedir_alteracao_data_criacao()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_criacao IS DISTINCT FROM old.data_criacao THEN
        RAISE EXCEPTION 'Data da criação não pode ser alterada';
    END IF;
    RETURN new;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_impedir_alt_data_criacao_db_cliente
    BEFORE UPDATE
    ON db_cliente
    FOR EACH ROW
EXECUTE FUNCTION fn_impedir_alteracao_data_criacao();


SELECT *
FROM db_cliente
WHERE id_cliente = 101;

UPDATE db_cliente
SET data_criacao = '2025-08-08'
WHERE id_cliente = 101;

SELECT *
FROM db_funcionario
LIMIT 3;

CREATE OR REPLACE FUNCTION fn_impedir_alteracao_data_admissao()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_admissao IS DISTINCT FROM old.data_admissao THEN
        RAISE EXCEPTION 'Alteração de data_admissoa não é permitida';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_impedir_alt_data_admissao
    BEFORE UPDATE
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_impedir_alteracao_data_admissao();

UPDATE db_funcionario
SET data_admissao = '2025-04-10'
WHERE matricula = 1008;

SELECT *
FROM db_funcionario
WHERE matricula = 1008;
--2025-08-09 04:13:11.193013


SELECT *
FROM db_venda
LIMIT 4;

CREATE OR REPLACE FUNCTION fn_impedir_alteracao_data_venda()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_venda IS DISTINCT FROM old.data_venda THEN
        RAISE EXCEPTION 'Alteração da data_venda não é permitida.';
    END IF;
    RETURN new;
END;

$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_impedir_alteracao_data_venda
    BEFORE UPDATE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_impedir_alteracao_data_venda();

select * from db_venda where id_venda = 21;

UPDATE db_venda SET data_venda = '2025-08-26' where id_venda = 21;






