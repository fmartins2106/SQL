select * from db_pessoa limit 3;

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
CREATE TRIGGER trg_set_updated_at
    BEFORE UPDATE
    ON db_pessoa
    FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

ALTER TABLE db_pessoa ADD COLUMN ultima_atualizacao TIMESTAMP;



CREATE OR REPLACE FUNCTION set_update_at()
    RETURNS TRIGGER AS
$$
BEGIN
    new.update_at := NOW();
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_set_updated_at
    BEFORE UPDATE
    ON db_pessoa
    FOR EACH ROW
EXECUTE FUNCTION set_update_at();