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

SELECT *
FROM db_venda
WHERE id_venda = 21;

UPDATE db_venda
SET data_venda = '2025-08-26'
WHERE id_venda = 21;

-------------------------------------------
CREATE OR REPLACE FUNCTION fn_atualizar()
    RETURNS TRIGGER AS
$$
BEGIN
    new.data_atualizacao = NOW();
    RETURN new;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_ultima_modificacao_db_diretoria
    BEFORE UPDATE
    ON db_diretoria
    FOR EACH ROW
EXECUTE FUNCTION set_atualizacao();

UPDATE db_diretoria
SET diretoria = 'Diretoria de logistica'
WHERE id_diretoria = 5;

ALTER TABLE db_diretoria
    ADD COLUMN ultima_atualizacao TIMESTAMP;

SELECT *
FROM db_diretoria
WHERE id_diretoria = 5;

SELECT table_schema,
       table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema');

SELECT *
FROM db_produto_venda;

SELECT *
FROM db_tipo_telefone;

CREATE OR REPLACE FUNCTION fn_tipo_telefone_nao_alterar()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.tipo_telefone IS DISTINCT FROM old.tipo_telefone THEN
        RAISE EXCEPTION 'Campo tipo telefone não pode ser alterado.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_alteracao_tipo_telefone_db_tipo_telefone
    BEFORE UPDATE
    ON db_tipo_telefone
    FOR EACH ROW
EXECUTE FUNCTION fn_tipo_telefone_nao_alterar();


SELECT *
FROM db_tipo_telefone
WHERE id_tipo_telefone = 1;

UPDATE db_tipo_telefone
SET tipo_telefone = 'Telefone ceular'
WHERE id_tipo_telefone = 1;

--------------------------------------------------
SELECT *
FROM db_produto
LIMIT 10;

CREATE OR REPLACE FUNCTION fn_validacao_valor_produto()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.preco < 50 OR new.preco > 10000 THEN
        RAISE EXCEPTION 'Preço dos produtos não pode ser menor que R$50 ou maior que R$100';
    END IF;
    RETURN new;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_preco_produto_invalido_db_produto
    BEFORE INSERT OR UPDATE
    ON db_produto
    FOR EACH ROW
EXECUTE FUNCTION fn_validacao_valor_produto();

SELECT *
FROM db_produto
WHERE id_produto = 1001;

UPDATE db_produto
SET preco = 40
WHERE id_produto = 1001;


SELECT *
FROM db_venda
ORDER BY total;

CREATE OR REPLACE FUNCTION fn_valor_minimo_faturamento()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.total < 100 THEN
        RAISE EXCEPTION 'Valor mínimo para faturamento não pode ser menor que R$100,00';
    END IF;
    RETURN new;
END;

$$ LANGUAGE plpgsql;

SELECT *
FROM db_venda
WHERE id_venda = 195;
DELETE
FROM db_venda
WHERE id_venda = 195;

CREATE OR REPLACE TRIGGER trg_valor_minimo_faturamento_db_venda
    BEFORE INSERT
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_valor_minimo_faturamento();

INSERT INTO db_venda(documento, id_cliente, data_venda, total)
VALUES ('VENDA3021', 102, '2025-08-09', 50);

CREATE TRIGGER trg_valida_preco
    BEFORE INSERT OR UPDATE
    ON db_produto
    FOR EACH ROW
EXECUTE FUNCTION valida_preco_produto();

SELECT *
FROM db_venda
LIMIT 3;

SELECT *
FROM db_pessoa
LIMIT 3;

ALTER TABLE db_pessoa
    ADD COLUMN ativo BOOLEAN;

UPDATE db_pessoa
SET ativo = TRUE
WHERE ativo IS NULL;

CREATE OR REPLACE FUNCTION fn_proibido_excluir_cadastro_pessoa()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido exclusão do cadastro, somente pode ser marcado como inativo. Entrar em contato com DBA';
    RETURN old;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_proibido_excluir_cadastro_pessoa
    BEFORE DELETE
    ON db_pessoa
    FOR EACH ROW
