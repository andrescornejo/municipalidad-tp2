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

	DECLARE @jsonAntes NVARCHAR(500)
	DECLARE @idEntidad INT
	DECLARE @Admin NVARCHAR(20)
	DECLARE @idUsuario INT = (
			SELECT id
			FROM Usuario
			WHERE username = @usuarioIDInput
			)

	BEGIN TRY
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE UsuarioVsPropiedad
		SET activo = 0
		WHERE idUsuario = @idUsuario
		-- Necesito iterar por cada relacion entre propiedad y usuario
		SET @idEntidad = 
			( 
				SELECT UP.id 
				FROM [dbo].[UsuarioVsPropiedad] UP 
				WHERE
			)

		-- insert into bitacora
		INSERT INTO [dbo].[Bitacora] (
			idTipoEntidad,
			idEntidad, 
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
		) SELECT
			T.id,
			@idEntidad,
			@jsonDespues,
			GETDATE(),
			@inputInsertBy,
			@inputInsertIn
		FROM [dbo].[TipoEntidad] T
		WHERE T.Nombre = 'PropiedadVsUsuario'
		
		UPDATE Usuario
		SET activo = 0
		WHERE id = @idUsuario

		-- insert Usuario changes into bitácora
		SET @idEntidad = (SELECT U.id 
							FROM [dbo].[Usuario] U
							WHERE U.username = @usuarioIDInput)
		SET @Admin = (CASE 
				WHEN @inputBit = 1
				THEN 'Administrador'
				ELSE 'Cliente'
			END)
		SET @jsonAntes = (SELECT U.username, '*******', @Admin, U.activo
							FROM [dbo].[Usuario] U
							WHERE U.id = idUsuario)

		INSERT INTO [dbo].[Bitacora] (
			idTipoEntidad,
			idEntidad, 
			jsonAntes,
			insertedAt,
			insertedBy,
			insertedIn
		) SELECT
		T.id,
		@idEntidad,
		@jsonAntes,
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
