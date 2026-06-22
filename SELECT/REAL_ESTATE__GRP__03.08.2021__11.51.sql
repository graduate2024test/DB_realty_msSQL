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