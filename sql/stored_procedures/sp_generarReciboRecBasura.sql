/*
 * Stored Procedure: 
 * Description: 
 * Author: Pablo Alpizar
 */

use municipalidad
go

create or alter proc csp_generarReciboRecBasura @inFecha DATE 
as
begin
	begin try
		DECLARE @idCCBasura INT
		
		set nocount on        
		SELECT @DiaCobro = (SELECT C.DiaEmisionRecibo 
                            FROM [dbo].[ConceptoCobro] C 
                            WHERE C.nombre = 'Recolectar Basura')

        IF @DiaCobro != (SELECT EXTRACT (DAY FROM @inFecha))
        BEGIN
            RETURN
        END

		DECLARE @tmpPropiedadesCC_Licores TABLE(
            idPropiedad INT
        )

		SET @idCCBasura = (SELECT C.id FROM [dbo].[ConceptoCobro] C WHERE C.nombre = 'Recolectar Basura')
	
		INSERT INTO @tmpPropiedadesCC_Licores (idPropiedad)
        SELECT CP.idPropiedad FROM [dbo].[CCenPropiedad] CP WHERE CP.idConceptoCobro = @idCCBasura

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
			@idCCBasura,
			@inFecha,
			DATEADD(DAY,CC.QDiasVecimiento, inFecha),
			CF.Monto,
			1,
			1
		FROM tmpPropiedadesCC_Licores tmp
		INNER JOIN [dbo].[ConceptoCobro] CC ON @idCCBasura = CC.id
		INNER JOIN [dbo].[CC_Fijo] CF ON @idCCBasura = CF.id

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