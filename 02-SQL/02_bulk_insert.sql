USE Telecom_Customer_Revenue_Analytics;
GO

TRUNCATE TABLE customers;


BULK INSERT customers
FROM 'C:\Users\customers.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);

TRUNCATE TABLE Devices;


BULK INSERT Devices
FROM 'C:\Users\Devices.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);


TRUNCATE TABLE revenue;


BULK INSERT revenue
FROM 'C:\Users\revenue.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);


GO
