SET NUMERIC_ROUNDABORT OFF;
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT,
   QUOTED_IDENTIFIER, ANSI_NULLS ON;


IF OBJECT_ID ('AGREGATE_ADV_VIEW', 'VIEW') IS NOT NULL
   DROP VIEW AGREGATE_ADV_VIEW
GO


CREATE VIEW AGREGATE_ADV_VIEW
WITH SCHEMABINDING
AS
SELECT 
	Advertising.AreaM2, Conditions.ConditionsInfo,
	Street.StreetName, PropertyType.PropertyTypeInfo,
	ContractType.ContractTypeName, RealEstateBroker.RealEstateBrokerInfo
	
FROM
	dbo.Advertising
JOIN
	dbo.Conditions
ON
	(Conditions.ConditionsID = Advertising.ConditionsID)
JOIN
	dbo.Street
ON
	(Street.StreetID = Advertising.StreetID)
JOIN
	dbo.PropertyType
ON
	(PropertyType.PropertyTypeID = Advertising.PropertyTypeID)
JOIN
	dbo.ContractType
ON
	(ContractType.ContractTypeID = Advertising.ContractTypeID)
JOIN
	dbo.RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising.RealEstateBrokerID)
GO


CREATE UNIQUE CLUSTERED INDEX IDX_AGREGATE_ADV_V
   ON AGREGATE_ADV_VIEW (AreaM2)
GO


------------------------------------------------------
------------------------------------------------------

SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT AreaM2 FROM AGREGATE_ADV_VIEW
WITH (NOEXPAND)
GO




SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT AreaM2 FROM AGREGATE_ADV_VIEW
GO