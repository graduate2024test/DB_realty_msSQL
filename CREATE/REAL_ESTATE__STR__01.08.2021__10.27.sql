/*
CREATE TABLE StreetTEST2
  (
  StreetID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT PK_StreetTEST2_StreetID PRIMARY KEY,
  StreetName nvarchar(30),
  StreetRank FLOAT
  )
GO

INSERT StreetTEST2 (StreetName, StreetRank)
	VALUES		('Улица1', 0.1),
				('Улица2', 0.2),
				('Улица3', 0.3),
				('Улица4', 0.4),
				('Улица5', 0.5)
GO

SELECT *
FROM StreetTEST2
GO
*/
------------------------------------------
--REPLACE
------------------------------------------
SELECT
REPLACE( StreetName, 'лиц', 'ООО' ) AS Street
FROM
	StreetTEST2
GO


------------------------------------------
--SUBSTRING
------------------------------------------
SELECT
SUBSTRING( StreetName, 2, 3 ) AS Street
FROM
	StreetTEST2
GO


------------------------------------------
--STUFF
------------------------------------------
SELECT
STUFF( StreetName, 2, 2, 'ООО' ) AS Street
FROM
	StreetTEST2
GO


------------------------------------------
--STR
------------------------------------------
SELECT
STR(StreetRank, 3 , 3) + ' rank' AS StRank
FROM
	StreetTEST2
GO


------------------------------------------
--UNICODE
------------------------------------------
SELECT
UNICODE(StreetName) AS Street
FROM
	StreetTEST2
GO


------------------------------------------
--LOWER
------------------------------------------
SELECT
LOWER(StreetName) AS Street
FROM
	StreetTEST2
GO


------------------------------------------
--UPPER
------------------------------------------
SELECT
UPPER(StreetName) AS Street
FROM
	StreetTEST2
GO
