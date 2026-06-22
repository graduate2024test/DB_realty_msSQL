-------------------------
--код заполнения данными
-------------------------

INSERT TableName (column1, column2, column3) VALUES ('Name1', 'Name2', 'Name3')
GO

BULK INSERT CSVTest
           FROM 'c:\csvtest.txt'
           WITH
           (
               FIELDTERMINATOR = ',',
               ROWTERMINATOR = '\n'
           )
GO


--Check the content of the table.
SELECT * FROM CSVTest
GO





-------------------------
--код очистки баз данных
-------------------------

DELETE FROM TableName
GO

DELETE FROM TableName WHERE ConditionInfo
GO