/*
 * Stored Procedure: csp_adminAddUser
 * Description: 
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_adminAddUser @inputUsername NVARCHAR(50),
	@inputPasswd NVARCHAR(100),
	@inputBit BIT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT Usuario (
			username,
			passwd,
			isAdmin,
			activo
			)
		SELECT @inputUsername,
			@inputPasswd,
			@inputBit,
			1
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

-- EXEC csp_adminAddUser 'puto', 'puto', 1
-- SELECT * FROM Usuario
