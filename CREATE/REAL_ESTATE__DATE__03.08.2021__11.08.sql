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