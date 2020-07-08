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
        DECLARE @idCCAgua INT
        DECLARE @Monto MONEY
        DECLARE @ValorM3 MONEY
        DECLARE @MontoMinimo MONEY
        DECLARE @QDias INT
        DECLARE @ConsumoM3 INT
        DECLARE @UltimoConsumoM3 INT

        set nocount on
        SELECT @DiaCobro = (SELECT C.DiaEmisionRecibo 
                            FROM [dbo].[ConceptoCobro] C 
                            WHERE C.nombre = 'Agua')

        IF @DiaCobro != (SELECT EXTRACT (DAY FROM @inFecha))
        BEGIN
            RETURN
        END

        DECLARE @tmpPropiedadesCC_Agua TABLE(
            idPropiedad INT
        )

        DECLARE @tmpRecibos TABLE(
            idPropiedad INT,
            idConceptoCobro INT,
            Fecha DATE,
            FechaVencimiento DATE,
            Monto MONEY
            )

        SET @idCCAgua = (SELECT C.id FROM [dbo].[ConceptoCobro] C WHERE C.nombre = 'Agua')
        
        SET @ValorM3 = (SELECT CA.ValorM3 FROM [dbo].[CC_ConsumoAgua] CA WHERE CA.id = @idCCAgua)
        
        SET @MontoMinimo = (SELECT CA.MontoMinimo FROM [dbo].[CC_ConsumoAgua] CA WHERE CA.id = @idCCAgua)
        
        SET @QDias = (SELECT CC.QDiasVencimiento FROM [dbo].[ConceptoCobro] CC WHERE CC.id = @idCCAgua)
        
        INSERT INTO @tmpPropiedadesCC_Agua (idPropiedad)
        SELECT CP.idPropiedad FROM [dbo].[CCenPropiedad] CP WHERE CP.idConceptoCobro = @idCCAgua
        
        WHILE (SELECT COUNT(*) FROM tmpPropiedadesCC_Agua) > 0
        BEGIN
            SELECT TOP 1 @idPropiedad = tmp.idPropiedad FROM tmpPropiedadesCC_Agua tmp
            
            SET @ConsumoM3 = (SELECT P.ConsumoAcumuladoM3 FROM [dbo].[Propiedad] P WHERE P.id = @idPropiedad)

            SET @UltimoConsumoM3 = (SELECT P.UltimoConsumoM3 FROM [dbo].[Propiedad] P WHERE P.id = @idPropiedad)

            SET @Monto =
                CASE WHEN (@ConsumoM3 - @UltimoConsumoM3) * @ValorM3 > @MontoMinimo
                    THEN (@ConsumoM3 - @UltimoConsumoM3) * @ValorM3
                    ELSE @MontoMinimo
                END   
            INSERT INTO tmpRecibos (idPropiedad, idCCAgua, Fecha, FechaVencimiento, Monto)
            SELECT @idPropiedad, @idCCAgua, @inFecha, DATEADD(DAY, @QDias, @inFecha,@Monto)  
            FROM tmpPropiedadesCC_Agua tmpP

            DELETE TOP (1) FROM tmpPropiedadesCC_Agua
        END

        INSERT INTO @tmpPropiedadesCC_Agua (idPropiedad)
        SELECT CP.idPropiedad FROM [dbo].[CCenPropiedad] CP WHERE CP.idConceptoCobro = @idCCAgua
        
        SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

        BEGIN TRANSACTION
            INSERT INTO [dbo].[Recibo](
                idPropiedad,
                idConceptoCobro, 
                fecha, 
                fechaVencimiento, 
                monto,
                esPediente,
                Activo
            )
            SELECT tmp.*, 1,1
            FROM tmpRecibos tmp

            WHILE (SELECT COUNT(*) FROM tmpPropiedadesCC_Agua) > 0
            BEGIN
                SELECT TOP 1 @idPropiedad = tmp.idPropiedad FROM tmpPropiedadesCC_Agua tmp
                UPDATE [dbo].[Propiedad]
                    SET UltimoConsumoM3 = ConsumoAcumuladoM3
                WHERE id = @idPropiedad 
                -- insert change into bitacora
                DELETE TOP (1) FROM tmpPropiedadesCC_Agua
            END
        COMMIT
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