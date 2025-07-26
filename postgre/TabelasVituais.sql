SELECT EXTRACT(YEAR FROM db_funcionario.data_admissao)                                as "ANO",
       count(*) FILTER ( WHERE extract(MONTH FROM db_funcionario.data_admissao) = 1)  as Janeiro,
       count(*) FILTER ( WHERE extract(MONTH FROM db_funcionario.data_demissao) = 2)  as Fevereiro,
       count(*) filter ( where extract(MONTH FROM db_funcionario.data_admissao) = 3)  as Março,
       count(*) filter ( where extract(MONTH FROM db_funcionario.data_demissao) = 4)  as Abril,
       count(*) filter ( where extract(MONTH FROM db_funcionario.data_demissao) = 5)  as Maio,
       count(*) filter ( where extract(MONTH FROM db_funcionario.data_demissao) = 7 ) as Junho,
       count(*) filter ( where extract(MONTH FROM db_funcionario.data_demissao) = 8 ) as Julho,
       count(*) filter ( where extract(MONTH FROM db_funcionario.data_demissao) = 9 ) as Agosto,
       count(*) filter ( where extract(MONTH FROM db_funcionario.data_demissao) = 10) as Setembro,
       count(*) filter ( where extract(MONTH FROM db_funcionario.data_demissao) = 11) as Outubro,
       count(*) filter ( where extract(MONTH FROM db_funcionario.data_demissao) = 12) as Novembro
from db_funcionario
group by EXTRACT(YEAR FROM db_funcionario.data_admissao)
order by "ANO";


select *
from db_pessoa
limit

select table_name as "Nome da tabela"
from information_schema.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
  and table_schema not in ('pg_catalog', 'information_schema');

select *
from db_funcionario
limit 12

select *
from db_venda

SELECT extract(YEAR FROM data_venda)                              as "ANO",
       count(*) FILTER ( WHERE EXTRACT(MONTH FROM data_venda) =1) as Janeiro,
       count(*) filter ( where extract(MONTH FROM data_venda) =2) as Feverero,
       count(*) filter ( where extract(MONTH FROM data_venda) =3) as Março,
       count(*) filter ( where extract(MONTH FROM data_venda) =4) as Abril,
       count(*) filter ( where extract(MONTH FROM data_venda) =5) as Maio,
       count(*) filter ( where extract(MONTH FROM data_venda) =6) as Junho,
       count(*) filter ( where extract(MONTH FROM data_venda) =7) as Julho,
       count(*) filter ( where extract(MONTH FROM data_venda) =8) as Agosto,
       count(*) filter ( where extract(MONTH FROM data_venda) =9) as Setembro,
       count(*) filter ( where extract(MONTH FROM data_venda) =10) as Outubro,
       count(*) filter ( where extract(MONTH FROM data_venda) =11) as Novembro,
       count(*) filter ( where extract(MONTH FROM data_venda) =12) as DEzembro
from db_venda
group by extract(YEAR FROM data_venda)
order by "ANO";



SELECT EXTRACT(YEAR FROM data_admissao)                                               as "ANO",
       COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM db_funcionario.data_admissao) = 1)   as Janeiro,
       COUNT(*) FILTER ( WHERE extract(MONTH FROM db_funcionario.data_demissao) = 2)  as Fevereiro,
       count(*) FILTER ( WHERE extract(MONTH FROM db_funcionario.data_demissao) = 3)  as Março,
       count(*) FILTER ( WHERE extract(MONTH FROM db_funcionario.data_demissao) = 4)  as Abril,
       count(*) FILTER ( WHERE extract(MONTH FROM db_funcionario.data_demissao) = 5)  as Maio,
       count(*) FILTER ( WHERE extract(MONTH FROM db_funcionario.data_demissao) = 6)  as junho,
       count(*) FILTER ( WHERE extract(MONTH FROM db_funcionario.data_demissao) = 7)  as julho,
       count(*) FILTER ( WHERE extract(MONTH FROM db_funcionario.data_demissao) = 8)  as Agosto,
       count(*) FILTER ( WHERE extract(MONTH FROM db_funcionario.data_demissao) = 9)  as Setembro,
       count(*) FILTER ( WHERE extract(MONTH FROM db_funcionario.data_demissao) = 10) as Outubro,
       count(*) FILTER ( WHERE extract(MONTH FROM db_funcionario.data_demissao) = 11) as Novembro,
       count(*) FILTER ( WHERE extract(MONTH FROM db_funcionario.data_demissao) = 12) as Dezembro
FROM db_funcionario
GROUP BY EXTRACT(YEAR FROM db_funcionario.data_admissao)
order by "ANO";


SELECT EXTRACT(YEAR FROM HireDate)                               AS ano,       -- Extrai o ano da data de contratação para agrupar
       COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM HireDate) = 1)  AS janeiro,   -- Contagem de contratações em janeiro
       COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM HireDate) = 2)  AS fevereiro, -- Contagem de contratações em fevereiro
       COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM HireDate) = 3)  AS março,     -- Contagem de contratações em março
       COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM HireDate) = 4)  AS abril,     -- Contagem de contratações em abril
       COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM HireDate) = 5)  AS maio,      -- Contagem de contratações em maio
       COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM HireDate) = 6)  AS junho,     -- Contagem de contratações em junho
       COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM HireDate) = 7)  AS julho,     -- Contagem de contratações em julho
       COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM HireDate) = 8)  AS agosto,    -- Contagem de contratações em agosto
       COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM HireDate) = 9)  AS setembro,  -- Contagem de contratações em setembro
       COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM HireDate) = 10) AS outubro,   -- Contagem de contratações em outubro
       COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM HireDate) = 11) AS novembro,  -- Contagem de contratações em novembro
       COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM HireDate) = 12) AS dezembro   -- Contagem de contratações em dezembro
FROM HumanResources.Employee -- Fonte dos dados: tabela de funcionários
GROUP BY EXTRACT(YEAR FROM HireDate) -- Agrupa resultados por ano
ORDER BY ano; -- Ordena os anos em ordem crescente
