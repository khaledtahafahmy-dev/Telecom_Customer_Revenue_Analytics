USE telecom_customer_revenue_analytics;
GO



    


CREATE TABLE customers
(
    msisdn VARCHAR(50),
    gender VARCHAR(50),
    year_of_birth INT,
    system_status VARCHAR(50),
    mobile_type VARCHAR(50),
    value_segment VARCHAR(50)
);

CREATE TABLE revenue
(
    msisdn VARCHAR(32),
    week_number INT,
    revenue_usd FLOAT
);


CREATE TABLE devices
(
    msisdn VARCHAR(50),
    imei_tac VARCHAR(50),
    brand_name VARCHAR(100),
    model_name VARCHAR(150),
    operating_system_name VARCHAR(100),
    operating_system_vendor VARCHAR(100)
);




GO