/*
 * Stored Procedure: csp_adminAddUser
 * Description: Borrado logico de objeto usuario.
 * Author: Andres Cornejo
 * Modified by: Pablo Alpizar
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_adminDeleteUsuario @usuarioIDInput NVARCHAR(50),
	@inputInsertedBy NVARCHAR(100),
	@inputInsertedIn NVARCHAR(20)
AS
BEGIN

	DECLARE @jsonAntesUsuario NVARCHAR(500)
	DECLARE @jsonDespuesUsuario NVARCHAR(500)
	DECLARE @idEntidad INT
	DECLARE @Admin NVARCHAR(20)
	DECLARE @idUsuario INT = (
			SELECT id
			FROM Usuario
			WHERE username = @usuarioIDInput
			)

	BEGIN TRY

		SET @Admin = (CASE WHEN @inputBit = 1
						THEN 'Administrador'
						ELSE 'Cliente'
					END)

		SET @jsonAntesUsuario = (SELECT
									U.id AS 'ID',
									U.username AS 'Nombre Usuario', 
									'*******' AS 'Contrasenna', 
									@Admin AS 'Tipo Usuario', 
									'Activo' AS 'Estado'
 							FROM [dbo].[Usuario] U
							WHERE U.id = idUsuario
							FOR JSON PATH, ROOT('Usuario'))

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE UsuarioVsPropiedad
		SET activo = 0
		WHERE idUsuario = @idUsuario
		-- Necesito iterar por cada relacion entre propiedad y usuario
		-- Falta agregar los cambios de las relaaciones Usuario Vs Propiedad

		UPDATE Usuario
		SET activo = 0
		WHERE id = @idUsuario

		-- insert into bitacora
		SET @jsonDespuesUsuario = (SELECT
									U.id AS 'ID',
									U.username AS 'Nombre Usuario', 
									'*******' AS 'Contrasenna', 
									@Admin AS 'Tipo Usuario', 
									'Inactivo' AS 'Estado'
 							FROM [dbo].[Usuario] U
							WHERE U.id = idUsuario
							FOR JSON PATH, ROOT('Usuario'))

		INSERT INTO [dbo].[Bitacora] (
			idTipoEntidad,
			idEntidad, 
			jsonAntes,
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
		) SELECT
			T.id,
			@idEntidad,
			@jsonAntesUsuario,
			@jsonDespuesUsuario,
			GETDATE(),
			@inputInsertBy,
			@inputInsertIn
		FROM [dbo].[TipoEntidad] T
		WHERE T.Nombre = 'Usuario'
		COMMIT
		RETURN 0
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		RETURN - 1
	END CATCH
END
GO

--EXEC csp_adminDeleteUsuario 'lmaoxd'
