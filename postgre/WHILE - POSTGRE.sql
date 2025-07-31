
--. WHILE com contador até 1000

DO $$
DECLARE
    contador INT := 1;
BEGIN
    CREATE TEMP TABLE IF NOT EXISTS TempTbl (
        id INT
    );

    WHILE (contador <= 1000 OR EXTRACT(YEAR FROM CURRENT_DATE) <> 2025) LOOP
        INSERT INTO TempTbl VALUES (contador);
        contador := contador + 1;
    END LOOP;
END $$;

SELECT * FROM TempTbl;





--Inserir datas de 2000 até hoje
DO $$
DECLARE
    data_atual DATE := DATE '2000-01-01';
BEGIN
    CREATE TEMP TABLE IF NOT EXISTS TblCalendario (
        data DATE PRIMARY KEY
    );

    WHILE data_atual <= CURRENT_DATE LOOP
        INSERT INTO TblCalendario VALUES (data_atual);
        data_atual := data_atual + INTERVAL '1 day';
    END LOOP;
END $$;

SELECT * FROM TblCalendario;

--. Remover espaços de string (tipo TRIM/REPLACE)

DO $$
DECLARE
    campo TEXT := '     SQL     Server';
BEGIN
    campo := TRIM(campo);

    WHILE POSITION(' ' IN campo) > 0 LOOP
        campo := REPLACE(campo, ' ', '');
    END LOOP;

    RAISE NOTICE 'Campo: %', campo;
END $$;


--4. Criar lista de IDs de 1 até o maior BusinessEntityID
DO $$
DECLARE
    contador INT := 1;
    max_id INT;
BEGIN
    CREATE TEMP TABLE IF NOT EXISTS Tbl AS
    SELECT "BusinessEntityID",
           CONCAT_WS(' ', "FirstName", "MiddleName", "LastName") AS fullName,
           "ModifiedDate"
    FROM person.person;

    SELECT MAX("BusinessEntityID") INTO max_id FROM Tbl;

    CREATE TEMP TABLE IF NOT EXISTS TblDif (
        id INT
    );

    WHILE contador <= max_id LOOP
        INSERT INTO TblDif VALUES (contador);
        contador := contador + 1;
    END LOOP;
END $$;

SELECT * FROM TblDif;




