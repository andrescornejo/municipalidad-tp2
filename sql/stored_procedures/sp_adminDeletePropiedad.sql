/*
 * Stored Procedure: csp_adminUpdateUsuario
 * Description: 
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_adminDeletePropiedad @numFincaInput INT
AS
BEGIN
	BEGIN TRY
		DECLARE @idPropiedad INT = (
				SELECT P.id
				FROM Propiedad P
				WHERE P.NumFinca = @numFincaInput
				);

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		DELETE
		FROM ComprobanteDePago
		WHERE idPropiedad = @idPropiedad

		DELETE
		FROM Recibo
		WHERE idPropiedad = @idPropiedad

		DELETE
		FROM PropiedadDelPropietario
		WHERE idPropiedad = @idPropiedad

		DELETE
		FROM UsuarioVsPropiedad
		WHERE idPropiedad = @idPropiedad

		DELETE
		FROM CCenPropiedad
		WHERE idPropiedad = @idPropiedad

		DELETE
		FROM Propiedad
		WHERE id = @idPropiedad

		COMMIT

		RETURN 0
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK

		RETURN - 1
	END CATCH
END
GO


