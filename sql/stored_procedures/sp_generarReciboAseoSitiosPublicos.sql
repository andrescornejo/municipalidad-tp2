/*
 * Stored Procedure: 
 * Description: 
 * Author: Pablo Alpizar
 */

use municipalidad
go

create or alter proc csp_generarReciboAseoSitiosPublicos @inFecha DATE 
as
begin
	begin try
		DECLARE @idCCAseoSP INT
		
		set nocount on        
		SELECT @DiaCobro = (SELECT C.DiaEmisionRecibo 
                            FROM [dbo].[ConceptoCobro] C 
                            WHERE C.nombre = 'Aseo de Sitios Publico')

        IF @DiaCobro != (SELECT EXTRACT (DAY FROM @inFecha))
        BEGIN
            RETURN
        END

		DECLARE @tmpPropiedadesCC_AseoSitiosP TABLE(
            idPropiedad INT
        )

		SET @idCCAseoSP = (SELECT C.id FROM [dbo].[ConceptoCobro] C WHERE C.nombre = 'Aseo de Sitios Publico')
	
		INSERT INTO @tmpPropiedadesCC_AseoSitiosP (idPropiedad)
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
			@idCCAseoSP,
			@inFecha,
			DATEADD(DAY,CC.QDiasVecimiento, inFecha),
			CF.Monto,
			1,
			1
		FROM tmpPropiedadesCC_AseoSitiosP tmp
		INNER JOIN [dbo].[ConceptoCobro] CC ON @idCCAseoSP = CC.id
		INNER JOIN [dbo].[CC_Fijo] CF ON @idCCAseoSP = CF.id

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