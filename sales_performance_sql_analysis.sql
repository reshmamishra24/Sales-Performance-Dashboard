
-- Project: Sales Performance Dashboard
-- Tool: SQL Server
-- Dataset: Superstore Sales


-- STEP 1: Create Database

CREATE DATABASE Sales_Project;
GO

USE Sales_Project;
GO

--STEP-2: Check Imported Data
SELECT TOP 10*
FROM Superstore_Sales;

--STEP-3: DATA CLEANING 

-- Q1 — Check Null Values

SELECT *
FROM Superstore_Sales
WHERE Order_ID IS NULL
OR Sales IS NULL
OR Profit IS NULL;

--Q2 — Remove Invalid Records

DELETE FROM Superstore_Sales
WHERE Sales <= 0
OR Quantity <= 0;

--Q3 — Remove Duplicate Records

WITH DuplicateCTE AS (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY Order_ID, Product_ID, Customer_ID
ORDER BY Order_ID
) AS rn
FROM Superstore_Sales
)
DELETE FROM DuplicateCTE
WHERE rn > 1;

-- Q4 — Check Date Format

SELECT 
CAST(Order_Date AS DATE) AS Order_Date,
CAST(Ship_Date AS DATE) AS Ship_Date
FROM Superstore_Sales;

--STEP-4:  DATA ANALYSIS

/* Q1 — Total Sales, Profit, Orders (Overall Performance)
Business Problem - Stakeholder wants overall company performance. */

SELECT 
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit,
COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Superstore_Sales;

/* Q2 — Sales by Region
Business Problem - Which region generates highest sales? */

SELECT 
Region,
SUM(Sales) AS Total_Sales
FROM Superstore_Sales
GROUP BY Region
ORDER BY Total_Sales DESC;

/* Q3 — Profit by Category
Business Problem - Which product category is most profitable? */

SELECT 
Category,
SUM(Profit) AS Total_Profit
FROM Superstore_Sales
GROUP BY Category
ORDER BY Total_Profit DESC;

/* Q4 — Top 10 Customers by Sales
Business Problem - Identify high-value customers. */

SELECT TOP 10
Customer_ID,
Customer_Name,
SUM(Sales) AS Total_Sales
FROM Superstore_Sales
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Sales DESC;

/* Q5 — Monthly Sales Trend
Business Problem - Stakeholder wants sales trend over time. */

SELECT 
YEAR(Order_Date) AS Year,
MONTH(Order_Date) AS Month,
SUM(Sales) AS Monthly_Sales
FROM Superstore_Sales
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;

/* Q6 — Loss Making Products
Business Problem - Identify products causing loss. */

SELECT 
Product_Name,
SUM(Profit) AS Total_Profit
FROM Superstore_Sales
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit;

-- Q7 — Sales by Segment (Consumer vs Corprate performance)

SELECT 
Segment,
SUM(Sales) AS Total_Sales
FROM Superstore_Sales
GROUP BY Segment
ORDER BY Total_Sales DESC;

/* Q8 — Profit Margin (Business KPI)
Business Problem -
→ Stakeholder wants to know overall profitability efficiency
→ Not just profit, but profit compared to sales  */

SELECT 
SUM(Profit) * 100.0 / SUM(Sales) AS Profit_Margin_Percentage
FROM Superstore_Sales;

/* Q9 — Rank Regions by Sales (Window Function)
Business Problem - Management wants region performance ranking  */

SELECT 
Region,
SUM(Sales) AS Total_Sales,
RANK() OVER(ORDER BY SUM(Sales) DESC) AS Region_Rank
FROM Superstore_Sales
GROUP BY Region;

/* Q10 — Products With Above Average Sales
Business Problem - Identify high-performing products  */

SELECT 
Product_Name,
SUM(Sales) AS Total_Sales
FROM Superstore_Sales
GROUP BY Product_Name
HAVING SUM(Sales) > (
    SELECT AVG(Sales) 
    FROM Superstore_Sales
);

/* Q11 — Top 3 Products by Sales
Business Problem - Stakeholder wants best selling products  */

SELECT TOP 3
Product_Name,
SUM(Sales) AS Total_Sales
FROM Superstore_Sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC;

/* Q12 — Average Order Value
Business Problem - Management wants average revenue per order  */

SELECT 
SUM(Sales) / COUNT(DISTINCT Order_ID) AS Avg_Order_Value
FROM Superstore_Sales;

