/*
 * Stored Procedure: csp_adminUpdateUsuario
 * Description: 
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_adminUpdateUsuario @inputOLDUsername NVARCHAR(50),
	@inputNewUsername NVARCHAR(50),
	@inputNewPassword NVARCHAR(100),
	@inputAdminStatus BIT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idUser INT

		EXEC @idUser = csp_getUserIDFromUsername @inputOLDUsername

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE Usuario
		SET username = @inputNewUsername,
			passwd = @inputNewPassword,
			isAdmin = @inputAdminStatus
		WHERE id = @idUser

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
