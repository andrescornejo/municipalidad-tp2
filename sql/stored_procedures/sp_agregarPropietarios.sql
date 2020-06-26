/*
 * Stored Procedure: csp_agregarPropietarios
 * Description: 
 * Author: Andres Cornejo
 */
USE municipalidad
GO

IF EXISTS (
		SELECT *
		FROM sysobjects
		WHERE id = object_id(N'[dbo].[csp_agregarPropietarios]')
			AND OBJECTPROPERTY(id, N'IsProcedure') = 1
		)
BEGIN
	DROP PROCEDURE dbo.csp_agregarPropietarios
END
GO

CREATE PROC csp_agregarPropietarios @fechaInput DATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @OperacionXML XML

		SELECT @OperacionXML = O
		FROM openrowset(BULK 'C:\xml\Operaciones.xml', single_blob) AS Operacion(O)

		DECLARE @hdoc INT

		EXEC sp_xml_preparedocument @hdoc OUT,
			@OperacionXML

		DECLARE @tmpPropiet TABLE (
			idTipoDocID INT,
			nombre NVARCHAR(50),
			valorDocID NVARCHAR(100),
			fechaxml DATE
			)

		INSERT @tmpPropiet (
			nombre,
			idTipoDocID,
			valorDocID,
			fechaxml
			)
		SELECT Nombre,
			TipoDocIdentidad,
			identificacion,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/Propietario', 1) WITH (
				Nombre NVARCHAR(50),
				TipoDocIdentidad INT,
				identificacion NVARCHAR(100),
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		EXEC sp_xml_removedocument @hdoc;

		-- SELECT * FROM @tmpPropiet

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT dbo.Propietario (
			nombre,
			idTipoDocID,
			valorDocID,
			activo
			)
		SELECT tp.nombre,
			tp.idTipoDocID,
			tp.valorDocID,
			1
		FROM @tmpPropiet tp

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


