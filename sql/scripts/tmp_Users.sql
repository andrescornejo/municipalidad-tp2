use municipalidad
go 

insert Usuario(username, passwd, isAdmin, activo)
select 'a', '1', 1, 1

insert Usuario(username, passwd, isAdmin, activo)
select 'b', '1', 0, 1

select * from Usuario