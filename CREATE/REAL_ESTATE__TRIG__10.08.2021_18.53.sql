------------------------------------------
--CREATE TRIGGER
------------------------------------------
------------------------------------------
--AFTER INSERT
------------------------------------------
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

SELECT * FROM RealEstateBrokerTEST
GO

SELECT * FROM RealEstateAgencyTEST
GO

INSERT RealEstateBrokerTEST (RealEstateBrokerInfo, RealEstateBrokerCommission, RealEstateAgencyID)
	VALUES		('Риэлтор ТЕСТ', 0.1, 0)
GO

INSERT RealEstateAgencyTEST (RealEstateAgencyInfo, RealEstateAgencyCommission)
	VALUES		('Риэлторское агентство 1', 0.1)
GO

INSERT RealEstateBrokerTEST (RealEstateBrokerInfo, RealEstateBrokerCommission, RealEstateAgencyID)
	VALUES		('Риэлтор ТЕСТ', 0.1, 1)
GO



------------------------------------------
--AFTER UPDATE
------------------------------------------



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


------------------------------------------
--DISABLE A TRIGGER
------------------------------------------



------------------------------------------
--DISABLE ALL TRIGGERS ON A TABLE
------------------------------------------



------------------------------------------
--ENABLE A TRIGGER
------------------------------------------



------------------------------------------
--ENABLE ALL TRIGGERS ON A TABLE
------------------------------------------



