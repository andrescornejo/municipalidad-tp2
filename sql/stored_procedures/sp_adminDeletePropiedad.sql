/*
 * Stored Procedure: csp_adminDeletePropiedad
 * Description: Borrado logico de Objeto Entidad.
 * Author: Andres Cornejo
 * Modified by: Pablo Alpizar
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_adminDeletePropiedad @numFincaInput INT,
@inInsertedBy NVARCHAR(100),
@inInsertedIn NVARCHAR(20)
AS
BEGIN
	BEGIN TRY
		DECLARE @jsonAntes NVARCHAR(500)
		DECLARE @jsonDepues NVARCHAR(500)
		DECLARE @idEntidad INT
		DECLARE @idPropiedad INT = (
				SELECT P.id
				FROM Propiedad P
				WHERE P.NumFinca = @numFincaInput
				);
		DECLARE @tmpPropiedadDelPropietario TABLE (id INT)
		DECLARE @tmpUsuarioVsPropiedad TABLE (id INT)

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		BEGIN TRANSACTION

		UPDATE Propiedad
		SET activo = 0
		WHERE id = @idPropiedad

		UPDATE Reconteca
		SET activo = 0
		WHERE idPropiedad = @idPropiedad

		UPDATE Recibo
		SET activo = 0
		WHERE idPropiedad = @idPropiedad

		UPDATE PropiedadDelPropietario
		SET activo = 0
		WHERE idPropiedad = @idPropiedad

		INSERT INTO @tmpPropiedadDelPropietario (id)
		SELECT PP.id FROM [dbo].[PropiedadDelPropietario] PP WHERE PP.idPropiedad = @idPropiedad

		UPDATE UsuarioVsPropiedad
		SET activo = 0
		WHERE idPropiedad = @idPropiedad

		INSERT INTO @tmpUsuarioVsPropiedad(id)
		SELECT UP.id FROM [dbo].[UsuarioVsPropiedad] UP WHERE Up.idPropiedad = @idPropiedad

		UPDATE CCenPropiedad
		SET activo = 0
		WHERE idPropiedad = @idPropiedad

		UPDATE TransaccionConsumo
		SET activo = 0
		WHERE idPropiedad = @idPropiedad
		-- insert changes of PropiedadDelPropietario table into bitacora
		WHILE (SELECT COUNT(*) FROM @tmpPropiedadDelPropietario) > 0
		BEGIN
			SET @idEntidad = (SELECT TOP 1 tmpP.id FROM @tmpPropiedadDelPropietario tmpP)
			DELETE @tmpPropiedadDelPropietario WHERE id = @idEntidad
			SET @jsonAntes = (SELECT 
								F.NumFinca AS 'Numero Finca',
								P.nombre AS 'Propietario',
								P.valorDocid AS 'Identificacion',
								'Activo' AS 'Estado'
								FROM [dbo].[PropiedadDelPropietario] PP
								INNER JOIN [dbo].[Propietario] P ON P.id = PP.idPropietario
								INNER JOIN [dbo].[Propiedad] F ON F.id = PP.idPropiedad
								WHERE PP.id = @idEntidad 
							FOR JSON PATH, ROOT('Propiedad-Propietario'))
			SET @jsonDepues = (SELECT 
								F.NumFinca AS 'Numero Finca',
								P.nombre AS 'Propietario',
								P.valorDocid AS 'Identificacion',
								'Inactivo' AS 'Estado'
								FROM [dbo].[PropiedadDelPropietario] PP
								INNER JOIN [dbo].[Propietario] P ON P.id = PP.idPropietario
								INNER JOIN [dbo].[Propiedad] F ON F.id = PP.idPropiedad
								WHERE PP.id = @idEntidad 
							FOR JSON PATH, ROOT('Propiedad-Propietario'))
			
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
				@idEntidad,
				@jsonAntes,
				@jsonDepues,
				GETDATE(),
				@inInsertedBy,
				@inInsertedIn
			FROM [dbo].[TipoEntidad] T
			WHERE T.Nombre = 'PropiedadVsPropietario'
		END
		-- insert changes of UsuarioVsPropiedad table into bitacora
		WHILE(SELECT COUNT(*) FROM @tmpUsuarioVsPropiedad) > 0
		BEGIN
			SET @idEntidad = (SELECT TOP 1 tmpU.id FROM @tmpUsuarioVsPropiedad tmpU)
			DELETE @tmpUsuarioVsPropiedad WHERE id = @idEntidad
			
			SET @jsonAntes = (SELECT
								U.username AS 'Nombre de Usuario',
								F.NumFinca AS 'Numero de Finca',
								'Activo' AS 'Estado'
								FROM [dbo].[UsuarioVsPropiedad] UP
								INNER JOIN [dbo].[Usuario] U ON U.id = UP.idUsuario
								INNER JOIN [dbo].[Propiedad] F ON F.id = UP.idPropiedad
								WHERE Up.id = @idEntidad
							FOR JSON PATH, ROOT('Propiedad-Usuario'))
			SET @jsonDepues = (SELECT
								U.username AS 'Nombre de Usuario',
								F.NumFinca AS 'Numero de Finca',
								'Inactivo' AS 'Estado'
								FROM [dbo].[UsuarioVsPropiedad] UP
								INNER JOIN [dbo].[Usuario] U ON U.id = UP.idUsuario
								INNER JOIN [dbo].[Propiedad] F ON F.id = UP.idPropiedad
								WHERE Up.id = @idEntidad
							FOR JSON PATH, ROOT('Propiedad-Usuario'))

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
				@idEntidad,
				@jsonAntes,
				@jsonDepues,
				GETDATE(),
				@inInsertedBy,
				@inInsertedIn
			FROM [dbo].[TipoEntidad] T
			WHERE T.Nombre = 'PropiedadVsUsuario'
		END
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


