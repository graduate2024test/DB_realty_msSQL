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