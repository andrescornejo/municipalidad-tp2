/*
 * Stored Procedure: csp_adminUpdatePropietario
 * Description: Actualizacion de informacion a Propietario por parte de un Admin.
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_adminUpdatePropietario @inputOLDDocID NVARCHAR(50),
	@inputName NVARCHAR(50),
	@inputDocIDVal NVARCHAR(100),
	@inputDocID NVARCHAR(50),
	@inputInsertedBy NVARCHAR(100),
	@inputInsertedIn NVARCHAR(20)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON

		DECLARE @idPropietario INT
		DECLARE @jsonAntes NVARCHAR(500)
		DECLARE @jsonDespues NVARCHAR(500)

		EXEC @idPropietario = csp_getPropietarioIDFromDocID @inputOLDDocID

		DECLARE @DocidID INT

		EXEC @DocidID = csp_getDocidIDFromName @inputDocID

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		SET @jsonAntes = (SELECT 
						P.Nombre, 
						T.nombre, 
						P.valorDocID, 
						P.activo
					FROM [dbo].[Propietario] P
					INNER JOIN [dbo].[TipoDocID] T ON P.idTipoDocID = T.id
					WHERE P.id = @idPropietario 
					FOR JSON PATH)

		BEGIN TRANSACTION

		UPDATE Propietario
		SET nombre = @inputName,
			valorDocID = @inputDocIDVal,
			idTipoDocID = @DocidID
		WHERE valorDocID = @inputOLDDocID and activo = 1

		

		-- insert change into bitacora

		SET @jsonDespues = (SELECT 
								P.Nombre, 
								T.nombre, 
								P.valorDocID, 
								P.activo
							FROM [dbo].[Propietario] P
							INNER JOIN [dbo].[TipoDocID] T ON P.idTipoDocID = T.id
							WHERE P.id = @idPropietario
							FOR JSON PATH)

		INSERT INTO [dbo].[Bitacora] (
			idTipoEntidad,
			idEntidad,
			jsonAntes, 
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
		) SELECT
			T.id,
			@idPropietario,
			@jsonAntes,
			@jsonDespues,
			GETDATE(),
			@inputInsertBy,
			@inputInsertIn
		FROM [dbo].[TipoEntidad] T
		WHERE T.Nombre = 'Propietario'
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


