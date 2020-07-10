/*
 * Stored Procedure: 
 * Description: 
 * Author: Pablo Alpizar
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_generarReciboCCPorcentaje @inFecha DATE,
	@inIdCC INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @Monto MONEY
		DECLARE @Porcentaje FLOAT
		DECLARE @idPropiedad INT
		DECLARE @QDias INT
		DECLARE @DiaCobro INT = (
				SELECT C.DiaEmisionRecibo
				FROM [dbo].[ConceptoCobro] C
				WHERE C.id = @inIdCC
				)

		IF @DiaCobro != (
				SELECT DAY(@inFecha)
				)
		BEGIN
			RETURN
		END

		DECLARE @tmpPropiedadesTipoCC TABLE (
			idPropiedad INT,
			valor MONEY
			)
		DECLARE @tmpRecibos TABLE (
			idPropiedad INT,
			idConceptoCobro INT,
			Monto MONEY
			)

		SET @Porcentaje = (
				SELECT CC.ValorPorcentaje
				FROM [dbo].[CC_Porcentaje] CC
				WHERE CC.id = @inIdCC
				)
		SET @QDias = (
				SELECT C.QDiasVencimiento
				FROM [dbo].[ConceptoCobro] C
				WHERE C.id = @inIdCC
				)

		INSERT INTO @tmpPropiedadesTipoCC (
			idPropiedad,
			valor
			)
		SELECT CP.idPropiedad,
			P.Valor
		FROM [dbo].[CCenPropiedad] CP
		INNER JOIN [dbo].[Propiedad] P ON CP.idPropiedad = P.id
		WHERE CP.idConceptoCobro = @inIdCC

		WHILE (
				SELECT COUNT(*)
				FROM @tmpPropiedadesTipoCC
				) > 0
		BEGIN
			-- seleccionamos la primera propiedad
			SELECT TOP 1 @idPropiedad = tmp.idPropiedad
			FROM @tmpPropiedadesTipoCC tmp

			SET @Monto = (
					(
						SELECT TOP 1 tmp.valor
						FROM @tmpPropiedadesTipoCC tmp
						) * (@Porcentaje / 100)
					)

			-- Quitamos esta propiedad de la tabla
			DELETE @tmpPropiedadesTipoCC
			WHERE @idPropiedad = idPropiedad

			INSERT INTO @tmpRecibos (
				idPropiedad,
				idConceptoCobro,
				Monto
				)
			SELECT @idPropiedad,
				@inIdCC,
				@Monto
		END

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT INTO [dbo].[Recibo] (
			idPropiedad,
			idConceptoCobro,
			fecha,
			fechaVencimiento,
			monto,
			esPendiente,
			activo
			)
		SELECT tmp.idPropiedad,
			tmp.idConceptoCobro,
			@inFecha,
			DATEADD(DAY, @QDias, @inFecha),
			tmp.Monto,
			1,
			1
		FROM @tmpRecibos tmp

		COMMIT
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


