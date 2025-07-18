SELECT 
BusinessEntityID,
FirstName,
ISNULL(MiddleName,0) AS MiddleName,
COALESCE(Title,MiddleName,Suffix,FirstName) AS [colasesce()],
LastName,
ISNULL(Title,'') AS Title,
ISNULL(Suffix,'') as Sulffix, /* Aceita somente 2 paramentros, o que quer verificar e o que sera colocado no lugar. */
ISNULL(AdditionalContactInfo,'') as AddicionalConcactInfo,
TRY_CONVERT(varchar(10),ModifiedDate,103) as ModifiedDate
FROM person.person
where Suffix is NOT NULL
