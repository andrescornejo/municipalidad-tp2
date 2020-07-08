/*
 * Stored Procedure: 
 * Description: 
 * Author: Pablo Alpizar
 */

use municipalidad
go

create or alter proc csp_generarReciboManteParques @inFecha DATE 
as
begin
	begin try
		DECLARE @idCCMantemP INT
		
		set nocount on        
		SELECT @DiaCobro = (SELECT C.DiaEmisionRecibo 
                            FROM [dbo].[ConceptoCobro] C 
                            WHERE C.nombre = 'Mantenimiento de Parques')

        IF @DiaCobro != (SELECT EXTRACT (DAY FROM @inFecha))
        BEGIN
            RETURN
        END

		DECLARE @tmpPropiedadesCC_MantemP TABLE(
            idPropiedad INT
        )

		SET @idCCMantemP = (SELECT C.id FROM [dbo].[ConceptoCobro] C WHERE C.nombre = 'Mantenimiento de Parques')
	
		INSERT INTO @tmpPropiedadesCC_MantemP (idPropiedad)
        SELECT CP.idPropiedad FROM [dbo].[CCenPropiedad] CP WHERE CP.idConceptoCobro = @idCCMantemP

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
			@idCCMantemP,
			@inFecha,
			DATEADD(DAY,CC.QDiasVecimiento, inFecha),
			CF.Monto,
			1,
			1
		FROM tmpPropiedadesCC_MantemP tmp
		INNER JOIN [dbo].[ConceptoCobro] CC ON @idCCMantemP = CC.id
		INNER JOIN [dbo].[CC_Fijo] CF ON @idCCMantemP = CF.id

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