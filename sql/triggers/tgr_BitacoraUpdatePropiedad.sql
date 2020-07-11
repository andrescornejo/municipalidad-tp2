/*
 * trigger: trgBitacoraUpdateProperty 
 * Description: 
 * Author: Pablo Alpizar
 */

USE municipalidad
GO

CREATE OR ALTER TRIGGER dbo.trgBitacoraUpdatePropiedad
ON dbo.Propiedad
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @jsonDespues NVARCHAR(500)
    DECLARE @idEntidad INT
    DECLARE @jsonAntes NVARCHAR(500)
    DECLARE @Estado NVARCHAR(15)

    SET @idEntidad = (SELECT P.id FROM INSERTED)

    SET @Estado = (SELECT CASE WHEN (SELECT P.activo FROM INSERTED P) = 1
                    THEN 'Activo'
                    ELSE 'Inactivo'
                    END)
                    
    SET @jsonAntes = (SELECT 
            P.NumFinca AS 'Numero Finca',
            P.valor AS 'Valor',
            P.Direccion AS 'Direccion',
            @Estado AS 'Estado',
            P.ConsumoAcumuladoM3 AS 'Consumo Acumuluado M3',
            P.UltimoConsumoM3 AS 'Consumo Acumulado M3 ultimo recibo'
        FROM INSERTED P
        FOR JSON PATH, ROOT('Propiedad'))

    SET @jsonDespues = (SELECT 
            P.NumFinca AS 'Numero Finca',
            P.valor AS 'Valor',
            P.Direccion AS 'Direccion',
            @Estado AS 'Estado',
            P.ConsumoAcumuladoM3 AS 'Consumo Acumuluado M3',
            P.UltimoConsumoM3 AS 'Consumo Acumulado M3 ultimo recibo'
        FROM INSERTED P
        FOR JSON PATH, ROOT('Propiedad'))
    
    INSERT INTO [dbo].[Bitacora] (
        idTipoEntidad,
        idEntidad,
        jsonAntes,
        jsonDespues,
        insertedAt,
        insertedBy,
        insertedIn
    )
    SELECT 
        T.id,
        @idEntidad,
        @jsonAntes,
        @jsonDespues,
        GETDATE(),
        CONVERT(NVARCHAR(100), (SELECT @@SERVERNAME)),
		'192.168.1.7'
    FROM [dbo].[TipoEntidad] T WHERE T.Nombre = 'Propiedad'

END