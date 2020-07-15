/*
 * Stored Procedure: csp_generarOrdReconexion
 * Description: 
 * Author: Pablo Alpizar
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_generarOrdReconexion @inFecha DATE, @idPropiedad INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		DECLARE @idReconexion INT

		SET @idReconexion = (SELECT R.id FROM [dbo].[Recibo] R
							INNER JOIN [dbo].[ConceptoCobro] C ON C.nombre = 'Reconexion de agua'
							WHERE R.idPropiedad = @idPropiedad 
							AND R.idConceptoCobro = C.id AND R.esPendiente = 1)


		INSERT INTO [dbo].[Reconteca] (fecha, idReconexion, idPropiedad, activo)
		SELECT @inFecha, @idReconexion, @idPropiedad, 1
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


