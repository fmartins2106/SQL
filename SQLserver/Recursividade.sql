-- auto-generated definition
create database AdventureWorks2019 collate SQL_Latin1_General_CP1_CI_AS
go

exec sp_addextendedproperty 'MS_Description', 'AdventureWorks 2016 Sample OLTP Database'
go

grant connect on database :: AdventureWorks2019 to dbo
go

grant view any column encryption key definition, view any column master key definition on database :: AdventureWorks2019 to [public]
go

