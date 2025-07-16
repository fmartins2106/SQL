-- Listar os bancos de dados (equivalente ao SELECT * FROM sys.databases)
SELECT datname FROM pg_database;

-- Selecionar o banco de dados (no PostgreSQL, você precisa conectar-se a ele no início da sessão, não via SQL)
-- Então, você precisa mudar o banco de dados fora do script (no cliente, como psql ou PgAdmin)

-- Remover a tabela se ela existir
DROP TABLE IF EXISTS public."Desenhos";

-- Criar a tabela
CREATE TABLE public."Desenhos" (
    "ID_Desenho" SERIAL PRIMARY KEY,
    "Nome_Desenho" VARCHAR(50) NOT NULL,
    "Data_Lancamento" DATE NOT NULL,
    "Quantidade_Episodios" SMALLINT NOT NULL
);


