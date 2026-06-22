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