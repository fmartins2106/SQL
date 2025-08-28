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

------
CREATE OR REPLACE FUNCTION fn_salario_maior_salario_minimo()
    RETURNS TRIGGER AS
$$
BEGIN
    IF new.salario <= 1510 THEN
        RAISE EXCEPTION 'Salário não pode ser menor que salário mínimo.';
        RETURN old;
    END IF;
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




