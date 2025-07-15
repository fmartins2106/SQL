select * from sys.DATABASES


USE dbCartoon
GO

DROP TABLE IF EXISTS Desenhos


/* CREATE TABLE SCHEMA.Nome_da_Tabela */
CREATE TABLE dbo.Desenhos(
    ID_Desenho TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Nome_Desenho VARCHAR(50) NOT NULL,
    Data_Lancamento DATE NOT NULL,
    Quantidade_Episodios SMALLINT NOT NULL,
)
GO