EXECUTE FUNCTION fn_proibido_excluir_cadastro_pessoa();

DELETE
FROM db_pessoa
WHERE id_pessoa = 2;


SELECT *
FROM db_venda
LIMIT 10;

ALTER TABLE db_venda
    ADD COLUMN ativo BOOLEAN;
UPDATE db_venda
SET ativo = TRUE
WHERE ativo IS NULL;

DELETE
FROM db_venda
WHERE id_venda = 127;

SELECT *
FROM db_funcionario;


CREATE OR REPLACE FUNCTION fn_proibido_excluir_venda()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido excluir venda do sistema. Utilize opção inativar venda. Entre em contat com DBA.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER thr_proibido_excluir_venda
    BEFORE DELETE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_proibido_excluir_venda();

ALTER TABLE db_funcionario
    ADD COLUMN ativo BOOLEAN;
SELECT *
FROM db_funcionario
LIMIT 50;

UPDATE db_funcionario
SET ativo = FALSE
WHERE data_demissao IS NOT NULL;

CREATE OR REPLACE FUNCTION fn_demissao()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_demissao IS NOT NULL THEN
        new.ativo = FALSE;
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_demissao
    BEFORE UPDATE
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_demissao();

UPDATE db_funcionario
SET data_demissao = '2025-08-10'
WHERE matricula = 1015;
SELECT *
FROM db_funcionario
WHERE matricula = 1015;

CREATE OR REPLACE FUNCTION fn_proibido_exclusao_funcionario()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido excluir cadastro de funcionário. Utilizar campo Ativo e escolha opção inativo.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_proibido_excluir_cadadastro_funcionario
    BEFORE DELETE
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_proibido_exclusao_funcionario();

DELETE
FROM db_funcionario
WHERE matricula = 1015;

CREATE OR REPLACE FUNCTION fn_validacao_inativar()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.ativo = FALSE AND new.data_demissao IS NULL THEN
        RAISE EXCEPTION 'Cadastro de funcionário só pode ser inativo apos preenchimento da ta de demissão.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_validacao_inativar
    BEFORE UPDATE
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_validacao_inativar();

UPDATE db_funcionario
SET data_demissao = '2025-09-10'
WHERE matricula = 1018;
SELECT *
FROM db_funcionario
WHERE matricula = 1018;
UPDATE db_funcionario
SET ativo = FALSE
WHERE matricula = 1018;


CREATE OR REPLACE FUNCTION fn_proibido_excluir_cadastro_funcionario()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido excluir dados funcionario';
    RETURN old;
END;

$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER trg_proibido_excluir_cadastro_funcionario
    BEFORE DELETE
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_proibido_exclusao_funcionario();

SELECT *
FROM db_funcionario
LIMIT 3;

SELECT table_schema,
       table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema');

CREATE OR REPLACE FUNCTION fn_bloquear_produto()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido exclusão de produtos. use campo ativo e marque como desativado.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_bloquear_exclusao_produto
    BEFORE DELETE
    ON db_produto
    FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_produto();

DELETE
FROM db_produto
WHERE id_produto = 1003;

ALTER TABLE db_produto
    ADD COLUMN ativo BOOLEAN;

UPDATE db_produto
SET ativo = TRUE
WHERE ativo IS NULL;


SELECT *
FROM db_produto
LIMIT 3;

SELECT *
FROM db_venda
LIMIT 3;


CREATE OR REPLACE FUNCTION fn_alteracao_id_cliente()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.id_cliente != old.id_cliente THEN
        RAISE EXCEPTION 'Erro, nome do cliente não pode ser alterado.';
    END IF;
    RETURN old;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_alteracao_id_cliente
    BEFORE UPDATE
    ON db_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_alteracao_id_cliente();


UPDATE db_venda
SET id_cliente = 128
WHERE id_venda = 127;

SELECT *
FROM db_pessoa
LIMIT 3;

CREATE OR REPLACE FUNCTION fn_alterar_cpf()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.cpf != old.cpf THEN
        RAISE EXCEPTION 'Erro, campo CPF não pode ser alterado. Consulte DBA.';
    END IF;
    RETURN old;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_proibido_alteracao_cpf
    BEFORE UPDATE
    ON db_pessoa
    FOR EACH ROW
