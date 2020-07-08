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
		DECLARE @Admin INT

		EXEC @idUser = csp_getUserIDFromUsername @inputOLDUsername

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
		
		SET @Admin = (CASE 
						WHEN @inputBit = 1
						THEN 'Administrador'
						ELSE 'Cliente'
					END)

		SET @jsonAntes = (SELECT 
							U.username,
							'*********',
							@Admin,
							U.activo
						FROM [dbo].[Usuario] U
						WHERE U.id = idUser
						FOR JSON PATH)

		BEGIN TRANSACTION

		UPDATE Usuario
		SET username = @inputNewUsername,
			passwd = @inputNewPassword,
			isAdmin = @inputAdminStatus
		WHERE id = @idUser
			AND activo = 1

		-- inset into bitacora

		SET @jsonDespues = (SELECT 
							U.username,
							'*********',
							@Admin,
							U.activo
						FROM [dbo].[Usuario] U
						WHERE U.id = idUser
						FOR JSON PATH)

		
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
			@idUser,
			@jsonAntes,
			@jsonDespues,
			GETDATE(),
			@inputInsertBy,
			@inputInsertIn
		FROM [dbo].[TipoEntidad] T
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

--EXEC csp_adminUpdateUsuario 'jpfeng', 'fengJP', 'yeet', 0;
