/*	Script para llenar la tablas de ConceptoCobro con datos de prueba
	Autor: Andres Cornejo
*/
USE municipalidad
GO

DECLARE @hdoc INT;

SET IDENTITY_INSERT ConceptoCobro ON

DECLARE @ConceptoCobroXML XML;

SELECT @ConceptoCobroXML = C
FROM openrowset(BULK 'C:\xml\concepto_cobro.xml', single_blob) AS ConceptoCobro(C)

EXEC sp_xml_preparedocument @hdoc OUT,
	@ConceptoCobroXML

INSERT dbo.ConceptoCobro (
	id,
	nombre,
	TasaInteresesMoratorios,
	DiaEmisionRecibo,
	QDiasVencimiento,
	EsRecurrente,
	EsImpuesto
	)
SELECT id,
	Nombre,
	TasaInteresMoratoria,
	DiaCobro,
	QDiasVencimiento,
	EsRecurrente,
	EsImpuesto
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
	ConsumoM3
	)
SELECT id,
	ConsumoM3
FROM openxml(@hdoc, '/Conceptos_de_Cobro/ccagua', 1) WITH (
		id INT,
		ConsumoM3 INT
		)

INSERT dbo.CC_Porcentaje (
	id,
	ValorPorcentaje
	)
SELECT id,
	ValorPorcentaje
FROM openxml(@hdoc, '/Conceptos_de_Cobro/ccporcentual', 1) WITH (
		id INT,
		ValorPorcentaje FLOAT
		)

INSERT dbo.CC_Fijo (
	id,
	MontoFijo
	)
SELECT id,
	Monto
FROM openxml(@hdoc, '/Conceptos_de_Cobro/ccfijo', 1) WITH (
		id INT,
		Monto MONEY
		)

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


