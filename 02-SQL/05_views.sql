USE Telecom_Customer_Revenue_Analytics;
GO

ALTER VIEW vw_Revenue_Customer_Analytics
AS
SELECT
    msisdn,
    week_number,
    revenue_usd,
    gender,
    system_status,
    mobile_type,
    value_segment,
    Age_Group,
    CASE
        WHEN Age_Group = 'Under 18' THEN 1
        WHEN Age_Group = '18-24' THEN 2
        WHEN Age_Group = '25-34' THEN 3
        WHEN Age_Group = '35-44' THEN 4
        WHEN Age_Group = '45-54' THEN 5
        WHEN Age_Group = '55+' THEN 6
        ELSE 7
    END AS Age_Group_Sort,
    Customer_Status
FROM Revenue_Customer_Final;
GO

SELECT TOP (20) *
FROM vw_Revenue_Customer_Analytics;