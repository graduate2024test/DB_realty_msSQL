/*
INSERT Advertising (AreaM2, ConditionsID, StreetID, PropertyTypeID, ContractTypeID, RealEstateBrokerID)
	VALUES		(700, 9, 8, 12, 9, 8)
GO


INSERT RealEstateBroker(RealEstateBrokerInfo,RealEstateBrokerCommission,RealEstateAgencyID)
	VALUES		('Риэлтор 22', 0.9, 6)
GO
*/
------------------------------------------
--EXISTS
------------------------------------------
SELECT
	AreaM2, StreetID 
FROM
	Advertising
WHERE EXISTS
	(
	SELECT * FROM Advertising
	WHERE StreetID = StreetID
	)
GO

SELECT
	AreaM2, StreetID 
FROM
	Advertising
WHERE EXISTS
	(
	SELECT * FROM Advertising
	WHERE StreetID = NULL
	)
GO


------------------------------------------
--IN
------------------------------------------
SELECT * FROM Street 
WHERE
	StreetName IN ( 'Улица3', 'Улица6' )
GO 


------------------------------------------
--ALL
------------------------------------------
SELECT * FROM Street 
WHERE StreetRank > ALL
	(
	SELECT StreetRank FROM Street 
    WHERE StreetName = 'Улица4'
	)
GO 


------------------------------------------
--SOME/ANY
------------------------------------------
 SELECT * FROM Advertising
 WHERE StreetID = ANY
	(
	SELECT StreetID FROM Street
	WHERE StreetName = 'Улица3'
	)
GO 

 SELECT * FROM Advertising
 WHERE StreetID = SOME
	(
	SELECT StreetID FROM Street
	WHERE StreetName = 'Улица3'
	)
GO 


------------------------------------------
--BETWEEN
------------------------------------------
SELECT * FROM RealEstateBroker
WHERE
	RealEstateBrokerCommission
BETWEEN .20 AND .40
GO


------------------------------------------
--LIKE
------------------------------------------
SELECT * FROM RealEstateBroker 
WHERE
	RealEstateBrokerInfo LIKE '%2%'
GO 