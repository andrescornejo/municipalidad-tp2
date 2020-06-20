/*
 * Stored Procedure: csp_getPropiedades
 * Description: 
 * Author: Andres Cornejo
 */
USE municipalidad
GO

CREATE
	OR

ALTER PROC csp_getPropiedades
AS
BEGIN
	SELECT P.numFinca AS [Identificacion],
		P.valor AS [Valor],
		P.Direccion AS [Direccion]
	FROM Propiedad P
END
	--EXEC csp_getPropiedades
