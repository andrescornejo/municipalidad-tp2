/*
 * Stored Procedure: csp_adminAddPropiedades
 * Description: 
 * Author: Andres Cornejo
 * Modified by: Pablo Alpizar
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_adminAddPropiedades @inputNumFinca INT,
	@inputValorFinca MONEY,
	@inputDir NVARCHAR(max)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT Propiedad (
			NumFinca,
			Valor,
			Direccion,
			activo,
			ConsumoAcumuladoM3,
			UltimoConsumoM3
			)
		SELECT @inputNumFinca,
			@inputValorFinca,
			@inputDir,
			1,
			0,
			0
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

--EXEC csp_adminAddPropiedades 420, 420, 'tencha'
