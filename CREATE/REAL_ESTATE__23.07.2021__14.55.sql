CREATE DATABASE REAL_ESTATE
GO

USE REAL_ESTATE
GO

CREATE TABLE dbo.Advertising  
   (
   AdvertisingID INT PRIMARY KEY,  
   AreaM2 FLOAT(2),
   StreetID INT
   CONSTRAINT FK_Advertising FOREIGN KEY (StreetID) REFERENCES Street(StreetID) 
   )  
GO 

CREATE TABLE Street
  (
  StreetID INT PRIMARY KEY,
  StreetName nvarchar(30)
  )
GO

ALTER TABLE Street ADD RankValue INT CHECK(RankValue BETWEEN 0 AND 101)
GO

DROP TABLE Street
GO

SELECT * FROM Advertising
GO

SELECT * FROM Street
GO

ALTER TABLE Street ALTER COLUMN StreetID 
GO


INSERT Street (StreetID,StreetName,RankValue)
VALUES
(001,'Чернышевского',70),
(002,'Горького',60),
(003,'Вольская',50),
(004,'Чапаева',50),
(005,'Дзержинского',50),
(006,'Яблочкова',50),
(007,'Киселева',40)
GO

INSERT Advertising (AdvertisingID,AreaM2,StreetID,ContractType)
VALUES
(001,50.2,001,1),
(002,28.4,001,2),
(003,77.6,004,2),
(004,125.1,005,1),
(005,42.4,006,2),
(006,43.1,007,1)
GO

ALTER TABLE Advertising ADD ContractType INT
   CONSTRAINT FK_Advertising_ContractType FOREIGN KEY (ContractType)
   REFERENCES ContractType(ContractTypeID) 
GO

CREATE TABLE ContractType
  (
  ContractTypeID INT PRIMARY KEY,
  ContractTypeName nvarchar(30)
  )
GO

INSERT ContractType (ContractTypeID,ContractTypeName)
VALUES
(001,'sale-contract'),
(002,'lease-contract')
GO

SELECT * FROM ContractType
GO

TRUNCATE TABLE Advertising
GO

------------------------------------------------
ALTER TABLE Advertising ADD Conditions INT
   CONSTRAINT FK_Advertising_Conditions FOREIGN KEY (Conditions)
   REFERENCES Conditions(ConditionsID) 
GO

CREATE TABLE Conditions
  (
  ConditionsID INT PRIMARY KEY,
  ConditionsName nvarchar(100)
  )
GO

INSERT Conditions (ConditionsID,ConditionsName)
VALUES
(001,'termless contract'),
(002,'fixed-term contract')
GO

UPDATE Advertising SET  Conditions = 001
WHERE Advertising.AdvertisingID = '1'
GO

------------------------------------------------


CREATE TABLE PropertyType
  (
  PropertyTypeID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_PropertyTypeID PRIMARY KEY,
  PropertyTypeName nvarchar(30)
  )
GO

ALTER TABLE Advertising ADD PropertyType INT
   CONSTRAINT FK_Advertising_PropertyType FOREIGN KEY (PropertyType)
   REFERENCES PropertyType(PropertyTypeID) 
GO 

INSERT PropertyType (PropertyTypeName)
VALUES
('residential building'),
('non-residential building')
GO