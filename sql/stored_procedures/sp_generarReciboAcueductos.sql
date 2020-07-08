/*
 * Stored Procedure: 
 * Description: 
 * Author: Pablo Alpizar
 */

use municipalidad
go

create or alter proc csp_generarReciboAcueductos @inFecha DATE 
as
begin
	begin try
		DECLARE @idCCAcueductos INT
		
		set nocount on        
		SELECT @DiaCobro = (SELECT C.DiaEmisionRecibo 
                            FROM [dbo].[ConceptoCobro] C 
                            WHERE C.nombre = 'Acueductos')

        IF @DiaCobro != (SELECT EXTRACT (DAY FROM @inFecha))
        BEGIN
            RETURN
        END

		DECLARE @tmpPropiedadesCC_Acueductos TABLE(
            idPropiedad INT
        )

		SET @idCCAcueductos = (SELECT C.id FROM [dbo].[ConceptoCobro] C WHERE C.nombre = 'Acueductos')
	
		INSERT INTO @tmpPropiedadesCC_Acueductos (idPropiedad)
        SELECT CP.idPropiedad FROM [dbo].[CCenPropiedad] CP WHERE CP.idConceptoCobro = @idCCAcueductos

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
			@idCCAcueductos,
			@inFecha,
			DATEADD(DAY,CC.QDiasVecimiento, inFecha),
			CF.Monto,
			1,
			1
		FROM tmpPropiedadesCC_Acueductos tmp
		INNER JOIN [dbo].[ConceptoCobro] CC ON @idCCAcueductos = CC.id
		INNER JOIN [dbo].[CC_Fijo] CF ON @idCCAcueductos = CF.id

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