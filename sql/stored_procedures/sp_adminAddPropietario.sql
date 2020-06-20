/*
 * Stored Procedure: csp_adminAddPropietario
 * Description: 
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_adminAddPropietario @inputName NVARCHAR(50),
	@inputDocIDVal NVARCHAR(100),
	@inputDocID NVARCHAR(50)
AS
BEGIN
	BEGIN TRY
		DECLARE @DocidID INT

		EXEC @DocidID = csp_getDocidIDFromName @inputDocID

		--PRINT (@DocidID)
		SET NOCOUNT ON
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT Propietario (
			nombre,
			valorDocID,
			idTipoDocID
			)
		SELECT @inputName,
			@inputDocIDVal,
			@DocidID

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


