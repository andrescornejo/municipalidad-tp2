/*
 * Stored Procedure: 
 * Description: 
 * Author: Pablo Alpizar
 */

use municipalidad
go

create or alter proc csp_generarRecibosAgua @inFecha DATE 
as
begin
	begin try
		set nocount on
        DECLARE @FechaCobro DATE
        SET @FechaCobro = (SELECT C.DiaEmisionRecibo 
                            FROM [dbo].[ConceptoCobro] C 
                            WHERE C.nombre = "Agua")

        IF @FechaCobro != @inFecha
        BEGIN
            RETURN
        END

        DECLARE @tmpCCPropiedades (
            idPropiedad INT,
            
        )

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