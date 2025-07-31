DECLARE @Contador INT = 0

while @Contador <= 500

    BEGIN
        IF @Contador = 30
            BREAK
        ELSE
            BEGIN
                SET @Contador += 1
                print @Contador
                continue
            end
    end