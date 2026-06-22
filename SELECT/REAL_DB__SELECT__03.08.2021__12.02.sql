/*
INSERT Street (StreetName, StreetRank)
	VALUES		('“лица6', 0.6)
GO

INSERT Street (StreetName, StreetRank)
	VALUES		('“лица3', 0.7)
GO

INSERT Advertising (AreaM2, ConditionsID, StreetID, PropertyTypeID, ContractTypeID, RealEstateBrokerID)
	VALUES		(600, 10, NULL, 13, 10, 10)
GO
*/


------------------------------------------
--INNER JOIN
------------------------------------------
SELECT
  -- Перечисляем столбцы, которые хотим вывести
	Advertising.AreaM2,
	Street.StreetName  
FROM
  -- таблицы для соединения перечисляем в предложении from 
	Advertising
  -- обратите внимание, что мы не указали вид соединения, поэтому выполнится внутренний (inner) джойн
INNER JOIN
	Street
    -- условия соединения прописываются после ON
    -- условий может быть несколько, записанных через and, or и т.п.
ON Advertising.StreetID = Street.StreetID
GO


------------------------------------------
--OUTER JOIN
------------------------------------------
SELECT
	Advertising.AreaM2,
	Street.StreetName  
FROM
 	Advertising
LEFT OUTER JOIN
	Street
ON Advertising.StreetID = Street.StreetID
GO


SELECT
	Advertising.AreaM2,
	Street.StreetName  
FROM
 	Advertising
RIGHT OUTER JOIN
	Street
ON Advertising.StreetID = Street.StreetID
GO


------------------------------------------
--CROSS JOIN
------------------------------------------
 SELECT
	Advertising.StreetID, Advertising.AreaM2,
	Street.StreetID, Street.StreetName  
FROM 
	Advertising 
CROSS JOIN
	Street
GO


------------------------------------------
--CROSS APPLY
------------------------------------------
SELECT * FROM Advertising 
CROSS APPLY 
   (
   SELECT * FROM Street 
   WHERE Street.StreetID = Advertising.StreetID 
   ) CrossApplyAdvStr
GO


------------------------------------------
--SELF-JOINS
------------------------------------------
SELECT   
	Street.StreetName,   
	Street.StreetRank,   
	StreetREP.StreetName,   
	StreetREP.StreetRank
FROM   
    Street
INNER JOIN  
	Street StreetREP   
ON
	Street.StreetID = StreetREP.StreetID  
WHERE  
	Street.StreetName = 'Улица3'
GO



--************************************************************************
--************************************************************************
--************************************************************************
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



--************************************************************************
--************************************************************************
--************************************************************************
------------------------------------------
--CASE 1
------------------------------------------
SELECT
  RealEstateBrokerInfo,RealEstateBrokerCommission,RealEstateAgencyID,

  CASE
    WHEN RealEstateBrokerCommission >= 0.5 THEN 'Комисиионные >= 50%'
    WHEN RealEstateBrokerCommission >= 0.4 THEN '40% <= Комисиионные < 50%'
    ELSE 'Комисиионные < 40%'
  END CommissionType

FROM RealEstateBroker
GO


------------------------------------------
--CASE 2
------------------------------------------
SELECT
  RealEstateBrokerInfo,RealEstateBrokerCommission,RealEstateAgencyID,

  CASE RealEstateAgencyID
    WHEN 6 THEN '20%'
    WHEN 9 THEN '30%'
    ELSE '10%'
  END NewYearBonusPercent,

  RealEstateBrokerCommission * 1000 *
  CASE RealEstateAgencyID
    WHEN 6 THEN 20
    WHEN 9 THEN 30
    ELSE 10
  END BonusAmount

FROM RealEstateBroker
GO



--************************************************************************
--************************************************************************
--************************************************************************
/*
CREATE TABLE StreetTEST
  (
  StreetID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT PK_StreetTEST_StreetID PRIMARY KEY,
  StreetName1 nvarchar(30),
  StreetName2 nvarchar(30),
  StreetName3 nvarchar(30),
  StreetRank FLOAT
  )
GO

INSERT StreetTEST (StreetName1, StreetName2, StreetName3, StreetRank)
	VALUES		('Улица1', NULL, NULL, 0.1),
				(NULL, 'Улица2', NULL, 0.2),
				(NULL, NULL, 'Улица3', 0.3),
				(NULL, 'Улица4', NULL, 0.4),
				('Улица5', NULL, NULL, 0.5)
GO

SELECT *
FROM StreetTEST
GO
*/
------------------------------------------
--CAST
------------------------------------------
SELECT 'Средняя комиссия риэлтора = '+ CAST(AVG(RealEstateBrokerCommission) AS CHAR(3))  AS AverageComission
FROM RealEstateBroker
GO


------------------------------------------
--CONVERT
------------------------------------------
SELECT RealEstateBrokerInfo, CONVERT( MONEY, RealEstateBrokerCommission * 1000 ) AS Comission
FROM RealEstateBroker
GO


