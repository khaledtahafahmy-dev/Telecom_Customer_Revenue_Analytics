USE Telecom_Customer_Revenue_Analytics;
GO

TRUNCATE TABLE customers;


BULK INSERT customers
FROM 'C:\Users\career\Desktop\khaled\work\DA\projects\first stage\4 - Sql server - power bi\Telecom Customer Revenue Analytics\customers.csv'
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
FROM 'C:\Users\career\Desktop\khaled\work\DA\projects\first stage\4 - Sql server - power bi\Telecom Customer Revenue Analytics\Devices.csv'
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
FROM 'C:\Users\career\Desktop\khaled\work\DA\projects\first stage\4 - Sql server - power bi\Telecom Customer Revenue Analytics\revenue.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);


GO