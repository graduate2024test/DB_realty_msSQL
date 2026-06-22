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