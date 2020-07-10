/*
 * trigger: trgBitacoraAddProperty 
 * Description: 
 * Author: Pablo Alpizar
 */

USE municipalidad
GO

CREATE OR ALTER TRIGGER dbo.trgBitacoraAddPropiedad
ON [dbo].[Propiedad]
AFTER  INSERT
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @jsonDespues NVARCHAR(500)
    DECLARE @idEntidad INT

    SET @idEntidad = (SELECT P.id FROM INSERTED P)

    SET @jsonDespues = (SELECT 
                            P.NumFinca AS 'Numero Finca',
                            P.valor AS 'Valor',
                            P.Direccion AS 'Direccion',
                            'Activo' AS 'Estado',
                            P.ConsumoAcumuladoM3 AS 'Consumo Acumuluado M3',
                            P.UltimoConsumoM3 AS 'Consumo Acumulado M3 ultimo recibo'
                        FROM INSERTED P
                        FOR JSON PATH, ROOT('Propiedad'))
    
    INSERT INTO [dbo].[Bitacora] (
        idTipoEntidad,
        idEntidad,
        jsonDespues,
        insertedAt,
        insertedBy,
        insertedIn
    ) 
    SELECT
        T.id,
        @idEntidad,
        @jsonDespues,
        GETDATE(),
        CONVERT(NVARCHAR(100), (SELECT @@SERVERNAME)),
		'192.168.1.7'
    FROM [dbo].[TipoEntidad] T WHERE T.Nombre = 'Propiedad'

END