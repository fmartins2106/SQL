SELECT "current_user"(); --Verificar qual usuario esta logado no banco de dados;

SET ROLE fmartins; -- definir usuario;

CREATE ROLE fmartins_adm WITH LOGIN SUPERUSER PASSWORD 'masterkey'; --criar usuario como adm do banco;

CREATE ROLE usuario_test WITH LOGIN PASSWORD '123';


drop TABLE db_test;
SELECT * from db_test;
create table db_test(
    id SERIAL PRIMARY KEY ,
    nome varchar(100),
    sobrenome varchar(100)
);

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
SELECT
    tablename,tableowner
FROM pg_tables order by tableowner;

DO $$
    DECLARE
    r RECORD;
        BEGIN
        FOR r IN
            SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'public'
        loop
            EXECUTE format('REVOKE ALL ON public.%I from public;',r.tablename);
            END LOOP;
    END;
    $$;

DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'public'   -- ou outro schema
    LOOP
        EXECUTE format(
            'GRANT SELECT, INSERT, UPDATE ON public.%I TO usuario_test;',
            r.tablename
        );
    END LOOP;
END;
$$;





