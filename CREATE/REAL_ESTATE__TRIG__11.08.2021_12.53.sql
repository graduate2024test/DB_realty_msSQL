/*
CREATE TABLE RealEstateAgencyTEST
  (
  RealEstateAgencyID INT IDENTITY(1,1) NOT NULL,
  RealEstateAgencyInfo nvarchar(100),
  RealEstateAgencyCommission FLOAT
  )
GO


CREATE TABLE RealEstateBrokerTEST
  (
  RealEstateBrokerID INT IDENTITY(1,1) NOT NULL,
  RealEstateBrokerInfo nvarchar(100),
  RealEstateBrokerCommission FLOAT,
  RealEstateAgencyID INT
  )
GO


SELECT * FROM RealEstateBrokerTEST
GO


SELECT * FROM RealEstateAgencyTEST
GO


INSERT RealEstateAgencyTEST (RealEstateAgencyInfo, RealEstateAgencyCommission)
	VALUES		('Риэлторское агентство 1', 0.1)
GO


*/
------------------------------------------
--CREATE TRIGGER
------------------------------------------
------------------------------------------
--AFTER INSERT
------------------------------------------
CREATE TRIGGER broker_agency_check_trigger
	ON RealEstateBrokerTEST AFTER INSERT
	AS
BEGIN
	IF
		(
		SELECT RealEstateAgencyTEST.RealEstateAgencyID
		FROM RealEstateAgencyTEST, inserted
		WHERE RealEstateAgencyTEST.RealEstateAgencyID = inserted.RealEstateAgencyID
		) IS NULL
		
		BEGIN
			ROLLBACK TRANSACTION
			PRINT 'No insertion/modification of the row'
		END
	ELSE PRINT 'The row inserted/modified'
END
GO


INSERT RealEstateBrokerTEST (RealEstateBrokerInfo, RealEstateBrokerCommission, RealEstateAgencyID)
	VALUES		('Риэлтор ТЕСТ', 0.1, 0)
GO


INSERT RealEstateBrokerTEST (RealEstateBrokerInfo, RealEstateBrokerCommission, RealEstateAgencyID)
	VALUES		('Риэлтор ТЕСТ', 0.1, 1)
GO


------------------------------------------
--AFTER UPDATE
------------------------------------------
CREATE TRIGGER update_agency_trigger  
ON RealEstateAgencyTEST
AFTER UPDATE   
AS   
PRINT 'Average commission is update'
GO 


SELECT * FROM RealEstateAgencyTEST
GO


UPDATE RealEstateAgencyTEST
SET RealEstateAgencyInfo = 'McDonald'  
WHERE RealEstateAgencyCommission = 0.1  
GO  


SELECT AVG(RealEstateAgencyCommission) FROM RealEstateAgencyTEST
GO


------------------------------------------
--AFTER DELETE
------------------------------------------



------------------------------------------
--INSTEAD OF INSERT
------------------------------------------



------------------------------------------
--INSTEAD OF UPDATE
------------------------------------------



------------------------------------------
--INSTEAD OF DELETE
------------------------------------------



------------------------------------------
--DROP TRIGGER
------------------------------------------
DROP TRIGGER broker_agency_check_trigger
GO


DROP TRIGGER update_agency_trigger
GO


------------------------------------------
--DISABLE A TRIGGER
------------------------------------------
DISABLE TRIGGER broker_agency_check_trigger ON RealEstateBrokerTEST 
GO  


------------------------------------------
--DISABLE ALL TRIGGERS ON A TABLE
------------------------------------------
DISABLE TRIGGER ALL ON RealEstateBrokerTEST
GO


------------------------------------------
--ENABLE A TRIGGER
------------------------------------------
ENABLE TRIGGER broker_agency_check_trigger ON RealEstateBrokerTEST 
GO  


------------------------------------------
--ENABLE ALL TRIGGERS ON A TABLE
------------------------------------------
ENABLE TRIGGER ALL ON RealEstateBrokerTEST
GO



