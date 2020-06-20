/*
 * Stored Procedure: csp_linkPropiedadDelPropietario
 * Description: Links PropiedadDelPropietario table with Propiedad and Propietario
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_linkPropiedadDelPropietario @fechaInput DATE
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

		DECLARE @tmpProtxProp TABLE (
			NumFinca INT,
			identificacion NVARCHAR(100),
			fechaxml DATE
			)

		INSERT @tmpProtxProp (
			NumFinca,
			identificacion,
			fechaxml
			)
		SELECT NumFinca,
			identificacion,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/PropiedadVersusPropietario', 1) WITH (
				NumFinca INT,
				identificacion NVARCHAR(100),
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		--select * from @tmpProtxProp
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT dbo.PropiedadDelPropietario (
			idPropiedad,
			idPropietario
			)
		SELECT PO.id,
			P.id
		FROM @tmpProtxProp AS pp
		JOIN Propietario P ON P.valorDocID = pp.identificacion
		JOIN Propiedad PO ON PO.NumFinca = pp.NumFinca

		--select * from PropiedadDelPropietario
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


