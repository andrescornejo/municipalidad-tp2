/*	Script para llenar la tablas de ConceptoCobro con datos de prueba
	Autor: Andres Cornejo
*/
USE municipalidad
GO

DECLARE @hdoc INT;

SET IDENTITY_INSERT ConceptoCobro ON

DECLARE @ConceptoCobroXML XML;

SELECT @ConceptoCobroXML = C
FROM openrowset(BULK 'C:\xml\ConceptoCobro.xml', single_blob) AS ConceptoCobro(C)

EXEC sp_xml_preparedocument @hdoc OUT,
	@ConceptoCobroXML

INSERT dbo.ConceptoCobro (
	id,
	nombre,
	TasaInteresesMoratorios,
	DiaEmisionRecibo,
	QDiasVencimiento,
	EsRecurrente,
	EsImpuesto,
	activo
	)
SELECT id,
	Nombre,
	TasaInteresMoratoria,
	DiaCobro,
	QDiasVencimiento,
	EsRecurrente,
	EsImpuesto,
	1
FROM openxml(@hdoc, '/Conceptos_de_Cobro/conceptocobro', 1) WITH (
		id INT,
		Nombre NVARCHAR(MAX),
		TasaInteresMoratoria REAL,
		DiaCobro INT,
		QDiasVencimiento INT,
		EsRecurrente BIT,
		EsImpuesto BIT
		)

INSERT dbo.CC_ConsumoAgua (
	id,
	MontoM3,
	activo
	)
SELECT id,
	ValorM3,
	1
FROM openxml(@hdoc, '/Conceptos_de_Cobro/conceptocobro', 1) WITH (
		id INT,
		ValorM3 MONEY,
		TipoCC NVARCHAR(10)
		) AS X
WHERE X.TipoCC = 'CC Consumo'

INSERT dbo.CC_Porcentaje (
	id,
	ValorPorcentaje,
	activo)
SELECT id,
	ValorPorcentaje,
	1
FROM openxml(@hdoc, '/Conceptos_de_Cobro/conceptocobro', 1) WITH (
		id INT,
		ValorPorcentaje FLOAT,
		TipoCC NVARCHAR(13)
		) AS X
WHERE X.TipoCC = 'CC Porcentaje'

INSERT dbo.CC_Fijo (
	id,
	Monto,
	activo
	)
SELECT id,
	Monto,
	1
FROM openxml(@hdoc, '/Conceptos_de_Cobro/conceptocobro', 1) WITH (
	id INT,
	Monto MONEY,
	TipoCC NVARCHAR(7)
	) AS X
WHERE X.TipoCC = 'CC Fijo'

SELECT *
FROM ConceptoCobro

SELECT *
FROM CC_ConsumoAgua

SELECT *
FROM CC_Porcentaje

SELECT *
FROM CC_Fijo

EXEC sp_xml_removedocument @hdoc
GO


