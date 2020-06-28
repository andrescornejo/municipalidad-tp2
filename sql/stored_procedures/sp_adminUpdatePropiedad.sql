/*
 * Stored Procedure: csp_adminUpdatePropiedad
 * Description: Actualizacion a una Propiedad por un Admin.
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_adminUpdatePropiedad @numFinca INT,
	@newNumFinca INT,
	@newValue MONEY,
	@newDir NVARCHAR(max)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idPropiedad INT

		EXEC @idPropiedad = csp_getPropiedadIDFromNumFinca @numFinca

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRAN

		UPDATE Propiedad
		SET NumFinca = @newNumFinca,
			Valor = @newValue,
			Direccion = @newDir
		WHERE id = @idPropiedad
			AND activo = 1

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


