/*
 * Stored Procedure: csp_adminAddUser
 * Description: Borrado logico de objeto usuario.
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_adminDeleteUsuario @usuarioIDInput NVARCHAR(50)
AS
BEGIN
	DECLARE @idUsuario INT = (
			SELECT id
			FROM Usuario
			WHERE username = @usuarioIDInput
			)

	BEGIN TRY
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE UsuarioVsPropiedad
		SET activo = 0
		WHERE idUsuario = @idUsuario

		UPDATE Usuario
		SET activo = 0
		WHERE id = @idUsuario

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

--EXEC csp_adminDeleteUsuario 'lmaoxd'