------------------------------------------
--ISNULL
------------------------------------------
SELECT ISNULL( NULL , 0.0 ) AS Comission
FROM RealEstateBroker
GO

SELECT ISNULL( RealEstateBrokerCommission , 0.0 ) AS Comission
FROM RealEstateBroker
GO


------------------------------------------
--NULLIF
------------------------------------------
SELECT NULLIF(  RealEstateBrokerCommission, 0.4 ) AS Comission
FROM RealEstateBroker
GO


------------------------------------------
--COALESCE
------------------------------------------
SELECT COALESCE( StreetName1, StreetName2, StreetName3 )
FROM StreetTEST
GO

SELECT * FROM StreetTEST
GO


------------------------------------------
--CHOOSE
------------------------------------------
SELECT
	* ,
CHOOSE ((RealEstateAgencyID - 5), 'Агентство1', 'Агентство2', 'Агентство3') AS Agency
FROM RealEstateBroker
GO


------------------------------------------
--IIF
------------------------------------------
DECLARE 
	@true_value VARCHAR(22) = 'Комиссия ВЫШЕ среднего',
	@false_value VARCHAR(22) = 'Комиссия НИЖЕ среднего';
SELECT RealEstateBrokerInfo , IIF ( RealEstateBrokerCommission > 0.4, @true_value, @false_value ) AS Result
FROM
	RealEstateBroker
GO



--************************************************************************
--************************************************************************
--************************************************************************
/*
CREATE TABLE StreetTEST2
  (
  StreetID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT PK_StreetTEST2_StreetID PRIMARY KEY,
  StreetName nvarchar(30),
  StreetRank FLOAT
  )
GO

INSERT StreetTEST2 (StreetName, StreetRank)
	VALUES		('”лица1', 0.1),
				('”лица2', 0.2),
				('”лица3', 0.3),
				('”лица4', 0.4),
				('”лица5', 0.5)
GO

SELECT *
FROM StreetTEST2
GO
*/
------------------------------------------
--REPLACE
------------------------------------------
SELECT
REPLACE( StreetName, 'лиц', 'ќќќ' ) AS Street
FROM
	StreetTEST2
GO


------------------------------------------
--SUBSTRING
------------------------------------------
SELECT
SUBSTRING( StreetName, 2, 3 ) AS Street
FROM
	StreetTEST2
GO


------------------------------------------
--STUFF
------------------------------------------
SELECT
STUFF( StreetName, 2, 2, 'ќќќ' ) AS Street
FROM
	StreetTEST2
GO


------------------------------------------
--STR
------------------------------------------
SELECT
STR(StreetRank, 3 , 3) + ' rank' AS StRank
FROM
	StreetTEST2
GO


------------------------------------------
--UNICODE
------------------------------------------
SELECT
UNICODE(StreetName) AS Street
FROM
	StreetTEST2
GO


------------------------------------------
--LOWER
------------------------------------------
SELECT
LOWER(StreetName) AS Street
FROM
	StreetTEST2
GO


------------------------------------------
--UPPER
------------------------------------------
SELECT
UPPER(StreetName) AS Street
FROM
	StreetTEST2
GO



--************************************************************************
--************************************************************************
--************************************************************************
------------------------------------------
--DATEPART
------------------------------------------
SELECT
DATEPART(year, PriceHistoryData) AS Year,
DATEPART(quarter, PriceHistoryData) AS Quarter
FROM
	PriceHistory
GO


------------------------------------------
--DATEADD
------------------------------------------
SELECT
PriceHistoryData AS BeforeApp,
DATEADD(month, -6, PriceHistoryData) AS AfterApp
FROM
	PriceHistory
GO


------------------------------------------
--DATEDIFF
------------------------------------------
SELECT
DATEDIFF(day, PriceHistoryData, '25.12.2017') AS DaysAmount
FROM
	PriceHistory
GO


------------------------------------------
--GETDATE()
------------------------------------------
SELECT
DATEDIFF(day, PriceHistoryData, GETDATE()) AS TodaysAmount,
GETDATE() AS Today
FROM
	PriceHistory
GO


------------------------------------------
--SYSDATETIMEOFFSET()
------------------------------------------
SELECT
DATEDIFF(day, PriceHistoryData, GETDATE()) AS TodaysAmount,
GETDATE() AS Today,
SYSDATETIMEOFFSET() AS SysDate
FROM
	PriceHistory
GO



--************************************************************************
--************************************************************************
--************************************************************************
------------------------------------------
--GROUP BY
------------------------------------------
 SELECT * FROM Advertising
 GO
 

 SELECT
	RealEstateBrokerID, SUM(AreaM2) AS TotalAreaBroker
 FROM 
	Advertising
 GROUP BY
	RealEstateBrokerID
 GO


------------------------------------------
--HAVING
------------------------------------------
 SELECT
	RealEstateBrokerID, SUM(AreaM2) AS TotalAreaBroker
 FROM 
	Advertising
 GROUP BY
	RealEstateBrokerID
HAVING
	RealEstateBrokerID = 8 OR RealEstateBrokerID = 10
 GO

