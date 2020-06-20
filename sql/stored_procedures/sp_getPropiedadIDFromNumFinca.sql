/*
 * Stored Procedure: csp_getPropiedadIDFromNumFinca
 * Description: 
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_getPropiedadIDFromNumFinca @inputNumFinca INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @outputID INT

		SET @outputID = (
				SELECT TOP 1 p.id
				FROM Propiedad P
				WHERE p.NumFinca = @inputNumFinca
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


