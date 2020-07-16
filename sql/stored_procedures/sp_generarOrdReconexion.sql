/*
 * Stored Procedure: csp_generarOrdReconexion
 * Description: 
 * Author: Pablo Alpizar
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_generarOrdReconexion @inFecha DATE, @idPropiedad INT, @idRecibo INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		INSERT INTO [dbo].[Reconteca] (fecha, idReconexion, idPropiedad, activo)
		SELECT @inFecha, @idRecibo, @idPropiedad, 1
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


