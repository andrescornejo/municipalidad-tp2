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

insert ComprobanteDePago(fecha, MontoTotal, activo)
select '2020-5-8', 50000, 1

insert ComprobanteDePago(fecha, MontoTotal, activo)
select '2020-6-8', 50000, 1

insert ComprobanteDePago(fecha, MontoTotal, activo)
select '2020-7-8', 50000, 1

select * from ComprobanteDePago

insert Recibo(idComprobantePago, idPropiedad, idConceptoCobro, fecha, fechaVencimiento, monto, esPendiente, activo)
select 1, 1, 1, '2020-5-8', '2020-5-17', 50000, 0, 1

insert Recibo(idComprobantePago, idPropiedad, idConceptoCobro, fecha, fechaVencimiento, monto, esPendiente, activo)
select 2, 1, 1, '2020-6-8', '2020-6-17', 50000, 0, 1

insert Recibo(idComprobantePago, idPropiedad, idConceptoCobro, fecha, fechaVencimiento, monto, esPendiente, activo)
select 3, 1, 1, '2020-7-10', '2020-7-17', 50000, 1, 1

select * from Recibo

