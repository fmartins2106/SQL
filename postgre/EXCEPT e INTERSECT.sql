SELECT 'DEVDOJO' AS nome,
       'JAVA' AS linguagem
INTERSECT
SELECT 'Google' AS nome,
       'Kotlin' AS linguagem;


select * from empresa.funcionarios limit 3

select * from empresa.vendas limit 3

select * from empresa.clientes limit 4



SELECT
cliente_id,
nome,
data_cadastro
from empresa.clientes

EXCEPT

SELECT
funcionario_id,
observacoes,
data_venda
from empresa.vendas



SELECT
cliente_id,
nome,
data_cadastro
from empresa.clientes

INTERSECT

SELECT
funcionario_id,
observacoes,
data_venda
from empresa.vendas