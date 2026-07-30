use Telecom_Customer_Revenue_Analytics
go

select top (21)*
from Customers_Work;

select top (21)*
from devices_Work;

select top (21)*
from  revenue_Work;

select*
from INFORMATION_SCHEMA.COLUMNS
where table_name = 'Customers_Work';

select *
from INFORMATION_SCHEMA.COLUMNS 
where table_name ='devices_Work';

select *
from INFORMATION_SCHEMA.COLUMNS
where table_name ='revenue_Work';

select count (*) as row_count
from Customers_Work;

select count (*) as row_count
from devices_Work;

select count (*) as row_count
from revenue_Work;

SELECT
    SUM(CASE WHEN msisdn IS NULL THEN 1 ELSE 0 END) AS msisdn_NULLs,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender_NULLs,
    SUM(CASE WHEN year_of_birth IS NULL THEN 1 ELSE 0 END) AS year_of_birth_NULLs,
    SUM(CASE WHEN system_status IS NULL THEN 1 ELSE 0 END) AS system_status_NULLs,
    SUM(CASE WHEN mobile_type IS NULL THEN 1 ELSE 0 END) AS mobile_type_NULLs,
    SUM(CASE WHEN value_segment IS NULL THEN 1 ELSE 0 END) AS value_segment_NULLs
FROM Customers_Work;

SELECT
    SUM(CASE WHEN msisdn IS NULL THEN 1 ELSE 0 END) AS msisdn_NULLs,
    SUM(CASE WHEN imei_tac IS NULL THEN 1 ELSE 0 END) AS imel_tac_NULLs,
    SUM(CASE WHEN brand_name IS NULL THEN 1 ELSE 0 END) AS brand_name_NULLs,
    SUM(CASE WHEN model_name IS NULL THEN 1 ELSE 0 END) AS model_name_NULLs,
    SUM(CASE WHEN operating_system_name IS NULL THEN 1 ELSE 0 END) AS operating_system_name_NULLs,
    SUM(CASE WHEN operating_system_vendor IS NULL THEN 1 ELSE 0 END) AS operating_system_vendor_NULLs
FROM Devices_Work;

SELECT
    SUM(CASE WHEN msisdn IS NULL THEN 1 ELSE 0 END) AS msisdn_NULLs,
    SUM(CASE WHEN week_number IS NULL THEN 1 ELSE 0 END) AS week_number_NULLs,
    SUM(CASE WHEN revenue_usd IS NULL THEN 1 ELSE 0 END) AS revenue_usd_NULLs
FROM Revenue_Work;

SELECT
    msisdn,
    COUNT(*) AS Duplicate_Count
FROM Customers_Work
GROUP BY msisdn
HAVING COUNT(*) > 1;

SELECT
    msisdn,
    COUNT(*) AS Duplicate_Count
FROM Devices_Work
GROUP BY msisdn
HAVING COUNT(*) > 1;

SELECT
    msisdn,
    week_number,
    COUNT(*) AS Duplicate_Count
FROM Revenue_Work
GROUP BY msisdn, week_number
HAVING COUNT(*) > 1;



SELECT
    gender,
    COUNT(*) AS Count_
FROM Customers_Work
GROUP BY gender
ORDER BY Count_ DESC;

SELECT
    system_status,
    COUNT(*) AS Count_
FROM Customers_Work
GROUP BY system_status
ORDER BY Count_ DESC;

SELECT
    mobile_type,
    COUNT(*) AS Count_
FROM Customers_Work
GROUP BY mobile_type
ORDER BY Count_ DESC;

SELECT
    value_segment,
    COUNT(*) AS Count_
FROM Customers_Work
GROUP BY value_segment
ORDER BY Count_ DESC;

SELECT
    week_number,
    COUNT(*) AS Count_
FROM Revenue_Work
GROUP BY week_number
ORDER BY week_number;

SELECT
    MIN(year_of_birth) AS Min_Year,
    MAX(year_of_birth) AS Max_Year
FROM Customers_Work;

SELECT
    week_number,
    MIN(revenue_usd) AS Min_Revenue,
    MAX(revenue_usd) AS Max_Revenue,
    AVG(revenue_usd) AS Avg_Revenue
FROM Revenue_Work
GROUP BY week_number
ORDER BY week_number;

UPDATE Customers_Work
SET gender = LTRIM(RTRIM(gender));

UPDATE Customers_Work
SET gender = 'Male'
WHERE UPPER(gender) IN
(
    'M',
    'MA',
    'MALE',
    'MAL',
    'MALE.',
    'MALE`',
    'MALEF',
    'MY'
);

UPDATE Customers_Work
SET gender = 'Female'
WHERE UPPER(gender) IN
(
    'F',
    'FE',
    'FEMALE',
    'FEMALE.',
    'FEMALE]',
    'FEMALE`',
    'FEMALEH',
    'FEMALEF',
    'FEMALE..',
    'FEMAL',
    'FEMELE',
    'FEMEL',
    'FAMALE',
    'FEMALE3',
    'FEMALE\\',
    'FEMAL]E',
    'MAFELE',
    'MALFEE'
);

UPDATE Customers_Work
SET gender = 'Unknown'
WHERE gender NOT IN ('Male', 'Female', 'Unknown');


UPDATE Customers_Work
SET gender = 'Unknown'
WHERE gender IS NULL;


SELECT
    gender,
    COUNT(*) AS Count_
FROM Customers_Work
GROUP BY gender
ORDER BY Count_ DESC;


UPDATE Customers_Work
SET system_status = 'SUSPEND'
WHERE system_status = 'DEACTIVE';

