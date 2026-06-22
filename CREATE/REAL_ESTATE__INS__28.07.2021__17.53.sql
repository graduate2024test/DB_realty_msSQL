

INSERT Conditions (ConditionsInfo, ConditionsRank)
	VALUES		('Условие1', 0.1),
				('Условие2', 0.2),
				('Условие3', 0.3),
				('Условие4', 0.4),
				('Условие5', 0.5)
GO


INSERT Street (StreetName, StreetRank)
	VALUES		('Улица1', 0.1),
				('Улица2', 0.2),
				('Улица3', 0.3),
				('Улица4', 0.4),
				('Улица5', 0.5)
GO


INSERT PropertyTypeName (PropertyTypeName)
	VALUES		('Тип недвижимости 1'),
				('Тип недвижимости 2'),
				('Тип недвижимости 3'),
				('Тип недвижимости 4'),
				('Тип недвижимости 5')
GO

SELECT * FROM PropertyTypeName
GO

--UPDATE PropertyTypeName SET PropertyTypeNameID = 1 WHERE PropertyTypeNameID = 6
--GO


INSERT PropertyType (PropertyTypeInfo, PropertyTypeRank, PropertyTypeNameID)
	VALUES		('Описание типа недвижимости 1', 0.1, 6),
				('Описание типа недвижимости 2', 0.2, 7),
				('Описание типа недвижимости 3', 0.3, 8),
				('Описание типа недвижимости 4', 0.4, 9),
				('Описание типа недвижимости 5', 0.5, 10)
GO

SELECT * FROM PropertyType
GO



INSERT PaymentTerms (PaymentTermsInfo, PrepaymentValue)
	VALUES		('Условие предоплаты 1', 0.1),
				('Условие предоплаты 2', 0.2),
				('Условие предоплаты 3', 0.3),
				('Условие предоплаты 4', 0.4),
				('Условие предоплаты 5', 0.5)
GO



INSERT ContractType (ContractTypeName, PaymentTermsID)
	VALUES		('Договор 1', 6),
				('Договор 2', 7),
				('Договор 3', 8),
				('Договор 4', 9),
				('Договор 5', 10)
GO


INSERT RealEstateAgency (RealEstateAgencyInfo, RealEstateAgencyCommission)
	VALUES		('Риэлторское агентство 1', 0.1),
				('Риэлторское агентство 2', 0.2),
				('Риэлторское агентство 3', 0.3),
				('Риэлторское агентство 4', 0.4),
				('Риэлторское агентство 5', 0.5)
GO


INSERT RealEstateBroker (RealEstateBrokerInfo, RealEstateBrokerCommission, RealEstateAgencyID)
	VALUES		('Риэлтор 1', 0.1, 6),
				('Риэлтор 2', 0.2, 7),
				('Риэлтор 3', 0.3, 8),
				('Риэлтор 4', 0.4, 9),
				('Риэлтор 5', 0.5, 10)
GO


INSERT Advertising (AreaM2, ConditionsID, StreetID, PropertyTypeID, ContractTypeID, RealEstateBrokerID)
	VALUES		(100, 6, 6, 9, 6, 6),
				(200, 7, 7, 10, 7, 7),
				(300, 8, 8, 11, 8, 8),
				(400, 9, 9, 12, 9, 9),
				(500, 10, 10, 13, 10, 10)
GO


INSERT PriceHistory (PriceHistoryData, PriceHistoryValue, AdvertisingID)
	VALUES		('01.01.2020', 1000, 10),
				('02.01.2020', 2000, 11),
				('03.01.2020', 3000, 12),
				('04.01.2020', 4000, 13),
				('05.01.2020', 5000, 14)
GO


SELECT * FROM Conditions
GO

SELECT * FROM Street
GO

SELECT * FROM PropertyTypeName
GO

SELECT * FROM PropertyType
GO

SELECT * FROM PaymentTerms
GO

SELECT * FROM ContractType
GO

SELECT * FROM RealEstateAgency
GO

SELECT * FROM RealEstateBroker
GO

SELECT * FROM Advertising
GO

SELECT * FROM PriceHistory
GO




DELETE FROM PriceHistory
GO

DELETE FROM Advertising
GO

DELETE FROM Conditions
GO

DELETE FROM Street
GO

DELETE FROM PropertyType
GO

DELETE FROM PropertyTypeName
GO

DELETE FROM ContractType
GO

DELETE FROM PaymentTerms
GO

DELETE FROM RealEstateBroker
GO

DELETE FROM RealEstateAgency
GO
