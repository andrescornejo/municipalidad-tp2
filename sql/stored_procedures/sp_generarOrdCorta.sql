/*
 * Stored Procedure: csp_generarOrdCorta
 * Description: 
 * Author: Pablo Alpizar
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_generarOrdCorta @inFecha DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @tmpProp_CCAgua TABLE (idPropiedad INT)
		DECLARE @idPropiedad INT

		INSERT INTO @tmpProp_CCAgua (idPropiedad)
		SELECT CP.idPropiedad
		FROM [dbo].[CCenPropiedad] CP
		WHERE CP.idConceptoCobro = (SELECT C.id FROM [dbo].[ConceptoCobro] C WHERE C.nombre = 'Agua')

		WHILE (
				SELECT COUNT(*)
				FROM @tmpProp_CCAgua
				) > 0
		BEGIN
			-- tomar la primera propiedad
			SET @idPropiedad = (
					SELECT TOP 1 tmp.idPropiedad
					FROM @tmpProp_CCAgua tmp
					)

			DELETE @tmpProp_CCAgua
			WHERE idPropiedad = @idPropiedad

			IF (SELECT COUNT(R.id) FROM [dbo].[Recibo] R 
				WHERE R.idPropiedad = @idPropiedad 
				AND idConceptoCobro = 1 AND R.esPendiente = 1
				AND NOT EXISTS (SELECT top 1 R.id FROM [dbo].[Recibo] R WHERE idPropiedad = @idPropiedad
				AND idConceptoCobro = 11)) > 1
			BEGIN
				-- Recibo de reconexion
				INSERT INTO [dbo].[Recibo] (
					idPropiedad, 
					idConceptoCobro, 
					fecha,
					fechaVencimiento,
					monto,
					esPendiente)
				SELECT 
					@idPropiedad,
					C.id,
					@inFecha,
					DATEADD(DAY,C.QDiasVencimiento,@inFecha),
					CF.monto,
					1
				FROM [dbo].[ConceptoCobro] C 
				INNER JOIN [dbo].[CC_Fijo] CF ON C.id = CF.id
				WHERE C.nombre = 'Reconexion de agua'

				INSERT INTO [dbo].[Reconexion] (id,activo)
				SELECT R.id,1
				FROM [dbo].[Recibo] R 
				WHERE R.idPropiedad = @idPropiedad
				ORDER BY R.id DESC

				-- Generar la orden de corta
				INSERT INTO [dbo].[Corte] (idReconexion, fecha, idPropiedad, activo)
				SELECT R.id, @inFecha, @idPropiedad, 1
				FROM [dbo].[Recibo] R 
				WHERE R.idPropiedad = @idPropiedad
				ORDER BY R.id DESC
			END
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


