/*
 * Stored Procedure: csp_adminAddPropiedades
 * Description: 
 * Author: Andres Cornejo
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
			Direccion
			)
		SELECT @inputNumFinca,
			@inputValorFinca,
			@inputDir

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
