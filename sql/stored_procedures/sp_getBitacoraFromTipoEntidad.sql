/*
 * Stored Procedure: 
 * Description: 
 * Author: Pablo Alpizar
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_getBitacoraFromTipoEntidad @inTipoEntidad INT,
	@inFechaInicio DATE,
	@inFechaFin DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		IF SELECT EXISTS T.id FROM [dbo].[TipoEntidad] T WHERE T.id = @idTipoEntidad
        BEGIN
            RETURN -1
        END
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


