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

		DELETE
		FROM UsuarioVsPropiedad
		WHERE idUsuario = @idUsuario

		DELETE
		FROM Usuario
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
