/*
 * Stored Procedure: csp_adminUpdatePropietario
 * Description: Actualizacion de informacion a Propietario por parte de un Admin.
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_adminUpdatePropietario @inputOLDDocID NVARCHAR(50),
	@inputName NVARCHAR(50),
	@inputDocIDVal NVARCHAR(100),
	@inputDocID NVARCHAR(50)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idPropietario INT

		EXEC @idPropietario = csp_getPropietarioIDFromDocID @inputOLDDocID

		DECLARE @DocidID INT

		EXEC @DocidID = csp_getDocidIDFromName @inputDocID

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE Propietario
		SET nombre = @inputName,
			valorDocID = @inputDocIDVal,
			idTipoDocID = @DocidID
		WHERE valorDocID = @inputOLDDocID and activo = 1

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


