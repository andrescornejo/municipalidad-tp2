/*
 * Stored Procedure: csp_getPropiedadesDePropietario
 * Description: 
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_getPropiedadesDePropietario @idInput NVARCHAR(100)
AS
BEGIN
	DECLARE @idPropietario INT = (
			SELECT P.id
			FROM Propietario P
			WHERE @idInput = P.valorDocId
			);

	SELECT P.NumFinca AS [# Propiedad],
		P.Valor AS [Valor],
		P.Direccion AS [Direccion]
	FROM Propiedad P
	JOIN PropiedadDelPropietario PP ON P.id = PP.idPropietario
	WHERE @idPropietario = PP.idPropietario
END
	--EXEC csp_getPropiedadesDePropietario 301410305
