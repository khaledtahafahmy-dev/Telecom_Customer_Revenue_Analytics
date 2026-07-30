use Telecom_Customer_Revenue_Analytics
go

SELECT
    mobile_type,
    SUM(revenue_usd) AS Total_Revenue,
    AVG(revenue_usd) AS Avg_Revenue,
    COUNT(DISTINCT msisdn) AS Customers
FROM vw_Revenue_Customer_Analytics
GROUP BY mobile_type;

SELECT
    gender,
    SUM(revenue_usd) AS Total_Revenue,
    AVG(revenue_usd) AS Avg_Revenue,
    COUNT(DISTINCT msisdn) AS Customers
FROM vw_Revenue_Customer_Analytics
GROUP BY gender;

SELECT
    system_status,
    AVG(revenue_usd) AS Avg_Revenue,
    SUM(revenue_usd) AS Total_Revenue,
    COUNT(DISTINCT msisdn) AS Customers
FROM vw_Revenue_Customer_Analytics
GROUP BY system_status;

SELECT
    Age_Group,
    SUM(revenue_usd) AS Total_Revenue,
    AVG(revenue_usd) AS Avg_Revenue,
    COUNT(DISTINCT msisdn) AS Customers
FROM vw_Revenue_Customer_Analytics
GROUP BY Age_Group
ORDER BY Total_Revenue DESC;



SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT msisdn) AS Total_Customers,
    SUM(revenue_usd) AS Total_Revenue,
    AVG(revenue_usd) AS Average_Revenue
FROM vw_Revenue_Customer_Analytics;


SELECT
    week_number,
    COUNT(*) AS Transactions,
    SUM(revenue_usd) AS Total_Revenue,
    AVG(revenue_usd) AS Avg_Revenue
FROM vw_Revenue_Customer_Analytics
GROUP BY week_number
ORDER BY week_number;


SELECT
    gender,
    COUNT(*) AS Customers
FROM vw_Revenue_Customer_Analytics
GROUP BY gender
ORDER BY Customers DESC;

SELECT
    mobile_type,
    COUNT(*) AS Customers
FROM vw_Revenue_Customer_Analytics
GROUP BY mobile_type;

SELECT
    system_status,
    COUNT(*) AS Customers
FROM vw_Revenue_Customer_Analytics
GROUP BY system_status;

SELECT
    Age_Group,
    COUNT(*) AS Customers
FROM vw_Revenue_Customer_Analytics
GROUP BY Age_Group
ORDER BY Customers DESC;


SELECT
    gender,
    SUM(revenue_usd) AS Total_Revenue,
    AVG(revenue_usd) AS Avg_Revenue
FROM vw_Revenue_Customer_Analytics
GROUP BY gender;

SELECT
    mobile_type,
    SUM(revenue_usd) AS Total_Revenue,
    AVG(revenue_usd) AS Avg_Revenue
FROM vw_Revenue_Customer_Analytics
GROUP BY mobile_type;


SELECT
    system_status,
    SUM(revenue_usd) AS Total_Revenue,
    AVG(revenue_usd) AS Avg_Revenue
FROM vw_Revenue_Customer_Analytics
GROUP BY system_status;

SELECT
    Age_Group,
    SUM(revenue_usd) AS Total_Revenue,
    AVG(revenue_usd) AS Avg_Revenue
FROM vw_Revenue_Customer_Analytics
GROUP BY Age_Group
ORDER BY Total_Revenue DESC;





SELECT TOP (10) *
FROM vw_Revenue_Customer_Analytics;