EXECUTE FUNCTION fn_alterar_cpf();

UPDATE db_pessoa
SET cpf = '11111112343'
WHERE id_pessoa = 3;

SELECT *
FROM db_funcionario
LIMIT 3;

CREATE OR REPLACE FUNCTION fn_salario_minimo()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.salario < 1510 THEN
        RAISE EXCEPTION 'Salário não pode ser menor que salário mínimo.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_salario_minimo
    BEFORE INSERT OR UPDATE
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_salario_minimo();

SELECT *
FROM db_funcionario
ORDER BY matricula DESC;
UPDATE db_funcionario
SET salario = 1000
WHERE matricula = 1020;

INSERT INTO db_funcionario(id_pessoa, data_admissao, data_demissao, salario, id_cargo, id_departamento,
                           id_nivel_funcionario, ativo)
VALUES (4, '2022-05-05', NULL, 94.85, 4, 5, 4, TRUE);


CREATE OR REPLACE FUNCTION fn_padrao_cep()
    RETURNS TRIGGER AS
$$
BEGIN
    new.cep = REGEXP_REPLACE(new.cep, '\D', '', 'g');
    new.endereco = INITCAP(LOWER(new.endereco));
    RETURN new;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_padrao_cpf_endereco
    BEFORE INSERT OR UPDATE
    ON db_endereco
    FOR EACH ROW
EXECUTE FUNCTION fn_padrao_cep();

SELECT *
FROM db_endereco
LIMIT 3;

CREATE OR REPLACE FUNCTION fn_atualizar_total_venda()
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


CREATE OR REPLACE TRIGGER tgr_atualizar_total_venda
    AFTER INSERT OR UPDATE OR DELETE
    ON db_produto_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_atualizar_total_venda();

CREATE OR REPLACE FUNCTION fn_set_preco_unitario()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.preco_unitario IS NULL THEN
        SELECT preco
        INTO new.preco_unitario
        FROM db_produto
        WHERE id_produto = new.id_produto;
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_set_produto_unitario
    BEFORE INSERT
    ON db_produto_venda
    FOR EACH ROW
EXECUTE FUNCTION fn_set_preco_unitario();


SELECT *
FROM db_produto_venda
LIMIT 23;

