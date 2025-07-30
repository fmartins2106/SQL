--Variaveis

DECLARE @PrimeiraVariavel VARCHAR(200) = 'SQL SERVER NO DEV DOJO',
    @Num1 INT = 3,
    @Hoje date = getdate(),
    @Hoje2 date = null,
    @TextoConcateado varchar(60),
    @Controle VARCHAR(60)

DECLARE @VariavelTabela table(
    IdTabela INT PRIMARY KEY,
    PrimeiroNome varchar (50),
    NomeMeio VARCHAR (50),
    UltimoNome varchar (50)
);

INSERT INTO @VariavelTabela
SELECT
    BusinessEntityID,
    FirstName,
    MiddleName,
    LastName
FROM Person.Person



DECLARE @Num2 INT = @Num1

SET @TextoConcateado = (SELECT CONCAT_WS('-', FirstName, MiddleName, LastName)
                        from Person.Person
                        WHERE BusinessEntityID = @Num1)

SET @Controle = IIF(@Num1 > @Num2, 'é maior', 'não é maior');

--Atribuição de valores
SET @PrimeiraVariavel = 'Maratona Java no DEVDOJO';
SET @PrimeiraVariavel = CONCAT(@PrimeiraVariavel, ' Bolado de mais');
SET @Num1 = 2560;

SET @Num1 += 440;
SET @Num1 -= 440;
SET @Num1 *= 440;
SET @Num1 /= 440;

--Exibição de valores.
SELECT @PrimeiraVariavel as mensagem,
       @Num1             as numero,
       @Hoje             as DataHoje,
       @Hoje2            as DataHoje2,
       @TextoConcateado,
       @Controle

SELECT * from @VariavelTabela