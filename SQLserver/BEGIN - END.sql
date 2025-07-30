BEGIN
    declare @texto varchar(100) = 'Alice'
    begin
        DECLARE  @TextoInterno varchar(100) = 'Texto Interno'
    end

    SELECT @TextoInterno,
           *
    from person.person
    WHERE FirstName = @texto

end