UPDATE Customers_Work
SET year_of_birth = NULL
WHERE year_of_birth < 1940
   OR year_of_birth > YEAR(GETDATE());

SELECT
    system_status,
    COUNT(*) AS Count_
FROM Customers_Work
GROUP BY system_status
ORDER BY Count_ DESC;

SELECT
    MIN(year_of_birth) AS Min_Year,
    MAX(year_of_birth) AS Max_Year
FROM Customers_Work;



SELECT TOP (30)
    year_of_birth,
    COUNT(*) AS Count_
FROM Customers_Work
GROUP BY year_of_birth
ORDER BY year_of_birth DESC;

SELECT
    year_of_birth,
    COUNT(*) AS Count_
FROM Customers_Work
GROUP BY year_of_birth
ORDER BY year_of_birth DESC;

ALTER TABLE Customers_Work
ADD Age INT;

UPDATE Customers_Work
SET Age = 2019 - year_of_birth
WHERE year_of_birth IS NOT NULL;

ALTER TABLE Customers_Work
ADD Age_Group VARCHAR(20);

UPDATE Customers_Work
SET Age_Group =
CASE
    WHEN Age < 18 THEN 'Under 18'
    WHEN Age BETWEEN 18 AND 24 THEN '18-24'
    WHEN Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN Age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
END
WHERE Age IS NOT NULL;

ALTER TABLE Customers_Work
ADD Customer_Status VARCHAR(20);

UPDATE Customers_Work
SET Customer_Status =
CASE
    WHEN system_status = 'ACTIVE' THEN 'Active'
    ELSE 'Inactive'
END;

SELECT
    msisdn,
    COUNT(DISTINCT gender) AS Gender_Count
FROM Customers_Work
GROUP BY msisdn
HAVING COUNT(DISTINCT gender) > 1;

SELECT
    gender,
    gender2,
    COUNT(*) AS Count_
FROM
(
    SELECT
        msisdn,
        MIN(gender) AS gender,
        MAX(gender) AS gender2
    FROM Customers_Work
    GROUP BY msisdn
    HAVING COUNT(DISTINCT gender) = 2
) t
GROUP BY gender, gender2
ORDER BY Count_ DESC;


select top (11) * 
from Customers_Work

select top(11) *
from revenue_Work


SELECT
    msisdn,
    CASE
        WHEN COUNT(DISTINCT gender) > 1 THEN 'Unknown'
        ELSE MAX(gender)
    END AS gender,
    MAX(year_of_birth) AS year_of_birth,
    MAX(system_status) AS system_status,
    MAX(mobile_type) AS mobile_type,
    MAX(value_segment) AS value_segment,
    MAX(Age) AS Age,
    MAX(Age_Group) AS Age_Group,
    MAX(Customer_Status) AS Customer_Status
INTO Customers_Clean
FROM Customers_Work
GROUP BY msisdn;


SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT msisdn) AS unique_msisdn
FROM Customers_Clean;


SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT msisdn) AS unique_msisdn
FROM Revenue_Work;

SELECT
    r.msisdn,
    r.week_number,
    r.revenue_usd,
    c.gender,
    c.year_of_birth,
    c.system_status,
    c.mobile_type,
    c.value_segment,
    c.Age,
    c.Age_Group,
    c.Customer_Status
INTO Revenue_Customer_Final
FROM Revenue_Work r
LEFT JOIN Customers_Clean c
ON r.msisdn = c.msisdn;

SELECT COUNT(*)
FROM Revenue_Work;

SELECT COUNT(*)
FROM Revenue_Customer_Final;

select top (11) *
from Revenue_Customer_Final;

SELECT COUNT(*)
FROM Revenue_Customer_Final;

SELECT SUM(revenue_usd)
FROM Revenue_Work;

SELECT COUNT(*) 
FROM Revenue_Work r
LEFT JOIN Customers_Clean c
ON r.msisdn = c.msisdn
WHERE c.msisdn IS NULL;

DROP TABLE Revenue_Customer_Final;

SELECT
    r.msisdn,
    r.week_number,
    r.revenue_usd,
    ISNULL(c.gender,'Unknown') AS gender,
    ISNULL(c.system_status,'Unknown') AS system_status,
    ISNULL(c.mobile_type,'Unknown') AS mobile_type,
    ISNULL(c.value_segment,'Unknown') AS value_segment,
    ISNULL(c.Age_Group,'Unknown') AS Age_Group,
    ISNULL(c.Customer_Status,'Unknown') AS Customer_Status
INTO Revenue_Customer_Final
FROM Revenue_Work r
LEFT JOIN Customers_Clean c
ON r.msisdn = c.msisdn;

SELECT COUNT(*)
FROM Revenue_Customer_Final;

SELECT SUM(revenue_usd)
FROM Revenue_Work;


SELECT SUM(revenue_usd)
FROM Revenue_Customer_Final;

SELECT *
FROM Revenue_Customer_Final
WHERE gender IS NULL
OR system_status IS NULL
OR mobile_type IS NULL;



select top (11) * 
from Customers_Work

select top(11) *
from revenue_Work

sp_help customers_work;

sp_help revenue_work;

SELECT
    msisdn,
    COUNT(DISTINCT gender)
    from Customers_Work

SELECT
    year_of_birth,
    COUNT(DISTINCT gender)
    from Customers_Work

SELECT
    mobile_type,
    COUNT(DISTINCT gender)
    from Customers_Work

SELECT
    system_status,
    COUNT(DISTINCT gender)
    from Customers_Work
