-- A função ROW_NUMBER() numera as linhas de um conjunto de resultados, com base em uma ordenação definida no OVER (...).


SELECT * FROM db_funcionario LIMIT 3;

SELECT row_number() over (ORDER BY db_funcionario.data_admissao,db_funcionario.id_departamento ),
* FROM db_funcionario;

select table_name
from information_schema.tables
where table_type = 'BASE TABLE'
and table_schema not in ('pg_catalog','information_schema');


select * from db_pessoa limit 3;

select
    nome,
    cpf,
    case
        when sexo = 'M' then 'MASCULINO'
        when sexo = 'F' then 'FEMINIMO'
    end as "Sexo",
    email,
    POSITION('@' IN "email") as "Posição do @",
    LEFT("email", position('@' in "email")-1) as User_name,
    RIGHT("email", length("email") - position('@' in "email")) as "Dominio"
from db_pessoa;

SELECT row_number() over (PARTITION BY db_funcionario.data_admissao,db_funcionario.id_departamento
    order by db_funcionario.data_admissao,db_funcionario.id_departamento),
* FROM db_funcionario;


select * from db_endereco limit 2;

select * from db_logradouro limit 30;

SELECT row_number() over (order by cep,endereco),
       * from db_endereco;

SELECT row_number() over (PARTITION BY db_endereco.cep,db_endereco.endereco
    order by db_endereco.cep,db_endereco.endereco),
    * from db_endereco;

SELECT row_number() over (ORDER BY data_criacao),
       * from db_cliente;

select row_number() over (ORDER BY db_produto_venda.id_produto,db_produto_venda.preco_unitario,db_produto_venda.quantidade),
       * from db_produto_venda;

select row_number() over (PARTITION BY db_produto_venda.id_produto,db_produto_venda.preco_unitario,db_produto_venda.quantidade
    order by id_produto,preco_unitario,quantidade),
       * from db_produto_venda;















