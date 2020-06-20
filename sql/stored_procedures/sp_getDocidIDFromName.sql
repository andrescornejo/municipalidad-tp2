/*
 * Stored Procedure: csp_getDocidIDFromName
 * Description: 
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_getDocidIDFromName @inputName NVARCHAR(100)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @outputID INT = (
				SELECT TOP 1 d.id
				FROM TipoDocID d
				WHERE d.nombre = @inputName
				)

		RETURN @outputID
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

-- exec csp_getDocidIDFromName 'Cedula Nacional'