CREATE TABLE db_log_salario
(
    id_log_salario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_funcionario INTEGER        NOT NULL,
    salario_antigo NUMERIC(12, 2) NOT NULL,
    novo_salario   NUMERIC(12, 2) NOT NULL,
    data_alteracao TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION fn_log_salario()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.salario <> old.salario THEN
        INSERT INTO db_log_salario(id_funcionario, salario_antigo, novo_salario)
        VALUES (old.matricula, old.salario, new.salario);
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_log_salario
    AFTER UPDATE
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_log_salario();

SELECT *
FROM db_log_salario;

SELECT *
FROM db_funcionario
LIMIT 2;

UPDATE db_funcionario
SET salario = 2000
WHERE matricula = 1003;

CREATE TABLE db_log_preco_alterado
(
    id_alteracao_preco INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_produto         INTEGER        NOT NULL,
    nome_produto       VARCHAR(100)   NOT NULL CHECK (TRIM(nome_produto) <> '' ),
    preco_antigo       NUMERIC(12, 2) NOT NULL,
    novo_preco         NUMERIC(12, 2) NOT NULL,
    data_alteracao     TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION fn_log_preco_alterado()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.preco <> old.preco THEN
        INSERT INTO db_log_preco_alterado(id_produto, nome_produto, preco_antigo, novo_preco)
        VALUES (old.id_produto, old.nome_produto, old.preco, new.preco);
    END IF;
    RETURN new;
END;

$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_log_preco_alterado()
    RETURNS TRIGGER AS
$$
BEGIN
    IF old.preco <> new.preco THEN
        INSERT INTO db_log_preco_alterado(id_produto, nome_produto, preco_antigo, novo_preco)
        VALUES (old.id_produto, old.nome_produto, old.preco, new.preco);
    END IF;
    RETURN new;
END;

$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_log_preco_alterado
    AFTER UPDATE
    ON db_produto
    FOR EACH ROW
EXECUTE FUNCTION fn_log_preco_alterado();

SELECT *
FROM db_log_preco_alterado;

UPDATE db_produto
SET preco = 950.54
WHERE id_produto = 1003;

SELECT *
FROM db_produto
WHERE id_produto = 1003;

CREATE OR REPLACE FUNCTION fn_exclusao_tabelas_log()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE EXCEPTION 'Proibido exclusão ou alteração desta tabela.';
    RETURN old;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_bloquear_exclusao_tabela_log_preco_alterado
    BEFORE DELETE OR UPDATE
    ON db_log_preco_alterado
    FOR EACH ROW
EXECUTE FUNCTION fn_exclusao_tabelas_log();

CREATE OR REPLACE TRIGGER tgr_bloquear_exclusao_tabela_log_alterar_salario
    BEFORE DELETE OR UPDATE
    ON db_log_salario
    FOR EACH ROW
EXECUTE FUNCTION fn_exclusao_tabelas_log();

DELETE
FROM db_log_salario
WHERE id_log_salario = 2;

UPDATE db_log_salario
SET novo_salario = 1600
WHERE id_log_salario = 2;

UPDATE db_funcionario
SET salario = 2000
WHERE matricula = 1003;

SELECT *
FROM db_cliente
LIMIT 2;

ALTER TABLE db_cliente
    ADD COLUMN ativo BOOLEAN;

UPDATE db_cliente
SET ativo = TRUE
WHERE ativo IS NULL;

CREATE TABLE log_cliente_cancelado
(
    id_log_cliente_cancelado INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente               INTEGER      NOT NULL,
    nome_cliente             VARCHAR(100) NOT NULL CHECK ( TRIM(nome_cliente) <> '' ),
    data_criacao             TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE log_cliente_cancelado
    RENAME TO db_log_cliente_cancelado;

DROP TABLE log_cliente_cancelado;

CREATE OR REPLACE FUNCTION fn_cliente_inativo()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome_cliente TEXT;
BEGIN
    SELECT p.nome
    INTO v_nome_cliente
    FROM db_pessoa p
    WHERE id_pessoa = old.id_pessoa;
    IF old.ativo = TRUE AND new.ativo = FALSE THEN
        INSERT INTO log_cliente_cancelado(id_cliente, nome_cliente)
        VALUES (old.id_cliente, v_nome_cliente);
    END IF;
    RETURN new;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_teste()
    RETURNS TRIGGER AS
$$
DECLARE
    v_nome_cliente TEXT;
BEGIN
    SELECT p.nome
    INTO v_nome_cliente
    FROM db_pessoa p
    WHERE id_pessoa = old.id_pessoa;
    IF old.ativo = TRUE AND new.ativo = FALSE THEN
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
FROM db_cliente
LIMIT 23;

UPDATE db_cliente
SET ativo = FALSE
WHERE id_cliente = 102;

SELECT *
FROM db_cliente
WHERE id_cliente = 102;

SELECT *
FROM log_cliente_cancelado;

CREATE OR REPLACE TRIGGER fn_proibir_exclusao
    BEFORE UPDATE OR DELETE
    ON log_cliente_cancelado
    FOR EACH ROW
EXECUTE FUNCTION fn_exclusao_tabelas_log();

DELETE
FROM log_cliente_cancelado
WHERE id_log_cliente_cancelado = 1;



SELECT table_schema,
       table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema');


SELECT *
FROM db_produto
LIMIT 3;

CREATE OR REPLACE FUNCTION fn_log_atualizar_preco()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.preco <> old.preco THEN
        INSERT INTO db_log_preco_alterado(id_produto, nome_produto, preco_antigo, novo_preco)
        VALUES (old.id_produto, old.nome_produto, old.preco, new.preco);
    END IF;
    RETURN new;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr__log_atualizar_preco
    AFTER UPDATE
    ON db_produto
    FOR EACH ROW
EXECUTE FUNCTION fn_log_atualizar_preco();

SELECT *
FROM public.db_cliente
LIMIT 3;


CREATE OR REPLACE FUNCTION fn_log_cliente_inativo()
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

CREATE OR REPLACE TRIGGER tgr_log_cliente_inativo
    AFTER UPDATE
    ON db_cliente
    FOR EACH ROW
EXECUTE FUNCTION fn_log_cliente_inativo();

SELECT *
FROM db_log_cliente_cancelado;

SELECT *
FROM db_cliente
LIMIT 2;


SELECT *
FROM db_funcionario
LIMIT 3;

CREATE OR REPLACE FUNCTION fn_data_futura_admissao()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.data_admissao > CURRENT_TIMESTAMP THEN
        RAISE EXCEPTION 'Proibido cadastrar data de admissão maior que data atual.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tgr_data_futura_admissao
    BEFORE INSERT
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_data_futura_admissao();

INSERT INTO db_funcionario(id_pessoa, data_admissao, data_demissao, salario, id_cargo, id_departamento,
                           id_nivel_funcionario)
VALUES (102, '2025-08-13', NULL, 5000, 1, 1, 6);

SELECT *
FROM db_funcionario
ORDER BY matricula DESC;


INSERT INTO DB_PESSOA (nome, cpf, sexo, email)
VALUES ('Marta da Silva Rocha', '90100222101', 'F', 'marta.sr@gmail.com');

SELECT *
FROM db_pessoa
WHERE id_pessoa = 101;

DELETE
FROM db_pessoa
WHERE id_pessoa = 100;

UPDATE db_pessoa
SET ativo = FALSE
WHERE id_pessoa = 100;

ALTER TABLE db_pessoa
    ALTER COLUMN ativo SET DEFAULT TRUE;

ALTER TABLE db_funcionario
    ALTER COLUMN ativo SET DEFAULT TRUE;

UPDATE db_funcionario
SET ativo = TRUE
WHERE matricula = 1024;


CREATE OR REPLACE FUNCTION fn_demissao_salario()
    RETURNS TRIGGER AS
$$
BEGIN
    IF old.ativo = FALSE AND old.data_demissao IS NOT NULL THEN
        RAISE EXCEPTION 'Proibido fazer alteração em funcionário com cadastro inativo.';
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tgr_proibido_alterar_cadastro_funcionario_inativo
    BEFORE UPDATE
    ON db_funcionario
    FOR EACH ROW
EXECUTE FUNCTION fn_demissao_salario();


SELECT *
FROM db_funcionario
WHERE ativo = FALSE;


UPDATE db_funcionario
SET salario = 2000
WHERE matricula = 1000;

UPDATE db_funcionario
SET data_demissao = '2025-08-13'
WHERE matricula = 1008;

SELECT *
FROM db_funcionario
WHERE matricula = 1008;

SELECT table_schema,
       table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema');

DROP FUNCTION fn_bloquear_truncate();
DROP EVENT TRIGGER trg_bloquear_drop;


CREATE ROLE fmartins_adm WITH LOGIN SUPERUSER PASSWORD 'masterkey';



SELECT "current_user"();

SET ROLE fmartins;

drop table db_pessoa;

DROP TABLE db_pessoa;
CREATE ROLE fmartins_adm WITH LOGIN SUPERUSER PASSWORD 'masterkey';
ALTER TABLE db_pessoa
    OWNER TO fmartins_adm;


ALTER TABLE db_pessoa
    OWNER TO admin_role;
ALTER TABLE db_funcionario
    OWNER TO admin_role;
ALTER TABLE db_cliente
    OWNER TO admin_role;


SELECT rolname, rolsuper
FROM pg_roles;

SELECT tablename, tableowner
FROM pg_tables
WHERE tablename IN ('db_test');

create table db_test(
    id SERIAL PRIMARY KEY ,
    nome varchar(100),
    sobrenome varchar(100)
);
SELECT * from db_test;

set role fmartins;

SELECT "current_user"();

DROP TABLE db_test;

ALTER TABLE db_test OWNER TO fmartins_adm;