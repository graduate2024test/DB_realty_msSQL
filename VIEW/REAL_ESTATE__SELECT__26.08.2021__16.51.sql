-------------------------------------
--NO INDEX
-------------------------------------
SET STATISTICS IO ON
SET STATISTICS TIME ON

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
ORDER BY
	Advertising_NO_INDEX_TEST.AreaM2 DESC
GO


SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT 
	Advertising_NO_INDEX_TEST.AreaM2, Conditions.ConditionsInfo,
	Street.StreetName, PropertyType.PropertyTypeInfo,
	ContractType.ContractTypeName, RealEstateBroker.RealEstateBrokerInfo
	
FROM
	Advertising_NO_INDEX_TEST
JOIN
	Conditions
ON
	(Conditions.ConditionsID = Advertising_NO_INDEX_TEST.ConditionsID)
JOIN
	Street
ON
	(Street.StreetID = Advertising_NO_INDEX_TEST.StreetID)
JOIN
	PropertyType
ON
	(PropertyType.PropertyTypeID = Advertising_NO_INDEX_TEST.PropertyTypeID)
JOIN
	ContractType
ON
	(ContractType.ContractTypeID = Advertising_NO_INDEX_TEST.ContractTypeID)
JOIN
	RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising_NO_INDEX_TEST.RealEstateBrokerID)
WHERE
	Advertising_NO_INDEX_TEST.AreaM2 BETWEEN 50 AND 150
GO


-------------------------------------
--NO CLAST (AreaM2)
-------------------------------------
SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT 
	Advertising_INDEX_TEST_NOCLAST.AreaM2,
	AVG(PriceHistory.PriceHistoryValue * RealEstateAgency.RealEstateAgencyCommission)
	AS Average_Comission
FROM
	PriceHistory
JOIN
	Advertising_INDEX_TEST_NOCLAST
ON
	(PriceHistory.AdvertisingID = Advertising_INDEX_TEST_NOCLAST.AdvertisingID)
JOIN
	RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising_INDEX_TEST_NOCLAST.RealEstateBrokerID)
JOIN
	RealEstateAgency
ON
	(RealEstateBroker.RealEstateAgencyID = RealEstateAgency.RealEstateAgencyID)
WHERE
	Advertising_INDEX_TEST_NOCLAST.AreaM2 BETWEEN 50 AND 150
GROUP BY
	Advertising_INDEX_TEST_NOCLAST.AreaM2
ORDER BY
	Advertising_INDEX_TEST_NOCLAST.AreaM2 DESC
GO


SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT 
	Advertising_INDEX_TEST_NOCLAST.AreaM2, Conditions.ConditionsInfo,
	Street.StreetName, PropertyType.PropertyTypeInfo,
	ContractType.ContractTypeName, RealEstateBroker.RealEstateBrokerInfo
	
FROM
	Advertising_INDEX_TEST_NOCLAST
JOIN
	Conditions
ON
	(Conditions.ConditionsID = Advertising_INDEX_TEST_NOCLAST.ConditionsID)
JOIN
	Street
ON
	(Street.StreetID = Advertising_INDEX_TEST_NOCLAST.StreetID)
JOIN
	PropertyType
ON
	(PropertyType.PropertyTypeID = Advertising_INDEX_TEST_NOCLAST.PropertyTypeID)
JOIN
	ContractType
ON
	(ContractType.ContractTypeID = Advertising_INDEX_TEST_NOCLAST.ContractTypeID)
JOIN
	RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising_INDEX_TEST_NOCLAST.RealEstateBrokerID)
WHERE
	Advertising_INDEX_TEST_NOCLAST.AreaM2 BETWEEN 50 AND 150
GO


-------------------------------------
--CLAST ()
-------------------------------------
SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT 
	Advertising_INDEX_TEST_CLAST.AreaM2,
	AVG(PriceHistory.PriceHistoryValue * RealEstateAgency.RealEstateAgencyCommission)
	AS Average_Comission
FROM
	PriceHistory
JOIN
	Advertising_INDEX_TEST_CLAST
ON
	(PriceHistory.AdvertisingID = Advertising_INDEX_TEST_CLAST.AdvertisingID)
JOIN
	RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising_INDEX_TEST_CLAST.RealEstateBrokerID)
JOIN
	RealEstateAgency
ON
	(RealEstateBroker.RealEstateAgencyID = RealEstateAgency.RealEstateAgencyID)
WHERE
	Advertising_INDEX_TEST_CLAST.AreaM2 BETWEEN 50 AND 150
GROUP BY
	Advertising_INDEX_TEST_CLAST.AreaM2
ORDER BY
	Advertising_INDEX_TEST_CLAST.AreaM2 DESC
GO


SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT 
	Advertising_INDEX_TEST_CLAST.AreaM2, Conditions.ConditionsInfo,
	Street.StreetName, PropertyType.PropertyTypeInfo,
	ContractType.ContractTypeName, RealEstateBroker.RealEstateBrokerInfo
	
FROM
	Advertising_INDEX_TEST_CLAST
JOIN
	Conditions
ON
	(Conditions.ConditionsID = Advertising_INDEX_TEST_CLAST.ConditionsID)
JOIN
	Street
ON
	(Street.StreetID = Advertising_INDEX_TEST_CLAST.StreetID)
JOIN
	PropertyType
ON
	(PropertyType.PropertyTypeID = Advertising_INDEX_TEST_CLAST.PropertyTypeID)
JOIN
	ContractType
ON
	(ContractType.ContractTypeID = Advertising_INDEX_TEST_CLAST.ContractTypeID)
JOIN
	RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising_INDEX_TEST_CLAST.RealEstateBrokerID)
WHERE
	Advertising_INDEX_TEST_CLAST.AreaM2 BETWEEN 50 AND 150
GO