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
CREATE TRIGGER delete_agency_trigger  
ON RealEstateAgencyTEST
AFTER DELETE   
AS   
PRINT 'Agency was deleted'
GO 


SELECT * FROM RealEstateAgencyTEST
GO


DELETE FROM RealEstateAgencyTEST WHERE RealEstateAgencyInfo = 'McKlein'
GO


INSERT RealEstateAgencyTEST (RealEstateAgencyInfo, RealEstateAgencyCommission)
	VALUES		('McKlein', 0.375)
GO


------------------------------------------
--INSTEAD OF INSERT
------------------------------------------



------------------------------------------
--INSTEAD OF UPDATE
------------------------------------------
ALTER TABLE RealEstateAgencyTEST ADD RealEstateAgencyHist DATE
GO


CREATE TRIGGER istead_of_update_agency_trigger  
ON RealEstateAgencyTEST
INSTEAD OF UPDATE   
AS   
UPDATE RealEstateAgencyTEST
SET RealEstateAgencyHist = GETDATE()
WHERE RealEstateAgencyID =(SELECT RealEstateAgencyID FROM deleted)
GO


UPDATE RealEstateAgencyTEST
SET RealEstateAgencyInfo = 'bankruptcy update'
WHERE RealEstateAgencyID = 8
GO


SELECT * FROM RealEstateAgencyTEST
GO


------------------------------------------
--INSTEAD OF DELETE
------------------------------------------
CREATE TRIGGER istead_of_delete_agency_trigger  
ON RealEstateAgencyTEST
INSTEAD OF DELETE   
AS   
UPDATE RealEstateAgencyTEST
SET RealEstateAgencyInfo = 'bankruptcy procedure', RealEstateAgencyCommission = 0
WHERE RealEstateAgencyID =(SELECT RealEstateAgencyID FROM deleted)
GO


INSERT RealEstateAgencyTEST (RealEstateAgencyInfo, RealEstateAgencyCommission)
	VALUES		('McMill', 0.305)
GO


SELECT * FROM RealEstateAgencyTEST
GO


DELETE FROM RealEstateAgencyTEST WHERE RealEstateAgencyInfo = 'McMill'
GO


DROP TRIGGER istead_of_delete_agency_trigger
GO


DELETE FROM RealEstateAgencyTEST WHERE RealEstateAgencyID = 7
GO


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



