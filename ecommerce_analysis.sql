CREATE DATABASE IF NOT EXISTS ecommerce_analytics;
USE ecommerce_analytics;

-- Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM ecommerce_sales;

-- Total Cost
SELECT SUM(Cost) AS Total_Cost
FROM ecommerce_sales;

-- Total Profit
SELECT SUM(Profit) AS Total_Profit
FROM ecommerce_sales;

-- Total Orders
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM ecommerce_sales;

-- Average Order Value
SELECT 
    SUM(Sales) / COUNT(DISTINCT Order_ID) AS Average_Order_Value
FROM ecommerce_sales;

-- Category-wise Sales
SELECT 
    Category,
    SUM(Sales) AS Total_Sales
FROM ecommerce_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Category-wise Profit
SELECT 
    Category,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Region-wise Sales & Profit
SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Payment Mode-wise Sales
SELECT 
    Payment_Mode,
    SUM(Sales) AS Total_Sales
FROM ecommerce_sales
GROUP BY Payment_Mode
ORDER BY Total_Sales DESC;

-- Customer Segment-wise Sales & Profit
SELECT 
    Customer_Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY Customer_Segment
ORDER BY Total_Sales DESC;

-- Monthly Sales Trend
SELECT
    MONTH(STR_TO_DATE(Order_Date, '%d-%b-%Y')) AS Month_Number,
    MONTHNAME(STR_TO_DATE(Order_Date, '%d-%b-%Y')) AS Month_Name,
    SUM(Sales) AS Total_Sales
FROM ecommerce_sales
GROUP BY
    MONTH(STR_TO_DATE(Order_Date, '%d-%b-%Y')),
    MONTHNAME(STR_TO_DATE(Order_Date, '%d-%b-%Y'))
ORDER BY Month_Number;

-- Top 10 Products by Sales
SELECT 
    Product,
    SUM(Sales) AS Total_Sales
FROM ecommerce_sales
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 10;

-- Top 10 Products by Profit
SELECT 
    Product,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 10;

-- Category-wise Profit Margin
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM ecommerce_sales
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;