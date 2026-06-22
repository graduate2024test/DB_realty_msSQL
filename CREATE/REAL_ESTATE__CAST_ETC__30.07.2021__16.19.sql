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