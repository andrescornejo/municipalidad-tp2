/*
 * Stored Procedure: csp_linkUsuarioVsPropiedad
 * Description: 
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_linkUsuarioVsPropiedad @fechaInput DATE
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

		DECLARE @tmpUSvsProp TABLE (
			NumFinca INT,
			nombreUsuario NVARCHAR(50),
			fechaxml DATE
			)

		INSERT @tmpUSvsProp (
			NumFinca,
			nombreUsuario,
			fechaxml
			)
		SELECT NumFinca,
			nombreUsuario,
			fecha
		FROM openxml(@hdoc, '/Operaciones_por_Dia/OperacionDia/UsuarioVersusPropiedad', 1) WITH (
				NumFinca INT,
				nombreUsuario NVARCHAR(50),
				fecha DATE '../@fecha'
				)
		WHERE @fechaInput = fecha

		--select * from @tmpUSvsProp
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		INSERT UsuarioVsPropiedad (
			idUsuario,
			idPropiedad
			)
		SELECT U.id,
			P.id
		FROM @tmpUSvsProp tmp
		JOIN Usuario U ON U.username = tmp.nombreUsuario
		JOIN Propiedad P ON P.NumFinca = tmp.NumFinca

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


