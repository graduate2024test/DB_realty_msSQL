CREATE VIEW Average_Comission_50_150_VIEW
AS
SELECT 
	Advertising_NO_INDEX_TEST.AreaM2,
	AVG(PriceHistory.PriceHistoryValue * RealEstateAgency.RealEstateAgencyCommission)
	AS Average_Comission
FROM
	PriceHistory
JOIN
	Advertising_NO_INDEX_TEST
ON
	(PriceHistory.AdvertisingID = Advertising_NO_INDEX_TEST.AdvertisingID)
JOIN
	RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising_NO_INDEX_TEST.RealEstateBrokerID)
JOIN
	RealEstateAgency
ON
	(RealEstateBroker.RealEstateAgencyID = RealEstateAgency.RealEstateAgencyID)
WHERE
	Advertising_NO_INDEX_TEST.AreaM2 BETWEEN 50 AND 150
GROUP BY
	Advertising_NO_INDEX_TEST.AreaM2
GO


SELECT * FROM Average_Comission_50_150_VIEW
GO
-------------------------------------------
-------------------------------------------




CREATE VIEW Agregate_Advertising_VIEW
AS
SELECT 
	Advertising.AreaM2, Conditions.ConditionsInfo,
	Street.StreetName, PropertyType.PropertyTypeInfo,
	ContractType.ContractTypeName, RealEstateBroker.RealEstateBrokerInfo
	
FROM
	Advertising
JOIN
	Conditions
ON
	(Conditions.ConditionsID = Advertising.ConditionsID)
JOIN
	Street
ON
	(Street.StreetID = Advertising.StreetID)
JOIN
	PropertyType
ON
	(PropertyType.PropertyTypeID = Advertising.PropertyTypeID)
JOIN
	ContractType
ON
	(ContractType.ContractTypeID = Advertising.ContractTypeID)
JOIN
	RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising.RealEstateBrokerID)
WHERE
	Advertising.AreaM2 BETWEEN 50 AND 150
GO


SELECT * FROM Agregate_Advertising_VIEW
GO
-------------------------------------------
-------------------------------------------




CREATE VIEW AVG_perM2_Broker_VIEW
AS
SELECT
	RealEstateBroker.RealEstateBrokerInfo,
	cast( AVG((PriceHistory.PriceHistoryValue / Advertising.AreaM2)
	* RealEstateBroker.RealEstateBrokerCommission
	* 1000) AS NUMERIC(15,2)) AS Average_per_M2
FROM
	Advertising
INNER JOIN
	RealEstateBroker
ON RealEstateBroker.RealEstateBrokerID = Advertising.RealEstateBrokerID
INNER JOIN
	PriceHistory
ON Advertising.AdvertisingID = PriceHistory.AdvertisingID

GROUP BY
	RealEstateBroker.RealEstateBrokerInfo
GO


SELECT * FROM AVG_perM2_Broker_VIEW
GO
-------------------------------------------
-------------------------------------------




CREATE VIEW BrokerCommission_between_7_9_percent_VIEW
AS
SELECT RealEstateBrokerInfo, RealEstateBrokerCommission FROM RealEstateBroker
WHERE RealEstateBrokerCommission BETWEEN 0.07 AND 0.09
WITH CHECK OPTION
GO


SELECT RealEstateBrokerInfo, RealEstateBrokerCommission FROM RealEstateBroker
WHERE RealEstateBrokerCommission BETWEEN 0.07 AND 0.09
GO


SELECT * FROM BrokerCommission_between_7_9_percent_VIEW
GO


UPDATE BrokerCommission_between_7_9_percent_VIEW
SET RealEstateBrokerCommission = 0.077
WHERE RealEstateBrokerInfo = 'Broker 003'
GO