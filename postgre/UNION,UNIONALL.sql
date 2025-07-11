SELECT 'DEVDOJO' AS nome,
       'JAVA' AS linguagem
UNION
SELECT 'Google' AS nome,
       'Kotlin' AS linguagem
UNION ALL
SELECT 'DEVDOJO' AS nome,
       'JAVA' AS linguagem;


select * from empresa.funcionarios limit 3

SELECT * FROM empresa.clientes

select * from empresa.cargos limit 4


SELECT
nome,
sobrenome,
data_nascimento,
email
from empresa.funcionarios
UNION all
SELECT
nome,
endereco,
data_cadastro,
email
from empresa.clientes

