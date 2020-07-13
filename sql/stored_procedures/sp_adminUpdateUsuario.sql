/*
 * Stored Procedure: csp_adminUpdateUsuario
 * Description: Actualizacion de un Usuario por un Admin.
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_adminUpdateUsuario @inputOLDUsername NVARCHAR(50),
	@inputNewUsername NVARCHAR(50),
	@inputNewPassword NVARCHAR(100),
	@inputAdminStatus BIT,
	@inputInsertedBy NVARCHAR(100),
	@inputInsertedIn NVARCHAR(20)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idUser INT
		DECLARE @jsonAntes NVARCHAR(500)
		DECLARE @jsonDespues NVARCHAR(500)
		DECLARE @adminBefore NVARCHAR(500)
		DECLARE @adminAfter NVARCHAR(500)
		DECLARE @idEntidad INT
		DECLARE @oldAdminStatus BIT

		EXEC csp_getUserIDFromUsername @inputOLDUsername,
			@idUser OUTPUT

		PRINT (@idUser)

		SET @idEntidad = (
				SELECT U.id
				FROM [dbo].[Usuario] U
				WHERE U.username = @inputOLDUsername
				)
		SET @oldAdminStatus = (
				SELECT u.isAdmin
				FROM Usuario u
				WHERE u.id = @idEntidad
				)
		SET @adminBefore = (
				CASE 
					WHEN @oldAdminStatus = 1
						THEN 'Administrador'
					ELSE 'Cliente'
					END
				)
		SET @adminAfter = (
				CASE 
					WHEN @inputAdminStatus = 1
						THEN 'Administrador'
					ELSE 'Cliente'
					END
				)
		SET @jsonAntes = (
				SELECT @inputOLDUsername AS 'Nombre Usuario',
					'*******' AS 'Contraseña',
					@adminBefore AS 'Tipo Usuario',
					'Activo' AS 'Estado'
				FOR JSON PATH,
					ROOT('Usuario')
				)
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE Usuario
		SET username = @inputNewUsername,
			passwd = @inputNewPassword,
			isAdmin = @inputAdminStatus
		WHERE id = @idUser
			AND activo = 1

		-- inset into bitacora
		SET @jsonDespues = (
				SELECT @inputNewUsername AS 'Nombre Usuario',
					'*******' AS 'Contraseña',
					@adminAfter AS 'Tipo Usuario',
					'Activo' AS 'Estado'
				FOR JSON PATH,
					ROOT('Usuario')
				)

		INSERT INTO [dbo].[Bitacora] (
			idTipoEntidad,
			idEntidad,
			jsonAntes,
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
			)
		SELECT T.id,
			@idUser,
			@jsonAntes,
			@jsonDespues,
			GETDATE(),
			@inputInsertedBy,
			@inputInsertedIn
		FROM [dbo].[TipoEntidad] T
		JOIN [dbo].[Usuario] U ON @inputNewUsername = U.username
			AND U.activo = 1
		WHERE T.Nombre = 'Usuario'

		COMMIT

		RETURN 1
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	END CATCH
END
GO

-- EXEC csp_adminUpdateUsuario 'lol', 'fengJP', 'yeet', 0, 'lskdjf', 'asldkfj';
