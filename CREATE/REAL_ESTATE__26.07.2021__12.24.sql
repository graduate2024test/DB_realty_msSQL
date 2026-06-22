--
--
--структура наименования FOREIGN KEY: FK_[таблица в которой установлени FK]_[поле взятое из другой таблицы]
--
--


CREATE DATABASE REAL_ESTATE
GO


CREATE TABLE Conditions
  (
  ConditionsID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT PK_ConditionsID PRIMARY KEY,
  ConditionsInfo nvarchar(100),
  ConditionsRank FLOAT
  )
GO


CREATE TABLE Street
  (
  StreetID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT PK_StreetID PRIMARY KEY,
  StreetName nvarchar(30),
  StreetRank FLOAT
  )
GO



CREATE TABLE PropertyTypeName
  (
  PropertyTypeNameID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT PK_PropertyTypeNameID PRIMARY KEY,
  PropertyTypeName nvarchar(30)
  )
GO


CREATE TABLE PropertyType
  (
  PropertyTypeID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT PK_PropertyTypeID PRIMARY KEY,
  PropertyTypeInfo nvarchar(100),
  PropertyTypeRank FLOAT,
  PropertyTypeNameID INT

  CONSTRAINT FK_PropertyType_PropertyTypeNameID
		FOREIGN KEY (PropertyTypeNameID) REFERENCES PropertyTypeName(PropertyTypeNameID) 
  )
GO


CREATE TABLE PaymentTerms
  (
  PaymentTermsID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT PK_PaymentTermsID PRIMARY KEY,
  PaymentTermsInfo nvarchar(100),
  PrepaymentValue FLOAT
  )
GO


CREATE TABLE ContractType
  (
  ContractTypeID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT PK_ContractTypeID PRIMARY KEY,
  ContractTypeName nvarchar(30),
  PaymentTermsID INT
  
  CONSTRAINT FK_ContractType_PaymentTermsID
		FOREIGN KEY (PaymentTermsID) REFERENCES PaymentTerms(PaymentTermsID)
  )
GO


CREATE TABLE RealEstateAgency
  (
  RealEstateAgencyID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT PK_RealEstateAgencyID PRIMARY KEY,
  RealEstateAgencyInfo nvarchar(100),
  RealEstateAgencyCommission FLOAT
  )
GO


CREATE TABLE RealEstateBroker
  (
  RealEstateBrokerID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT PK_RealEstateBrokerID PRIMARY KEY,
  RealEstateBrokerInfo nvarchar(100),
  RealEstateBrokerCommission FLOAT,
  RealEstateAgencyID INT
  
  CONSTRAINT FK_RealEstateBroker_RealEstateAgencyID
		FOREIGN KEY (RealEstateAgencyID) REFERENCES RealEstateAgency(RealEstateAgencyID)
  )
GO



CREATE TABLE Advertising  
   (
   AdvertisingID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT PK_AdvertisingID PRIMARY KEY,  
   AreaM2 FLOAT(2),
   StreetID INT,
   PropertyTypeID INT,
   ContractTypeID INT,
   RealEstateBrokerID INT
   )  
GO
 

CREATE TABLE PriceHistory
  (
  PriceHistoryID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT PK_PriceHistoryID PRIMARY KEY,
  PriceHistoryData DATE,
  PriceHistoryValue FLOAT,
  AdvertisingID INT
  
  CONSTRAINT FK_PriceHistory_AdvertisingID
		FOREIGN KEY (AdvertisingID) REFERENCES Advertising(AdvertisingID) 
  )
GO

