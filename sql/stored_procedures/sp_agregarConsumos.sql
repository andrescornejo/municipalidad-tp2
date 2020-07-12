/*
 * Stored Procedure: csp_agregarTransConsumo
 * Description: 
 * Author: Pablo Alpizar
 */
USE municipalidad
GO

IF EXISTS (
		SELECT *
		FROM sysobjects
		WHERE id = object_id(N'[dbo].[csp_agregarTransConsumo]')
			AND OBJECTPROPERTY(id, N'IsProcedure') = 1
		)
BEGIN
	DROP PROCEDURE dbo.csp_agregarTransConsumo
END
GO

CREATE
	OR

ALTER PROC csp_agregarTransConsumo @inFecha DATE,  @OperacionXML XML
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		DECLARE @MontoM3 MONEY
		DECLARE @NumFincaRef INT

		DECLARE @hdoc INT
		DECLARE @tmpConsumo TABLE (
			idTipoTransConsumo INT,
			FechaXml DATE,
			LecturaM3 INT,
			Descripcion NVARCHAR(100),
			NumFinca INT
			)

		SET @MontoM3 = (
				SELECT CC.ValorM3
				FROM dbo.CC_ConsumoAgua CC
				INNER JOIN dbo.ConceptoCobro C ON C.nombre = 'Agua'
				WHERE C.id = CC.id
				)

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		INSERT INTO @tmpConsumo (
			idTipoTransConsumo,
			FechaXml,
			Descripcion,
			NumFinca,
			LecturaM3
			)
		SELECT X.id,
			X.fecha,
			X.descripcion,
			X.NumFinca,
			X.LecturaM3
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/TransConsumo', 1) WITH (
				id INT,
				fecha DATE '../@fecha',
				descripcion NVARCHAR(100),
				NumFinca INT,
				LecturaM3 INT
				) AS X
		WHERE @inFecha = fecha

		EXEC sp_xml_removedocument @hdoc;

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
		BEGIN TRANSACTION

			INSERT dbo.TransaccionConsumo (
				idPropiedad,
				fecha,
				montoM3,
				LecturaConsumoM3,
				NuevoAcumuladoM3,
				activo,
				idTipoTransacCons
				)
			SELECT P.id,
				tmp.FechaXml,
				@MontoM3,
				tmp.LecturaM3,
				(CASE WHEN idTipoTransConsumo = 1 THEN tmp.LecturaM3 - P.UltimoConsumoM3
					ELSE P.ConsumoAcumuladoM3 + tmp.LecturaM3
				END),
				1,
				idTipoTransConsumo
			FROM @tmpConsumo tmp
			INNER JOIN dbo.Propiedad P ON tmp.NumFinca = P.NumFinca
	
	
			WHILE (SELECT COUNT(*) FROM @tmpConsumo) > 0
			BEGIN
				-- Seleccionamos la primera propiedad
				SET @NumFincaRef = (SELECT TOP 1 tmp.NumFinca FROM @tmpConsumo tmp ORDER BY tmp.NumFinca DESC)
				DELETE @tmpConsumo WHERE NumFinca = @NumFincaRef
	
				UPDATE [dbo].[Propiedad]
				SET ConsumoAcumuladoM3 = (SELECT Tc.NuevoAcumuladoM3 
											FROM [dbo].[TransaccionConsumo] TC
											INNER JOIN [dbo].[Propiedad] P ON P.NumFinca = @NumFincaRef 
											WHERE TC.idPropiedad = P.id)
				WHERE NumFinca = @NumFincaRef
			END
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


