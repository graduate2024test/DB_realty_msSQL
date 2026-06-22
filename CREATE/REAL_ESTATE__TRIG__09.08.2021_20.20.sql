------------------------------------------
--CREATE TRIGGER
------------------------------------------
------------------------------------------
--AFTER INSERT
------------------------------------------
CREATE TRIGGER broker_agency_check_trigger
	ON RealEstateBroker AFTER INSERT, UPDATE
AS IF UPDATE(RealEstateAgencyID)
BEGIN
IF (
	SELECT RealEstateBroker.RealEstateAgencyID
	FROM RealEstateBroker, inserted
	WHERE RealEstateBroker.RealEstateAgencyID = inserted.RealEstateAgencyID
	) IS NULL
BEGIN
ROLLBACK TRANSACTION
PRINT 'No insertion/modification of the row'
END
ELSE PRINT 'The row inserted/modified'
END


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



