SET LANGUAGE  Brasilian

if (1 = 1)
    select 'é verdadeiro'
else
    select 'é falso'

select @@language

IF DATEPART(MONTH ,GETDATE()) = 11 AND DAY(GETDATE()) IN (1,2,3,4,5)
    begin
        select * from sales.SalesOrderDetail
    end
else IF datename(WEEKDAY ,GETDATE()) in ('Sábado', 'quarta-feira')
    begin
        select * from person.person;
    end
else
    begin
        select 'Deu ruim'
    end


BEGIN
    DECLARE @Idade tinyint = 18

    IF (@Idade > 18 and (select max(BusinessEntityID) from person.person ) < 500)
    PRINT 'Bastante coisa'
    ELSE
        BEGIN
            IF DAY(EOMONTH(GETDATE())) > 29
                PRINT 'Não é Fevereiro'
            else
                print 'Show de bola'
        end
end

