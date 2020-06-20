/*	Script para llenar la tabla de usuario con datos de prueba
	Autor: Andres Cornejo
*/
USE municipalidad
GO

--SET IDENTITY_INSERT Usuario ON
--Disabled cuz xml team...
DECLARE @hdoc INT;
DECLARE @UsuarioXML XML;

SELECT @UsuarioXML = U
FROM openrowset(BULK 'C:\xml\Admin.xml', single_blob) AS Usuario(U)

EXEC sp_xml_preparedocument @hdoc OUT,
	@UsuarioXML

INSERT dbo.Usuario (
	username,
	passwd,
	isAdmin
	)
SELECT username,
	passwd,
	tipoUsuario
FROM openxml(@hdoc, '/Administrador/UsuarioAdmi', 1) WITH (
		username NVARCHAR(50),
		passwd NVARCHAR(MAX),
		tipoUsuario BIT
		)

SELECT *
FROM Usuario

EXEC sp_xml_removedocument @hdoc
GO


