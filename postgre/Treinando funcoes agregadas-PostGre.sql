select * from empresa.clientes c 
limit 40
select count(*) from empresa.auditorias a 

-- fazendo maximo, minimo, soma e media de um campo em especifico.

select MIN(v.total) as minimo from empresa.vendas v  

select MAX( v.total ) as maximo from empresa.vendas v 

select SUM(v.total) as soma from empresa.vendas v

select AVG(v.total)  as media from empresa.vendas v  


-- utilização do group by


select * from