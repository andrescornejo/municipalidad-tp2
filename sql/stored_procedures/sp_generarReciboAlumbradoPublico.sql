/*
 * Stored Procedure: 
 * Description: 
 * Author: Pablo Alpizar
 */

use municipalidad
go

create or alter proc csp_generarReciboAlumbradoPublico @inFecha DATE 
as
begin
	begin try
		DECLARE @idCCAlumbradoP INT
		
		set nocount on        
		SELECT @DiaCobro = (SELECT C.DiaEmisionRecibo 
                            FROM [dbo].[ConceptoCobro] C 
                            WHERE C.nombre = 'Alumbrado Publico')

        IF @DiaCobro != (SELECT EXTRACT (DAY FROM @inFecha))
        BEGIN
            RETURN
        END

		DECLARE @tmpPropiedadesCC_AlumbradoP TABLE(
            idPropiedad INT
        )

		SET @idCCAlumbradoP = (SELECT C.id FROM [dbo].[ConceptoCobro] C WHERE C.nombre = 'Alumbrado Publico')
	
		INSERT INTO @tmpPropiedadesCC_AlumbradoP (idPropiedad)
        SELECT CP.idPropiedad FROM [dbo].[CCenPropiedad] CP WHERE CP.idConceptoCobro = @idCCAlumbradoP

        INSERT INTO [dbo].[Recibo](
            idPropiedad,
            idConceptoCobro, 
            fecha, 
            fechaVencimiento, 
            monto,
            esPediente,
            Activo
        )
		SELECT
			tmp.idPropiedad,
			@idCCAlumbradoP,
			@inFecha,
			DATEADD(DAY,CC.QDiasVecimiento, inFecha),
			CF.Monto,
			1,
			1
		FROM tmpPropiedadesCC_AlumbradoP tmp
		INNER JOIN [dbo].[ConceptoCobro] CC ON @idCCAlumbradoP = CC.id
		INNER JOIN [dbo].[CC_Fijo] CF ON @idCCAlumbradoP = CF.id

	end try
	begin catch
		IF @@TRANCOUNT > 0
			ROLLBACK

		DECLARE @errorMsg NVARCHAR(200) = (
				SELECT ERROR_MESSAGE()
				)

		PRINT ('ERROR:' + @errorMsg)

		RETURN - 1 * @@ERROR
	end catch
end

go