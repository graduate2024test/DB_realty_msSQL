CREATE DATABASE REAL_ESTATE
GO

USE REAL_ESTATE
GO

CREATE TABLE dbo.Advertising  
   (
   AdvertisingID INT,  
   AreaM2 FLOAT(2),
   StreetID INT
   )  
GO 

CREATE TABLE Street
  (
  StreetID INT,
  StreetName nvarchar(30)
  )
GO
