use municipalidad
go 

insert Usuario(username, passwd, isAdmin, activo)
select 'a', '1', 1, 1

insert Usuario(username, passwd, isAdmin, activo)
select 'b', '1', 0, 1

select * from Usuario

INSERT Propiedad(NumFinca, Valor, Direccion, activo, ConsumoAcumuladoM3, UltimoConsumoM3)
select 1234, 1234, 'techa', 1, 2, 2

INSERT Propiedad(NumFinca, Valor, Direccion, activo, ConsumoAcumuladoM3, UltimoConsumoM3)
select 431, 12643, 'techa', 1, 2, 2

INSERT Propiedad(NumFinca, Valor, Direccion, activo, ConsumoAcumuladoM3, UltimoConsumoM3)
select 1111111, 123, 'techa', 1, 2, 2

select * from Propiedad

insert UsuarioVsPropiedad(idUsuario, idPropiedad, activo)
select 2, 1, 1

insert UsuarioVsPropiedad(idUsuario, idPropiedad, activo)
select 2, 2, 1

insert UsuarioVsPropiedad(idUsuario, idPropiedad, activo)
select 2, 3, 1

select * from UsuarioVsPropiedad


