/* 
    CHARINDEX(EXPRESSSÃO A PROCURAR, NOME_DA_COLUNA);
    obs: Usar somente para texto.
    ____________________________________________________
    PATINDEX(%padrao%, Nome_Da_Coluna)

 */

SELECT CHARINDEX('y','O melhor canal do youtube é o DevDojo, brabo demais!') as [CHARINDEX], /* Retornou a posição da letra Y */
      PATINDEX('%é_o__e%','O melhor canal do youtube é o DevDojo, brabo demais!') as [PARTINDEX]



SELECT 
    BusinessEntityID,
    EmailAddress,
    CHARINDEX('@', EmailAddress) as [CHARINDEX()],
    SUBSTRING(EmailAddress,1,CHARINDEX('@',EmailAddress)-1) as [Nome do usuário], /* Primeiro argumento:o que quero pesquisar. segundo: inicio da posição, terceiro: tamanho */
    ModifiedDate,
    CHARINDEX('8', ModifiedDate) AS POS /*  Não usar para inteiros e datas */
from person.EmailAddress
