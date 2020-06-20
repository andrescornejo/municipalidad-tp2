/*
 * Stored Procedure: csp_adminDeletePropietario
 * Description: 
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_adminDeletePropietario @InputDocID NVARCHAR(100)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idPropietario INT

		EXEC @idPropietario = csp_getPropietarioIDFromDocID @InputDocID

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		DELETE
		FROM PropietarioJuridico
		WHERE id = @idPropietario

		DELETE
		FROM PropiedadDelPropietario
		WHERE idPropietario = @idPropietario

		DELETE
		FROM Propietario
		WHERE id = @idPropietario

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

--EXEC csp_adminDeletePropietario '301777068'
