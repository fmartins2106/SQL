
CREATE schema if not exists anime_store

CREATE TABLE anime_store.producer(
    id_produtor INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    nome_produtor varchar(100) not null unique check ( nome_produtor <> '' )
);

alter table anime_store.producer drop column nome_produtor;
alter table anime_store.producer add column nome_produtor varchar(100) not null unique check ( nome_produtor <> '' )

drop table anime_store.producer;


CREATE TABLE anime_store.anime(
    id_anime INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    nome_anime varchar(100) not null UNIQUE CHECK ( nome_anime <> '' ),
    episodeos smallint not null ,
    id_produtor integer not null,
    constraint FK_id_produtor FOREIGN KEY (id_produtor) references anime_store.producer(id_produtor)
);


select
    table_schema,
    table_name
from information_schema.tables
where table_type = 'BASE TABLE'
AND TABLE_SCHEMA NOT IN ('pg_catalog','information_schema')
order by table_schema,table_name;



